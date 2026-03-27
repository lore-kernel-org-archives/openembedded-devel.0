Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BBF10BA435
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 07:45:00 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67037.1774597496589554042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 00:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lhNa8f2O;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486b9675d36so15851595e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 00:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774597495; x=1775202295; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GAsa9o+gmaOlYHYW7qeS2i3xcX2iFv2rw6RmC9TAeF4=;
        b=lhNa8f2OjtspgDEvhx98qXfciaC0VmdO5aioP+zjQXZRMmj+sAL/LdpjmBqPnSFmcu
         R/CCv0VmEJ7y6BiwnNDWiLI6YUXrng+rWSmjImE2UvZbwvzRfZlOm9pYaqICZVXuhgfZ
         htn22VSlQ3VucbPvb/XLs5WgOBEoWxeqCLsunbzuPGM+QD6wzeypmt8HPAeNFP6nl5fL
         XvVrEHC3XWG4ZpeLSEUJ/ZkN61tBjVcbTu8hPuFVjEuXTXnxiRCMEoDrli842ib/nrR7
         XdiVFGjQ+s9HgSM41Zf006SF/IFmxhQM0pnlV1ORaVphLqukcj+uQTOlW9vQkkUePKIq
         bPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774597495; x=1775202295;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAsa9o+gmaOlYHYW7qeS2i3xcX2iFv2rw6RmC9TAeF4=;
        b=kDHLCp4+JnLgxNYMd3Nx2sH4mPSIUtnXwThb/Jit1J8DeMtybV5/k43FuSTsVDNQKl
         4AlRGpZOVCDSEuLOVUOTNKvhgibhCrusUO05n9fzrt/UpAUwER0wycGXXH5YSYddZJZf
         beFZ7KmTxsKh6spo7PwQeIYutn/NjFmXgc1KblR55/UNi6N0/A4vZ4HFY47ROosGtH8l
         jRM/ZKZC+x0Zv8iru76f2uon4yTqlSAfxbSPPKKCYXwiv6eXvudq/bXS5HA509TL3xrP
         1MdXEKaBCGiDarQbg+L+4qlnxzf98XrmidNJdrZFn9H4jRalNK/J0FhcgI9eT8Uu7t2B
         p10A==
X-Forwarded-Encrypted: i=1; AJvYcCVWoZs/Vh4EPLl3C9aEkxU1I2GviUM0yoT2kCusvrDONRHeUMm7xcfOsinUnB0+bD5FRbplJBq5Z85eCEhlED/xx2w=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxE23qbMY8NijzR0O3UN1YW655Vn7TvqbYLiV12wFWJXEdxrokr
	YXc0v+BqUgfxo995iizw+cbdw9MA9dTM982ocIXfQ8yQmXgQl/5CbEIg
X-Gm-Gg: ATEYQzwxaDZn3K/8YKOD/DV4gxxA8m2D3FnzTT7mO78ekg1xAIGS3ymsB/H/ror4wvd
	lxvPoh/sUSQPaVOyeEUfzh3fobrKT+6OcaMlYO+ob9SjHpCD/FkrxdfWr5gaSc3aRzfgVwdAcyS
	XJm+Fr59uNxTiEWxHzpz3ZLXWhoHQkfzBg2WqZxX/n3VyCbfns0WfAZ2JJ9b4qaqwORaUSNzhDT
	5qyn722H9c+XtNYS9jSXjRw3Cj0DgD+aRfxAGgirwjXlOcJZTAMLd+GOkpkDOdCRpSDMwRHW3YS
	bsJlDMP7sa9VTLxWDFXel3yK1sYvBoK7ED3LE4PElaDWbZptpOGvtlsUP4HXpniThULFq+mXGv1
	bmPcza4u597Sz7xQr/LujvRv8rfVFrpLQkIyxjlXusYeSudBd1ZXJpEEk3aY+uxelCVn/gbeaZW
	th6YrkjkCzvJxzHJ8OVovL2RXFd09VW5A=
X-Received: by 2002:a05:600c:6287:b0:485:469f:5320 with SMTP id 5b1f17b1804b1-48727ef6865mr22579045e9.30.1774597494485;
        Fri, 27 Mar 2026 00:44:54 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d49c18sm78173385e9.14.2026.03.27.00.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 00:44:53 -0700 (PDT)
Message-ID: <24e7add8-ec1c-454c-9192-a74037b9df46@gmail.com>
Date: Fri, 27 Mar 2026 08:44:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe] [PATCH 16/63] graphviz: upgrade 14.1.3 -> 14.1.4
To: wangmy@fujitsu.com, openembedded-devel@lists.openembedded.org
References: <20260326115634.1199-1-wangmy@fujitsu.com>
 <20260326115634.1199-16-wangmy@fujitsu.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260326115634.1199-16-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 07:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125778

On 3/26/26 12:55, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> ==========
> - Enable ascii plugin to be built using autotools.
> - Processing 'concentrate=true' graphs no longer crashes Graphviz. Processing of
>   'concentrate=true' graphs still often errors out.
> 
> License_Update: Change Eclipse Public License from version 1.0 to 2.0
> 


I think the LICENSE should be updated to EPL-2.0 also due to this



> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../graphviz/{graphviz_14.1.3.bb => graphviz_14.1.4.bb}       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-graphics/graphviz/{graphviz_14.1.3.bb => graphviz_14.1.4.bb} (95%)
> 
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
> similarity index 95%
> rename from meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
> rename to meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
> index d885dc43ac..8711eba7bc 100644
> --- a/meta-oe/recipes-graphics/graphviz/graphviz_14.1.3.bb
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_14.1.4.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Graph Visualization Tools"
>  HOMEPAGE = "http://www.graphviz.org"
>  LICENSE = "EPL-1.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=9109f5fc16cf963fb3cdd32781b3ce04"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d9fc0efef5228704e7f5b37f27192723"
>  
>  DEPENDS = " \
>      bison-native \
> @@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
>  SRC_URI:append:class-nativesdk = "\
>             file://graphviz-setup.sh \
>  "
> -SRC_URI[sha256sum] = "fe76529477c22c0cf833ec5a35b430cf710f4705afc465d86292bf13560be584"
> +SRC_URI[sha256sum] = "043877c0857d8d46067cd2f18809d54fc876c399f0ecd438f60ea7f4d8037451"
>  
>  UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#125671): https://lists.openembedded.org/g/openembedded-devel/message/125671
> Mute This Topic: https://lists.openembedded.org/mt/118516674/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


