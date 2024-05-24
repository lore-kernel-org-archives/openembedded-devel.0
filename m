Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0189CC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 18:22:50 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.2528.1716574966418077596
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 May 2024 11:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M4d3Do4o;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5295f201979so1395505e87.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716574964; x=1717179764; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ebr5nJyje0+GEj75CNJniMXK6RmrOKp7PjzqkEV+K4A=;
        b=M4d3Do4oLhu1YIEK2doL86aTOYusowLb+zyj+VoA32dq1X27LPUytzBaxriRZOrhBH
         K21eG08IWXooKMc9YFHMEYExgXjjtj2+KOcn5BvGX14EaCjVpD/lba+/yb3InpNJFMUM
         9DJIBgvwXCMLCRh9sP3g4kV6uNFDmnn3HHNhFNOAIGLe4WRaJQ8Iku6+dQ/IPltG+0LZ
         UrYmV/HKn8n6aeRARNz1ZVyG0bGeUXdXVLbL9H4GKq24RkMpgR5Qp7z/PatjSuH9ZJzw
         PQD5C5WPs3a7UvUOjSPd0ss2P0Bvi3RnzroEZ/IOv/9JelZtSTgzNKDOrGbf+CaNE4I9
         7FBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716574964; x=1717179764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ebr5nJyje0+GEj75CNJniMXK6RmrOKp7PjzqkEV+K4A=;
        b=O3AFuMaLY0g14IgKOgIc3HA+zHOmu4j+/g6s7o3H43jsnCB7ad1OZstWx1ASX9z/ex
         jAvM13jc30+BdN1SmccP2CYskomMObjMAj1tWOXwA32IuPMIdHZSD3J3gTwKlmYNXWs2
         IsB3EiaZPTEE32s5ZYlmbiCmSfrPe5t69zhNzN8fKZgQZN9uSzgKhfGdTAfvVblnn/6P
         ECbO3oLSkIMkES9e7l0pGnkjuFz/scfJ5rvpWrMXRRQZx+a9NYx24gmvjp/EYe0h2Vxr
         5Tepi3t3YeAnuMEvPs/rNsZ4V9G9Q6IfVBy8XpZWoMH+qSVkJF85bC2LFynDJ2dX0F9G
         gDwg==
X-Gm-Message-State: AOJu0Yw9rqQJ9s7SjCoRvO6wDFB7ofCXzXAIeDvPzhGqQg0ZmEyaLRpZ
	NC9lEMy7jndikNUslvp9FkfJo9G/zZOnscRre+Gel1XZTLKRWX3G2lBM6157aV5xObF6nGXz7jV
	GmnijWlRMNnVd0rvk0eg0YAoVDYw=
X-Google-Smtp-Source: AGHT+IF8MiVjtMoC7FwT+vFM6xvc0s+MBEsYPcHkHs/3zKn2uEqMTu8+uPKDozNrkVP286LoyjOVaKZUXxKmhu+n1d8=
X-Received: by 2002:a05:6512:4cc:b0:51e:f2bb:158a with SMTP id
 2adb3069b0e04-52966ca8c0fmr1819923e87.64.1716574964264; Fri, 24 May 2024
 11:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240516163058.465553-1-gerard.salvatella@siemens.com>
In-Reply-To: <20240516163058.465553-1-gerard.salvatella@siemens.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 24 May 2024 20:22:25 +0200
Message-ID: <CA+chaQen=WaddY8kr4K9hvVgjeEtU6GKoRb-FxAqTiYXqzSbZw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libwebsockets: fix buildpath warnings
To: gerard.salvatella@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 May 2024 18:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110523

This breaks libcap dependency when libwebsocket is built with libcap in DEP=
ENDS.

mosquitto fails with:
ninja: error: '/libcap.so', needed by 'src/mosquitto', missing and no
known rule to make it

because this change caused this diff:
+++ 4.3.3/image/usr/lib/cmake/libwebsockets/LibwebsocketsTargets.cmake
 2024-05-24 20:16:49.448901228 +0200
@@ -69,7 +69,7 @@

 set_target_properties(websockets_shared PROPERTIES
   INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include;"
-  INTERFACE_LINK_LIBRARIES
"ssl;crypto;ssl;crypto;/OE/lge/build/starfish/styhead/BUILD/work/o22-webosm=
llib32-linux-gnueabi/lib32-libwebsockets/4.3.3/lib32-recipe-sysroot/usr/lib=
/libcap.so;-lpthread"
+  INTERFACE_LINK_LIBRARIES "ssl;crypto;ssl;crypto;/libcap.so;-lpthread"
)

 if(CMAKE_VERSION VERSION_LESS 2.8.12)

I don't see libz there, but /libcap.so is surely wrong, removing the /
fixes the mosquitto build for me (I'm not using it, it just started to
fail in world builds now), will send the fix shortly.

On Thu, May 16, 2024 at 6:30=E2=80=AFPM Gerard Salvatella via
lists.openembedded.org
<gerard.salvatella=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Gerard Salvatella <gerard.salvatella@siemens.com>
>
> In order to remove absolute paths from the cmake artifacts, paths from
> the `$lib` folder should also be stripped off, otherwise internally
> linked libraries (e.g. libz) may appear.
> ---
>  .../recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb   | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3=
.3.bb b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
> index 4518e2faa..8f8b70421 100644
> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_4.3.3.bb
> @@ -42,6 +42,8 @@ do_install:append() {
>      sed -i -e 's|${STAGING_LIBDIR}/libuv.so|uv|g' ${D}${libdir}/cmake/li=
bwebsockets/LibwebsocketsTargets.cmake
>      sed -i -e 's|${STAGING_INCDIR}||g' ${D}${libdir}/cmake/libwebsockets=
/LibwebsocketsTargets.cmake \
>                                         ${D}${libdir}/cmake/libwebsockets=
/libwebsockets-config.cmake
> +    sed -i -e 's|${STAGING_LIBDIR}||g' ${D}${libdir}/cmake/libwebsockets=
/LibwebsocketsTargets.cmake \
> +                                       ${D}${libdir}/cmake/libwebsockets=
/libwebsockets-config.cmake
>  }
>
>  PACKAGES =3D+ "${PN}-testapps ${PN}-evlib-event ${PN}-evlib-uv ${PN}-evl=
ib-ev ${PN}-evlib-sd"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110416): https://lists.openembedded.org/g/openembedde=
d-devel/message/110416
> Mute This Topic: https://lists.openembedded.org/mt/106138059/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

