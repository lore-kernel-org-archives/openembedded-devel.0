Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B3EC54788
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 13:11:37 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.12249.1708607487693427387
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Feb 2024 05:11:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q94aXBZR;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-412880e625fso4353205e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 05:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708607486; x=1709212286; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lOqPhxeWnX0a/6B5R75WgvCmPfy9xq8YMgHlpUUbYA4=;
        b=Q94aXBZRWs333NXbghjE/CV84DTgTg4EqrYfMvLlO4VByN4QyoVJzKcfk+GmfKNlKn
         f+0YQ/p0IhJ94id5mRryICjSFbV9umJH4VQt3Zx9/C/1fRcPvBeXkmreZZMnxT3viWRd
         Yve/sz8Ku+YwKNB2fU96kuMY6rjaJ1OHEqonpvHVfK6a2FzdCJW4ihiAFNfL9YNIIQ+U
         qigIg0IBsghvMc2BgMf+0npQi60uG1rp+wlHauQ1am93OcMapZOQRS397Be0rQQbwfPw
         CnrTwVv1Hf6fiPevstsOnSD6vzpL1bF7CGRbhJV2FeenvKqgF0KMQTDX5g/ENUJU3Cux
         NwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708607486; x=1709212286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOqPhxeWnX0a/6B5R75WgvCmPfy9xq8YMgHlpUUbYA4=;
        b=OT7BH6Fbt+DokwiABXfFQb7QDmLoudF+FqwvNW6nAQ7jKY7M7L00u5xbesfNvQ4NKc
         8d0Pjuia7WV2EvgNNzow+bXMU14afQzCxxLDCXpLrDdERsT/96eip7KMn/20YptnI5nY
         rr0taDB04RCcoKaxJq8VWaSV5Cs4fIXCJa8on5Agn3VYU8rmEuDdazUB+QjW18hhQaOP
         TSko6NqlniPSG/YM8/RBwRLyg9UnPXL1UwfOOMtZUy635DHjm33F20EcVrfJmxYqsjwd
         IymDlC7GFXuMV0+WWFrCBK7K/n+WfNY2WCGcXpyOx6LIB5SQ6kAZ5e5yCoYnTrLb3bFi
         BfqA==
X-Gm-Message-State: AOJu0Yw/mpdwTT+JB8WRqyi5PxlW52KdKS6fLJuKmaTCn8MFB2r6Ytbl
	3VtWhGSlfsanEMSbfP9UQYtSkou4irSaH2T6QHZhuVQYdq3y1IH5cbtw6Kv/0qZEoHomWJKklvn
	XMeA7f1116tZVMF9TZZTFJM71hiU=
X-Google-Smtp-Source: AGHT+IELLUyv1DZf5tIQdDlDUTw8gNY5lq3gTuUIwN+1wlx2wDZPDyHc7w3COtYv7y8WeaYL6DPY49r2rWUA9KVh1NI=
X-Received: by 2002:a05:600c:3b15:b0:412:8d27:b757 with SMTP id
 m21-20020a05600c3b1500b004128d27b757mr667886wms.37.1708607485787; Thu, 22 Feb
 2024 05:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20240222125551.66224-1-badganchipv@gmail.com>
In-Reply-To: <20240222125551.66224-1-badganchipv@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 22 Feb 2024 14:11:09 +0100
Message-ID: <CA+chaQe1jgjBJ0t6GKD_ssMwxpDwfYjsJ+e25g74xm4GVdixtQ@mail.gmail.com>
Subject: Re: [oe] [OE-core][master][PATCH] android-tools: Enable
 position-independent executable
To: Pawan Badganchi <badganchipv@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: multipart/alternative; boundary="0000000000004042090611f82e2e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Feb 2024 13:11:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108985

--0000000000004042090611f82e2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[OE-core] tag doesn't belong to subject for meta-oe patches, use [meta-oe]
instead.

Upstream-Status belongs to .patch files in the metadata, not to commit
message of metadata changes.

On Thu, Feb 22, 2024 at 1:56=E2=80=AFPM Pawan Badganchi <badganchipv@gmail.=
com>
wrote:

> Enable position-independent executable security flag for adb
> and fastboot. Verified that flag is enabled by using checksec.py
>
> Upstream-Status: Pending
>
> Signed-off-by: Pawan <badganchipv@gmail.com>
> ---
>  .../recipes-devtool/android-tools/android-tools_29.0.6.r14.bb   | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools=
/
> android-tools_29.0.6.r14.bb
> b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/
> android-tools_29.0.6.r14.bb
> index fbad5e136..6ec90c2f5 100644
> --- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/
> android-tools_29.0.6.r14.bb
> +++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/
> android-tools_29.0.6.r14.bb
> @@ -77,6 +77,8 @@ PREREQUISITE_core =3D "liblog libbase libsparse liblog
> libcutils"
>  TOOLS_TO_BUILD =3D "libcrypto_utils libadb libziparchive fastboot adb
> img2simg simg2img libbacktrace"
>  TOOLS_TO_BUILD:append:class-target =3D " adbd"
>
> +SECURITY_CFLAGS:append:aarch64 =3D " -pie -fPIE"
> +
>  do_compile() {
>
>      case "${HOST_ARCH}" in
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108983):
> https://lists.openembedded.org/g/openembedded-devel/message/108983
> Mute This Topic: https://lists.openembedded.org/mt/104507422/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> martin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004042090611f82e2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">[OE-core] tag doesn&#39;t belong to subject for meta-oe pa=
tches, use [meta-oe] instead.<div><br></div><div>Upstream-Status belongs to=
 .patch files in the metadata, not to commit message of metadata changes.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Thu, Feb 22, 2024 at 1:56=E2=80=AFPM Pawan Badganchi &lt;<a href=3D"=
mailto:badganchipv@gmail.com">badganchipv@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Enable position-independ=
ent executable security flag for adb<br>
and fastboot. Verified that flag is enabled by using checksec.py<br>
<br>
Upstream-Status: Pending<br>
<br>
Signed-off-by: Pawan &lt;<a href=3D"mailto:badganchipv@gmail.com" target=3D=
"_blank">badganchipv@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtool/android-tools/<a href=3D"http://android-tools_29.=
0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.b=
b</a>=C2=A0 =C2=A0| 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/<=
a href=3D"http://android-tools_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"=
_blank">android-tools_29.0.6.r14.bb</a> b/meta-oe/dynamic-layers/selinux/re=
cipes-devtool/android-tools/<a href=3D"http://android-tools_29.0.6.r14.bb" =
rel=3D"noreferrer" target=3D"_blank">android-tools_29.0.6.r14.bb</a><br>
index fbad5e136..6ec90c2f5 100644<br>
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/<a href=
=3D"http://android-tools_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank=
">android-tools_29.0.6.r14.bb</a><br>
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/<a href=
=3D"http://android-tools_29.0.6.r14.bb" rel=3D"noreferrer" target=3D"_blank=
">android-tools_29.0.6.r14.bb</a><br>
@@ -77,6 +77,8 @@ PREREQUISITE_core =3D &quot;liblog libbase libsparse libl=
og libcutils&quot;<br>
=C2=A0TOOLS_TO_BUILD =3D &quot;libcrypto_utils libadb libziparchive fastboo=
t adb img2simg simg2img libbacktrace&quot;<br>
=C2=A0TOOLS_TO_BUILD:append:class-target =3D &quot; adbd&quot;<br>
<br>
+SECURITY_CFLAGS:append:aarch64 =3D &quot; -pie -fPIE&quot;<br>
+<br>
=C2=A0do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0case &quot;${HOST_ARCH}&quot; in<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108983): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108983" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108983</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104507422/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/104507422/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@gmail.com" =
target=3D"_blank">martin.jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004042090611f82e2e--

