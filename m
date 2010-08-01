Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OfamE-0007eZ-OY
	for openembedded-devel@lists.openembedded.org;
	Sun, 01 Aug 2010 17:48:40 +0200
Received: (qmail 9685 invoked by uid 503); 1 Aug 2010 16:06:12 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 1 Aug 2010 16:06:12 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 1 Aug 2010 17:48:17 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 1 Aug 2010 17:48:17 +0200
Message-ID: <4C559740.9020102@eukrea.com>
Date: Sun, 01 Aug 2010 17:48:16 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.7) Gecko/20100713 Thunderbird/3.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1280554451-27780-1-git-send-email-raj.khem@gmail.com>
X-Ovh-Tracer-Id: 10898992574910672201
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/5][v4] Make multi-machine toolchains to co-exist (Alternate approach)
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
X-List-Received-Date: Sun, 01 Aug 2010 15:48:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

Le 31/07/2010 07:34, Khem Raj a écrit :
> Following series of patches are for making multi-machine toolchains co-exist with
> new cross staging for toolchain.
>
> It installs the toolchain in<native sysroot>/usr/${BASE_PACKAGE_ARCH}
> this way we can have multiple toolchains co-existing for different sub-arches and major arches too.
>
> I have booted a native-sdk-image on qemuarm successfully. The build for
> beagleboard minimal image using different versions of toolchain went all fine too.
>
> Please test these patches and if seem ok provide some ACKS/NACKS
>
here is the result of my tests :
* distro Angstrom for armv5 and armv6 machines : several images & sdk 
are built fine (but not tested)
* distro minimal for armv4 and armv5 machines : several images & sdk are 
built fine (but not tested)

Eric


