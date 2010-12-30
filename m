Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PYPVi-0001Ka-66
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 21:54:10 +0100
Received: (qmail 16053 invoked by uid 503); 30 Dec 2010 20:26:48 -0000
Received: from b6.ovh.net (HELO mail640.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 30 Dec 2010 20:26:48 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 Dec 2010 22:53:54 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 30 Dec 2010 22:53:54 +0200
Message-ID: <4D1CF15E.4020003@eukrea.com>
Date: Thu, 30 Dec 2010 21:53:50 +0100
From: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D1C4E4A.5000705@eukrea.com>	<ifhrie$a01$1@dough.gmane.org>	<ifije4$p3n$1@dough.gmane.org>	<4D1CD8F2.6000209@eukrea.com>
	<ifipuv$nbt$1@dough.gmane.org>
In-Reply-To: <ifipuv$nbt$1@dough.gmane.org>
X-Ovh-Tracer-Id: 17393464712181624137
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: ti-c6accel-1_01_00_01: link error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Dec 2010 20:54:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/12/2010 21:27, Koen Kooi wrote:
>
> If you build the new xdctools with the linker hack (
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=7993e4ca7746a4ca9e7116cc76e6c1da32a76690
> ) then you only need a few changes to make it all build:
>
> 1) edit
> conf/distro/include/angstrom-codec-engine-latest-preferred-versions.inc:
>
> - -PREFERRED_VERSION_ti-linuxutils = "2_25_05_11"
> +PREFERRED_VERSION_ti-linuxutils = "2_26_01_02"
>
> - -PREFERRED_VERSION_ti-xdctools = "3_20_05_76"
> +PREFERRED_VERSION_ti-xdctools = "3_20_06_81"
>
> 2) Add -fPIC to C_FLAGS in the c6accel soc/ Makefiles (plural)
>
> 3) remove -Werror from DMAI makefiles
>
> 4) remove -Werror from gstreamer-ti makefiles
>
> That will get you a succesfull build, but you will have some runtime
> problems. My current goal is to get c6accel working on my USRP E100 so
> gnuradio can use that, so gst-ti is out of scope for that.
>
thanks, I'll try that.

In order to finish the image build, I removed gstreamer-ti from 
beagleboard-linuxtag2010-demo-image which also "fixed" the problem as I don't 
need gst-ti for my tests ;-)

Eric


