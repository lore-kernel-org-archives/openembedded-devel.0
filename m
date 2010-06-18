Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OPYxr-0005Ro-05 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 12:38:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OPYtV-0001HY-Er for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 12:33:53 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 12:33:53 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 12:33:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 18 Jun 2010 12:33:38 +0200
Message-ID: <hvfi22$pff$1@dough.gmane.org>
References: <20100615133736.310590@gmx.net>
	<201006180129.03630.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <201006180129.03630.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Fixes install error in xfwm4-themes_4.6.0
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
X-List-Received-Date: Fri, 18 Jun 2010 10:38:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-06-10 01:29, Andreas Mueller wrote:
> From c6fe3e0c5bee620b77871baef0b8cd4680fa2cbd Mon Sep 17 00:00:00 2001
> From: Andreas Mueller <schnitzeltony@gmx.de>
> Date: Fri, 18 Jun 2010 01:21:16 +0200
> Subject: [PATCH] Fixes install error in xfwm4-themes_4.6.0
> 
> File 'maximize-inactive.xpm' was listed twice in Makefile.am
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  .../xfwm4-themes-4.6.0/remove-double-files.patch   |   10 ++++++++++
>  recipes/xfce-base/xfwm4-themes_4.6.0.bb            |    6 +++++-
>  2 files changed, 15 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
> 
> diff --git a/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch b/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
> new file mode 100644
> index 0000000..14dbe4d
> --- /dev/null
> +++ b/recipes/xfce-base/xfwm4-themes-4.6.0/remove-double-files.patch
> @@ -0,0 +1,10 @@
> +--- xfwm4-themes-4.6.0/themes/redmond/Makefile.am	2009-02-26 00:54:06.000000000 +0100
> ++++ xfwm4-themes-4.6.0/themes/redmond/Makefile.am~	2010-06-14 11:10:00.000000000 +0200
> +@@ -16,7 +16,6 @@
> + 	left-inactive.xpm \
> + 	maximize-active.xpm \
> + 	maximize-toggled-active.xpm \
> +-	maximize-inactive.xpm \
> + 	maximize-toggled-inactive.xpm \
> + 	maximize-inactive.xpm \
> + 	maximize-pressed.xpm \
> diff --git a/recipes/xfce-base/xfwm4-themes_4.6.0.bb b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
> index d71042b..93f8e92 100644
> --- a/recipes/xfce-base/xfwm4-themes_4.6.0.bb
> +++ b/recipes/xfce-base/xfwm4-themes_4.6.0.bb
> @@ -1,7 +1,7 @@
>  # xfwm4-themes OE build file
>  
>  SECTION = "x11/wm"
> -PR = "r4"
> +PR = "r5"
>  
>  DEPENDS = "xfwm4 libglade libxml2"
>  RDEPENDS_${PN} = "xfwm4 libglade libxml2"
> @@ -10,6 +10,10 @@ inherit xfce46
>  
>  SRC_URI = "http://mocha.xfce.org/archive/src/art/xfwm4-themes/4.6/xfwm4-themes-${PV}.tar.bz2"
>  
> +SRC_URI += " \
> +    file://remove-double-files.patch \
> +"
> +
>  PACKAGES_DYNAMIC = "xfwm4-theme-*"
>  
>  python populate_packages_prepend () {

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMG0uCMkyGM64RGpERAjE0AJ9N8SY/vhWbknHQxI7t1cvAZfHZowCgu0o+
DyAuBvK9ij7CAV3Y0P78Dgw=
=kP4x
-----END PGP SIGNATURE-----



