Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAE1C36010
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 14:25:47 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.20510.1743517545983429035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 07:25:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fHO7j/jA;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6021e3daeabso2598989eaf.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 07:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517545; x=1744122345; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mayWIMPWV7xgon+r6FIxHAZsEEJvCuz+4NufLxb4E/w=;
        b=fHO7j/jARYInMGvs0nLOdX3SDEBOO94B6h+uAR1bY+dEPF02jdZwKXWD75HR6yG7V7
         41gq1b/hUiqlWLvy3YGfNally+p0TJpRRIkhkoTujAVD1y7oB2lZMVw+0+adYV3b/O61
         QhE/wW4wgk1m981TMS7qWBwxNOCzyrXTUZpVacclL/A2/jtcU5GUArqPcnAAaH24CZyU
         Uq2+qcrKHCsmwyDBg4PwA4o4yR4tdsj9XVBE/oc8YaQ436S0Hoffr056R9yQmo8ivICi
         cWW/fqJumuovyrDiDA6CVrxnK17Mr4FdGvvePvrPuddHB3U8CkBiQIWeCa0uugko1dwY
         nljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517545; x=1744122345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mayWIMPWV7xgon+r6FIxHAZsEEJvCuz+4NufLxb4E/w=;
        b=qknvrVkYYxRRT2tc8dw41YCdni14Pc3BBazxuhDU2/0pk4RcLk5DgMRY3bZzJee/kI
         R8ltRYwfFhUz19hm+4OSc3FhLpKNZ1q6PTIdYlPRo+/HhWA/YnVR210Kc/Ea9wgFzdtS
         1O1BaP46i+G6tzn0k8du/I3jUDoV/LBVfzX7pyKzqTP6DxA2dH6VudMKT/orKDFY0It7
         t7sW0+XZKkUV4b4UTcPobVYQu1Cihr8TbnR/KKCQd2l6mSzNSsnXVeN+4vn6MLltpb9f
         lZgPDVizQLf0G1NqolOi8dQUQ2Yp9VxvfaTTJBF3WcsFDr2A/soSyUVWTdE5HttBrExF
         FKbw==
X-Gm-Message-State: AOJu0YxlsgbZAM8XjiYo/peeFcYlZtQvDjJEkxhZmrQEfLpO5YUynHsH
	PSQF2S4sY/yVF4NYYG5wPGyp8W04Xt4gN3Zu1vofxwjHBW/oiccT84W840hRfCtgBB6PyJWZdME
	4xi0Jdk1r1il3K2pjB4+ipPMOAWepLFdfKRI=
X-Gm-Gg: ASbGncv8FmVV6HCu4+pyGWhfIdh8hepXIL6NP8UBRmkZrrzr9xE3igcN0Pw1ERVgD0R
	xT//pzuq0nCuCtguOeyUpweTRxfMRqRr6mIIyc+RO0BRLiQvTjJ6+ir0BPcCMZUt7O8maFeIjB4
	si9/tkxuTNodob2yMK/EAOATaFNViV0btKsKekDM5VkQSJEtzHgO8=
X-Google-Smtp-Source: AGHT+IFFEYNYmsZVogwiKrxHYiI4s/9bss4/gbb8kEaPBxfgJqhsd7d7prFfAbBPdFbMPjypZzJ1FbfaIDzd+Tdwxmo=
X-Received: by 2002:a05:6820:1c8b:b0:603:f981:5fe4 with SMTP id
 006d021491bc7-603f981606emr716337eaf.1.1743517545152; Tue, 01 Apr 2025
 07:25:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250401115003.1886649-1-mark.yang@lge.com>
In-Reply-To: <20250401115003.1886649-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 07:25:18 -0700
X-Gm-Features: AQ5f1Jpeob-X_SWLf6jT1MvvGAU7OZFoFCKKHyN5yPPiObInUSu04IZBkqabbhI
Message-ID: <CAMKF1sr9c7OM89OZhPz6-_dgLF7najz6WBvoKWWfQSgsoJ_oiA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: Stick to C17
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 14:25:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116479

On Tue, Apr 1, 2025 at 4:50=E2=80=AFAM mark.yang via lists.openembedded.org
<mark.yang=3Dlge.com@lists.openembedded.org> wrote:
>
> From: "mark.yang" <mark.yang@lge.com>
>
> * Fix build error with gcc-15.0.1
>   http://errors.yoctoproject.org/Errors/Details/850147/
>     srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false=
' as enumeration constant
>     13 |     false =3D 0,
>         |     ^~~~~
>     srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with =
'-std=3Dc23' onwards
>     srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier =
or '(' before 'bool'
>     15 | } bool;
>         |   ^~~~
>     srcdir/lib/util/include/bool.h:15:3: warning: useless type name in em=
pty declaration
>     In file included from sleep.c:2:
>     srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'false=
' as enumeration constant
>     13 |     false =3D 0,
>         |     ^~~~~
>     srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with =
'-std=3Dc23' onwards
>     srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier =
or '(' before 'bool'
>     15 | } bool;
>         |   ^~~~
>
>     In C23, bool, true, and false are added as reserved keywords, causing=
 build errors.
>     However, modifying the source code just for this would be risky, so w=
e set the C standard to C17.
>

See if something like this

https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/e=
2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch

Can be adopted.

> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-=
oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> index 62ba0f53e6..cca745cd51 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> @@ -46,3 +46,8 @@ do_install:append:class-target() {
>  BBCLASSEXTEND =3D "native"
>
>  CLEANBROKEN =3D "1"
> +
> +# http://errors.yoctoproject.org/Errors/Details/850147/
> +# srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with '=
-std=3Dc23' onwards
> +# srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier o=
r '(' before 'bool'
> +CFLAGS +=3D "-std=3Dgnu17"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116474): https://lists.openembedded.org/g/openembedde=
d-devel/message/116474
> Mute This Topic: https://lists.openembedded.org/mt/112023126/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

