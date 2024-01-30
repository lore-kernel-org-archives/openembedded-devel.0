Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FB2C46CD2
	for <webhook@archiver.kernel.org>; Tue, 30 Jan 2024 18:24:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.3756.1706639046368049720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jan 2024 10:24:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dAGTL28z;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40eebe7767cso34531145e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 10:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706639045; x=1707243845; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhwq8RafeNrpkO9z7qy/IyNvpeVLexkYnN4Z3kbck/U=;
        b=dAGTL28zsnGXq4YV7SOchMQVN48YwUIavdzD1kbpDlkUTl4UU70SqMoueiaB7L+37H
         /p9mnAX+n7VafXyDQVT7jMH/OJTAU2cQl5nha8t1w/kOFwcPfs8hzF4MALXzk0ZjkFd5
         D3xvVHXwfNdWRY6shATWXv4wqWxVLwAsuz/miQxpzw6gPbI+Xy5Yf+RJz1h+ko+s84m8
         hLdfFiy8hpbpI8vbKxa6MzaPFRy3usedEg9xW97Oqos3tcbrgTRldx13Nhy0UKt0opbb
         s77MXSw82y7L453kvID4DbKjxsW1gm2k7WjhIxXV4HpBpxuhuB/ldfWLR8HkLwIrLrR3
         7bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706639045; x=1707243845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhwq8RafeNrpkO9z7qy/IyNvpeVLexkYnN4Z3kbck/U=;
        b=qQiTU4Tt9q68a9W3NirHcEOTxCi/lj54YcEk/qsbw9Fvx7IHZWloL/3IA/ULan8KXB
         NkcRrsO/GiwSPp4kPD4hBgVoRuyDFB4M6ZQTD4sBWnsPYxv+UwLi1oKGLrfbeI7THUvK
         o9Cp9BxUN6AIXuYDYrFaUWYMwQf4CTr4LBqxYB0v702xPJEAdDKwwt2p74vJKgIEN3/Y
         dB5cDzCObdnQiSNt2SAaHumOCOx0hrSRIm3p3z960PY6ercsR9dTBhM8drcLK3onNW9v
         3KGolmxHmBkg+Kp0MTIVov+boS0bWmCkDreRzyKcNOYgXv7LEZmYNJdHe58RzVZsM0Nv
         KjcA==
X-Gm-Message-State: AOJu0Yxd3F39ayHy+v1d6/hGMhgB8HAQm7O/14Paff4Ttz1QCfXo8652
	51PuwVjM9veyin276Q+H4W+fsh2vnkxPx9ATILOBjAjLvYHT6uB+O1rPTMFtL8kz7YDodJfnaMr
	IQQIoBcl5wu7PyWWcaG6Ig73pEiE=
X-Google-Smtp-Source: AGHT+IHSpyrZ5Qrz43PIH2L10GF2Agy46b5d4/1Odfy4SgojtExycZDcvhInLXw16sQtiu/7aHJfFUEVw/b3TD8c4P0=
X-Received: by 2002:adf:ec4f:0:b0:33a:f3dd:97e9 with SMTP id
 w15-20020adfec4f000000b0033af3dd97e9mr3682592wrn.40.1706639044474; Tue, 30
 Jan 2024 10:24:04 -0800 (PST)
MIME-Version: 1.0
References: <20240130103458.819774-1-martin.jansa@gmail.com> <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com>
In-Reply-To: <0b85cf93-421b-4c5c-ae46-515ebdb5cc38@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2024 19:23:51 +0100
Message-ID: <CA+chaQcHdgbVOORRdeErRXT2FM+7QcOidaHEanskrqrocFN7xg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] redis: restore Upstream-Status
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, wangmy@fujitsu.com
Content-Type: multipart/alternative; boundary="000000000000017b6a06102dde22"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jan 2024 18:24:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108499

--000000000000017b6a06102dde22
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> On 1/30/24 2:34 AM, Martin Jansa wrote:
> > * accidentally dropped in:
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=3De91fa668ed1dd=
4a3f6b06bcb099f70dbdd2a50b4
> > ---
> >   .../lua-update-Makefile-to-use-environment-build-setting.patch  | 2 +=
+
> >   1 file changed, 2 insertions(+)
> >
> > diff --git
> a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> > index b562e2522c..48a8bb5b4b 100644
> > ---
> a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> > +++
> b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-to-use-e=
nvironment-build-setting.patch
> > @@ -16,6 +16,8 @@ updated to work wtih 6.2.1
> >   Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
> >
> >   ---
> > +Upstream-Status: Pending
>
> I think it might be better to move it above the scissor to avoid getting
> lost in next devtool based upgrade.
>

As you wish, resent all 3 as v2 with it moved.

FWIW: in
https://github.com/webosose/meta-webosose/commit/2c78e37ad9ceb9e236c03b44cc=
a5b38e9d9eb2fc
I've moved all Upstream-Statuses in LGE layers bellow, because too often
developers applied them with Upstream-Status into the component source git
repo where it doesn't belong and then it was already too late to remove it
there (while with Upstream-Status lost in rebase/devtool there is still
time to get warning from QA check and once this check is enabled by default
in all the builds it will prevent people overlooking this by accident).

--000000000000017b6a06102dde22
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 30, 2024 at 6:28=E2=80=AFPM K=
hem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt=
; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 1/30/24 2:34 AM, Martin Jansa wrote:<br>
&gt; * accidentally dropped in:<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded=
/commit/?id=3De91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4" rel=3D"noreferrer" =
target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?id=
=3De91fa668ed1dd4a3f6b06bcb099f70dbdd2a50b4</a><br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../lua-update-Makefile-to-use-environment-build-setting.p=
atch=C2=A0 | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Mak=
efile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/red=
is/redis-7.2.4/lua-update-Makefile-to-use-environment-build-setting.patch<b=
r>
&gt; index b562e2522c..48a8bb5b4b 100644<br>
&gt; --- a/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-t=
o-use-environment-build-setting.patch<br>
&gt; +++ b/meta-oe/recipes-extended/redis/redis-7.2.4/lua-update-Makefile-t=
o-use-environment-build-setting.patch<br>
&gt; @@ -16,6 +16,8 @@ updated to work wtih 6.2.1<br>
&gt;=C2=A0 =C2=A0Signed-off-by: Yi Fan Yu &lt;<a href=3D"mailto:yifan.yu@wi=
ndriver.com" target=3D"_blank">yifan.yu@windriver.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0---<br>
&gt; +Upstream-Status: Pending<br>
<br>
I think it might be better to move it above the scissor to avoid getting <b=
r>
lost in next devtool based upgrade.<br></blockquote><div><br></div><div>As =
you wish, resent all 3 as v2 with it moved.</div><div><br></div><div>FWIW: =
in=C2=A0<a href=3D"https://github.com/webosose/meta-webosose/commit/2c78e37=
ad9ceb9e236c03b44cca5b38e9d9eb2fc">https://github.com/webosose/meta-webosos=
e/commit/2c78e37ad9ceb9e236c03b44cca5b38e9d9eb2fc</a> I&#39;ve moved all Up=
stream-Statuses in LGE layers bellow, because too often developers applied =
them with Upstream-Status into the component source git repo where it doesn=
&#39;t belong and then it was already too late to remove it there (while wi=
th Upstream-Status lost in rebase/devtool there is still time to get warnin=
g from QA check and once this check is enabled by default in all the builds=
 it will prevent people overlooking this by accident).</div></div></div>

--000000000000017b6a06102dde22--

