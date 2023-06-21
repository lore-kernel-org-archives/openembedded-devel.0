Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025A2EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:44:13 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.330.1687358645700705392
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 07:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gSMdidIe;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-38e04d1b2b4so4152172b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687358645; x=1689950645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epTtVRABHAdJZMJefX5iWOzpAf2EIYJrMf/pzYYMI+Q=;
        b=gSMdidIe/KtrkRFONR3I/kDlTAy3EJ0hNFC3veRZNiAtZbe4T9vjmoG8Gy2BaBi6UP
         7GzZ4PFJqMJTCHmdRM1hS4dmRxMeUhoBOAkq9Ri5/T9PrfLPxEZ9rCHhLyuoKqk0nizX
         UpCJ1ceLxop0sgHuJJlF+dvyJ8LUyftLTStulWfWZC9KFceWs4LwK9oMefWPfaJjuq5B
         H7bdFqjveH/SzmZ7GGf03vwP7RZkugv2++5t4UuFHdVP/DuW/ondNzgCquyp6zKnSsAs
         0KIISpnooGcWP11y+uZH9M5FmM9KdeX+TaM1OS7dRVDVECt2awIhEXPBS1OV8IBj2ivP
         LVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687358645; x=1689950645;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epTtVRABHAdJZMJefX5iWOzpAf2EIYJrMf/pzYYMI+Q=;
        b=RA32fIj7fJkm/Srri41+rzdbUmiX6VizGr/rQxbdBvBZ0z/bOH87mEOFG2qVIowtA3
         V6MXzj0PATIKnMylW1HL2A4Jy2xTDTqAnt3uX9gdO3qRzNcVVYF0vBTWsQzt5Kt9epf9
         +3NrVhMgUJUK1143WRL4PnH1v1vVgVmC9iUuKru0/SHpWuNWxw1JTEa7U+oaNADo3VL2
         BP2kF58sY3CY0maWXa/bFWBiv0FUWCsD9FPgdc6V2ECcUSxjPu/djuQRCmGdlM1GmZBN
         5GowQ2W/TMHGx1AbP3bDBtzgRjgLx3pjPRs3VPSxA0Cf3t6kINBppYkLvOg2JIhqT5BD
         N3sA==
X-Gm-Message-State: AC+VfDxpO3rfUT4UF8KLWtYqRlcFrwBxIMDg7ql5HbcrECItFyuRkQGq
	IPZ7M2x8UY3HMbKRdzoo1nYtwAxIdrVRGTMHavQ=
X-Google-Smtp-Source: ACHHUZ7ldpDBVZByB1RdYiKzUfVyVYdwFpxHBguLWHAbUTElfBd3ROS/Q/elKaHsoR4Qc3dO9P3GrS43HFQA/lqq5Dw=
X-Received: by 2002:a05:6808:316:b0:39e:a2ee:880f with SMTP id
 i22-20020a056808031600b0039ea2ee880fmr15637784oie.6.1687358644620; Wed, 21
 Jun 2023 07:44:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230619132214.213417-1-brgl@bgdev.pl> <20230619132214.213417-2-brgl@bgdev.pl>
 <5a677745-c6a2-bd0a-5507-98bc3b185877@gmail.com> <CAMKF1sq=L-GyguojmkSd4KD9Aq5mAEaM9O-pUnECZqhzdrfetQ@mail.gmail.com>
 <CAMKF1sp403GSqm3iA99qrw-14zLbbViwQ68AOK6XhUKN4kBK3w@mail.gmail.com> <CAMRc=MdvdXOQgTooZCeRD01VG+TwhiO6qtZNO25SCF1DN1qxpw@mail.gmail.com>
In-Reply-To: <CAMRc=MdvdXOQgTooZCeRD01VG+TwhiO6qtZNO25SCF1DN1qxpw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Jun 2023 07:43:53 -0700
Message-ID: <CAMKF1srfsA72h_s-WWHTjROjzuXSJqfRx+5vOg31OKrCcjJmjQ@mail.gmail.com>
Subject: Re: [meta-python][RESEND PATCH 01/54] python3-pywbem: drop unneeded
 class from RDEPENDS
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009f137c05fea4cc94"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jun 2023 14:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103475

--0000000000009f137c05fea4cc94
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have dropped whole series it will be good to send a new one with these
fixed you can do

Bitbake world -n to see some of dep and parsing fails

On Wed, Jun 21, 2023 at 2:51 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> On Tue, Jun 20, 2023 at 8:15=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> > Some more dep failures on parse
> >
> > 23:11:18 ERROR: Nothing RPROVIDES 'python3-nocasedict-native' (but
> >
> virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-opene=
mbedded/meta-python/recipes-extended/pywbem/
> python3-pywbem_1.6.1.bb
> > RDEPENDS on or otherwise requires it)
> > 23:11:18 NOTE: Runtime target 'python3-nocasedict-native' is
> > unbuildable, removing...
> > 23:11:18 Missing or unbuildable dependency chain was:
> > ['python3-nocasedict-native']
> > 23:11:18 NOTE: Runtime target 'python3-pywbemtools-dev' is
> > unbuildable, removing...
> > 23:11:18 Missing or unbuildable dependency chain was:
> > ['python3-pywbemtools-dev', 'python3-pywbem-native',
> > 'python3-nocasedict-native']
> > 23:11:19 NOTE: Runtime target 'python3-pywbemtools' is unbuildable,
> removing...
> > 23:11:19 Missing or unbuildable dependency chain was:
> > ['python3-pywbemtools', 'python3-pywbem-native',
> > 'python3-nocasedict-native']
> > 23:11:23 ERROR: Nothing RPROVIDES 'python3-nocaselist-native' (but
> >
> virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-opene=
mbedded/meta-python/recipes-extended/pywbem/
> python3-pywbem_1.6.1.bb
> > RDEPENDS on or otherwise requires it)
> > 23:11:23 NOTE: Runtime target 'python3-nocaselist-native' is
> > unbuildable, removing...
> > 23:11:23 Missing or unbuildable dependency chain was:
> > ['python3-nocaselist-native']
> > 23:11:28 ERROR: Nothing RPROVIDES 'python3-yamlloader-native' (but
> >
> virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-opene=
mbedded/meta-python/recipes-extended/pywbem/
> python3-pywbem_1.6.1.bb
> > RDEPENDS on or otherwise requires it)
> > 23:11:28 NOTE: Runtime target 'python3-yamlloader-native' is
> > unbuildable, removing...
> > 23:11:28 Missing or unbuildable dependency chain was:
> > ['python3-yamlloader-native']
> >
>
> Feel free to drop this and whichever other patches cause failures, I
> will look at whatever remains after this round.
>
> Bart
>
> > On Tue, Jun 20, 2023 at 11:03=E2=80=AFAM Khem Raj <raj.khem@gmail.com> =
wrote:
> > >
> > > here are some failures
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/284=
1
> > >
> > > On Mon, Jun 19, 2023 at 6:16=E2=80=AFPM Khem Raj <raj.khem@gmail.com>=
 wrote:
> > > >
> > > > On 6/19/23 6:21 AM, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > > >
> > > > > The native package has the same dependencies. Even if normally
> they are
> > > > > satisfied by python3-native, we should still use a global RDEPEND=
S.
> > > > >
> > > >
> > > > This will deepen the dependency list for native packages. Why shoul=
d
> we
> > > > do this ?
> > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.or=
g
> >
> > > > > ---
> > > > >   meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb | 2
> +-
> > > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta-python/recipes-extended/pywbem/
> python3-pywbem_1.6.1.bb b/meta-python/recipes-extended/pywbem/
> python3-pywbem_1.6.1.bb
> > > > > index 71af06881..8b0383cf6 100644
> > > > > --- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > > > +++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
> > > > > @@ -27,7 +27,7 @@ DEPENDS +=3D " \
> > > > >       ${PYTHON_PN}-wheel-native \
> > > > >   "
> > > > >
> > > > > -RDEPENDS:${PN}:class-target +=3D "\
> > > > > +RDEPENDS:${PN} +=3D "\
> > > > >       ${PYTHON_PN}-datetime \
> > > > >       ${PYTHON_PN}-io \
> > > > >       ${PYTHON_PN}-netclient \
>

--0000000000009f137c05fea4cc94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I have dropped whole series it will be good to send a new=
 one with these fixed you can do=C2=A0</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Bitbake world -n to see some of dep and parsing fails=C2=A0<=
/div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Jun 21, 2023 at 2:51 AM Bartosz Golaszewski &lt;<a href=3D"mail=
to:brgl@bgdev.pl">brgl@bgdev.pl</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Tue, Jun 20, 2023 at 8:15=E2=80=AFPM Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Some more dep failures on parse<br>
&gt;<br>
&gt; 23:11:18 ERROR: Nothing RPROVIDES &#39;python3-nocasedict-native&#39; =
(but<br>
&gt; virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-op=
enembedded/meta-python/recipes-extended/pywbem/<a href=3D"http://python3-py=
wbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pywbem_1.6.1.bb=
</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 23:11:18 NOTE: Runtime target &#39;python3-nocasedict-native&#39; is<b=
r>
&gt; unbuildable, removing...<br>
&gt; 23:11:18 Missing or unbuildable dependency chain was:<br>
&gt; [&#39;python3-nocasedict-native&#39;]<br>
&gt; 23:11:18 NOTE: Runtime target &#39;python3-pywbemtools-dev&#39; is<br>
&gt; unbuildable, removing...<br>
&gt; 23:11:18 Missing or unbuildable dependency chain was:<br>
&gt; [&#39;python3-pywbemtools-dev&#39;, &#39;python3-pywbem-native&#39;,<b=
r>
&gt; &#39;python3-nocasedict-native&#39;]<br>
&gt; 23:11:19 NOTE: Runtime target &#39;python3-pywbemtools&#39; is unbuild=
able, removing...<br>
&gt; 23:11:19 Missing or unbuildable dependency chain was:<br>
&gt; [&#39;python3-pywbemtools&#39;, &#39;python3-pywbem-native&#39;,<br>
&gt; &#39;python3-nocasedict-native&#39;]<br>
&gt; 23:11:23 ERROR: Nothing RPROVIDES &#39;python3-nocaselist-native&#39; =
(but<br>
&gt; virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-op=
enembedded/meta-python/recipes-extended/pywbem/<a href=3D"http://python3-py=
wbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pywbem_1.6.1.bb=
</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 23:11:23 NOTE: Runtime target &#39;python3-nocaselist-native&#39; is<b=
r>
&gt; unbuildable, removing...<br>
&gt; 23:11:23 Missing or unbuildable dependency chain was:<br>
&gt; [&#39;python3-nocaselist-native&#39;]<br>
&gt; 23:11:28 ERROR: Nothing RPROVIDES &#39;python3-yamlloader-native&#39; =
(but<br>
&gt; virtual:native:/mnt/jenkins/workspace/Yocto-world-musl/sources/meta-op=
enembedded/meta-python/recipes-extended/pywbem/<a href=3D"http://python3-py=
wbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-pywbem_1.6.1.bb=
</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; 23:11:28 NOTE: Runtime target &#39;python3-yamlloader-native&#39; is<b=
r>
&gt; unbuildable, removing...<br>
&gt; 23:11:28 Missing or unbuildable dependency chain was:<br>
&gt; [&#39;python3-yamlloader-native&#39;]<br>
&gt;<br>
<br>
Feel free to drop this and whichever other patches cause failures, I<br>
will look at whatever remains after this round.<br>
<br>
Bart<br>
<br>
&gt; On Tue, Jun 20, 2023 at 11:03=E2=80=AFAM Khem Raj &lt;<a href=3D"mailt=
o:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt; here are some failures<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/88/builds/2841" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/typhoon/#/builders/88/builds/2841</a><br>
&gt; &gt;<br>
&gt; &gt; On Mon, Jun 19, 2023 at 6:16=E2=80=AFPM Khem Raj &lt;<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrot=
e:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 6/19/23 6:21 AM, Bartosz Golaszewski wrote:<br>
&gt; &gt; &gt; &gt; From: Bartosz Golaszewski &lt;<a href=3D"mailto:bartosz=
.golaszewski@linaro.org" target=3D"_blank">bartosz.golaszewski@linaro.org</=
a>&gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The native package has the same dependencies. Even if n=
ormally they are<br>
&gt; &gt; &gt; &gt; satisfied by python3-native, we should still use a glob=
al RDEPENDS.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; This will deepen the dependency list for native packages. Wh=
y should we<br>
&gt; &gt; &gt; do this ?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Bartosz Golaszewski &lt;<a href=3D"mailt=
o:bartosz.golaszewski@linaro.org" target=3D"_blank">bartosz.golaszewski@lin=
aro.org</a>&gt;<br>
&gt; &gt; &gt; &gt; ---<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0meta-python/recipes-extended/pywbem/<a href=
=3D"http://python3-pywbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">py=
thon3-pywbem_1.6.1.bb</a> | 2 +-<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(=
-)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; diff --git a/meta-python/recipes-extended/pywbem/<a hre=
f=3D"http://python3-pywbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pywbem_1.6.1.bb</a> b/meta-python/recipes-extended/pywbem/<a href=3D=
"http://python3-pywbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-pywbem_1.6.1.bb</a><br>
&gt; &gt; &gt; &gt; index 71af06881..8b0383cf6 100644<br>
&gt; &gt; &gt; &gt; --- a/meta-python/recipes-extended/pywbem/<a href=3D"ht=
tp://python3-pywbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pywbem_1.6.1.bb</a><br>
&gt; &gt; &gt; &gt; +++ b/meta-python/recipes-extended/pywbem/<a href=3D"ht=
tp://python3-pywbem_1.6.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
pywbem_1.6.1.bb</a><br>
&gt; &gt; &gt; &gt; @@ -27,7 +27,7 @@ DEPENDS +=3D &quot; \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-wheel-native \<b=
r>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0&quot;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; -RDEPENDS:${PN}:class-target +=3D &quot;\<br>
&gt; &gt; &gt; &gt; +RDEPENDS:${PN} +=3D &quot;\<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-datetime \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-io \<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0${PYTHON_PN}-netclient \<br>
</blockquote></div></div>

--0000000000009f137c05fea4cc94--

