Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41D51EB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 20:03:41 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.854.1686686620037064059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jun 2023 13:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rGi0+xtn;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b15e510630so3917846a34.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 13:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686686619; x=1689278619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yN3o7v/DleAL7RkO5AVeyMdcFenUpGN9w15BJhGVmvI=;
        b=rGi0+xtnvsKx9uIYmuVwatO26hKgC5mCMefwprzjV6yKqPkF+IJHlxdQMdif+vl44W
         eTYhH7hGVddN/h+uRa6rzKce7hDnxvRn0xNvstN3eEtWAPKo8sLWHDVDzyL9/CR+gSxL
         za928tL2xOs+koYfLh/GOCiBVUGzIdh9zYbIY0gepeEaj1F5l//RW+r72ZIYXLA80piM
         y42Gpa7jtdCTVZwykRQdVhy0ZMM0f1SE4nL5zlvGtq0oCft2KjOZOVjxcAer+QeHClkg
         Ufz3Uk+nib7i5ZGDuJfxPPbA+UPdy6Hh1gwgusS+/tsTBWZSBRUkMDQJXssQXFhmry1k
         E0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686686619; x=1689278619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yN3o7v/DleAL7RkO5AVeyMdcFenUpGN9w15BJhGVmvI=;
        b=K7M/0DavKdEcPufNMcTO5bcifzonSnjfsI29pfZKrJRvKdXFyC0RAIPy86/XINakuR
         tjiIcj2z6g+hdYP5qaN/Mut945DrCvpStdIqjpSguvQJxR8f6FyyWBPBc5rvWjVN9G6A
         HtycMuHUw4euUsNam1W4AL2wProl/Q9HlOWWVxsgzaa0/X8g4AxhXfbOIFudr/YPz02O
         aQ3WUqCgEBKSGI+RJ7hRjiKVwUjRxe0pxaeNsoBNmCY1uI2GFZlkB6y71ok/7Yf/xSLZ
         cUizwLti2Py0BsgVluNVDn74WaEui8vJyWIDdw8DuaMT4s21iGmqfy7LlRMtVrfVQ96R
         al4w==
X-Gm-Message-State: AC+VfDw550zZMsB9L/2vr8h7eFxqWmJlPQa7GSytZgHmmdoFbVR0k7oL
	BGoHnK34LiBdE6ForC3q3ddx2GidHTFpBHwi5hVy/mdPjWQ=
X-Google-Smtp-Source: ACHHUZ6eKhA4/ZWG0kKa1OsGLD4GVC6rjfDm72L8grGpTLXMCxf2lefsQX+mdxlN3gkxijh1XCFkOheTYT9kHBXIRyU=
X-Received: by 2002:a4a:e050:0:b0:54f:629a:f581 with SMTP id
 v16-20020a4ae050000000b0054f629af581mr7918287oos.7.1686686619083; Tue, 13 Jun
 2023 13:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com> <1686620422-29962-7-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1686620422-29962-7-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 13 Jun 2023 13:03:13 -0700
Message-ID: <CAMKF1soigVrnOvFKfnyuekVgyREUBaNtddBEohhw6v6=qVEcEA@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] libtracefs: upgrade 1.6.4 -> 1.7.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 20:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103276

fails to build with musl + clang see

https://errors.yoctoproject.org/Errors/Details/708208/


On Mon, Jun 12, 2023 at 6:41=E2=80=AFPM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  - Fixes to the tests.
>  - Added meson build support (but it is not the default).
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libtracefs/{libtracefs_1.6.4.bb =3D> libtracefs_1.7.0.bb}     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.6.4.bb =3D> libtr=
acefs_1.7.0.bb} (94%)
>
> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb b/meta=
-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
> similarity index 94%
> rename from meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
> rename to meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
> index 73620f37a..77556d912 100644
> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.6.4.bb
> +++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.7.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSES/GPL-2.0;md5=3De6a75=
371ba4d16749254a51215d13f97
>  SECTION =3D "libs"
>  DEPENDS =3D "libtraceevent bison-native flex-native"
>
> -SRCREV =3D "af49d832f46631597e0aabb2302bd0f56a9cad29"
> +SRCREV =3D "aebab37379d0fbadc702d64aca0fe5cf18676404"
>  SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;b=
ranch=3D${BPN};protocol=3Dhttps \
>             file://0001-makefile-Do-not-preserve-ownership-in-cp-command.=
patch \
>             "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103234): https://lists.openembedded.org/g/openembedde=
d-devel/message/103234
> Mute This Topic: https://lists.openembedded.org/mt/99497419/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

