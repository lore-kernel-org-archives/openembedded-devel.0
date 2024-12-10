Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 714D1E7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:43:57 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.5047.1733867036493235403
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:43:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5shfiLH;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29e65257182so2984446fac.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 13:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733867036; x=1734471836; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfdzvWbaV3RmJIPf6q7PlOlGPJwYEY+p4JLj3W+r0Ms=;
        b=j5shfiLHWSXAilhqvjVkPO+YRFgCwqmwHvmNJ41GXobul1ao5eyDmVasSJTwYv21yP
         zUrj2yIfn8FgwnrOUKGSs00oP/JsgsNvopGUnU4rJodtdhCkAFVRnZYblaOCHyjdNy5a
         8MBOohHxJaXqF6WpQcoOCOxJk0jCAIRtYLPgphwUCbmu7lS36PIR8VQaOC8wwDcWX+3S
         GwWbdssI6dtAAo4lM2E51o+nYlYqVC3S4YXsbZ7xSEtAW3ZGdZn2mo22S6YQouS7ylCL
         XSS9hNZIjmHe4Y781magoV9wHrh2tAd9BN9927oV3oGUnlgZ4AQicjf6CjTTJIL9Andk
         f9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733867036; x=1734471836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfdzvWbaV3RmJIPf6q7PlOlGPJwYEY+p4JLj3W+r0Ms=;
        b=RpxlyLMU94p0phIfafY7TRkTc2DxqnPQuoH9oTbYVSdWGudJi0DONiMgXJzfjxD+4E
         Sqp1WVFj+txJs5WVr1ganWLbH0Z+P6HZmbQWF1z2O7R8EmtP2PHK3Nsa29SAB8hpV4PA
         2Bh525dw0sI2rpBcEZ+omPewJApKJ4rCCWNVv+km4qTqc04SBN4ETVc2/XHwhizhaP/D
         onVuCCYGoDlyA77Es+U1OIdMW+HBBoDZ7W0QDnz+iKhPBZ1upaKz8VBYFry+qREzn3by
         f7cBWQB13GzXmypx61Y5hiBJSC4C8rH34OllyyQu0+Z80mhUGMEF1UlWez35Rypy9rbf
         r19g==
X-Gm-Message-State: AOJu0Yw19qy+7uADqcBDhufyfXqMAFSI1vZvdGmBauENNuiSPr4lmzIs
	4J41OwzqoAHP8HWYMyMHhqWM01jeLeUyMPFdi5N/BLsWG+4FrevoWGqu8Jk8yxZSPaIplUPBkei
	kjmPLrGqpfsNU8t5zF4RbksBmRgn4oJZQ7gM=
X-Gm-Gg: ASbGncsuu64a6MZmM1UobXzW+gjExGa/fQqyYLliYs2hRLVFBsdfbqZQvBHI/X3dDPv
	tPsLUt8ZGnVwvBmk7ECxNxJ5uxyVmg+wD0ycmNG/q29bN6cgQRG2Dh4vVkdtxDFTt
X-Google-Smtp-Source: AGHT+IHkqhGu+f+CaHGMjYTZmZfHtCxpbY1DJELXoNdo1mEN2ZqN9ZSLJ8IzPNIkIeBFKXhR1wHYEHPa26w4ibuQx5I=
X-Received: by 2002:a05:6870:8e17:b0:29e:5dfd:1e17 with SMTP id
 586e51a60fabf-2a012c5cb8bmr462416fac.23.1733867035698; Tue, 10 Dec 2024
 13:43:55 -0800 (PST)
MIME-Version: 1.0
References: <20241209213948.2377-1-mail@michael-fitzmayer.de>
In-Reply-To: <20241209213948.2377-1-mail@michael-fitzmayer.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2024 13:43:29 -0800
Message-ID: <CAMKF1sratBWEuCCTzv8zp_EQSdSnrVcDbauWLHH2ijUiMiL5Cw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] canopenterm: fix number of arguments check
 in API function
To: mail@michael-fitzmayer.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Dec 2024 21:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114266

the patch needs some tags added e.g. Upstream-Status, see
https://valkyrie.yoctoproject.org/#/builders/81/builds/199/steps/14/logs/er=
rors

On Mon, Dec 9, 2024 at 1:40=E2=80=AFPM Michael Fitzmayer via
lists.openembedded.org
<mail=3Dmichael-fitzmayer.de@lists.openembedded.org> wrote:
>
> Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> ---
>  ...r-of-arguments-check-in-API-function.patch | 23 +++++++++++++++++++
>  .../canopenterm/canopenterm_1.0.10.bb         |  4 +++-
>  2 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-extended/canopenterm/canopenterm/0001=
-fix-number-of-arguments-check-in-API-function.patch
>
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm/0001-fix-nu=
mber-of-arguments-check-in-API-function.patch b/meta-oe/recipes-extended/ca=
nopenterm/canopenterm/0001-fix-number-of-arguments-check-in-API-function.pa=
tch
> new file mode 100644
> index 000000000..aba139ff5
> --- /dev/null
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm/0001-fix-number-of=
-arguments-check-in-API-function.patch
> @@ -0,0 +1,23 @@
> +From 02e8b19d4090809deee11bf6801c0444c38fe4d2 Mon Sep 17 00:00:00 2001
> +From: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +Date: Mon, 9 Dec 2024 22:30:03 +0100
> +Subject: [PATCH] canopenterm: fix number of arguments check in API funct=
ion
> +
> +Signed-off-by: Michael Fitzmayer <mail@michael-fitzmayer.de>
> +---
> + src/api/python_test_report.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/api/python_test_report.c b/src/api/python_test_report.c
> +index ff7b31e..1b1fc4a 100644
> +--- a/src/api/python_test_report.c
> ++++ b/src/api/python_test_report.c
> +@@ -69,7 +69,7 @@ bool py_test_eds_file(int argc, py_Ref argv)
> +     (void)argc;
> +     (void)argv;
> +
> +-    PY_CHECK_ARGC(2);
> ++    PY_CHECK_ARGC(3);
> +
> +     node_id   =3D py_toint(py_arg(0));
> +     file_name =3D py_tostr(py_arg(1));
> diff --git a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb b=
/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> index b15a36330..81ba15fab 100644
> --- a/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> +++ b/meta-oe/recipes-extended/canopenterm/canopenterm_1.0.10.bb
> @@ -15,7 +15,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D10e84ea70=
e8c3a1fbc462f5424806474"
>
>  DEPENDS =3D "cjson libinih libsdl2 lua libsocketcan pocketpy"
>
> -SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain"
> +SRC_URI =3D "git://github.com/CANopenTerm/CANopenTerm.git;protocol=3Dhtt=
ps;branch=3Dmain \
> +           file://0001-fix-number-of-arguments-check-in-API-function.pat=
ch \
> +           "
>
>  SRCREV  =3D "e0760b2e9657907e691be4df384ca7617109635d"
>
> --
> 2.39.5
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114257): https://lists.openembedded.org/g/openembedde=
d-devel/message/114257
> Mute This Topic: https://lists.openembedded.org/mt/110015092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

