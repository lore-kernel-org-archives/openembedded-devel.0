Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S3NoL-0001xw-8F for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 09:25:57 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S3Ng7-0002p1-Ul for openembedded-devel@lists.openembedded.org;
	Fri, 02 Mar 2012 09:17:27 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2012 09:17:27 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Mar 2012 09:17:27 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 02 Mar 2012 09:17:17 +0100
Message-ID: <jipvmb$14d$1@dough.gmane.org>
References: <1330604440-8121-1-git-send-email-obi@opendreambox.org>
	<1330604440-8121-2-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1330604440-8121-2-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH 2/2][resend] udev: consolekit package requires x11
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
X-List-Received-Date: Fri, 02 Mar 2012 08:25:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-03-12 13:20, Andreas Oberritter schreef:
> * consolekit fails to build without x11, so disable creation of
> udev-consolekit, if x11 is unavailable.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- 
> meta-oe/recipes-core/udev/udev_173.bb |    2 +- 
> meta-oe/recipes-core/udev/udev_175.bb |    2 +- 
> meta-oe/recipes-core/udev/udev_181.bb |    2 +- 3 files changed, 3
> insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/udev/udev_173.bb
> b/meta-oe/recipes-core/udev/udev_173.bb index e4e634a..cbbe910 100644 ---
> a/meta-oe/recipes-core/udev/udev_173.bb +++
> b/meta-oe/recipes-core/udev/udev_173.bb @@ -59,7 +59,7 @@
> do_configure_prepend() { INITSCRIPT_NAME = "udev" INITSCRIPT_PARAMS =
> "start 04 S ."
> 
> -PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils udev-consolekit" 
> +PACKAGES =+ "${PN}-systemd libudev libgudev udev-utils
> ${@base_contains('DISTRO_FEATURES', 'x11', 'udev-consolekit', '', d)}"

What does this actually accomplish? If the package is empty it won't get
generated anyway and if it isn't empty you just introduced a QA error.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9QggsACgkQMkyGM64RGpE5IACgh7qgjWEzWhgUWGBMxCjM86GY
lD4AnRj/2+bgRdsJAt/PJ0Xm0jmK+rVb
=9tpQ
-----END PGP SIGNATURE-----



