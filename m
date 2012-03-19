Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S9cC2-0005rO-C5 for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 14:00:10 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S9c3T-0002Do-HE for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 13:51:19 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:51:19 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 13:51:19 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 19 Mar 2012 13:50:57 +0100
Message-ID: <jk7a3p$8i0$1@dough.gmane.org>
References: <1332104369-4485-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1332104369-4485-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe 1/2] midori: remove midori.inc and oe-stylize
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
X-List-Received-Date: Mon, 19 Mar 2012 13:00:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-03-12 21:59, Andreas Müller schreef:
> 
> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
> meta-oe/recipes-connectivity/midori/midori.inc     |   39
> ------------------ .../recipes-connectivity/midori/midori_0.4.4.bb    |
> 42 ++++++++++++++++++- 2 files changed, 39 insertions(+), 42
> deletions(-) delete mode 100644
> meta-oe/recipes-connectivity/midori/midori.inc
> 
> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc
> b/meta-oe/recipes-connectivity/midori/midori.inc deleted file mode
> 100644 index dccb3ee..0000000 ---
> a/meta-oe/recipes-connectivity/midori/midori.inc +++ /dev/null @@ -1,39
> +0,0 @@ -DESCRIPTION = "Midori is a lightweight web browser." -HOMEPAGE =
> "http://www.twotoasts.de/index.php?/pages/midori_summary.html" -LICENSE =
> "LGPLv2.1" -LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" - -DEPENDS =
> "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native
> python-docutils-native" - -inherit gtk-icon-cache pkgconfig - 
> -do_configure() { -    sed -i -e 's:, shell=False::g' -e
> s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript -    ./configure
> \ -            --prefix=${prefix} \ -            --bindir=${bindir} \ -
> --sbindir=${sbindir} \ -            --libexecdir=${libexecdir} \ -
> --datadir=${datadir} \ -            --sysconfdir=${sysconfdir} \ -
> --sharedstatedir=${sharedstatedir} \ -
> --localstatedir=${localstatedir} \ -            --libdir=${libdir} \ -
> --includedir=${includedir} \ -            --infodir=${infodir} \ -
> --mandir=${mandir} \ -            --disable-hildon \ -
> --disable-gtk3 \ -} - -LDFLAGS_append = " -ljavascriptcoregtk-1.0 " - 
> -do_install() { -	oe_runmake DESTDIR=${D} install -} - -RRECOMMENDS_${PN}
> += "glib-networking ca-certificates gnome-icon-theme" - -FILES_${PN}-dev
> += "${datadir}/vala/vapi" - -TARGET_CC_ARCH += "${LDFLAGS}" diff --git
> a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb
> b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb index
> 827eb19..7c51641 100644 ---
> a/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb +++
> b/meta-oe/recipes-connectivity/midori/midori_0.4.4.bb @@ -1,8 +1,44 @@ 
> -require midori.inc - -PARALLEL_MAKE = "" +DESCRIPTION = "Midori is a
> lightweight web browser." +HOMEPAGE =
> "http://www.twotoasts.de/index.php?/pages/midori_summary.html" +LICENSE =
> "LGPLv2.1" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" +DEPENDS =
> "webkit-gtk libsoup-2.4 libsexy openssl vala-native python-native
> python-docutils-native"
> 
> SRC_URI =
> "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori
> \ " SRC_URI[midori.md5sum] = "a6578ebfd237c0f22cce49113b95f70c" 
> SRC_URI[midori.sha256sum] =
> "fadd43f76c1c9f6a16483e60a804e58fb6817c6a595b1acdd59bcbdd7b35bca2" + 
> +inherit gtk-icon-cache pkgconfig + +do_configure() { +    sed -i -e 's:,
> shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g
> wscript +    ./configure \ +            --prefix=${prefix} \ +
> --bindir=${bindir} \ +            --sbindir=${sbindir} \ +
> --libexecdir=${libexecdir} \ +            --datadir=${datadir} \ +
> --sysconfdir=${sysconfdir} \ +
> --sharedstatedir=${sharedstatedir} \ +
> --localstatedir=${localstatedir} \ +            --libdir=${libdir} \ +
> --includedir=${includedir} \ +            --infodir=${infodir} \ +
> --mandir=${mandir} \ +            --disable-hildon \ +
> --disable-gtk3 \ +} +do_install() { +    oe_runmake DESTDIR=${D} install 
> +} + +RRECOMMENDS_${PN} += "glib-networking ca-certificates
> gnome-icon-theme" + +FILES_${PN}-dev += "${datadir}/vala/vapi"

The idea of oe-stylize is to group variables close to the funciton they are
used in, the ones below are for do_compile, so please moves those inbetween
do_configure and do_install

> +LDFLAGS_append = " -ljavascriptcoregtk-1.0 " + +PARALLEL_MAKE = "" + 
> +TARGET_CC_ARCH += "${LDFLAGS}"

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9nK64ACgkQMkyGM64RGpEnNQCfS50Bi4dEh4nbE1peR8UBGxZN
1AsAoLbL5YaMkb/dphBqUCV+cOlgAzJq
=/XfP
-----END PGP SIGNATURE-----



