Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AB3C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 06:12:58 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web10.3851.1715235160187776587
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 May 2024 23:12:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BotM/9tj;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5aa3f0fcd46so281065eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 May 2024 23:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715235159; x=1715839959; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tSPRzvv4/zOKbIVP53+hjn4lvO5ZwDXq+wpWZTE8goM=;
        b=BotM/9tjUbyYicAKscIazcfjvKf0Yd9r8wbAyN1/n1ncl5TJrHzVpV3O2jEKzyEJqi
         cpbOe25KOVgMMTJVioQ5l8TbnyC84gjL1+gI/DuytsKNIecPnKOJxknTR7EvDcnf/TPX
         k64UBzyuov7JFpuFT1h4DfhqJFruefwsbj08T21Gml0b32RX2UHABjXVt1Ett6IenN9f
         +NrXJ8zSEN4o+R6+5gVp7OKURY/cn5DaYxFFfxD3OvnjaejVJL1gYdGt9sz9FEeO4e9t
         RCTf5KaTwUCkgL8skka8sN/JqnioznXJWTkvkPlELDtN5Pa8VInrrbGGz5d/pI5sgogL
         LRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715235159; x=1715839959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tSPRzvv4/zOKbIVP53+hjn4lvO5ZwDXq+wpWZTE8goM=;
        b=DKwsWc/AjpW8WAdDq95+gPjfTsRsijEH7c9Gokm610sL4lC7g3fo9/RR6H0Hsdo9CL
         Y71+xztyGEeMAUNCQzooe5OnLTaPH6/JNmHdjUGk9Ssqgc4WuFOqw2jzdRCyUO4zGpCQ
         /0K5n2b9NNlJ21a3+8X1F9rCW/J89qcY/B8EtbubN7l8lIHwrxHDtGyVMn5+J8APqia8
         PpCcHjArrqvrZmWIF72IJyTVi1IAK43dESBTac9eQyqtlY4/4fZQHjQTAmSFl4rui4C8
         H9rT473000Y9VcVmEvcGtHauGzC5P947xyB8q50FXlMxQWKq/R3eNX50zpw3G72h5+Lr
         a6iQ==
X-Gm-Message-State: AOJu0YxQbjzt+jvC/9HcxxJ7FKH8ldqRv6ads7FECbkz/1Qo1SUAx3Bx
	zfXplHamlMe+y5UAnfOJQQVJYT7xDfMNn2ifjCxA5MqMDo459FKikQvs03vbU1fXdSOjwnxIgMK
	3a6RfUzL9KmhKhEHAPuMetnLPmLY=
X-Google-Smtp-Source: AGHT+IFxt9bOfs9by7JksxNE4AtucgUf0YotSe+lARXYqmT5IYpKfObubBNhT4gInRHLnsuUiiJK1fF8aOZJJus2DL8=
X-Received: by 2002:a05:6871:686:b0:23d:2660:36be with SMTP id
 586e51a60fabf-24097e798a8mr5326166fac.24.1715235159359; Wed, 08 May 2024
 23:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240509060755.3072961-1-zboszor@gmail.com>
In-Reply-To: <20240509060755.3072961-1-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 May 2024 23:12:12 -0700
Message-ID: <CAMKF1soh_kJQe=_cVp3uDK0shNq49WBbbsXrf_FS8TUvcW54sQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] uw-imap: Add a patch to support newer than TLSv1.0
To: zboszor@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 06:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110282

On Wed, May 8, 2024 at 11:08=E2=80=AFPM Zoltan Boszormenyi via
lists.openembedded.org <zboszor=3Dgmail.com@lists.openembedded.org>
wrote:
>
> The patch 0001-Support-OpenSSL-1.1.patch enabled building
> uw-imap against OpenSSL 1.1.0 or later.
>
> However, TLSv1_client_method() and TLSv1_server_method()
> restricts uw-imap to TLSv1.0.
>
> These APIs, along with explicitly versioned APIs like
> TLSv1_1_*_method() and TLSv1_2_*_method() are deprecated
> in OpenSSL 1.1.0 or later. The replacements are unversioned
> API functions: TLS_client_method() and TLS_server_method()
> which support TLS version autonegotiation.
>
> This allows the PHP IMAP extension to work with IMAP servers
> that enforce TLSv1.2 or higher.
>
> Fixes: https://bugs.php.net/bug.php?id=3D76928
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  .../uw-imap/uw-imap/uw-imap-newer-tls.patch   | 29 +++++++++++++++++++
>  .../recipes-devtools/uw-imap/uw-imap_2007f.bb |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newe=
r-tls.patch
>
> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.p=
atch b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
> new file mode 100644
> index 000000000..958abc90f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap/uw-imap-newer-tls.patch
> @@ -0,0 +1,29 @@
> +Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
> +Upstream-Status: Pending
> +

I think it will be good to submit this patch upstream to uw as well,

> +--- imap-2007f/src/osdep/unix/ssl_unix.c.old   2024-05-08 09:41:06.18345=
0584 +0200
> ++++ imap-2007f/src/osdep/unix/ssl_unix.c       2024-05-08 09:43:38.51293=
1933 +0200
> +@@ -220,7 +220,11 @@
> +   if (ssl_last_error) fs_give ((void **) &ssl_last_error);
> +   ssl_last_host =3D host;
> +   if (!(stream->context =3D SSL_CTX_new ((flags & NET_TLSCLIENT) ?
> ++#if OPENSSL_VERSION_NUMBER >=3D 0x10100000
> ++                                     TLS_client_method () :
> ++#else
> +                                      TLSv1_client_method () :
> ++#endif
> +                                      SSLv23_client_method ())))
> +     return "SSL context failed";
> +   SSL_CTX_set_options (stream->context,0);
> +@@ -703,7 +707,11 @@
> +   }
> +                               /* create context */
> +   if (!(stream->context =3D SSL_CTX_new (start_tls ?
> ++#if OPENSSL_VERSION_NUMBER >=3D 0x10100000
> ++                                     TLS_server_method () :
> ++#else
> +                                      TLSv1_server_method () :
> ++#endif
> +                                      SSLv23_server_method ())))
> +     syslog (LOG_ALERT,"Unable to create SSL context, host=3D%.80s",
> +           tcp_clienthost ());
> diff --git a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb b/meta-oe/=
recipes-devtools/uw-imap/uw-imap_2007f.bb
> index dcb59f4ea..17faa3aa6 100644
> --- a/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> +++ b/meta-oe/recipes-devtools/uw-imap/uw-imap_2007f.bb
> @@ -15,6 +15,7 @@ SRC_URI =3D "https://fossies.org/linux/misc/old/imap-${=
PV}.tar.gz \
>             file://0001-Do-not-build-mtest.patch \
>             file://0002-tmail-Include-ctype.h-for-isdigit.patch \
>             file://0001-Fix-Wincompatible-function-pointer-types.patch \
> +           file://uw-imap-newer-tls.patch \
>             "
>
>  SRC_URI[md5sum] =3D "2126fd125ea26b73b20f01fcd5940369"
> --
> 2.45.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110281): https://lists.openembedded.org/g/openembedde=
d-devel/message/110281
> Mute This Topic: https://lists.openembedded.org/mt/105996685/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

