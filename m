Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2D760167
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 11:02:53 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XosAu-00062b-90 for openembedded-devel@lists.openembedded.org;
	Thu, 13 Nov 2014 12:02:52 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 12:02:52 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Nov 2014 12:02:52 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 13 Nov 2014 12:02:35 +0100
Message-ID: <m4234b$gsg$1@ger.gmane.org>
References: <cover.1415758217.git.hongxu.jia@windriver.com>
	<d1a6e0fd2dabf3e291fe2b1c5e94f429fe390184.1415758217.git.hongxu.jia@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <d1a6e0fd2dabf3e291fe2b1c5e94f429fe390184.1415758217.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH 1/1] libbonobo.inc: add libbonobo-bin package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Nov 2014 11:02:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hongxu Jia schreef op 12-11-14 03:13:
> The previous libbonobo package contains perl scripts, while installing 
> libbonobo, package management detected perl required, but it actually not
> needed as lib. So add libbonobo-bin package to contain these scripts. It
> refers debian: https://packages.debian.org/sid/libbonobo2-bin
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com> --- 
> meta-gnome/recipes-gnome/bonobo/libbonobo.inc | 3 ++- 1 file changed, 2
> insertions(+), 1 deletion(-)
> 
> diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc
> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc index 8b6007e..e0f6168
> 100644 --- a/meta-gnome/recipes-gnome/bonobo/libbonobo.inc +++
> b/meta-gnome/recipes-gnome/bonobo/libbonobo.inc @@ -5,10 +5,11 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
> \ SECTION = "x11/gnome/libs" DEPENDS = "glib-2.0 orbit2 intltool-native
> libxml2 dbus dbus-glib"
> 
> -inherit gnomebase gtk-doc +inherit gnomebase gtk-doc lib_package
> 
> ORBIT_IDL_SRC = "${STAGING_BINDIR_NATIVE}/orbit-idl-2"
> 
> +RDEPENDS_${PN}-bin = "${PN} perl" FILES_${PN} +=
> "${libdir}/orbit-2.0/*.so ${libdir}/bonobo/monikers/*.so" FILES_${PN}-dbg
> += "${libdir}/bonobo/monikers/.debug \ 
> ${libdir}/bonobo-2.0/samples/.debug ${libdir}/orbit-2.0/.debug"
> 

This breaks the upgrade path
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUZI/LMkyGM64RGpERAtVEAJ0XmKfZNy6DSxfpmN1DLPGrSf381ACgmPOz
D6JMY11ejawTrkxO3ZcoBOw=
=xLd+
-----END PGP SIGNATURE-----


