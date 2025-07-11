Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6E6C83F17
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 00:01:33 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.2069.1752192090400526654
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 17:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cn/Q4zyb;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e8259b783f6so1307483276.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 17:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752192089; x=1752796889; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dp4tAydIhq4CVscU6J749dxp9vhXF5I8AX+1ETiyQH4=;
        b=cn/Q4zybIdEGGMel6huO8HKB/Qj3YBqoPU6lH7kUZHySv95d5eYuLHO45CDVLqR8wj
         J9vn59ZtyH5aKVjQiarnwBW6QJd3gA7o9+3ppmO+BRrCddGdPaHoOstjSBCsbX4c52i8
         lsZHjaaQoNmNmVSAc1/VBvGKeC89jqJPt4aWrcConf9gbN8p6J6uqHUe9Wag9IJnK1W0
         /uq99BOabFA2S+02aY1/PhZphZ5I8mVlj2UDVRoklB4wU9mZd7BaJagmOfD/JkeJlESN
         uOS5+d9pXrCI7krnHjXSkyZdpgcXL3R8FB5N7JeNrrVS/uGBLGUVZw8Ffd2hqqlDDEn3
         +DsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752192089; x=1752796889;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dp4tAydIhq4CVscU6J749dxp9vhXF5I8AX+1ETiyQH4=;
        b=KIq/7nuBXY8vZLbbPHNxuMhiQL3K2ZwiJ5IDpOPXO2Q5/H9JprQuLextoZ9ivKkNtO
         +ryq8YOdXVwOi0nsSeXQJ1XBSXK0KtOU4sjQyhDmGkzVQRBwymVxVaMbl5fG8sd75lKN
         OSjaPw6JRWN6mUrwDlPcvmY5GN5Qv29P19v2n/9LekNURIKz54SD1BbNOGyhExSZs9jG
         P1LkVtNeQByI2Hx5NtYwiCK0NR/1aY6JfGx2HVC8nssTrVJga7/xbqd/Hat5Q/H6uS3z
         ONKbGsAXtZKYN71LkRFe2SazwAbZVynTTSY7Hku/9q28ELxTI6yql5ZCe1HfZjP2IzU+
         1KXw==
X-Forwarded-Encrypted: i=1; AJvYcCVqsX/Hr06kTU1G8v/M0WcQD73biCeNs4QoqGOA2JQG5ZCUCsAOSbP/VyG7JLsvMgXk8eH4Sv6iiS1SgaJ2Nc60+Mg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyK4FnFBon6WAvTpbCSmPlkskuL8/4bXF3uzIgSca2LIbWN6JVA
	KEMf7P3RJRFRNVwPXqhh5mwrl9qy8l1P8vEddOayOUQgvpKBgtxdsRzc
X-Gm-Gg: ASbGncsJnt4p5Sb1e8LobG6f62pMx62PFCpsK0I+ZOKmPNdOP3KZboxH+Q9CztLgwCS
	Fr0DQ26lADSrv6y3heHm6yK7whU62lMHmwOHA4DC1MfgOutuCo0n5I8UndBqB3K0lnKYuFxJ286
	ukrz4KCjsAkMsVEDLIjG5Z7/G8P8vKh8vIh1OuPkf3L6YK2Ahq+UfXjSxp4HdpL8EZVEsF9CAJ1
	0jJPFxy25AuRk8toSKJd1/3dvaEhKKd0ibpZk/l+eyIQFfDWl80Kq3XMsQ5oV0nAISvmTSJ0fHv
	UZCsMRSPcZt7Ek5XfOwfTrKTV7rVNAcFeU8IBBUm7WsUuwGQk6PnaD2fS6Tfft4kX0rYoMDpLNb
	qJrvXtXTo4VTWuSYE++KGVbDSJQHp5GOQuA5qf7w223HkIXPpVzVbW6xy1Fq5/5PL0kQQehc=
X-Google-Smtp-Source: AGHT+IGzBsOeN+vKjJ7Tl5AhGmSladKPcFnesJ76XwekR8GiRrIS46l6Ych6Ye+vm3TaGlUBqk1OsQ==
X-Received: by 2002:a05:6902:6c03:b0:e7d:a7c7:3f34 with SMTP id 3f1490d57ef6-e8b85b02395mr951095276.32.1752192089299;
        Thu, 10 Jul 2025 17:01:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:7437:3f28:cfa:3bd4? ([2600:1700:45dd:7000:7437:3f28:cfa:3bd4])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8b7ae68baesm730703276.23.2025.07.10.17.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 17:01:28 -0700 (PDT)
Message-ID: <b868df60-4d34-4e20-9003-0496eb3e76b7@gmail.com>
Date: Thu, 10 Jul 2025 20:01:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-oe][scarthgap][PATCH] imagemagick: Fix CVE-2022-28463
To: Virendra Thakur <thakur.virendra1810@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20250706063626.818120-1-thakur.virendra1810@gmail.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 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
 ApZ86eOP
In-Reply-To: <20250706063626.818120-1-thakur.virendra1810@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 00:01:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118426



On 7/6/25 2:36 AM, Virendra Thakur wrote:
> ImageMagick is vulnerable to Buffer Overflow.
>
> Reference: https://github.com/ImageMagick/ImageMagick/commit/ca3654ebf7a439dc736f56f083c9aa98e4464b7f

The recipe version is for kirkstone.

- armin
>
> Signed-off-by: Virendra Thakur <thakur.virendra1810@gmail.com>
> ---
>   .../imagemagick/files/CVE-2022-28463.patch    | 27 +++++++++++++++++++
>   .../imagemagick/imagemagick_7.0.10.bb         |  5 +++-
>   2 files changed, 31 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
>
> diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
> new file mode 100644
> index 0000000000..c7730957bc
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-28463.patch
> @@ -0,0 +1,27 @@
> +From ca3654ebf7a439dc736f56f083c9aa98e4464b7f Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Sat, 26 Mar 2022 09:26:57 -0400
> +Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/4988
> +
> +Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/ca3654ebf7a439dc736f56f083c9aa98e4464b7f]
> +
> +CVE: CVE-2022-28463
> +Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
> +
> +---
> + coders/cin.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/coders/cin.c b/coders/cin.c
> +index e266e7f3c56..23fc17e0890 100644
> +--- a/coders/cin.c
> ++++ b/coders/cin.c
> +@@ -451,6 +451,8 @@ static Image *ReadCINImage(const ImageInfo *image_info,ExceptionInfo *exception)
> +   image->endian=(magick[0] == 0x80) && (magick[1] == 0x2a) &&
> +     (magick[2] == 0x5f) && (magick[3] == 0xd7) ? MSBEndian : LSBEndian;
> +   cin.file.image_offset=ReadBlobLong(image);
> ++  if (cin.file.image_offset < 712)
> ++    ThrowReaderException(CorruptImageError,"ImproperImageHeader");
> +   offset+=4;
> +   cin.file.generic_length=ReadBlobLong(image);
> +   offset+=4;
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index b8167f5a72..db786ea3a5 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -11,7 +11,10 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
>   
>   BASE_PV := "${PV}"
>   PV .= "-62"
> -SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
> +SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
> +           file://CVE-2022-28463.patch \
> +           "
> +
>   SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
>   
>   S = "${WORKDIR}/git"


