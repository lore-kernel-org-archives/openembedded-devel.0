Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1THVWL-00031a-7H
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Sep 2012 10:02:02 +0200
Received: by iebc13 with SMTP id c13so6641591ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Sep 2012 00:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=qGL1dbhOtY5gj8qEB7vEnumFVXWQJcvysWTRAbXWXoQ=;
	b=svv+ymAUe3QqjwLxx/XTxcLuN2gddqKcOSz+lKrvXVuVzAJATb0rnoH1l+Hg01rxJS
	yHihfaE6Qg0JVZJIKNveAMdUSAyscP/MAoaWnLsObdoB6qfh63YRjksBRlzxNvI8VAvF
	i75kVMcb7LpkKa7aWywWUzTyBPLPXhgFWh/ZpEhSQY/BbKGVcL1jUwYUw5Ap6ImGKZbG
	SQsmrgggH4XYFzELjZ9HjyIROwzqIBY/3joP2LGOY/I++sIdPxTVwUgB3x4/qxKjbxNs
	7eHpR5Du9fIH1vx8ntK96u/ZxC5aA8t48mJuJklOx9G8FfouPOJ95MIRSRaJakH7BP5n
	05tA==
MIME-Version: 1.0
Received: by 10.50.236.6 with SMTP id uq6mr832875igc.50.1348818547740; Fri, 28
	Sep 2012 00:49:07 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Fri, 28 Sep 2012 00:49:07 -0700 (PDT)
In-Reply-To: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
References: <1348814151-31167-1-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 28 Sep 2012 09:49:07 +0200
Message-ID: <CALbNGRQUij-JZdKVW3KoNu+tgatquyA0ZBT6yDgdguJPEgpfEQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe, meta-xfce 1/3] glade3: initial add 3.8.2
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
X-List-Received-Date: Fri, 28 Sep 2012 08:02:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 28, 2012 at 8:35 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...gnome-doc-utils.make-sysrooted-pkg-config.patch |   51 ++++++++++++++=
++++++
>  meta-oe/recipes-devtools/glade/glade3_3.8.2.bb     |   19 +++++++
>  2 files changed, 70 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/glade/files/0001-gnome-doc-u=
tils.make-sysrooted-pkg-config.patch
>  create mode 100644 meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
>
> diff --git a/meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.ma=
ke-sysrooted-pkg-config.patch b/meta-oe/recipes-devtools/glade/files/0001-g=
nome-doc-utils.make-sysrooted-pkg-config.patch
> new file mode 100644
> index 0000000..1b24c39
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/glade/files/0001-gnome-doc-utils.make-sysr=
ooted-pkg-config.patch
> @@ -0,0 +1,51 @@
> +From aed002cd9ff9e8f972120fbac33b4a65aba952e1 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
> +Date: Tue, 25 Sep 2012 10:28:33 +0200
> +Subject: [PATCH] gnome-doc-utils.make: sysrooted pkg-config
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +same approach as used used in gnome-disk-utility:
> +
> +In cross environment we have to prepend the sysroot to the path found by
> +pkgconfig since the path returned from pkgconfig does not have sysroot p=
refixed
> +it ends up using the files from host system. Now usually people have gno=
me installed
> +so the build succeeds but if you dont have gnome installed on build host=
 then
> +it wont find the files on host system and packages using gnome-doc-utils=
 wont
> +compile.
> +
> +This should work ok with non sysrooted builds too since in those cases P=
KG_CONFIG_SYSROOT_DIR
> +will be empty
> +
> +Upstream-Status: pending
> +
> +Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> +---
> + gnome-doc-utils.make |   10 +++++-----
> + 1 files changed, 5 insertions(+), 5 deletions(-)
> +
> +diff --git a/gnome-doc-utils.make b/gnome-doc-utils.make
> +index 42d9df3..f71bbfa 100644
> +--- a/gnome-doc-utils.make
> ++++ b/gnome-doc-utils.make
> +@@ -133,11 +133,11 @@ _DOC_ABS_SRCDIR =3D @abs_srcdir@
> + _xml2po ?=3D `which xml2po`
> + _xml2po_mode =3D $(if $(DOC_ID),mallard,docbook)
> +
> +-_db2html ?=3D `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
> +-_db2omf  ?=3D `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
> +-_chunks  ?=3D `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/x=
slt/docbook/utils/chunks.xsl
> +-_credits ?=3D `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/x=
slt/docbook/utils/credits.xsl
> +-_ids ?=3D $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnom=
e/xslt/docbook/utils/ids.xsl
> ++_db2html ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2htm=
l gnome-doc-utils`
> ++_db2omf  ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf=
 gnome-doc-utils`
> ++_chunks  ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir=
 gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
> ++_credits ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir=
 gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
> ++_ids ?=3D ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gno=
me-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
> +
> + if ENABLE_SK
> + _ENABLE_SK =3D true
> +--
> +1.7.6.5
> +
> diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb b/meta-oe/rec=
ipes-devtools/glade/glade3_3.8.2.bb
> new file mode 100644
> index 0000000..8cd6a0e
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/glade/glade3_3.8.2.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION =3D "Glade - A User Interface Designer"
> +HOMEPAGE =3D "http://www.gnu.org/software/gnash"
> +LICENSE =3D "GPLv2 & LGPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Daabe87591cb8ae0f3c68be6977bb5=
522 \
> +                    file://COPYING.LGPL;md5=3D3bf50002aefd002f49e7bb8540=
63f7e7"
> +DEPENDS =3D "gtk+ gnome-doc-utils-native"
> +
> +inherit autotools pkgconfig pythonnative
> +
> +SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${=
PV}.tar.xz \
> +           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch"
> +SRC_URI[md5sum] =3D "b5da0ce717b2dc710e93a10b97c0f9ce"
> +SRC_URI[sha256sum] =3D "f180a5018eee6e3fe574854cb025af897dd9962b01d17d57=
52e626876d388b19"
> +
> +EXTRA_OECONF +=3D "--disable-scrollkeeper"
> +
> +FILES_${PN} +=3D "${datadir}/icons"
> +FILES_${PN}-dbg +=3D "${libdir}/glade3/modules/.debug"
> +FILES_${PN}-dev +=3D "${libdir}/glade3/modules/*.la"
> --
> 1.7.4.4
>
Patchwork does not like the third of this series. So this series can be fou=
nd at

git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git
branch patches

Andreas


