Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF9C7E8D3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 13:10:54 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id d17so10198463qtj.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nez526DC3Ks3nC66zN8sx8dwax7kEb7s+rKOS9R6e7M=;
	b=VL4Gty8rguMprOp2X614toG/x8vOK0QBEXnK1Jobjia2U7fxAhWxkMh84EsdqjNYzJ
	ehbpFsfWWRXvCzPiPYOuBb3s5M/AkJpl+AxGAvhL/4U9yb14owqZy2sQTyZ4ZsHh2UQl
	DRgP/MO3I5keIb3sid/rPTv0LtjkJxXdh2jrZd05ihccEWGSPnIv4h+szlltMm3kmh3p
	Lr9jgVgvHaE5UwwmO+GT690jlWnf8qiPvovah3wWIJt1gytdeSLtRMJH+zz/PfPi98qL
	d1O2msj6EkBgpvFeM3QvVLXcOkjPKNBmza6aW7rjMS0pxPCfT1aGoP1wPeq2XnJ4Setx
	+AdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nez526DC3Ks3nC66zN8sx8dwax7kEb7s+rKOS9R6e7M=;
	b=l9mByr//C0H/sQagQj48PMs5jTWQqT7g6f0JdhmR7mh9fueFO50/PmH9Xv7aEb1ZFn
	rPkWBq7lhK9d+GnTlJXo7u9RxlJO14m+ZwXrufoaUT8VRb40bX0W/kiZf7mP2Z+GzSJ6
	6YBXCHnMOV+P5nFrbaz7SAPzp0GrqOqjpwnzWZ+EKY8X0mXLZab/ZX4RljY/EUjQB8GH
	PCyDAK6mGhh/ctVLBRFhSQ5tgCRBNU+hqVOF3AvNXRDiTUSjl2AeuU3HqObvAqlz0ErO
	URdL1lZ518UW+E1/GxJXA1WKgq5gxfkudxouNnnnVOVmPce2mcn507YenRVdyfQjLZzA
	yTLA==
X-Gm-Message-State: APjAAAXD++daWSIfSX8Ng1RwTJr2/wxTQp5fCV0I3u6mIqdWXB+qmfc6
	JLVsPfwvwG6/co3zHHaZ/BNYXbMFTit7COUEgLo=
X-Google-Smtp-Source: APXvYqyu0s66GGFYrjsPlufVbaF/a1NKrRrKkjJSgf7LTSa6Qwk1WeDsTtoXbK7YmBCb8nxQgU7x6y89NsLzz4388BE=
X-Received: by 2002:ac8:26dc:: with SMTP id 28mr96745516qtp.88.1560863455139; 
	Tue, 18 Jun 2019 06:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <1557610134-3197-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C38CC0@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C38CC0@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Jun 2019 06:10:28 -0700
Message-ID: <CAMKF1sr6-JLUOLJk7CZAENiKkrA5QGKJ8WNWzCEhf_B2ifKoCw@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][patch v3] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 13:10:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 18, 2019 at 5:26 AM Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Hi
>
> This patch is still be ignored. Does anyone have any comment about this p=
atch?
>

somehow it has gone off from patchwork. Can you resend it after
rebasing on top of master again
so that patchwork can capture it from ml.

> Best regards.
> Zheng Ruoqin
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
> > From: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6
> > Sent: Sunday, May 12, 2019 5:29 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> > Subject: [oe][meta-oe][patch v3] dnf-plugin-tui: new recipe
> >
> > This dnf plugin aims to supply a tui interface for user to manage packa=
ges. It has
> > features as following:
> >   1. Add new command dnf tui --init to make dnf to work on host.
> >   2. Text-based user interface for dnf.
> >   3. Manage SPDX files.
> >   4. Manage SRPM files.
> >   5. Add installation samples for dnf.
> >
> > More details please refer to https://github.com/ubinux/dnf-plugin-tui.
> >
> > Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> > ---
> >  .../dnf-plugin-tui/dnf-plugin-tui_git.bb           | 38 ++++++++++++++=
++++++++
> >  .../dnf-plugin-tui/files/oe-remote.repo.sample     |  5 +++
> >  2 files changed, 43 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-
> > tui_git.bb
> >  create mode 100644 meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-
> > remote.repo.sample
> >
> > diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git=
.bb
> > b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> > new file mode 100644
> > index 0000000..e891868
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
> > @@ -0,0 +1,38 @@
> > +SUMMARY =3D "A text-based user interface plugin of dnf for user to man=
age
> > packages. "
> > +LICENSE =3D "GPLv2"
> > +
> > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > +
> > +SRC_URI =3D "git://github.com/ubinux/dnf-plugin-tui.git;branch=3Dmaste=
r "
> > +SRCREV =3D "31d6866d5eda02be9a6bfb1fca9e9095b12eecd1"
> > +PV =3D "1.0"
> > +
> > +SRC_URI_append_class-target =3D "file://oe-remote.repo.sample"
> > +
> > +inherit distutils3-base
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +do_install_append() {
> > +        install -d ${D}${datadir}/dnf
> > +        install -m 0755 ${S}/samples/* ${D}${datadir}/dnf
> > +        install -d ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> > +        install -m 0755 ${S}/dnf-plugins/mkimg/*
> > ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins/mkimg
> > +        for file in $(ls ${S}/dnf-plugins/ | grep -v mkimg); do
> > +            install -m 0755 ${S}/dnf-plugins/$file
> > ${D}${PYTHON_SITEPACKAGES_DIR}/dnf-plugins
> > +        done
> > +}
> > +
> > +do_install_append_class-target() {
> > +        install -d ${D}${sysconfdir}/yum.repos.d
> > +        install -m 0644 ${WORKDIR}/oe-remote.repo.sample
> > +${D}${sysconfdir}/yum.repos.d }
> > +
> > +FILES_${PN} +=3D "${datadir}/dnf"
> > +
> > +RDEPENDS_${PN} +=3D " \
> > +  dnf \
> > +  libnewt-python \
> > +  "
> > +
> > +BBCLASSEXTEND =3D "nativesdk"
> > diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-
> > remote.repo.sample b/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-
> > remote.repo.sample
> > new file mode 100644
> > index 0000000..6c4502e
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/dnf-plugin-tui/files/oe-remote.repo.samp=
l
> > +++ e
> > @@ -0,0 +1,5 @@
> > +[base]
> > +name=3Dmyrepo
> > +baseurl=3Dhttp://127.0.0.1/oe_repo/
> > +enabled=3D1
> > +gpgcheck=3D0
> > --
> > 2.7.4
>
>
>

