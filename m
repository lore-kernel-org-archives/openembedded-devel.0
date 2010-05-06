Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1O9xvq-0002w8-Pf
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 May 2010 12:03:51 +0200
Received: (qmail 2480 invoked by uid 503); 6 May 2010 09:56:44 -0000
Received: from b6.ovh.net (HELO mail423.ha.ovh.net) (213.186.33.56)
	by 30.mail-out.ovh.net with SMTP; 6 May 2010 09:56:44 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 May 2010 10:00:03 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 6 May 2010 10:00:02 -0000
Message-ID: <4BE29322.7060205@eukrea.com>
Date: Thu, 06 May 2010 12:00:02 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.1.9) Gecko/20100317 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <n2kfc0861611004260035m8d19c57ez38a19dbbe360efe8@mail.gmail.com>
	<v2hfc0861611004260046za2daa3a4ve91f93ab88e72d8e@mail.gmail.com>
	<hr3im2$gf6$1@dough.gmane.org>	<x2rfc0861611004261141u68a0ad71icfc12c12c3053c23@mail.gmail.com>	<hr4t3j$tds$1@dough.gmane.org>	<k2jfc0861611004280742x8a9ca2b7jc65a77230be17b42@mail.gmail.com>	<4BD84B08.4000300@eukrea.com>	<g2wfc0861611005040002v62c57e0ahf08f8337bbbe9c1d@mail.gmail.com>	<4BDFC996.5060606@eukrea.com>
	<AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com>
In-Reply-To: <AANLkTik56w90iywd5ZmzV_geM0ULabHWVCuJIfxzHY7u@mail.gmail.com>
X-Ovh-Tracer-Id: 10602036473974795593
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Regarding customized image with Qt embedded support.
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
X-List-Received-Date: Thu, 06 May 2010 10:03:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 06/05/2010 11:53, Abhishek Sharma a écrit :
> Thanks for the solution Eric. I was also facing problems regarding tslib,
> which u answered on the irc. I did
> IMAGE_INSTALL += "qt4-embedded-plugin-mousedriver-tslib"
>
> but still when I am running the qtehelloworld app on the created image in
> qemu, everything is being "displayed" fine but the mouse pointer is not
> moving when I try it to, in other words the touch screen ain't working with
> the image while it works when i try to run a preconfigured opie-image.

QWS_MOUSE_PROTO=tslib:/dev/input/touchscreen0 qt-app -qws

you will find details here :
http://doc.qt.nokia.com/4.6/qt-embedded-envvars.html

Eric


