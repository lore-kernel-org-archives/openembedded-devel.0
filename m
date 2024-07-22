Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C700C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 14:17:05 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.19284.1721657817068661874
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jul 2024 07:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WE3hzdjR;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-260e5b2dfb5so2490683fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 07:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721657816; x=1722262616; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GuGTZy+o+4D5CwiH1pkZPtYpUmk+UBg2dTUOcgYhosc=;
        b=WE3hzdjRqX1G+DdwbHAqQspNGJ5LZhZcpBXSHz/iNNhiSBtNPz5LKtfP676WBjkCG9
         OMYkXwAkTrTtzdhhqkJuo8tIWdM3qydWxRbCO/46zsGuY2y0pfUUfJVzCbU522a9sG1P
         Wo+2lrwbLliBpVBWEPeguoYPefGC0IoQZdtMEMO0pXm/e1AQ8qSOnAR7GlC1dS2Yy75o
         6/qko95parJk5zwWPj+wYlux5cCqxZvl/IdME+FN+5Ps9V//C3P6cS7oLxNIgqTAU5vk
         +7xLLyQzfbJj78Mk8m9P4u+CQ3UjnQHocqRZwcwN9OmadZcoDQGaetx2hnrXyjjrwMNX
         CA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721657816; x=1722262616;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuGTZy+o+4D5CwiH1pkZPtYpUmk+UBg2dTUOcgYhosc=;
        b=PS0Pn+2SV32Y0QEsLAn+lwJmlCGjtFl+buYyiMMGHBIyi+kwxrxn4Uacq4aREPxfOZ
         AQF6YUjJG2JMQpwlnGdshnxlxrzGYuDJtI5hLrl/4DYnnLzVZ+vZVwdCO9Lx6bLAEwkt
         +n6sfhTHR6HKfWafsWUCKCAJFECbBBzbDd2trwzWXr7X27+BtJj519WUAaVF9ixOmLrg
         tg75b1tjZRMJBa3OwkzG/Ez8abCYZtqcX7raNBPj3VF81LxEtkSQQv63jzEUi/OW9TKE
         x95i6XMvjpex/u/QxlLqFmaGWIN6ajdueuSexalcxC5l9UX+Vx3RMzAuBpBBPclmdIJM
         yL0w==
X-Forwarded-Encrypted: i=1; AJvYcCVNxOc6l+J9Ff1PtdEXeIRiDHpILxjLpDglQJz0kTLg7qNE20PEamR2bUpcpZOlz4MLx/+g9aIfzYU9xMlMBTNV3YLVD9bF9vqwINoWMzdCvtt1Y29/v6H0sg==
X-Gm-Message-State: AOJu0Yz/pmQDsD4nOhpJpykdwy3/vBa7UhnkI0I9itzL62TaIS4wJSrW
	5EfgDv0wSOpNCVpr2VSj/0E0nftGeAMpNpXGxVuU+s0FPnsw7bhgRGNkROP03SslZHku3hWaiMD
	tf9QDJARt/xqwFihIVUnG3Fn0AF5Jh4Er
X-Google-Smtp-Source: AGHT+IEclGZHa4kUSwv6rmIH+09XdP+4GZbibcqEYaTZnYdjEhA/4vwasZnYdF1tCo+bhMEyhLlQmL+Tj4mmV0QbKyQ=
X-Received: by 2002:a05:6870:f14a:b0:260:e36f:ef4f with SMTP id
 586e51a60fabf-2638de5be38mr5611838fac.3.1721657816169; Mon, 22 Jul 2024
 07:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <17DBFA54632A2792.21660@lists.openembedded.org>
 <183db266-05c8-48f5-840d-93d93925bcf8@kernel.crashing.org>
 <CAMKF1srQ5ZeQfwbcc-Ht=jVYQ9j3P1Y3dYqdis0hMYg57vWaTg@mail.gmail.com> <BY5PR12MB4950AD95BFBB82B0DC1BB2D1FCA82@BY5PR12MB4950.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4950AD95BFBB82B0DC1BB2D1FCA82@BY5PR12MB4950.namprd12.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2024 07:16:45 -0700
Message-ID: <CAMKF1soqY7z3E=63thVqKt9A=LWjdOW7Rv-pV7mOYm9WrD_otw@mail.gmail.com>
Subject: Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Install media
 ctrl header and library files
To: "Gandhi, Neel" <neel.gandhi@amd.com>
Cc: Armin Kuster <akuster808@gmail.com>, "Hatle, Mark" <mark.hatle@amd.com>, 
	Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008ec564061dd6b2ed"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 14:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111429

--0000000000008ec564061dd6b2ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Armin has a monthly release schedule for Every release branch so you can
make a rough estimate based on previous merge to scarthgap

On Mon, Jul 22, 2024 at 7:08=E2=80=AFAM Gandhi, Neel <neel.gandhi@amd.com> =
wrote:

> Hi Armin / Khem,
>
> Could you please provide an update on when this can be merge into the
> scarthgap branch?
>
> As, you can see that we've already sent this patch for merging it into
> scarthgap, so we're waiting for the same. Also we've already verified thi=
s
> patch in the scarthgap branch by pulling it locally from the master's
> commitID.
>
> Thanks & Regards,
> Neel Gandhi
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* 16 July 2024 00:38
> *To:* Mark Hatle <mark.hatle@kernel.crashing.org>; Armin Kuster <
> akuster808@gmail.com>
> *Cc:* openembeded-devel <openembedded-devel@lists.openembedded.org>;
> Gandhi, Neel <neel.gandhi@amd.com>; Hatle, Mark <mark.hatle@amd.com>
> *Subject:* Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Install
> media ctrl header and library files
>
> I am ok with it. Adding Armin as well.
>
> On Mon, Jul 15, 2024 at 11:59=E2=80=AFAM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> >
> > This got merged to master and appears to be working.  Can I get this
> backported
> > to Scarthgap?
> >
> > Commit (in meta-openembedded master)
> >
> > commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab
> > Author: Neel Gandhi <neel.gandhi@amd.com>
> > Date:   Fri Jun 21 16:53:45 2024 +0530
> >
> >      v4l-utils: Install media ctrl header and library files
> >
> >
> > I verified this commit can be applied directly to scarthgap.
> >
> > --Mark
> >
> > On 6/24/24 10:28 AM, Mark Hatle wrote:
> > > From: Neel Gandhi <neel.gandhi@amd.com>
> > >
> > > Commit 9389d63fdddcab400cb0b243b74d47bf665aba18 removed a previous
> patch
> > > that caused the recipe to install the header and library files. Resto=
re
> > > this behavior to the new meson based build system.
> > >
> > > Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> > > Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > > Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> > > ---
> > >
> > > This is a resend, the first copy seems to have not been delivered to
> the list?
> > >
> > > We would like to get this applied to both master and scarthgap.  Any
> questions
> > > let me know.
> > >
> > >    ...l-media-ctl-header-and-library-files.patch | 78
> +++++++++++++++++++
> > >    .../v4l2apps/v4l-utils_1.26.1.bb              |  1 +
> > >    2 files changed, 79 insertions(+)
> > >    create mode 100644
> > >
> meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-medi=
a-ctl-header-and-library-files.patch
> > >
> > > diff --git
> > >
> a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> > >
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> > > new file mode 100644
> > > index 000000000..6c946d8c4
> > > --- /dev/null
> > > +++
> > >
> b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Install-me=
dia-ctl-header-and-library-files.patch
> > > @@ -0,0 +1,78 @@
> > > +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:00 20=
01
> > > +From: Neel Gandhi <neel.gandhi@amd.com>
> > > +Date: Wed, 5 Jun 2024 13:51:36 +0530
> > > +Subject: [PATCH] media-ctl: Install media-ctl header and library fil=
es
> > > +
> > > +Install mediactl and v4l2subdev header and library
> > > +files, which may be required by 3rd party applications
> > > +to populate and control v4l2subdev device node tree
> > > +
> > > +Install of these files was removed in upstream commit
> > > +0911dce53b08b0df3066be2c75f67e8a314d8729.
> > > +
> > > +Upstream-Status: Denied
> > > +
> > > +v4l-utils maintainers do not promise a stable API for this library,
> and
> > > +do not currently have the time to do so. So exporting the API in thi=
s
> > > +way is fine, as long as we understand that it will change and users =
of
> > > +the API will need to adapt over time.
> > > +
> > > +Signed-off-by: Neel Gandhi <neel.gandhi@amd.com>
> > > +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > > +---
> > > + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------
> > > + 1 file changed, 21 insertions(+), 7 deletions(-)
> > > +
> > > +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson.bui=
ld
> > > +index 3a7b0c9a..40669b4c 100644
> > > +--- a/utils/media-ctl/meson.build
> > > ++++ b/utils/media-ctl/meson.build
> > > +@@ -3,14 +3,24 @@ libmediactl_sources =3D files(
> > > +     'mediactl-priv.h',
> > > + )
> > > + ++libmediactl_api =3D files(
> > > ++    'mediactl.h',
> > > ++    'v4l2subdev.h',
> > > ++)
> > > ++
> > > ++install_headers(libmediactl_api, subdir: 'mediactl')
> > > ++
> > > + libmediactl_deps =3D [
> > > +     dep_libudev,
> > > + ]
> > > + +-libmediactl =3D static_library('mediactl',
> > > +-                             libmediactl_sources,
> > > +-                             dependencies : libmediactl_deps,
> > > +-                             include_directories : v4l2_utils_incdi=
r)
> > > ++libmediactl =3D library('mediactl',
> > > ++                      libmediactl_sources,
> > > ++                      soversion: '0',
> > > ++                      version: '0.0.0',
> > > ++                      install : true,
> > > ++                      dependencies : libmediactl_deps,
> > > ++                      include_directories : v4l2_utils_incdir)
> > > + + dep_libmediactl =3D declare_dependency(link_with : libmediactl)
> > > + +@@ -18,9 +28,13 @@ libv4l2subdev_sources =3D files('libv4l2subdev.=
c')
> > > + libv4l2subdev_sources +=3D media_bus_format_names_h
> > > + libv4l2subdev_sources +=3D media_bus_format_codes_h
> > > + +-libv4l2subdev =3D static_library('v4l2subdev',
> > > +-                               libv4l2subdev_sources,
> > > +-                               include_directories :
> v4l2_utils_incdir)
> > > ++libv4l2subdev =3D library('v4l2subdev',
> > > ++                        libv4l2subdev_sources,
> > > ++                        soversion: '0',
> > > ++                        version: '0.0.0',
> > > ++                        install : true,
> > > ++                        dependencies : dep_libmediactl,
> > > ++                        include_directories : v4l2_utils_incdir)
> > > + + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2subde=
v)
> > > + +-- +2.34.1
> > > +
> > > diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > > b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > > index 52759ef18..eb38d9713 100644
> > > --- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > > +++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.26.1.bb
> > > @@ -28,6 +28,7 @@ PACKAGECONFIG[v4l2-tracer] =3D
> ",-Dv4l2-tracer=3Ddisabled,json-c"
> > >    SRC_URI =3D "\
> > >        git://
> git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1.26 \
> > >
> file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch \
> > > +
> file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch \
> > >    "
> > >     SRCREV =3D "4aee01a027923cab1e40969f56f8ba58d3e6c0d1"
> > >
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#111001):
> https://lists.openembedded.org/g/openembedded-devel/message/111001
> > > Mute This Topic: https://lists.openembedded.org/mt/106851971/3616948
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [mark.hatle@kernel.crashing.org]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--0000000000008ec564061dd6b2ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Armin has a monthly release schedule for Every release br=
anch so you can make a rough estimate based on previous merge to scarthgap<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Mon, Jul 22, 2024 at 7:08=E2=80=AFAM Gandhi, Neel &lt;<a href=3D"mai=
lto:neel.gandhi@amd.com">neel.gandhi@amd.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0)">
Hi Armin / Khem,</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0)">
Could you please provide an update on when this can be merge into the scart=
hgap branch?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0)">
As, you can see that we&#39;ve already sent this patch for merging it into =
scarthgap, so we&#39;re waiting for the same. Also we&#39;ve already verifi=
ed this patch in the scarthgap branch by pulling it locally from the master=
&#39;s commitID.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:11pt;color=
:rgb(0,0,0)">
<br>
</div>
<div id=3D"m_5467235543438541006Signature" style=3D"color:inherit">
<div style=3D"font-family:Arial,sans-serif;font-size:13.3333px;color:rgb(0,=
0,255)">
Thanks &amp; Regards,</div>
<div style=3D"font-family:Arial,sans-serif;font-size:13.3333px;color:rgb(0,=
0,255)">
<span style=3D"background-color:rgb(255,255,255)">Neel Gandhi</span></div>
</div>
<div id=3D"m_5467235543438541006appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"m_5467235543438541006divRplyFwdMsg" dir=3D"ltr"><font face=3D"Ca=
libri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>From:</b> =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;<br>
<b>Sent:</b> 16 July 2024 00:38<br>
<b>To:</b> Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org"=
 target=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;; Armin Kuster &lt=
;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gmail=
.com</a>&gt;<br>
<b>Cc:</b> openembeded-devel &lt;<a href=3D"mailto:openembedded-devel@lists=
.openembedded.org" target=3D"_blank">openembedded-devel@lists.openembedded.=
org</a>&gt;; Gandhi, Neel &lt;<a href=3D"mailto:neel.gandhi@amd.com" target=
=3D"_blank">neel.gandhi@amd.com</a>&gt;; Hatle, Mark &lt;<a href=3D"mailto:=
mark.hatle@amd.com" target=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
<b>Subject:</b> Re: [oe][master][scarthgap][meta-oe][PATCH] v4l-utils: Inst=
all media ctrl header and library files</font>
<div>=C2=A0</div>
</div></div><div dir=3D"ltr">
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>I am ok with it. Adding Armin as well.<br>
<br>
On Mon, Jul 15, 2024 at 11:59=E2=80=AFAM Mark Hatle<br>
&lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org" target=3D"_blank">mar=
k.hatle@kernel.crashing.org</a>&gt; wrote:<br>
&gt;<br>
&gt; This got merged to master and appears to be working.=C2=A0 Can I get t=
his backported<br>
&gt; to Scarthgap?<br>
&gt;<br>
&gt; Commit (in meta-openembedded master)<br>
&gt;<br>
&gt; commit 5f453c3401e20eb5489fac4d3b54a5bf96d019ab<br>
&gt; Author: Neel Gandhi &lt;<a href=3D"mailto:neel.gandhi@amd.com" target=
=3D"_blank">neel.gandhi@amd.com</a>&gt;<br>
&gt; Date:=C2=A0=C2=A0 Fri Jun 21 16:53:45 2024 +0530<br>
&gt;<br>
&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l-utils: Install media ctrl header and=
 library files<br>
&gt;<br>
&gt;<br>
&gt; I verified this commit can be applied directly to scarthgap.<br>
&gt;<br>
&gt; --Mark<br>
&gt;<br>
&gt; On 6/24/24 10:28 AM, Mark Hatle wrote:<br>
&gt; &gt; From: Neel Gandhi &lt;<a href=3D"mailto:neel.gandhi@amd.com" targ=
et=3D"_blank">neel.gandhi@amd.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; Commit 9389d63fdddcab400cb0b243b74d47bf665aba18 removed a previou=
s patch<br>
&gt; &gt; that caused the recipe to install the header and library files. R=
estore<br>
&gt; &gt; this behavior to the new meson based build system.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Neel Gandhi &lt;<a href=3D"mailto:neel.gandhi@amd.=
com" target=3D"_blank">neel.gandhi@amd.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.co=
m" target=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@kernel=
.crashing.org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt; This is a resend, the first copy seems to have not been delivered=
 to the list?<br>
&gt; &gt;<br>
&gt; &gt; We would like to get this applied to both master and scarthgap.=
=C2=A0 Any questions<br>
&gt; &gt; let me know.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0 ...l-media-ctl-header-and-library-files.patch |=
 78 +++++++++++++++++++<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0 .../v4l2apps/<a href=3D"http://v4l-utils_1.26.1=
.bb" target=3D"_blank">v4l-utils_1.26.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0 2 files changed, 79 insertions(+)<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0 create mode 100644<br>
&gt; &gt; meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-Inst=
all-media-ctl-header-and-library-files.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git<br>
&gt; &gt; a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-In=
stall-media-ctl-header-and-library-files.patch<br>
&gt; &gt; b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-In=
stall-media-ctl-header-and-library-files.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000..6c946d8c4<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++<br>
&gt; &gt; b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0001-media-ctl-In=
stall-media-ctl-header-and-library-files.patch<br>
&gt; &gt; @@ -0,0 +1,78 @@<br>
&gt; &gt; +From 3867fcfa4389c7fa271705f1fd1d4bfb74bc1bd1 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Neel Gandhi &lt;<a href=3D"mailto:neel.gandhi@amd.com" tar=
get=3D"_blank">neel.gandhi@amd.com</a>&gt;<br>
&gt; &gt; +Date: Wed, 5 Jun 2024 13:51:36 +0530<br>
&gt; &gt; +Subject: [PATCH] media-ctl: Install media-ctl header and library=
 files<br>
&gt; &gt; +<br>
&gt; &gt; +Install mediactl and v4l2subdev header and library<br>
&gt; &gt; +files, which may be required by 3rd party applications<br>
&gt; &gt; +to populate and control v4l2subdev device node tree<br>
&gt; &gt; +<br>
&gt; &gt; +Install of these files was removed in upstream commit<br>
&gt; &gt; +0911dce53b08b0df3066be2c75f67e8a314d8729.<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Denied<br>
&gt; &gt; +<br>
&gt; &gt; +v4l-utils maintainers do not promise a stable API for this libra=
ry, and<br>
&gt; &gt; +do not currently have the time to do so. So exporting the API in=
 this<br>
&gt; &gt; +way is fine, as long as we understand that it will change and us=
ers of<br>
&gt; &gt; +the API will need to adapt over time.<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Neel Gandhi &lt;<a href=3D"mailto:neel.gandhi@amd=
.com" target=3D"_blank">neel.gandhi@amd.com</a>&gt;<br>
&gt; &gt; +Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.c=
om" target=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + utils/media-ctl/meson.build | 28 +++++++++++++++++++++-------<b=
r>
&gt; &gt; + 1 file changed, 21 insertions(+), 7 deletions(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/utils/media-ctl/meson.build b/utils/media-ctl/meson=
.build<br>
&gt; &gt; +index 3a7b0c9a..40669b4c 100644<br>
&gt; &gt; +--- a/utils/media-ctl/meson.build<br>
&gt; &gt; ++++ b/utils/media-ctl/meson.build<br>
&gt; &gt; +@@ -3,14 +3,24 @@ libmediactl_sources =3D files(<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 &#39;mediactl-priv.h&#39;,<br>
&gt; &gt; + )<br>
&gt; &gt; + ++libmediactl_api =3D files(<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 &#39;mediactl.h&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0 &#39;v4l2subdev.h&#39;,<br>
&gt; &gt; ++)<br>
&gt; &gt; ++<br>
&gt; &gt; ++install_headers(libmediactl_api, subdir: &#39;mediactl&#39;)<br=
>
&gt; &gt; ++<br>
&gt; &gt; + libmediactl_deps =3D [<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0=C2=A0 dep_libudev,<br>
&gt; &gt; + ]<br>
&gt; &gt; + +-libmediactl =3D static_library(&#39;mediactl&#39;,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmediactl_sources,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencies : libmediactl_deps,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 include_directories : v4l2_utils_incdir)<br>
&gt; &gt; ++libmediactl =3D library(&#39;mediactl&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libmediactl=
_sources,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 soversion: =
&#39;0&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 version: &#=
39;0.0.0&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install : t=
rue,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dependencie=
s : libmediactl_deps,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 include_dir=
ectories : v4l2_utils_incdir)<br>
&gt; &gt; + + dep_libmediactl =3D declare_dependency(link_with : libmediact=
l)<br>
&gt; &gt; + +@@ -18,9 +28,13 @@ libv4l2subdev_sources =3D files(&#39;libv4l=
2subdev.c&#39;)<br>
&gt; &gt; + libv4l2subdev_sources +=3D media_bus_format_names_h<br>
&gt; &gt; + libv4l2subdev_sources +=3D media_bus_format_codes_h<br>
&gt; &gt; + +-libv4l2subdev =3D static_library(&#39;v4l2subdev&#39;,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libv4l2subdev_sources,<br>
&gt; &gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 include_directories : v4l2_utils=
_incdir)<br>
&gt; &gt; ++libv4l2subdev =3D library(&#39;v4l2subdev&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 libv4l2subdev_sources,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 soversion: &#39;0&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 version: &#39;0.0.0&#39;,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 install : true,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 dependencies : dep_libmediactl,<br>
&gt; &gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 include_directories : v4l2_utils_incdir)<br>
&gt; &gt; + + dep_libv4l2subdev =3D declare_dependency(link_with : libv4l2s=
ubdev)<br>
&gt; &gt; + +-- +2.34.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http:=
//v4l-utils_1.26.1.bb" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; &gt; b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-utils=
_1.26.1.bb" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; &gt; index 52759ef18..eb38d9713 100644<br>
&gt; &gt; --- a/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-u=
tils_1.26.1.bb" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-multimedia/v4l2apps/<a href=3D"http://v4l-u=
tils_1.26.1.bb" target=3D"_blank">v4l-utils_1.26.1.bb</a><br>
&gt; &gt; @@ -28,6 +28,7 @@ PACKAGECONFIG[v4l2-tracer] =3D &quot;,-Dv4l2-tr=
acer=3Ddisabled,json-c&quot;<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0 SRC_URI =3D &quot;\<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git://<a href=3D"http:/=
/git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable-1.26" targe=
t=3D"_blank">git.linuxtv.org/v4l-utils.git;protocol=3Dhttps;branch=3Dstable=
-1.26</a> \<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://0001-keytable-meson-Restrict-the-installation-of-50-rc_ke.patch</a> =
\<br>
&gt; &gt; +=C2=A0=C2=A0=C2=A0 <a>
file://0001-media-ctl-Install-media-ctl-header-and-library-files.patch</a> =
\<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0 &quot;<br>
&gt; &gt;=C2=A0=C2=A0=C2=A0=C2=A0 SRCREV =3D &quot;4aee01a027923cab1e40969f=
56f8ba58d3e6c0d1&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#111001): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/111001" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/111001</a><br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106=
851971/3616948" target=3D"_blank">
https://lists.openembedded.org/mt/106851971/3616948</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:mark.hatle@kernel.crashing.org" target=3D"_blank">mark.hatle@kernel.c=
rashing.org</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</div>
</span></font></div>
</div>

</blockquote></div></div>

--0000000000008ec564061dd6b2ed--

