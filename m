Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84EFC36010
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:29:01 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web10.5118.1743564536246948855
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B3DDTEE3;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3fe83c8cbdbso1974053b6e.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743564535; x=1744169335; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNcK9jqZMt+j0n61HcjK7ZL9Vtlba+Dmw3hAlbBS5jo=;
        b=B3DDTEE3MTeWNs1SggCqm8bctV9+/3/+EaMF6nCQ8WS5rVxR3RFT1JDy+VjsEvYRbC
         VNjjDBq25UdjLsaIMrViDR1RoMfIa9LKa2/dboxFmc5q8jO2Xd8EzwTx8AMe2oU7IEVA
         n/k9RX6JqjcIL0qs0a1IJWTgkr7a8n98YX00eyx6ZgWUFABjZrZMOriHGonoZJeT4lZd
         2lR/mAAWfaqbkvpNd1/LednuDhGueaKgf4wKXwGuuy/iGOJFflzj0r01nNPlsCY+rHJD
         zIBQ0PQwZIZQcm/xNM9PgiyLVgtKUnXvvOlH0jZ07edI61Gt5K+Ttm0ZKKJSm8O5eHMg
         lvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743564535; x=1744169335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNcK9jqZMt+j0n61HcjK7ZL9Vtlba+Dmw3hAlbBS5jo=;
        b=TJjisuauA1heVPmdn+EpWCV2F19IvmKlqmhF2ECg+UYJUpP5vIpF4FG2Xv3lEjbX85
         RYWnio8A3Y4pBd8dlKAqtSCbZnpXatnhUy12WCSEIz8KjVKph6VPo3BRsE67Q9wiDWso
         olomwY2C8LqOR2tX6vjmZ/XkHnMjFa0XlrauDVlN2JPH6JKKfBbpY9EdVLL3+ADMTfKU
         sNuj7Yapik6/SaV1W2lgE8QZ6YzwTB2UTWcH8kRorpuZM3YQ5Qpcu821W5MzF2yE0eM8
         bgaKQSM756QwMVqbMjFmF9gH6Tv0yuUaXt3caL06baoYj9ed5CCrujlByRbsT556kEvA
         TB+w==
X-Gm-Message-State: AOJu0Yz3PbZWMSug2znHnqI0bPYuG0WKLcru+eNTEtxl1j81t7h1jAom
	DIJXCfdP0/u4xeHlq6lawO8rsg7DNN0Vv084YiIfh7mLpga0BuxrW2JngYh/FC/VwTYLcK0u6QG
	qbVBa/NWoQJi3Cw0onGa0XIFEAC6It7GQjAE=
X-Gm-Gg: ASbGncvQu1OgruYLxacslAybDJ7R4AOlZ7oPISKJYPBZ9Txe8r1E/Pz/U0WXdtoHDNg
	y0MygRFqggkqq4JwdhKNnmxc981uWiycOLxMlRJO4dBjQXAKgaqsUPlvgtuUpQ/EbjZvQ20nS1g
	4isbA8Hzr8wp4HQIrX+DEyauUdMIIsPHgxHN73dVmXrVDRniIJs4E=
X-Google-Smtp-Source: AGHT+IFFSLS0q0JYjIIl70AgywvomwPX0kY8vpQGzXRi9ODMAcUeZec7CBlrbQQir0u3u21ZOmgmGaA4CCRyIC0hDyI=
X-Received: by 2002:a05:6808:138a:b0:3fa:adc7:1ab with SMTP id
 5614622812f47-3ff0f53b194mr8956745b6e.17.1743564535189; Tue, 01 Apr 2025
 20:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250402021600.4164452-1-mark.yang@lge.com>
In-Reply-To: <20250402021600.4164452-1-mark.yang@lge.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Apr 2025 20:28:29 -0700
X-Gm-Features: AQ5f1JoJGyK9wUk8N8R6LtpSQYti6wN7qbQuMRC3M33ndvf2QzYsFJk6I556Pcc
Message-ID: <CAMKF1sqtGR9BrR6ShFVvvWN729ni5Wao2t3YzcVyvx2gPvNxCw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: fix build with gcc-15.0.1
To: mark.yang@lge.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116491

On Tue, Apr 1, 2025 at 7:16=E2=80=AFPM mark.yang via lists.openembedded.org
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
>   gcc-15 switched to -std=3Dc23 by default.
>   https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D55e3bd376b2214e=
200fa76d12b67ff259b06c212
>
> Signed-off-by: mark.yang <mark.yang@lge.com>
> ---
>  ...x-bool-reserved-word-error-in-gcc-15.patch | 50 +++++++++++++++++++
>  .../xmlrpc-c/xmlrpc-c_1.64.0.bb               |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-b=
ool-reserved-word-error-in-gcc-15.patch
>
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-bool-res=
erved-word-error-in-gcc-15.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc=
-c/0001-fix-bool-reserved-word-error-in-gcc-15.patch
> new file mode 100644
> index 0000000000..3761a68745
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0001-fix-bool-reserved-w=
ord-error-in-gcc-15.patch
> @@ -0,0 +1,50 @@
> +From a811ea6af5296b89ee7c2a358dd4ffd2584429f4 Mon Sep 17 00:00:00 2001
> +From: "mark.yang" <mark.yang@lge.com>
> +Date: Wed, 2 Apr 2025 11:00:27 +0900
> +Subject: [PATCH] fix bool reserved word error in gcc 15
> +
> +* Fix build error with gcc-15.0.1
> +  http://errors.yoctoproject.org/Errors/Details/850147/
> +    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'fals=
e' as enumeration constant
> +    13 |     false =3D 0,
> +        |     ^~~~~
> +    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with=
 '-std=3Dc23' onwards
> +    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier=
 or '(' before 'bool'
> +    15 | } bool;
> +        |   ^~~~
> +    srcdir/lib/util/include/bool.h:15:3: warning: useless type name in e=
mpty declaration
> +    In file included from sleep.c:2:
> +    srcdir/lib/util/include/bool.h:13:5: error: cannot use keyword 'fals=
e' as enumeration constant
> +    13 |     false =3D 0,
> +        |     ^~~~~
> +    srcdir/lib/util/include/bool.h:13:5: note: 'false' is a keyword with=
 '-std=3Dc23' onwards
> +    srcdir/lib/util/include/bool.h:15:3: error: expected ';', identifier=
 or '(' before 'bool'
> +    15 | } bool;
> +        |   ^~~~
> +
> +  gcc-15 switched to -std=3Dc23 by default.
> +  https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff;h=3D55e3bd376b2214=
e200fa76d12b67ff259b06c212
> +
> +Upstream-Status: Submitted [https://github.com/mirror/xmlrpc-c/pull/4]

Thsnks this patch looks good. However it maybe needed to be submitted
to the xmlrpc-c mailing list here
https://sourceforge.net/projects/xmlrpc-c/lists/xmlrpc-c-devel

I dont think they accept GH PRs

> +Signed-off-by: mark.yang <mark.yang@lge.com>
> +---
> + stable/lib/util/include/bool.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/stable/lib/util/include/bool.h b/stable/lib/util/include/bo=
ol.h
> +index 312477c4..a5e81eb6 100644
> +--- a/stable/lib/util/include/bool.h
> ++++ b/stable/lib/util/include/bool.h
> +@@ -9,10 +9,12 @@
> + /* At least the GNU compiler defines __bool_true_false_are_defined */
> + #ifndef __bool_true_false_are_defined
> + #define __bool_true_false_are_defined
> ++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <=
=3D 201710L
> + typedef enum {
> +     false =3D 0,
> +     true =3D 1
> + } bool;
> + #endif
> + #endif
> ++#endif
> +
> diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb b/meta-=
oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> index 62ba0f53e6..298c84bb2c 100644
> --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.64.0.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=
=3Dmaster;protocol=3Dhttps \
>             file://no-automake.patch \
>             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.p=
atch \
>             file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-r=
m-a.patch \
> +           file://0001-fix-bool-reserved-word-error-in-gcc-15.patch;stri=
plevel=3D2 \
>             "
>  # one more commit after Release 1.64.0 in the Stable series
>  SRCREV =3D "8ce36bce2438df9b02fcaafd19efa90a56426601"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116490): https://lists.openembedded.org/g/openembedde=
d-devel/message/116490
> Mute This Topic: https://lists.openembedded.org/mt/112039949/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

