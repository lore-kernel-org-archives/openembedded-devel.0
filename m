Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NRiEc-0005GV-N9 for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 09:24:21 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NRiCd-0004o1-Km
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 09:22:15 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 09:22:15 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 09:22:15 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 04 Jan 2010 09:21:52 +0100
Message-ID: <hhs8ev$ogg$1@ger.gmane.org>
References: <200912190854.11510.holger+oe@freyther.de>	<201001011348.44168.holger+oe@freyther.de>	<hhn031$6hg$1@ger.gmane.org>
	<201001040840.28000.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.5) Gecko/20091220 Shredder/3.0.1pre
In-Reply-To: <201001040840.28000.holger+oe@freyther.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Qt4 GLES (once again)
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
X-List-Received-Date: Mon, 04 Jan 2010 08:24:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04-01-10 08:40, Holger Hans Peter Freyther wrote:
> On Saturday 02 January 2010 09:28:18 Koen Kooi wrote:
> 
>> If that works, I can live with that.
> 
> Hi Koen,
> 
> that is the current patch. It is working for the !GLES case and it would be
> great if you could test the GLES case and then I would be happy to commit
> it.

For one it's missing the qt4-x11 case :)

regards,

Koen

> 
> 
> ich@knecht:/data/openembedded/openembedded$ cat 0001-qt4-embedded-make-qt4-embedded-and-qt4-
> embedded-gles.patch 
> From 4b7c9f94bc7441919e1b9e24179e0b45236739ae Mon Sep 17 00:00:00 2001
> From: Holger Hans Peter Freyther <zecke@selfish.org>
> Date: Mon, 4 Jan 2010 15:37:05 +0800
> Subject: [PATCH] qt4-embedded: make qt4-embedded and qt4-embedded-gles both provide qt4-embedded
> 
> This way a distribution/user can set PREFERRED_PROVIDER_qt4-embedded = "qt4-embedded-gles"
> to select the GLES/OpenVG runtime. The default is qt4-embedded as GLES require a dedicated
> library most of the time provided as a binary blob by the vendor requiring the user
> to manually download and store it at the right place.
> ---
>  conf/compatibility-providers.conf      |    1 +
>  recipes/qt4/qt4-embedded-gles_4.6.0.bb |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/compatibility-providers.conf b/conf/compatibility-providers.conf
> index 10a81f2..cf61ab5 100644
> --- a/conf/compatibility-providers.conf
> +++ b/conf/compatibility-providers.conf
> @@ -47,6 +47,7 @@ PREFERRED_PROVIDER_openmoko-alsa-scenarios ?= "alsa-scenarii-shr"
>  PREFERRED_PROVIDER_opkg ?= "opkg"
>  #PREFERRED_PROVIDER_opkg ?= "opkg-nogpg"
>  PREFERRED_PROVIDER_qemu-native ?= "qemu-native"
> +PREFERRED_PROVIDER_qt4-embedded ?= "qt4-embedded"
>  PREFERRED_PROVIDER_qt4x11 ?= "qt4-x11-free"
>  PREFERRED_PROVIDER_task-bootstrap ?= "task-bootstrap"
>  PREFERRED_PROVIDER_tslib-conf ?= "tslib"
> diff --git a/recipes/qt4/qt4-embedded-gles_4.6.0.bb b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> index f819c66..06cdcc5 100644
> --- a/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> +++ b/recipes/qt4/qt4-embedded-gles_4.6.0.bb
> @@ -1,6 +1,7 @@
>  require qt4-embedded.inc
>  PR = "${INC_PR}.0"
>  
> +PROVIDES += "qt4-embedded"
>  QT_GLFLAGS = "-opengl es2 -openvg"
>  
>  require qt-4.6.0.inc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLQaUgMkyGM64RGpERAiziAKC5XLmNDn/ZnMtfNCn/Z5PZZOZziQCdEiWt
yRluDfRgv/sO6OcWRWb7kwE=
=ZKyX
-----END PGP SIGNATURE-----



