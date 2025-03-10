Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCA7C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 14:15:57 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.38762.1741616150838364079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Mar 2025 07:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=LcK8itOS;
 spf=pass (domain: snapchat.com, ip: 209.85.218.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-abf48293ad0so696109966b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 07:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1741616149; x=1742220949; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jliCDIaTtUMoJA0WBsCOsivbRzv9R8M9puU9UMhj2YI=;
        b=LcK8itOSqOnI7oJiLj6eCk3ob097KkmmjfuXUv8bSDzs//dmh0S58wLdL2M7eAsmz0
         jr1MiSYELBuPW7QLkJX5mghjuxgnmRbJFO09uahVs2r3RVPrt3ZdQP6TxCqmUu/leo5k
         6SQJjUFrAzdAoc2T6elkYbxqTXreqqj9IHjvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741616149; x=1742220949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jliCDIaTtUMoJA0WBsCOsivbRzv9R8M9puU9UMhj2YI=;
        b=bcgraItqBbMX44wPyn4yIppQdyc71FWDb/TMp1L/MrAjUOMqGjjKvmTZxjXcVKcfL/
         tS1F1hseCZgG7D1Wc7nkCECQvSyRU9E+OvE3GYpuM/5BLoPIb3vNLXne3rYh5JRlri8X
         oXN3QTRcGpV4w6qv4s3UcGpVwnDG8GO4z8cXaFPXqOhnEwpayLgYDMTkkJtz0/AASfAA
         9MRskgK1WuHWWD3Nn6YCtYBBEIPk6qLV0khfkdDOw0bVthfCuGXkX39v6I05OIEgt1qf
         OxzlAW9MlKmOvhezdfs9uilOcoq/cR8ATN3LzwgY1ECorW3zGVAxNgPBb0ijCChaS8fH
         5nxQ==
X-Gm-Message-State: AOJu0Yxt1ziU8LGGi3pYzvgBOI6SLfa0688TC06demtmYUiULbbFIcgr
	C/j7T865hAFI/i0XeV6TofdLpNI/hhmR7bQJLR7aVAhaHzq54PCv/y26yKjF73KbwSq0QA6j3xI
	nnEran0VrjhOfPPZ3k38kekCW6gFd32XcaVIMtg==
X-Gm-Gg: ASbGncsM1aCCbb6Je+c1uoT3aEBxZLqILLxEToPXV0cYy2jHNPl1b4OwYrc8ycIe6yq
	kWJQEgp8vKDVwqOIjpLe0JZcH4a5lym5Q4p9coIJ8JTj9MmchQNMk4FDLjg498BmPqEsNnge0wU
	/oT2ERFViuwPASXJhVvkv7fqFPDQ==
X-Google-Smtp-Source: AGHT+IG7KWSiZbezbPivcas3gTscTlyoFU+KcTDGlDnD/bk729ENiWAPeBG0Gj2fWa7QrlImmh2P1qg1mBY/cpV/JWY=
X-Received: by 2002:a17:907:3e16:b0:abf:fb78:6743 with SMTP id
 a640c23a62f3a-ac252fa0fedmr1676697466b.35.1741616149022; Mon, 10 Mar 2025
 07:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250305150306.2628246-1-martin.jansa@gmail.com>
In-Reply-To: <20250305150306.2628246-1-martin.jansa@gmail.com>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 10 Mar 2025 15:15:37 +0100
X-Gm-Features: AQ5f1Jr9B_zVphXKpK9ILUmTlk-gGUQHaIXUW6cZ8A3G79ZF-jsFyP-CKV6QtJI
Message-ID: <CAHUKmYZ3PWSFkhaH24LBPtB_dbR5ELJbwMJoV2xmCS04FBfjyw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] uutils-coreutils: remove LIBCLANG_PATH,
 SELINUX_LIB_DIR, SELINUX_INCLUDE_DIR variables
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e5f30b062ffd9b84"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Mar 2025 14:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115836

--000000000000e5f30b062ffd9b84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Martin, thanks for the improvement, and I confirm it works fine in my
test setup. Sorry for the slow response; your email had landed in my spam
folder for some unknown reason.

On Wed, Mar 5, 2025 at 4:03=E2=80=AFPM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> * don't seem to be needed, I don't see any failures or changes after
> removing them
>
> * they were needed before in older version as explained by Etienne in:
>
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_115756&d=3DDwIDAg&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3Dh_7mE0M2CrrYkOS5XkpS056mteR6X9KpxapPeNOzb_68rXcL29oBpvqyRwJjck_9&s=3D-L=
3i0Tx53RQ8q5VIvPT8yACcg3RK71CZTGXOv0C0_Os&e=3D
>
> regarding SELINUX_INCLUDE_DIR, it was definitely needed as I implemented
> the recipe. During implementation I submitted this patch to selinux-sys (
> https://github.com/koutheir/selinux-sys/commit/a6667c404ecc33266f66e9516b=
b8e30150c41ec2
> ) to correctly use this variable, and was getting a build error without
> this fix because the rust crate selinux-sys was not finding the selinux
> header-file (specifically, the bindgen tool).
>
> However, this was in 2022, and since then there has been this patch in
> selinux-sys:
> https://github.com/koutheir/selinux-sys/commit/d3ea4674e18c5240918348bea4=
ec6248e50516e5
> , and it seems that the variable is not needed any more.
> At least I'm not able to reproduce the build error which I was getting,
> even with commenting out SELINUX_LIB_DIR and SELINUX_INCLUDE_DIR.
>
> The header-file is used for generating rust code from the C header-file
> using bindgen, so I don't think it makes a difference whether the native
> version or the target version is used.
>
> This is the old build error I was getting:
>   process didn't exit successfully:
> `/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutils/0.0.14.AUTOI=
NC+43a5b8c7d7-r0/build/target/release/build/selinux-sys-0849198bc1fef4a4/bu=
ild-script-build`
> (exit status: 101)
>   --- stdout
>   cargo:root=3D/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreutil=
s/
> 0.0.14.
> AUTOINC+43a5b8c7d7-r0/build/target/aarch64-snap-linux/release/build/selin=
ux-sys-d96748d49908959f/out
>   cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64-snap-linux
>   cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64_snap_linux
>   cargo:rerun-if-env-changed=3DTARGET_SELINUX_STATIC
>
> |   --- stderr
> |   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not fou=
nd
> |   src/selinux-sys.h:1:10: fatal error: 'selinux/selinux.h' file not
> found, err: true
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb  | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.0.29.bb b/meta-oe/recipes-core/uutils-coreutils/
> uutils-coreutils_0.0.29.bb
> index d0a7532984..09f6071e71 100644
> --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
> +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.29.bb
> @@ -30,10 +30,6 @@ CARGO_BUILD_FLAGS +=3D
> "${@bb.utils.contains('PACKAGECONFIG', 'selinux', '--featur
>
>  DEPENDS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'selinux',
> 'clang-native libselinux-native', '', d)}"
>
> -export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> -export SELINUX_LIB_DIR =3D "${STAGING_LIBDIR_NATIVE}"
> -export SELINUX_INCLUDE_DIR =3D "${STAGING_INCDIR_NATIVE}"
> -
>  # The code which follows is strongly inspired from the GNU coreutils
> bitbake recipe:
>
>  # [ df mktemp nice printenv base64 gets a special treatment and is not
> included in this
> --
> 2.48.1
>
>

--000000000000e5f30b062ffd9b84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin, thanks for the improvement, and I confirm it wo=
rks fine in my test setup. Sorry for the slow response; your email had land=
ed in my spam folder for some unknown reason.</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 5, 2025 at 4:03=E2=
=80=AFPM Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=
=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">* don&#39;t seem to be needed, I don&#39;=
t see any failures or changes after removing them<br>
<br>
* they were needed before in older version as explained by Etienne in:<br>
=C2=A0 <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__li=
sts.openembedded.org_g_openembedded-2Ddevel_message_115756&amp;d=3DDwIDAg&a=
mp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx=
_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dh_7mE0M2CrrYkOS5XkpS056mteR6X9KpxapPeNO=
zb_68rXcL29oBpvqyRwJjck_9&amp;s=3D-L3i0Tx53RQ8q5VIvPT8yACcg3RK71CZTGXOv0C0_=
Os&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofp=
oint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel=
_message_115756&amp;d=3DDwIDAg&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2e=
pckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3Dh_7mE0M=
2CrrYkOS5XkpS056mteR6X9KpxapPeNOzb_68rXcL29oBpvqyRwJjck_9&amp;s=3D-L3i0Tx53=
RQ8q5VIvPT8yACcg3RK71CZTGXOv0C0_Os&amp;e=3D</a> <br>
<br>
regarding SELINUX_INCLUDE_DIR, it was definitely needed as I implemented th=
e recipe. During implementation I submitted this patch to selinux-sys ( <a =
href=3D"https://github.com/koutheir/selinux-sys/commit/a6667c404ecc33266f66=
e9516bb8e30150c41ec2" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/koutheir/selinux-sys/commit/a6667c404ecc33266f66e9516bb8e30150c41ec2</a>=
 ) to correctly use this variable, and was getting a build error without th=
is fix because the rust crate selinux-sys was not finding the selinux heade=
r-file (specifically, the bindgen tool).<br>
<br>
However, this was in 2022, and since then there has been this patch in seli=
nux-sys: <a href=3D"https://github.com/koutheir/selinux-sys/commit/d3ea4674=
e18c5240918348bea4ec6248e50516e5" rel=3D"noreferrer" target=3D"_blank">http=
s://github.com/koutheir/selinux-sys/commit/d3ea4674e18c5240918348bea4ec6248=
e50516e5</a> , and it seems that the variable is not needed any more.<br>
At least I&#39;m not able to reproduce the build error which I was getting,=
 even with commenting out SELINUX_LIB_DIR and SELINUX_INCLUDE_DIR.<br>
<br>
The header-file is used for generating rust code from the C header-file usi=
ng bindgen, so I don&#39;t think it makes a difference whether the native v=
ersion or the target version is used.<br>
<br>
This is the old build error I was getting:<br>
=C2=A0 process didn&#39;t exit successfully: `/workdir/build/tmp-glibc/work=
/armv8a-linux/uutils-coreutils/0.0.14.AUTOINC+43a5b8c7d7-r0/build/target/re=
lease/build/selinux-sys-0849198bc1fef4a4/build-script-build` (exit status: =
101)<br>
=C2=A0 --- stdout<br>
=C2=A0 cargo:root=3D/workdir/build/tmp-glibc/work/armv8a-linux/uutils-coreu=
tils/<a href=3D"http://0.0.14." target=3D"_blank">0.0.14.</a>AUTOINC+43a5b8=
c7d7-r0/build/target/aarch64-snap-linux/release/build/selinux-sys-d96748d49=
908959f/out<br>
=C2=A0 cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64-snap-linux<br>
=C2=A0 cargo:rerun-if-env-changed=3DSELINUX_STATIC_aarch64_snap_linux<br>
=C2=A0 cargo:rerun-if-env-changed=3DTARGET_SELINUX_STATIC<br>
<br>
|=C2=A0 =C2=A0--- stderr<br>
|=C2=A0 =C2=A0src/selinux-sys.h:1:10: fatal error: &#39;selinux/selinux.h&#=
39; file not found<br>
|=C2=A0 =C2=A0src/selinux-sys.h:1:10: fatal error: &#39;selinux/selinux.h&#=
39; file not found, err: true<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreutils_=
0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29.bb<=
/a>=C2=A0 | 4 ----<br>
=C2=A01 file changed, 4 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils=
-coreutils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils=
_0.0.29.bb</a> b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uu=
tils-coreutils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreu=
tils_0.0.29.bb</a><br>
index d0a7532984..09f6071e71 100644<br>
--- a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29=
.bb</a><br>
+++ b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uutils-coreut=
ils_0.0.29.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0.0.29=
.bb</a><br>
@@ -30,10 +30,6 @@ CARGO_BUILD_FLAGS +=3D &quot;${@bb.utils.contains(&#39;P=
ACKAGECONFIG&#39;, &#39;selinux&#39;, &#39;--featur<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39=
;selinux&#39;, &#39;clang-native libselinux-native&#39;, &#39;&#39;, d)}&qu=
ot;<br>
<br>
-export LIBCLANG_PATH =3D &quot;${STAGING_LIBDIR_NATIVE}&quot;<br>
-export SELINUX_LIB_DIR =3D &quot;${STAGING_LIBDIR_NATIVE}&quot;<br>
-export SELINUX_INCLUDE_DIR =3D &quot;${STAGING_INCDIR_NATIVE}&quot;<br>
-<br>
=C2=A0# The code which follows is strongly inspired from the GNU coreutils =
bitbake recipe:<br>
<br>
=C2=A0# [ df mktemp nice printenv base64 gets a special treatment and is no=
t included in this<br>
-- <br>
2.48.1<br>
<br>
</blockquote></div>

--000000000000e5f30b062ffd9b84--

