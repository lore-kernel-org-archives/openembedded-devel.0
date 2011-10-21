Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH8Oa-0006YV-CH for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 08:15:56 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RH8Iv-0000wQ-9D for openembedded-devel@lists.openembedded.org;
	Fri, 21 Oct 2011 08:10:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:10:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2011 08:10:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 21 Oct 2011 08:09:53 +0200
Message-ID: <j7r2bh$7jb$1@dough.gmane.org>
References: <cover.1319168013.git.otavio@ossystems.com.br>
	<b9bb7aa6a838bfad2d268907d0af7820cfd46618.1319168013.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <b9bb7aa6a838bfad2d268907d0af7820cfd46618.1319168013.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-oe][PATCH 4/4] systemd-serialgetty: don't require systemd_git.bb
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
X-List-Received-Date: Fri, 21 Oct 2011 06:15:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 21-10-11 05:34, Otavio Salvador schreef:
> Avoids the recompile of this package every time systemd is change.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> .../recipes-core/systemd/systemd-serialgetty.bb    |   22 
> ++++++------------- 1 files changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb 
> b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb index 
> d7e8571..b4c6880 100644 --- 
> a/meta-oe/recipes-core/systemd/systemd-serialgetty.bb +++ 
> b/meta-oe/recipes-core/systemd/systemd-serialgetty.bb @@ -1,19 +1,10 @@ 
> -require systemd_git.bb - -SRC_URI = 
> "git://anongit.freedesktop.org/systemd;protocol=git \ - 
> file://serial-getty@.service \ -          " - DESCRIPTION = "Systemd 
> serial config" -SERIAL_CONSOLE ?= "115200 /dev/ttyS0" +LICENSE = "MIT" 
> +LIC_FILES_CHKSUM = 
> "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"

The file is originally from systemd itself, so not MIT.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOoQyxMkyGM64RGpERArGSAJkBkdBzKEyxs9aJqR9LCtI8Ss2fFACfRgoi
fcId0k30yaa7Df6S8bHsGps=
=QjIM
-----END PGP SIGNATURE-----



