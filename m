Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8A3F364CD
	for <webhook@archiver.kernel.org>; Sat, 11 Apr 2026 06:56:06 +0000 (UTC)
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.181902.1775890565044440117
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 23:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JxFDvoFW;
 spf=pass (domain: gmail.com, ip: 74.125.224.48, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6501418152cso2702310d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 23:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775890564; cv=none;
        d=google.com; s=arc-20240605;
        b=GnJofpVl6oyeezXleGMzFMymkoJDoC8MSZflQMjbghhzDZt+sOHBFT0D88uy4qGX50
         wP4SBMdOgWsyVWgfLGjIWYkXNo1GG97M1tZs5TW51+HpMRKvsavEfeh1X4ZoMbIZHtqa
         Um1a9xC481fg25G+g5f7fUIBM4+qCUuhZ84f8rVGTXYmh6eFDEoD2hCKBEocD1S6U2mX
         NcoTplh5oYDpOfuKeBLthXVeloMppYanH6QJ1J9VukgAWVIn3ji3FqNcfw9kjG14ADeX
         Xg/a68k4rqs0JGO1hrfsCiZAtdk4Kyv1zrnd7NHSralGFyS0ucmNrXLCQce+KwFHcCbu
         QIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OUoenNMNnZ8AAhWNNGJXkrDlfY7oJcwvoTwD048dnYA=;
        fh=omGsxyFJZ50ECKYv3eI9/Wtao+MgVB02tsvOGIAVpcE=;
        b=R44ItU6xH3GE32ctorpp4qjXQ2flfHXJyO4fOHso+mi2YPAYfo902ozt+aFC1sBgfU
         FBn2kte0O76uuf9717XYqQmBf80hezgJzm1yHCQtTnRE41ANrN2Mb2I/jGYURrq/VrFv
         fId28e65ytlBaYa+FA4GAs3VbcEmelFeMsBMcuZyFctNjHBLe4TuUvrpyhSTZdX0PlSr
         FQg9oQNCcsfFSvwNgF4ZztdV2gojLlkGtx7acUu2wzm1Jlb5K1CH2jmE/Rmarz3NnV0K
         TIVs4aCAygWurf2L7WXcQ7nIBwmPkTMT6D6pbqRvWfRJO1ZNw7APk38p9i8g8IU8gCbX
         wOVQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775890564; x=1776495364; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OUoenNMNnZ8AAhWNNGJXkrDlfY7oJcwvoTwD048dnYA=;
        b=JxFDvoFWwb5yOpUtSZAv7xnWAmF8TgAJv9B2mYUyXdU3+NpgG/EWSkMla1JqW8RV4G
         Wd1bRQ/0xZTodL5Qa7CxQcnTWL7Ss6vD7DSl7/4W6mIOR1WZq0qr5/qRZ+rjElO7gWlZ
         Z86Pnx/IS8GyvmWuI47PtZdR52ZzTrwnkUbhIZvWNvMPwHtfe5vx+1o0+b8Vwc/wyBuN
         aScF9qepwUI1f+hTb7zvncojmbQCL/x16dHMsW4y5ovBom/NTTL6aMzM9FpwOczhc4Ls
         b4zEPeOXXZMxQ3PK8KwzN3cpQ1xFGOKn060ALujvLKcSkSQyRubL82bKRzvUpUpcD3Lr
         raew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775890564; x=1776495364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUoenNMNnZ8AAhWNNGJXkrDlfY7oJcwvoTwD048dnYA=;
        b=S1lWuqUX88tx/P5vpHeJZqImKyiKnDfinn6o8435PN/5p6jnK4BpK2g4krsLAJEQdm
         Eu6hk086UHFfXjxQ1zSni0QuuSN7NRYjbxjZ21+LGn4FsxW/GeqtmAIoXpJMZbrPwlGq
         vlVsEYuz3u/025B6FaengmYa5IilWqrSGIVN/ooUOMwc5EBuHtLCJKnUSz/Zz8lKXx9u
         AnChJuWvqWwYdYoXi5zdDnVyMHkrF/hccgPnRD3CrpuZWCYXFhzAKjW9dIt5YsHED7P1
         gmXqdnOU1044Xz+tsahPC4EfJhPXxIeVSNsyhykuqihx9cfimdkU85BR6ljQ2hVXG79T
         f8mg==
X-Forwarded-Encrypted: i=1; AJvYcCWe1RUDi1a9SvP2HtAT+FTgXAOxCpBXWdPtY3nsH6U4pPa/jKRd3k1K9OagrI58bLL5U9kBbGzEY3pK/T9fJKDH/sM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKgrNncfDqNtcLHnnuyhj8AtM2rU+Kbga4T8kY1/1uKAuopuo3
	FMkfgvETgB4zYqX4tamu2RmsG0zzEO+3wCvXVWScIsPT1WFUbjErOU0vaXzZaxtSMHsm8OCOVwN
	qfXC1E3hr7mEGYX5kv4yhQrx9YjmoDns=
X-Gm-Gg: AeBDieup+MMXhKn+LkbfhkMzY820QCDXKzpF9b6+uco18jZR1WZRrumozsj9XkHzwon
	iIDVZriMjVGmnnhLQmva6KcRUHlNXgKYtJbm7QbEvknifSiGQlmR2vlfWmvuGo4aVE6Rb9z1Hbo
	Zkvtsuo8uqor0CNEuXAw/tQwfppzYarzsF2v7gNd7CZQk5J24tp0/sfGT/l4qWQEyTbG2Xa+fo8
	vvDt/3D26MvfuQW4ap1VoWujGxqdonty983KErORgUAInU5HSABJz9YhMlqtPe4Nzyo1gY/OV6d
	Nu/terVMIpllfNm9j/R2q9hYzVIOJhEPjjCfATkYd1bFbTSDEKwQNfbvuXhCOtIWKazvHSYZoZR
	p4bT+1fAS7ph40gAxyy8k6LIT2itTpnFUMO0=
X-Received: by 2002:a05:690e:43db:b0:650:1cdb:5f49 with SMTP id
 956f58d0204a3-65198a385fdmr3814089d50.2.1775890564010; Fri, 10 Apr 2026
 23:56:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260225093727.1284-1-wangmy@fujitsu.com> <20260225093727.1284-21-wangmy@fujitsu.com>
 <CAMKF1sqyBvg=6Pf0EPLzR8b=N27Nbry6jduL1t-tHdqAygwp8A@mail.gmail.com> <690f7b42-7d44-4ac3-9401-3d79e9ffa317@gmail.com>
In-Reply-To: <690f7b42-7d44-4ac3-9401-3d79e9ffa317@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 10 Apr 2026 23:55:36 -0700
X-Gm-Features: AQROBzCbG1ArA_pENfH3XjplfcoCnvS1hEAZ_9G0hy2OetIlamrKgiyWx-KIUxo
Message-ID: <CAMKF1sr=3Qu0mPMeFjmwMADN6C6rHoPWUZUfrM1oMDKMovz-_Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 21/33] minizip: upgrade 1.3.1 -> 1.3.2
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: wangmy@fujitsu.com, Samuli Piippo <samuli.piippo@qt.io>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003a59f6064f29be16"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Apr 2026 06:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126250

--0000000000003a59f6064f29be16
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 10:16=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.=
com>
wrote:

> On 3/3/26 15:58, Khem Raj via lists.openembedded.org wrote:
> > qtwebengine fails to build with this version of minizip, I do see meta-
> > qt6 locks its own version but I think it will be good to reconcile the
> > versions into a single recipe and see if meta-qt6 version can be remove=
d.
> >
>
>
> Why not do a scream test? Apply it, and see what happens.
> I don't think that this is a good a reason to hold off such a patch
> indefinitely. Or is it?
>
>
Well, I am one of the affected ones, so I will be first one to scream :)
but it makes sense to accept it.


>
> > On Wed, Feb 25, 2026 at 1:38=E2=80=AFAM wangmy via lists.openembedded.o=
rg
> > <http://lists.openembedded.org>
> > <wangmy=3Dfujitsu.com@lists.openembedded.org
> > <mailto:fujitsu.com@lists.openembedded.org>> wrote:
> >
> >     From: Wang Mingyu <wangmy@fujitsu.com <mailto:wangmy@fujitsu.com>>
> >
> >     License-Update: "Version 1.1, February 14h, 2010" removed
> >
> >     Signed-off-by: Wang Mingyu <wangmy@fujitsu.com
> >     <mailto:wangmy@fujitsu.com>>
> >     ---
> >      .../minizip/{minizip_1.3.1.bb <http://minizip_1.3.1.bb> =3D>
> >     minizip_1.3.2.bb <http://minizip_1.3.2.bb>}            | 4 ++--
> >      1 file changed, 2 insertions(+), 2 deletions(-)
> >      rename meta-oe/recipes-core/minizip/{minizip_1.3.1.bb <http://
> >     minizip_1.3.1.bb> =3D> minizip_1.3.2.bb <http://minizip_1.3.2.bb>}
> (77%)
> >
> >     diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb <http://
> >     minizip_1.3.1.bb> b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb
> >     <http://minizip_1.3.2.bb>
> >     similarity index 77%
> >     rename from meta-oe/recipes-core/minizip/minizip_1.3.1.bb <http://
> >     minizip_1.3.1.bb>
> >     rename to meta-oe/recipes-core/minizip/minizip_1.3.2.bb <http://
> >     minizip_1.3.2.bb>
> >     index 51a74d039b..49e4a4b561 100644
> >     --- a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb <http://
> >     minizip_1.3.1.bb>
> >     +++ b/meta-oe/recipes-core/minizip/minizip_1.3.2.bb <http://
> >     minizip_1.3.2.bb>
> >     @@ -4,7 +4,7 @@ library which is used by many different programs."
> >      HOMEPAGE =3D "http://www.winimage.com/zLibDll/minizip.html <http:/=
/
> >     www.winimage.com/zLibDll/minizip.html>"
> >      SECTION =3D "libs"
> >      LICENSE =3D "Zlib"
> >     -LIC_FILES_CHKSUM =3D "file://
> >     zip.h;beginline=3D14;endline=3D30;md5=3D8eaa8535a3a1a2296b303f40f75=
385e7"
> >     +LIC_FILES_CHKSUM =3D "file://
> >     zip.h;beginline=3D14;endline=3D30;md5=3Db7d2930a7332b2bc68fc1a7fdc5=
ba775"
> >
> >      GITHUB_BASE_URI ?=3D "https://github.com/madler/zlib/releases/
> >     <https://github.com/madler/zlib/releases/>"
> >
> >     @@ -12,7 +12,7 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/
> >     zlib-${PV}.tar.xz"
> >
> >      S =3D "${UNPACKDIR}/zlib-${PV}/contrib/minizip"
> >
> >     -SRC_URI[sha256sum] =3D
> >     "38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32"
> >     +SRC_URI[sha256sum] =3D
> >     "d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3"
> >
> >      PACKAGECONFIG ??=3D "demos"
> >      PACKAGECONFIG[demos] =3D "--enable-demos=3Dyes,,,"
> >     --
> >     2.43.0
> >
> >
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#124833):
> https://lists.openembedded.org/g/openembedded-devel/message/124833
> > Mute This Topic: https://lists.openembedded.org/mt/117991965/6084445
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> skandigraun@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--0000000000003a59f6064f29be16
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 10,=
 2026 at 10:16=E2=80=AFPM Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@=
gmail.com">skandigraun@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 3/3/26 15:58, Khem Raj via <a href=3D"h=
ttp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.op=
enembedded.org</a> wrote:<br>
&gt; qtwebengine fails to build with this version of minizip, I do see meta=
-<br>
&gt; qt6 locks its own version but I think it will be good to reconcile the=
<br>
&gt; versions into a single recipe and see if meta-qt6 version can be remov=
ed.<br>
&gt; <br>
<br>
<br>
Why not do a scream test? Apply it, and see what happens.<br>
I don&#39;t think that this is a good a reason to hold off such a patch<br>
indefinitely. Or is it?<br>
<br></blockquote><div><br></div><div>Well, I am one of the affected ones, s=
o I will be first one to scream=C2=A0:)</div><div>but it makes sense to acc=
ept it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
&gt; On Wed, Feb 25, 2026 at 1:38=E2=80=AFAM wangmy via <a href=3D"http://l=
ists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembed=
ded.org</a><br>
&gt; &lt;<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">http://lists.openembedded.org</a>&gt;<br>
&gt; &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org" tar=
get=3D"_blank">fujitsu.com@lists.openembedded.org</a><br>
&gt; &lt;mailto:<a href=3D"mailto:fujitsu.com@lists.openembedded.org" targe=
t=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fuji=
tsu.com" target=3D"_blank">wangmy@fujitsu.com</a> &lt;mailto:<a href=3D"mai=
lto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;&gt;<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0License-Update: &quot;Version 1.1, February 14h, 20=
10&quot; removed<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:wangmy@fujitsu.com" ta=
rget=3D"_blank">wangmy@fujitsu.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../minizip/{<a href=3D"http://minizip_1.3.1.=
bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.1.bb</a> &lt;<a href=
=3D"http://minizip_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">http://mi=
nizip_1.3.1.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.2.bb</a> &lt;<a href=3D"http://minizip_1.=
3.2.bb" rel=3D"noreferrer" target=3D"_blank">http://minizip_1.3.2.bb</a>&gt=
;}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A01 file changed, 2 insertions(+), 2 deletions(=
-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0rename meta-oe/recipes-core/minizip/{<a href=
=3D"http://minizip_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1=
.3.1.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.1.bb</a>&gt; =3D&gt; <a href=3D"http://mi=
nizip_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.2.bb</a> &=
lt;<a href=3D"http://minizip_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>http://minizip_1.3.2.bb</a>&gt;} (77%)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-oe/recipes-core/minizip/<a href=
=3D"http://minizip_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1=
.3.1.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.1.bb</a>&gt; b/meta-oe/recipes-core/miniz=
ip/<a href=3D"http://minizip_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank"=
>minizip_1.3.2.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://minizip_1.3.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">http://minizip_1.3.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0similarity index 77%<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename from meta-oe/recipes-core/minizip/<a href=3D=
"http://minizip_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.=
1.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename to meta-oe/recipes-core/minizip/<a href=3D"h=
ttp://minizip_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.2.=
bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 51a74d039b..49e4a4b561 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-oe/recipes-core/minizip/<a href=3D"http:=
//minizip_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.1.bb</=
a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.1.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-oe/recipes-core/minizip/<a href=3D"http:=
//minizip_1.3.2.bb" rel=3D"noreferrer" target=3D"_blank">minizip_1.3.2.bb</=
a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://minizip_1.3.2.bb" rel=3D"noreferr=
er" target=3D"_blank">minizip_1.3.2.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -4,7 +4,7 @@ library which is used by many diffe=
rent programs.&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.wini=
mage.com/zLibDll/minizip.html" rel=3D"noreferrer" target=3D"_blank">http://=
www.winimage.com/zLibDll/minizip.html</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.winimage.com/zLibDll/minizip.=
html" rel=3D"noreferrer" target=3D"_blank">www.winimage.com/zLibDll/minizip=
.html</a>&gt;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SECTION =3D &quot;libs&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0LICENSE =3D &quot;Zlib&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-LIC_FILES_CHKSUM =3D &quot;file://<br>
&gt;=C2=A0 =C2=A0 =C2=A0zip.h;beginline=3D14;endline=3D30;md5=3D8eaa8535a3a=
1a2296b303f40f75385e7&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+LIC_FILES_CHKSUM =3D &quot;file://<br>
&gt;=C2=A0 =C2=A0 =C2=A0zip.h;beginline=3D14;endline=3D30;md5=3Db7d2930a733=
2b2bc68fc1a7fdc5ba775&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0GITHUB_BASE_URI ?=3D &quot;<a href=3D"https:/=
/github.com/madler/zlib/releases/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/madler/zlib/releases/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/madler/zlib/relea=
ses/" rel=3D"noreferrer" target=3D"_blank">https://github.com/madler/zlib/r=
eleases/</a>&gt;&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -12,7 +12,7 @@ SRC_URI =3D &quot;${GITHUB_BASE_U=
RI}/download/v${PV}/<br>
&gt;=C2=A0 =C2=A0 =C2=A0zlib-${PV}.tar.xz&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0S =3D &quot;${UNPACKDIR}/zlib-${PV}/contrib/m=
inizip&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;38ef96b8dfe510d42707d9c781877914792541133e187=
0841463bfa73f883e32&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;d7a0654783a4da529d1bb793b7ad9c3318020af77667b=
cae35f95d0e42a792f3&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGECONFIG ??=3D &quot;demos&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0PACKAGECONFIG[demos] =3D &quot;--enable-demos=
=3Dyes,,,&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.43.0<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#124833): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/124833" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/124833</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11799196=
5/6084445" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/117991965/6084445</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:skandigraun@gmail.c=
om" target=3D"_blank">skandigraun@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div></div>

--0000000000003a59f6064f29be16--

