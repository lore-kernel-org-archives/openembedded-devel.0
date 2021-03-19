Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.946.1616120558518739961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 19:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=M0p+miYu;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id r193so4508998ior.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Mar 2021 19:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G0VOu1zYX0zL2otklTQkK529p81E3XMtp9AHexIb+VM=;
        b=M0p+miYusbKxOtSGAuBFO1fDxBxisksqP0KrvR9ipvMTy9BnwRpkPtYBwbCbhFZVLR
         tfRwNHpPaLo0Y0V/67e2nmzwMkBGa2Oafpet10Eb8Alpjq3m8Ks3bruRsZxXpLYSILXQ
         0YUKpPXqAjXW2AFZS7PoNj6/m73KE2T46zXgM3dAuwiS0v+HqlH/aV9bphP4leWBPSSc
         y3PUvRxpKtCVcb9kzgyEn1roptd26rM2BM524+7zL0LEyKd7h6wiT9BpvmvbD/LlPSXR
         dYQZOkCljU7jOPY5c4o9+CBLj9vSGpeav6ArwV6+h/eSvBKlkykBgnFqtacJ/qSCbDUF
         AVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=G0VOu1zYX0zL2otklTQkK529p81E3XMtp9AHexIb+VM=;
        b=pspANZ0QjuY88ibonwxz/EF7G11wlMAK4fTinVI9yN1ZydlcZyDrlTFDb25tp8dhY3
         NbFNOPQFdSQ7radIpzKaUvSTdvWyrDqYZWK93fK6EgrG5xIT5Dxn0FyvvyhwF7Us4ShV
         oDFQQTMJHSCyXJ1ulOU78eJg1xzCQHztrz7y0PC8zXPD2v5GGOsu5SYS3sBZ9JmtDBCn
         q/LwvaQIYYfU+aO1MSUER+UR2ajN1nnht5I7Vstbh90PYEZFi65dW6BG4p5w3aRUPB/r
         xrBJHQf23ngBKXCLuNMyhW5wYlCwIshSQBruwpugWOcxu7+lsbAsTZDAueu/SMDIklSR
         6WcQ==
X-Gm-Message-State: AOAM532LlkqLwRmR5/u8+cjbaWcwXwkMtqtR8rya81BGBZgnqahPGsyl
	3TpseG3aMjtvZqjX4HFSZZBFL9fMJyQqDA==
X-Google-Smtp-Source: ABdhPJx+Oenmwm3w43a8Tl5cezT3bHcMsfvynYegr23SfHfpSTKkGw+D2kU7Xy+7Fqx0wvy4P4hEOw==
X-Received: by 2002:a02:9985:: with SMTP id a5mr9421990jal.122.1616120557356;
        Thu, 18 Mar 2021 19:22:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:64ff:3f25:21dc:876e? ([2601:646:9200:a0f0:64ff:3f25:21dc:876e])
        by smtp.gmail.com with ESMTPSA id 18sm1917478ilj.59.2021.03.18.19.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 19:22:36 -0700 (PDT)
Subject: Re: [oe] [meta-oe] [PATCH] glmark2: upgrade 20201114 -> 2021.02
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1616150149-59433-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <421a049a-2d2c-d9ca-d583-5a3e50ad77d3@gmail.com>
Date: Thu, 18 Mar 2021 19:22:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616150149-59433-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/19/21 3:35 AM, zhengruoqin wrote:
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>   .../0003-fix-precision-handling-bugs.patch    | 138 ------------------

why is this patch dropped ? is this already in 2021.02 ?

>   .../recipes-benchmark/glmark2/glmark2_git.bb  |   5 +-
>   2 files changed, 2 insertions(+), 141 deletions(-)
>   delete mode 100644 meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
> 
> diff --git a/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch b/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
> deleted file mode 100644
> index af88f6cd2..000000000
> --- a/meta-oe/recipes-benchmark/glmark2/files/0003-fix-precision-handling-bugs.patch
> +++ /dev/null
> @@ -1,138 +0,0 @@
> -From 90e837ffd1ff5c9add1074d69de23e58a3a4810e Mon Sep 17 00:00:00 2001
> -From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> -Date: Wed, 11 Nov 2020 09:26:03 -0500
> -Subject: [PATCH 1/3] terrain: Fix precision bug in light rendering
> -
> -Resulting in overly bright rendering when mediump is implemented as
> -fp16.
> -
> -Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ----
> - data/shaders/terrain.frag | 5 +++++
> - 1 file changed, 5 insertions(+)
> -
> -diff --git a/data/shaders/terrain.frag b/data/shaders/terrain.frag
> -index 84d085c..58f17ea 100644
> ---- a/data/shaders/terrain.frag
> -+++ b/data/shaders/terrain.frag
> -@@ -67,7 +67,12 @@ void main() {
> -     vec3 pointSpecular = vec3( 0.0 );
> -     for ( int i = 0; i < MAX_POINT_LIGHTS; i ++ ) {
> -         vec4 lPosition = viewMatrix * vec4( pointLightPosition[ i ], 1.0 );
> -+#ifdef GL_FRAGMENT_PRECISION_HIGH
> -+        // should be highp for correct behaviour if mediump is implemented as fp16
> -+        highp vec3 lVector = lPosition.xyz + vViewPosition.xyz;
> -+#else
> -         vec3 lVector = lPosition.xyz + vViewPosition.xyz;
> -+#endif
> -         float lDistance = 1.0;
> -         if ( pointLightDistance[ i ] > 0.0 )
> -             lDistance = 1.0 - min( ( length( lVector ) / pointLightDistance[ i ] ), 1.0 );
> -
> -From 1edd76fda77edabd49d713912aee49b8360c86c3 Mon Sep 17 00:00:00 2001
> -From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> -Date: Wed, 11 Nov 2020 09:49:52 -0500
> -Subject: [PATCH 2/3] terrain: Fix precision handling in noise shader
> -
> -Another overflow resulting in infinity in mediump. Note this bug is
> -masked if the driver clamps infinity to MAX_FLOAT, but it's still our
> -bug.
> -
> -Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ----
> - data/shaders/terrain-noise.frag | 6 ++++++
> - 1 file changed, 6 insertions(+)
> -
> -diff --git a/data/shaders/terrain-noise.frag b/data/shaders/terrain-noise.frag
> -index 7fea5c0..9535e58 100644
> ---- a/data/shaders/terrain-noise.frag
> -+++ b/data/shaders/terrain-noise.frag
> -@@ -17,7 +17,13 @@ uniform float time;
> - uniform MEDIUMP vec2 uvScale;
> - varying vec2 vUv;
> -
> -+#ifdef GL_FRAGMENT_PRECISION_HIGH
> -+// x should be passed as highp since the intermediate multiplications can
> -+// overflow with mediump
> -+vec4 permute(highp vec4 x)
> -+#else
> - vec4 permute(vec4 x)
> -+#endif
> - {
> -     return mod(((x * 34.0) + 1.0) * x, 289.0);
> - }
> -
> -From e866cc633ffc450e5358b2742f32ca360e4f3f12 Mon Sep 17 00:00:00 2001
> -From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> -Date: Wed, 11 Nov 2020 09:35:21 -0500
> -Subject: [PATCH 3/3] loop,function,conditionals: Fix mediump overflow
> -
> -The multiplication can produce infinity.
> -
> -Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ----
> - data/shaders/conditionals.frag | 9 ++++++++-
> - data/shaders/function.frag     | 9 ++++++++-
> - data/shaders/loop.frag         | 9 ++++++++-
> - 3 files changed, 24 insertions(+), 3 deletions(-)
> -
> -diff --git a/data/shaders/conditionals.frag b/data/shaders/conditionals.frag
> -index 3bd2507..e902263 100644
> ---- a/data/shaders/conditionals.frag
> -+++ b/data/shaders/conditionals.frag
> -@@ -2,7 +2,14 @@ varying vec4 dummy;
> -
> - void main(void)
> - {
> --    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
> -+#ifdef GL_FRAGMENT_PRECISION_HIGH
> -+    // should be declared highp since the multiplication can overflow in
> -+    // mediump, particularly if mediump is implemented as fp16
> -+    highp vec2 FragCoord = gl_FragCoord.xy;
> -+#else
> -+    vec2 FragCoord = gl_FragCoord.xy;
> -+#endif
> -+    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
> -
> - $MAIN$
> -
> -diff --git a/data/shaders/function.frag b/data/shaders/function.frag
> -index 3e3c74f..9d0230e 100644
> ---- a/data/shaders/function.frag
> -+++ b/data/shaders/function.frag
> -@@ -8,7 +8,14 @@ $PROCESS$
> -
> - void main(void)
> - {
> --    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
> -+#ifdef GL_FRAGMENT_PRECISION_HIGH
> -+    // should be declared highp since the multiplication can overflow in
> -+    // mediump, particularly if mediump is implemented as fp16
> -+    highp vec2 FragCoord = gl_FragCoord.xy;
> -+#else
> -+    vec2 FragCoord = gl_FragCoord.xy;
> -+#endif
> -+    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
> -
> - $MAIN$
> -
> -diff --git a/data/shaders/loop.frag b/data/shaders/loop.frag
> -index 31ae23e..9a6afd2 100644
> ---- a/data/shaders/loop.frag
> -+++ b/data/shaders/loop.frag
> -@@ -3,7 +3,14 @@ uniform int FragmentLoops;
> -
> - void main(void)
> - {
> --    float d = fract(gl_FragCoord.x * gl_FragCoord.y * 0.0001);
> -+#ifdef GL_FRAGMENT_PRECISION_HIGH
> -+    // should be declared highp since the multiplication can overflow in
> -+    // mediump, particularly if mediump is implemented as fp16
> -+    highp vec2 FragCoord = gl_FragCoord.xy;
> -+#else
> -+    vec2 FragCoord = gl_FragCoord.xy;
> -+#endif
> -+    float d = fract(FragCoord.x * FragCoord.y * 0.0001);
> -
> - $MAIN$
> -
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index a5872f435..509c5cc40 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -11,15 +11,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>   DEPENDS = "libpng jpeg udev"
>   DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland-native', '', d)}"
>   
> -PV = "20201114+${SRCPV}"
> +PV = "2021.02+${SRCPV}"
>   
>   SRC_URI = " \
>       git://github.com/glmark2/glmark2.git;protocol=https \
>       file://0001-fix-dispmanx-build.patch \
>       file://0002-run-dispmanx-fullscreen.patch \
> -    file://0003-fix-precision-handling-bugs.patch \
>       "
> -SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
> +SRCREV = "4b2bbe803576d48f08367aa5441740f9319c21e7"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> 
> 
