Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770E7D1953D
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 23:55:51 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35804.1769471743017655335
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 15:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYY4Nh21;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-790992528f6so48959087b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 15:55:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769471742; cv=none;
        d=google.com; s=arc-20240605;
        b=TQm9dk/hNxBARdc5vwHoOKtPc3fDTZyWgQRK8qaoO3SSCohkOe+81KPv4l05affYKv
         fxbIg1on5rWjFXp9F8LwYjSn0tSp6cSmKH84zWhavEWYO2AJEaQ2I4kJJM77s1yP4tWE
         kyaqnv11cCQmL6wdRrK0ZPbnlMxfTQrhoirfc3yl+yzoKN9eoeK35foXc0vPvYnEeglf
         JyvoRDoRS76838iSI6WIqAfRgFRQetjfIGVmlqEoZBbgNMAq43PbByAezWgVAyA0qy3Z
         sY8eZ3qSz6VApBu1DpnZx+YTAJd6AZwUC4J4EHjn5H9nF1aoo3egZl6NmrSr1rFbwYPf
         oGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lCh+J1pZE9m0oXj/dk/eX4YFfmJba2T+dfATagFCB00=;
        fh=XcM6YKs5XohCyQUPXjnlFet9+nD6e72ufuzytl2wGp8=;
        b=YJmnRTQGqhVbLGfCBUoJpe1irklS2/L1VwilLG0xEgTljHDqn6J41wr5CztxYI7UEV
         Y7RAkiZfULdL+kpAYZVqlUZhuVNhrGy7VmhVDJjBnJjSt0cf08aax4nxA67A6hXSbbn4
         /j+lgwxuLByscYlswn43/qA6wAAYGFp3t0NlYOAwLZOK/4xf1DcrKKjmdblvlhOjplV3
         8sBBPACcrQQvv7YsynBWod8RPkD4MehjPMLmOV8m6PlFN4VO9Ee/d0Q8t15BiHyXOi1g
         CmzgfVg/Y+BEULAfFLmhsQ/zZwLKsn/UHUEO3WCCaMmygBeXh9mCYDZtBz8srflnICPF
         3ENg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769471742; x=1770076542; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lCh+J1pZE9m0oXj/dk/eX4YFfmJba2T+dfATagFCB00=;
        b=PYY4Nh21mF9FSqONQbFdZwy4WbPWb9j+b4NpxqVr756Wl4KDLlXZIZGCn24VjSd8Yd
         AYgQ1xVFIe86Hwbi9t3pDjh2R2gI6ncXa9oMVCl86rh4ly1p0EOsdBgTWRlsA9B5NlDT
         vM1tO3R+NU+gkhXAmefcHomiciq1qf7rxa47iQrCFYwUQE/QqSFbrL92lR5C/iA7TTR8
         JApfUSb7qnbvT10tzQQ5dZ8mYmHH3ZalkHKDxRBUUCRsFmWtb7ufLghtd4+vL8V8Cmwl
         uwHJDlD5pjWUG6Q8hwZpfO4/O1nK5JvQSbjvRgHUgC4pzWae29/Gqe2KtLFyKUjhLMdk
         NN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769471742; x=1770076542;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCh+J1pZE9m0oXj/dk/eX4YFfmJba2T+dfATagFCB00=;
        b=WnnJqkGDh+9ariA2ZdVVYaj+cSMEYRlG7VTOu9DN17qLy2U+5h3t3/7Ik+fGOoOanP
         sCj9gcFLBJ/IE5JPbwwHbDqfsh9BrAMJfOEvXpRsI4+MjfWK2C/tHV97HHw4Cp/ZFDJc
         /JJyjictsK0bc92yBaIW0s5btVBEVkWT7Thjlq+A+lWeEDfkqNnZKt0kgV2QLGP6KdYn
         /C1OsgMQ1FkjMr5wDVhZ9SCmpjZfpziaHBKTid/CVEeqpFU04GtliXJDM77ULWnpmajW
         RN29SyQ6+67OFdpQAhqbb7qB/uX4n6PEOZrFNWqQZqH+cMCbEjpzubruR2UZZSKm3ApF
         AFDA==
X-Gm-Message-State: AOJu0YxTSKDYUfzrMxVUvWRtWuPtMbDTQyU42y3cn04NywzqrSBHasQ/
	j29x/M36TiZZFKyLlA8Rj0BMVwb/LJElBtTvd+mWfD68USwEUnbBu3vAVn9iu9Jcai9lyaD8pFE
	cWYf1es9V64Q6UOVgMSLdQwOPzBh1rms=
X-Gm-Gg: AZuq6aLRM0B0B6IiFYtP+/Yl1eOyPC4AS2PNhQgRo4s6vSK8JwGay0lyJFZUpSF8wHT
	j0MyYpVlFT+ueyNsbM8VjwBqzpl/a5wkw0YkcBIry92ciMxA4bHg9cG3aM80LrkZeD1i6NeNtyl
	XeSH6O+XS+H03HIElwxj22tvjwAdEUYdHyBTw8sSRqNLQGBGVvbFGRlIEwanMq0wyxfOAZXUibk
	rExyvzp2c/iTdnsCjKtEz7Rvwmdr06U9/LGbk0qQv3wAxL3xIDHkPA2e4WfI310x99lOmns20id
	zlPaUhDNsMI+J3SbgFH5rpEH5w5RRsyhM0Fs9Fzj21Y5HzbiXv4OfNULNpIJYWXm6r8T5JNbRPu
	vtSzkDjmfl/HXLFTYngVIptZAcYncqQ9kd5D4yWzmuLHh0uCH/lkBFJU=
X-Received: by 2002:a05:690c:e3cb:b0:78f:a8cb:6366 with SMTP id
 00721157ae682-7945a826f81mr48712287b3.13.1769471742016; Mon, 26 Jan 2026
 15:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20260126071627.4466-1-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260126071627.4466-1-liuyd.fnst@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jan 2026 15:55:15 -0800
X-Gm-Features: AZwV_Qh-6Bj03LeLmwqWOZj7AAnwgDNLbEakDfRnYQ4hS-MyFy7cIYOYjrxC5jk
Message-ID: <CAMKF1sqvMFn7OrdkBxFLgfgKyaYSdMM1X3oYK6O5xAEymGix_A@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH] openl2tp: Fix do_package_qa Issue
To: liuyd.fnst@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009f7f9c0649533eef"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 23:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123893

--0000000000009f7f9c0649533eef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 11:16=E2=80=AFPM Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:

> Fix following issue when using customized kernel without
> kernel-module-l2tp-ppp enabled.
> ERROR: openl2tp-1.8-r0 do_package_qa: QA Issue: openl2tp-ptest rdepends o=
n
> kernel-module-l2tp-ppp, but it isn't a build dependency? [build-deps]
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> index 4e5b45891d..ac9dece2f9 100644
> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
> @@ -97,3 +97,5 @@ do_install_ptest () {
>
>  RDEPENDS:${PN} =3D "ppp ppp-l2tp bash"
>  RDEPENDS:${PN}-ptest +=3D "rpcbind kernel-module-l2tp-ppp procps-ps tcl"
>

Try changing above line to use
RRECOMMENDS:${PN}-ptest instead of rdep


> +
> +INSANE_SKIP:${PN}-ptest +=3D "build-deps"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123859):
> https://lists.openembedded.org/g/openembedded-devel/message/123859
> Mute This Topic: https://lists.openembedded.org/mt/117464733/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009f7f9c0649533eef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 25,=
 2026 at 11:16=E2=80=AFPM Yiding Liu (Fujitsu) via <a href=3D"http://lists.=
openembedded.org">lists.openembedded.org</a> &lt;liuyd.fnst=3D<a href=3D"ma=
ilto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Fix following issue when using customized kernel without kernel-module-l2tp=
-ppp enabled.<br>
ERROR: openl2tp-1.8-r0 do_package_qa: QA Issue: openl2tp-ptest rdepends on =
kernel-module-l2tp-ppp, but it isn&#39;t a build dependency? [build-deps]<b=
r>
<br>
Signed-off-by: Liu Yiding &lt;<a href=3D"mailto:liuyd.fnst@fujitsu.com" tar=
get=3D"_blank">liuyd.fnst@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-protocols/openl2tp/<a href=3D"http://openl2tp=
_1.8.bb" rel=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a> | 2 ++<br=
>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-networking/recipes-protocols/openl2tp/<a href=3D"http://o=
penl2tp_1.8.bb" rel=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a> b/=
meta-networking/recipes-protocols/openl2tp/<a href=3D"http://openl2tp_1.8.b=
b" rel=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a><br>
index 4e5b45891d..ac9dece2f9 100644<br>
--- a/meta-networking/recipes-protocols/openl2tp/<a href=3D"http://openl2tp=
_1.8.bb" rel=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a><br>
+++ b/meta-networking/recipes-protocols/openl2tp/<a href=3D"http://openl2tp=
_1.8.bb" rel=3D"noreferrer" target=3D"_blank">openl2tp_1.8.bb</a><br>
@@ -97,3 +97,5 @@ do_install_ptest () {<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;ppp ppp-l2tp bash&quot;<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;rpcbind kernel-module-l2tp-ppp procps=
-ps tcl&quot;<br></blockquote><div><br></div><div>Try changing above line t=
o use</div><div>RRECOMMENDS:${PN}-ptest instead of rdep</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+INSANE_SKIP:${PN}-ptest +=3D &quot;build-deps&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123859): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123859" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123859</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117464733/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117464733/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009f7f9c0649533eef--

