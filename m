Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69D7C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 11:16:36 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.16303.1745922206168327874
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Apr 2025 03:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LA1gJ4kh;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: nguyenthaithuanalg@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-31062172698so61069861fa.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745922204; x=1746527004; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1Gl4vNLo2vBGdJBg8fA6zPUXvWnc0fuEwDR2cM/5AVs=;
        b=LA1gJ4khxDI58oKcYhnkRz3n9oRDmdk711g2t85bAVDp+6I+x1c+M15zC+d1YKrwQv
         yTMcsq4XGdgCyYL77wfFY57SPekyLdNKpFZ8IN0W0MRIjMF2B2JmMZj3gEqlbiisXn72
         0krE109anONlPdzP3xExoBqVSJEqapZ00TjESE/3qy4Ogz6wShizh2oryyXp+z7I76KC
         pr9STbQpGDn/609LgQGz7lfq/IYVjVLQUbDcAbCBfu+K23lZhCgxeuJgmXLzRaa38bYM
         URu1lRKRTer+On35Sl/piH/6O/1lr+fl3QL2LTO5Wcl0zUTxSZh511HEwSQFNjIsAsuV
         z5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745922204; x=1746527004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gl4vNLo2vBGdJBg8fA6zPUXvWnc0fuEwDR2cM/5AVs=;
        b=JDF9SOB9bqYjP9QkBiyjRw4BnhKMhzD9TnYP4MUDrU8wShStodiEeELwDwF6d8Mv4A
         xkHDtPHHs6YjFkUBq1PhF451ztjVJY7aTRsuEC3SH8bvivea6ah73QOPt21nIhNewNrf
         L+qRVFufXvibbSdLpw37pEn8qfqn+VNEHVmrIXNZPR3gSSVchbquj4hbn2khzIBdexPZ
         5r3ULBR/ooDCFXqgSiSYjI3xKeIrFt8JLNem2Md7SXTojT5OmAUYsNLdircyYS3KFYQ8
         +l+nCsi+8Jpo9DfkDz0LNrQRHaGVkpyeFfT+lsW7krizuMIvxvcXZPCPB+DL1sol2Gy6
         GMnQ==
X-Forwarded-Encrypted: i=1; AJvYcCViXH+95pFFsIvyQGKWftvWacrlveBQXS4SoF7lmah3S5wWGxmn1Jg1kx7niCWDNm+Y/Mi1oxpHBqtBjZMcbTAebJU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKVoudEZbVcrKNzrqNoLM6YQRMNsy/oftl2sDWMfjBIMgH3gAJ
	4C0TlmFs3HTqUegnQewCZ79IGwizZvtVJkimX4nteWzsX3EUgT3XdQ/Yvc8c9memtkWQduv9OUN
	M/xd6K+xZnVw1O3njh309tfAH4yk=
X-Gm-Gg: ASbGncuGgvbe+LH2e/IGe6ykZm8pxW8SNXF2tOcucbfiDwuR6pIozyprLR3M+mgabJ0
	Bg4O81M3+0KlIhHMoL6xqQAtI3Vw1LZDGUYHsmKsFZikJF+eKcC9mtWe9Sm0MuyDrjgwaMm/9av
	I6rzdSTSE/8inTJGTr2xTF0NNK6p500xjeep8RdyX9fwFrgjnFK84TyLYq
X-Google-Smtp-Source: AGHT+IFiNc3EMMy89fgR5b62HMmR5WiiILB6yxs/vOjnhPuq3Pr8Euhy+ljBqb8Cx/VbEIPmDc5V4uBD2rSlayEVVcg=
X-Received: by 2002:a2e:be1b:0:b0:30b:badf:75f0 with SMTP id
 38308e7fff4ca-31d341a5190mr8699541fa.2.1745922203789; Tue, 29 Apr 2025
 03:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250428173922.43331-1-nguyenthaithuanalg@gmail.com>
 <CAMKF1soLcrA7eGKfQ4JHBc+hvBEd5XE=7M+5x3OqhnEMB7FxAA@mail.gmail.com> <CA+chaQfkmMKBwwTcUH+xSR7iZ=iJmA_OibELmV6mK35DDYCQzg@mail.gmail.com>
In-Reply-To: <CA+chaQfkmMKBwwTcUH+xSR7iZ=iJmA_OibELmV6mK35DDYCQzg@mail.gmail.com>
From: =?UTF-8?B?VGh14bqtbiBOZ3V54buFbi1UaMOhaQ==?= <nguyenthaithuanalg@gmail.com>
Date: Tue, 29 Apr 2025 17:23:12 +0700
X-Gm-Features: ATxdqUHkfXxWfLFJgFtNqAPHB5q7gevsTA_SGTHbzzLnJnLVbF4Wz9U-0BHCScs
Message-ID: <CANBtAgdxLSM6NUvPKkNMoV03B3UG6FhXaBQi0dydBZWGxpwFeg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsimplelog: Clean up code
To: Martin Jansa <martin.jansa@gmail.com>
Cc: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3302e0633e83036"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 11:16:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117239

--000000000000c3302e0633e83036
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin,
Thank you for the hint. I noted.
Best regards,
Thuan

On Tue, Apr 29, 2025 at 4:01=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:

> It's correctly updated in
> https://lists.openembedded.org/g/openembedded-devel/message/117210
>
> but maybe next time move it to one of existing recipes-* directories
> instead of recipes-libsimplelog which is used only for this.
>
> On Mon, Apr 28, 2025 at 11:16=E2=80=AFPM Khem Raj via lists.openembedded.=
org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Please rebase and squash the code on master branch or master-next branc=
h
> >
> > On Mon, Apr 28, 2025 at 11:06=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-T=
h=C3=A1i via
> > lists.openembedded.org
> > <nguyenthaithuanalg=3Dgmail.com@lists.openembedded.org> wrote:
> > >
> > > 1. Add "simplelog-topic.md" designation.
> > >
> > > 2. Fix warning in building.
> > >
> > > 3. "-Werror=3Dformat".
> > >
> > > Signed-off-by: Thuan Nguyen Thai <nguyenthaithuanalg@gmail.com>
> > > ---
> > >  meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb | 4
> ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/
> libsimplelog_git.bb b/meta-oe/recipes-libsimplelog/libsimplelog/
> libsimplelog_git.bb
> > > index 764425dbc..8acf50fe8 100644
> > > --- a/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> > > +++ b/meta-oe/recipes-libsimplelog/libsimplelog/libsimplelog_git.bb
> > > @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE.txt;md5=3D22cdd382a6275cb4c2e75c517952ac7c"
> > >
> > >  SRC_URI =3D "git://
> github.com/thuanalg/simplelog-topic.git;branch=3Dmain;protocol=3Dhttps"
> > >
> > > -PV =3D "1.0.5+git"
> > > -SRCREV =3D "fa8c68f8dfcf72adb346f1f4d6dfad02829052b5"
> > > +PV =3D "1.0.6+git"
> > > +SRCREV =3D "7676b9cf871bedd8648d2cf68ebf43dc2c79b94d"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > --
> > > 2.47.1
> > >
> > >
> > >
> > >
> >
> >=20
> >
>

--000000000000c3302e0633e83036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Martin,</div><div>Thank you for the hint. I noted.=
</div><div>Best regards,</div><div>Thuan<br></div></div><br><div class=3D"g=
mail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On =
Tue, Apr 29, 2025 at 4:01=E2=80=AFPM Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">It&#39;s correctly updated in<br=
>
<a href=3D"https://lists.openembedded.org/g/openembedded-devel/message/1172=
10" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/o=
penembedded-devel/message/117210</a><br>
<br>
but maybe next time move it to one of existing recipes-* directories<br>
instead of recipes-libsimplelog which is used only for this.<br>
<br>
On Mon, Apr 28, 2025 at 11:16=E2=80=AFPM Khem Raj via <a href=3D"http://lis=
ts.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedde=
d.org</a><br>
&lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Please rebase and squash the code on master branch or master-next bran=
ch<br>
&gt;<br>
&gt; On Mon, Apr 28, 2025 at 11:06=E2=80=AFAM Thu=E1=BA=ADn Nguy=E1=BB=85n-=
Th=C3=A1i via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;nguyenthaithuanalg=3D<a href=3D"mailto:gmail.com@lists.openembedde=
d.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; 1. Add &quot;simplelog-topic.md&quot; designation.<br>
&gt; &gt;<br>
&gt; &gt; 2. Fix warning in building.<br>
&gt; &gt;<br>
&gt; &gt; 3. &quot;-Werror=3Dformat&quot;.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Thuan Nguyen Thai &lt;<a href=3D"mailto:nguyenthai=
thuanalg@gmail.com" target=3D"_blank">nguyenthaithuanalg@gmail.com</a>&gt;<=
br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-oe/recipes-libsimplelog/libsimplelog/<a href=3D"http:/=
/libsimplelog_git.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_git=
.bb</a> | 4 ++--<br>
&gt; &gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-libsimplelog/libsimplelog/<a href=3D=
"http://libsimplelog_git.bb" rel=3D"noreferrer" target=3D"_blank">libsimple=
log_git.bb</a> b/meta-oe/recipes-libsimplelog/libsimplelog/<a href=3D"http:=
//libsimplelog_git.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_gi=
t.bb</a><br>
&gt; &gt; index 764425dbc..8acf50fe8 100644<br>
&gt; &gt; --- a/meta-oe/recipes-libsimplelog/libsimplelog/<a href=3D"http:/=
/libsimplelog_git.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_git=
.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-libsimplelog/libsimplelog/<a href=3D"http:/=
/libsimplelog_git.bb" rel=3D"noreferrer" target=3D"_blank">libsimplelog_git=
.bb</a><br>
&gt; &gt; @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE.txt;md5=
=3D22cdd382a6275cb4c2e75c517952ac7c&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://github.com/thuana=
lg/simplelog-topic.git;branch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/thuanalg/simplelog-topic.git;branch=3Dmain;prot=
ocol=3Dhttps</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt; -PV =3D &quot;1.0.5+git&quot;<br>
&gt; &gt; -SRCREV =3D &quot;fa8c68f8dfcf72adb346f1f4d6dfad02829052b5&quot;<=
br>
&gt; &gt; +PV =3D &quot;1.0.6+git&quot;<br>
&gt; &gt; +SRCREV =3D &quot;7676b9cf871bedd8648d2cf68ebf43dc2c79b94d&quot;<=
br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.47.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div>

--000000000000c3302e0633e83036--

