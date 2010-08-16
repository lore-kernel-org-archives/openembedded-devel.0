Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkzGb-0001ya-08
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 14:58:18 +0200
Received: by iwn38 with SMTP id 38so1621148iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=d11lPSf/cKTG73XS1pF2SVdFbmT3Fp+S6T9DYX5co4k=;
	b=YW3i9kGmRDk+TpINH+bgbVUjfdrzHupsTRuxh1ULN2hI4PRqD5/egWPs4VfUszUIAC
	qo53JAl8bzgV3Xzvo1U6avVOVJpq7O1gS1Ljf7P8oKMXttpOJMxff2rJkCmkStmsX7Nb
	LX18rTmwkZ9ATgBd8E3mXIcYAjAsPHqz/XLHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=orIharPEO6E3yYvPM7JFzuwX7UjERZdXG/U8duoOmBzxYV91Nrzdsil+4LIFEuD6Nf
	e+uIKQqnPvQ+FechHMtT8aaekfM03Tmd7OJwRTWu4jFrIHKVWx2LuRamXL8+Ogtd0/cO
	LOfbT+z4ZKn0aJaS1PeDDPwSmWBtxtqzpf3MM=
MIME-Version: 1.0
Received: by 10.231.14.76 with SMTP id f12mr5554756iba.63.1281963478306; Mon,
	16 Aug 2010 05:57:58 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Mon, 16 Aug 2010 05:57:58 -0700 (PDT)
In-Reply-To: <1281963140-29565-1-git-send-email-fahad_usman@mentor.com>
References: <1281963140-29565-1-git-send-email-fahad_usman@mentor.com>
Date: Mon, 16 Aug 2010 14:57:58 +0200
Message-ID: <AANLkTik3NJf+OF=Eobbmq1iKPdwzj87zmeWF6h6e9GhD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] dcopidl-native_3.5.8.bb: Removed legacy style staging
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
X-List-Received-Date: Mon, 16 Aug 2010 12:58:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/16 Fahad Usman <fahad_usman@mentor.com>:
> * converted do_stage to do_install and replaced ${STAGING_BINDIR} with ${=
D}${bindir}
>
> * and treated the source with oe-stylize.py script
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> =A0recipes/dcop/dcopidl-native_3.5.8.bb | =A0 29 ++++++++++++++++--------=
-----
> =A01 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/recipes/dcop/dcopidl-native_3.5.8.bb b/recipes/dcop/dcopidl-=
native_3.5.8.bb
> index df3f761..1b20e49 100644
> --- a/recipes/dcop/dcopidl-native_3.5.8.bb
> +++ b/recipes/dcop/dcopidl-native_3.5.8.bb
> @@ -1,16 +1,19 @@
> =A0DESCRIPTION =3D "DCOP IDL parser"
> =A0SECTION =3D "kde/devel"
> -PRIORITY =A0 =A0=3D "optional"
> -LICENSE =A0 =A0 =3D "GPL"
> -DEPENDS =A0 =A0 =3D "uicmoc3-native"
> +PRIORITY =3D "optional"
> +LICENSE =3D "GPL"
> +DEPENDS =3D "uicmoc3-native"
> +PR =3D "r2"
>
> -SRC_URI =A0 =A0 =3D "ftp://download.kde.org/pub/kde/stable/${PV}/src/kde=
libs-${PV}.tar.bz2 \
> - =A0 =A0 =A0 =A0 =A0 =A0 file://dcopidl-compile.patch "
> -S =A0 =A0 =A0 =A0 =A0 =3D "${WORKDIR}/kdelibs-${PV}/dcop/dcopidl"
> +SRC_URI =3D "ftp://download.kde.org/pub/kde/stable/${PV}/src/kdelibs-${P=
V}.tar.bz2 \
> + =A0 =A0 =A0 =A0 =A0 file://dcopidl-compile.patch "
> +SRC_URI[md5sum] =3D "acaa37e79e840d10dca326277a20863c"
> +SRC_URI[sha256sum] =3D "779f563fdf0385b973f2238f04d82b5729aefe1c949e4d29=
482b6bb170aa3fe6"
> +
> +S =3D "${WORKDIR}/kdelibs-${PV}/dcop/dcopidl"
>
> =A0inherit native qmake qt3e
>
> -export OE_QMAKE_LINK=3D"${CXX}"
> =A0EXTRA_QMAKEVARS_POST_append =3D "LIBS+=3D-ldl "
> =A0EXTRA_QMAKEVARS_POST_append =3D "CONFIG-=3Dthread "
>
> @@ -19,11 +22,11 @@ do_configure_prepend() {
> =A0 =A0 =A0echo "SOURCES +=3D main.cpp yacc.cc scanner.cc " > dcopidl.pro
> =A0 =A0 =A0echo "HEADERS +=3D yacc.cc.h " >> dcopidl.pro
> =A0}
> -
> -do_stage() {
> - =A0 =A0 install -d ${STAGING_BINDIR}
> - =A0 =A0 install -m 0755 dcopidl ${STAGING_BINDIR}
> +do_install() {
> + =A0 =A0 install -d ${D}${bindir}
> + =A0 =A0 install -m 0755 dcopidl ${D}${bindir}
> =A0}
>
> -SRC_URI[md5sum] =3D "acaa37e79e840d10dca326277a20863c"
> -SRC_URI[sha256sum] =3D "779f563fdf0385b973f2238f04d82b5729aefe1c949e4d29=
482b6bb170aa3fe6"
> +export OE_QMAKE_LINK=3D"${CXX}"
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> --


Looks good to me.
Can you also do the other recipe in the dcop dir?
Thanks!

Frans


