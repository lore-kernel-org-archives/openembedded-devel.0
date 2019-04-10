Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id 288127D785
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 09:19:55 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 64so1269711otb.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Lg6Xd0PIX+HqoamccjVAsxjaLOjgP43idhf7yQz4EeI=;
	b=UgzUt/KerY2DKBPygpG6M87Uqfw5u+D1iF8PVawb7yjRCbRg6JqeWsvxA1xnKYlaHT
	jIJ9+eONQ91Zklx/3YzaVqqbuu8lSXWnrX5pSAPGU/HCBoHYFK0wIIDbRHho/4OhXm5c
	36EJ/EPqMw7UVpBg3RHFfNUzdKQ+Z+QcIqUu7wjCNXmutAHRNfOJKH1Z5Viz98w8M1Jr
	H1yuybbTHgjIiuIkff4NvB9cFEpvisv0aPFe06qizfJYCz0fcTKfcVTzFaaA+YdgBoxL
	KVjBElXbLZREtUwd+OOAcMamqq+RBC836FoLeYJX7HdMRXiM5hwt/ngkKOR87w1OV0cz
	8bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Lg6Xd0PIX+HqoamccjVAsxjaLOjgP43idhf7yQz4EeI=;
	b=txBmWHT0mHizetSbWIAdV+RBIwo9CTfaVg/4jccrqty/Ulj1mKWrdONnly8QJLn58M
	KmCSR3Nq7JKGhPJnGhnx8FBE78bUpkD9p4Mbz0On2DDAuPaQGTZv0ODi44u+vvmbLC4F
	3E6y0+AzXFUe5lfLonekmBA39TnApx2OnJ14Im5zmGPF2Ir0VoE+MeP04/zey1BWCePS
	zhTCjhvQ0wINB3cMqmXx3SWkOLTD3yGU2swAqN9Xcq+cBflDCkGqkWAwzOL1MI25+yzr
	w7FmiwOh4WoQjawo71pZBP9QYAWBAdQy8BmsTQQ5cEZhclY6Im9c+TCwvDfCaNY4vo8U
	I5EA==
X-Gm-Message-State: APjAAAXLnsRkEv91atsf7VDV8HQS34dvpOL3XgeEcDFq91SGVg/W9bVa
	+eCLW7zjFSL20wK8wgNmKKiSjpKv/tN8qU3Sf58=
X-Google-Smtp-Source: APXvYqwc0u/zMAZytKll1qElrVyBGh3MRrvUm/82H4om0jMNI6Sk+WCc8oXgOUP3Wbut6KDkKHcKp/tsPGt+kNIYrLI=
X-Received: by 2002:a05:6830:16d3:: with SMTP id
	l19mr26279017otr.92.1554887995974; 
	Wed, 10 Apr 2019 02:19:55 -0700 (PDT)
MIME-Version: 1.0
References: <1554300459-3158-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CANNYZj9CtQ9Ucm-rjxNBfH9oTCai+WeKCWNnszVrQoDiLN23rA@mail.gmail.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C12AA8@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C12AA8@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 10 Apr 2019 11:19:44 +0200
Message-ID: <CANNYZj-wPdpWZsPZ-gfKXw+Gd=OezcQnaGogv+_RegHdC209Dg@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][patch] dnf-plugin-tui: new recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2019 09:19:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sure, no problem. As long as you continue to maintain that recipe.

Alex

On Wed, 10 Apr 2019 at 10:45, Zheng, Ruoqin <zhengrq.fnst@cn.fujitsu.com> w=
rote:
>
> Hi Alex:
>
> I got it. My previous patch is a little inappropriate. So, I will only in=
clude dnf-plugin-tui as a single recipe in my v2 patch, is that OK?
> If users want to add dnf-plugin-tui to their target or SDK, they can modi=
fy their recipe file by themselves.
>
> dnf-plugin-tui can provide an text-based user interface for dnf instead o=
f command line and desktop.
>   - By dnf-plugin-tui, you can use a manifest file to install/remove/upgr=
ade packages.
>   - By nativesdk-dnf-plugin-tui, users can customize image.
>   - By dnf-plugin-tui, users can generate images in various formats, such=
 as JFFS2, INITRAMFS, SquashFS image and so on(Please reference to https://=
github.com/ubinux/dnf-plugin-tui/blob/master/README.md).
>   - By nativesdk-dnf-plugin-tui, users can manage srpm packages and SPDX =
files.
>
> --------------------------------------------------
> Zheng Ruoqin
> Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)
> ADDR.: No.6 Wenzhu Road, Software Avenue,
>        Nanjing, 210012, China
> MAIL : zhengrq.fnst@cn.fujistu.com
>
>
> > -----Original Message-----
> > From: Alexander Kanavin [mailto:alex.kanavin@gmail.com]
> > Sent: Wednesday, April 03, 2019 4:32 PM
> > To: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> > Cc: OpenEmbedded Devel List <openembedded-
> > devel@lists.openembedded.org>
> > Subject: Re: [oe] [meta-oe][patch] dnf-plugin-tui: new recipe
> >
> > Apologies, but i have to say no to this patch.
> >
> > 1) Most people do not want dnf tooling in their SDKs. Your patches incl=
ude that
> > unconditionally.
> > 2) bbappends do not belong in meta-oe, as they modify behavior of origi=
nal
> > recipes quietly when you enable that layer. You need to modify the orig=
inal
> > recipes, and send patches for that.
> > 3) The recipe for the tui plugin should not be nativesdk-specific. If s=
omeone
> > wants that on target, they should be able to.
> > 4) You had previously submitted this to oe-core, it was discussed, and =
the
> > outcome was that it's better to add generic tooling support to eSDK for=
 the use
> > case (customizing a rootfs). Meta-oe is not the right place for a dnf/r=
pm-specific
> > solution, especially if it's forced on everyone.
> >
> > I would suggest that you make your own layer for this (e.g.
> > meta-dnf-tui) and publish that in github next to the tui plugin.
> >
> > Alex
> >
> >
> >
> >
> > On Wed, 3 Apr 2019 at 07:08, Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > wrote:
> > >
> > > A new recipe for dnf-plugin called tui.
> > > This plugin can work in nativesdk environment, and provide some addit=
ional
> > functions:
> > >  1. Add new command dnf tui --init to make dnf to work on host  2.
> > > Text-based user interface for dnf.
> > >  3. Manage SPDX files
> > >  4. Manage SRPM files
> > >  5. Add installation samples for dnf
> > >
> > > More details, please reference to https://github.com/ubinux/dnf-plugi=
n-
> > tui/tree/master.
> > >
> > > In addition, modify some nativesdk recipes to include dnf-plugin-tui =
in meta-
> > toolchain.
> > >
> > > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > > ---
> > >  .../recipes-core/meta/meta-environment.bbappend    |  3 +++
> > >  .../nativesdk-packagegroup-sdk-host.bbappend       |  2 ++
> > >  .../recipes-devtools/dnf-plugin-tui/dnf_%.bbappend | 29
> > ++++++++++++++++++++++
> > >  .../dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb     | 29
> > ++++++++++++++++++++++
> > >  4 files changed, 63 insertions(+)
> > >  create mode 100644
> > > meta-oe/recipes-core/meta/meta-environment.bbappend
> > >  create mode 100644
> > > meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb=
a
> > > ppend  create mode 100644
> > > meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
> > >  create mode 100644
> > > meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
> > >
> > > diff --git a/meta-oe/recipes-core/meta/meta-environment.bbappend
> > > b/meta-oe/recipes-core/meta/meta-environment.bbappend
> > > new file mode 100644
> > > index 0000000..2ac268f
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-core/meta/meta-environment.bbappend
> > > @@ -0,0 +1,3 @@
> > > +create_sdk_files_append() {
> > > +    echo 'export MACHINE_ARCH=3D${MACHINE_ARCH}' >> $script }
> > > diff --git
> > > a/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
b
> > > bappend
> > > b/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.=
b
> > > bappend
> > > new file mode 100644
> > > index 0000000..9f85825
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-core/packagegroups/nativesdk-packagegroup-sdk-h=
o
> > > +++ st.bbappend
> > > @@ -0,0 +1,2 @@
> > > +RDEPENDS_${PN}_append =3D " nativesdk-dnf-plugin-tui \
> > > +                          nativesdk-createrepo-c"
> > > diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
> > > b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
> > > new file mode 100644
> > > index 0000000..ce683e4
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf_%.bbappend
> > > @@ -0,0 +1,29 @@
> > > +RDEPENDS_${PN}_class-nativesdk +=3D " \
> > > +  python3-core \
> > > +  python3-codecs \
> > > +  python3-netclient \
> > > +  python3-email \
> > > +  python3-threading \
> > > +  python3-distutils \
> > > +  python3-logging \
> > > +  python3-fcntl \
> > > +  librepo \
> > > +  python3-shell \
> > > +  libcomps \
> > > +  libdnf \
> > > +  python3-sqlite3 \
> > > +  python3-compression \
> > > +  python3-rpm \
> > > +  python3-iniparse \
> > > +  python3-json \
> > > +  python3-curses \
> > > +  python3-misc \
> > > +  python3-gpg \
> > > +  libnewt-python \
> > > +  "
> > > +
> > > +do_install_append_class-nativesdk() {
> > > +        create_wrapper ${D}/${bindir}/dnf \
> > > +                RPM_CONFIGDIR=3D${SDKPATHNATIVE}${libdir_nativesdk}/=
rpm \
> > > +                RPM_NO_CHROOT_FOR_SCRIPTS=3D1 }
> > > diff --git
> > > a/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
> > > b/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tui.bb
> > > new file mode 100644
> > > index 0000000..4fbbac8
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/nativesdk-dnf-plugin-tu=
i
> > > +++ .bb
> > > @@ -0,0 +1,29 @@
> > > +SUMMARY =3D "A text-based user interface plugin for dnf, used in too=
lchian
> > environment"
> > > +LICENSE =3D "GPLv2"
> > > +
> > > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > > +
> > > +SRC_URI =3D "git://github.com/ubinux/dnf-plugin-tui.git;branch=3Dmas=
ter "
> > > +
> > > +SRCREV =3D "a743116fa78a20f9828533c1de79ad8e4ab2d16c"
> > > +
> > > +inherit nativesdk distutils3-base
> > > +
> > > +S =3D "${WORKDIR}/git"
> > > +
> > > +RDEPENDS_${PN} +=3D " \
> > > +  nativesdk-dnf \
> > > +  nativesdk-libnewt-python \
> > > +  "
> > > +
> > > +do_install_append() {
> > > +        install -d ${D}${datadir}/dnf
> > > +        install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
> > > +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> > > +        install -m 0755 ${S}/dnf-plugins/mkimg/*
> > ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> > > +        for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
> > > +            install -m 0755 ${S}/dnf-plugins/$file
> > ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins
> > > +        done
> > > +}
> > > +
> > > +FILES_${PN} +=3D "${datadir}/dnf"
> > > --
> > > 2.7.4
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>
>
>

