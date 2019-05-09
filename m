Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178])
	by mail.openembedded.org (Postfix) with ESMTP id BDA2B7D6A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 May 2019 17:18:24 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id g190so1924879qkf.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 May 2019 10:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hqMDsNh4O60/pxD0O0gUhU3P77lvJGj/BEHXGihtORU=;
	b=BO5ZYHuMAXUfvJUm6pchFoj2gHzuIU6nOaXtC8tdGUiPgLeHli8dWCbaZ49AtS7PyT
	OlxB0zkT7G4j7ADiTg0BbJbVdvALNIg446+FRbhfHXrYoRY3D48RqgDMKUUAs7GpNYjG
	38wBHI3+v6Ip0Dj58fsfJA8FkJ71WIZPteVyN/aRlKUrufhc0PvR+6xxXTyJpwL1pSAm
	dXB0fDWPbyQuWg0SyFUI+QUx5phNUb/0TV6G7aXj5mBrh+fgcuHFQfm3w7HiVRCbcFjS
	KV/OevFN5bWvEHWj8PYWhiAIv/VF3jXtdIQpAUEMvTbuLGEtXF1QosQVCqn6yX/AM4+3
	rbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hqMDsNh4O60/pxD0O0gUhU3P77lvJGj/BEHXGihtORU=;
	b=dXUib2lmv61CrvOhM9THA3sPflKcTcYGm88DVpB8hQPxJhMgcG39I54dzMDN0zXIIK
	f+/zMN9/J4OvZ66y+N3G/W8O3qKea6UUqDmhyyTnaJ7WH8tnBCzPnD9+KTeefdgNhaFL
	VjBAFP5OyEm2/epvdAyrQNPa/DJ9uTJidIfKbTn8uh3eWXdkyk5EEBBqM7YRV0AJ3kMt
	rGwmOBT0lpz4iruNNK2uV32H4eU11N8SfmDC30VvOP2FDNUTjzYaAbzBYXf9nZioGXvz
	JMF+XLsbn2kk4DYiH26drILATcTOGcKlTwtZi08ljmuY0PrKShJ+gAJREB1D1JTbZ0Wd
	e76g==
X-Gm-Message-State: APjAAAUIJgJCTMMPDqzHJUDZzqLt1Z8CLNTYgdckmso/quQobLzsC62B
	emZbFus6Nr9eC/4xYDF23bto/M7GyTjVbv8Lh1owiXK3
X-Google-Smtp-Source: APXvYqwv4lxBSuCjjW/5q82UiMLGinCpPxDZ0a2RXLRxBojfY8VA6HmVPcpeKc1bl1/MHMJx/q/Nhn1G+XHw8ZmkTKk=
X-Received: by 2002:a37:5009:: with SMTP id e9mr4364248qkb.206.1557422305230; 
	Thu, 09 May 2019 10:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <1555093001-41848-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<33D4DBCAC5F2D74E96B07F6E7632BF73B1C1693E@G08CNEXMBPEKD01.g08.fujitsu.local>
In-Reply-To: <33D4DBCAC5F2D74E96B07F6E7632BF73B1C1693E@G08CNEXMBPEKD01.g08.fujitsu.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 May 2019 10:17:59 -0700
Message-ID: <CAMKF1spFHciZqujO0nxqNsDvYdPHrgk0pyWkpQi2a9jDr_7O+g@mail.gmail.com>
To: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][patch v2] dnf-plugin-tui: new recipe
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
X-List-Received-Date: Thu, 09 May 2019 17:18:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Somehow this patch is not captured by patchwork, can you resend it so
we can get it on patchwork ?

On Thu, May 9, 2019 at 5:14 AM Zheng, Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
>
> Ping
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
> > Sent: Saturday, April 13, 2019 2:17 AM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Zheng, Ruoqin/=E9=83=91 =E8=8B=A5=E9=92=A6 <zhengrq.fnst@cn.fujitsu=
.com>
> > Subject: [oe][meta-oe][patch v2] dnf-plugin-tui: new recipe
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
> > 1.8.3.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

