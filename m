Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EF5C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 04:07:57 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web12.5106.1634270876607958761
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OuI/Fs7I;
 spf=pass (domain: gmail.com, ip: 209.85.214.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id s1so3774900plg.12
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=mgcMsdponc5UmmrqBWsgSnWP/Dl6HlCtvm3e6zTsK8A=;
        b=OuI/Fs7IVuJeHubzVkTBK/UEh7/nEJQDtlavZw2uA4zxnqCzAcZzT/J4aRuANbwluF
         ePoC4nRtH/QvTXZJWBtxlGtzNpF75azqvqRSGM0KUjydSdxtDsyZSAzl3AO7zizr3Xl/
         0C52pAg3dVRC9/TWCyOOj38YHG5naphBALABnwUaUtrGMeslcceDp283FJ64XhbwSNmW
         We2actO0XvdD3q3JBAgMBy6eLvuD9ZCXxk6FZu+QHN+C97SbGw+KPtjlYWA5A8cVdaLt
         Wd7fsMAuwyBPwec0rz7CZ5Kn1OkJVBQwIxOhRHL3PVkC843Gkc+lEaHfqU4iYWqOsBRf
         upnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=mgcMsdponc5UmmrqBWsgSnWP/Dl6HlCtvm3e6zTsK8A=;
        b=CNUa+kHj2cGUi5enqV0W1Yc7RTMRT2PkL9gxyV5hKGWiE3U/yUgVA6QiDBqipYTSJ1
         qp8rDctwwWAhZH4W0XdHVY0x6DcnKD+vjqLV4dcugDXliCAYKI7Ndhv3AqjHjvEw8t91
         Z7CwtB2/ZW+jDZBpHBg9950WuUqWRed/yIuYKDvB2IaWqVZ4X0YJhtO+BSVVi0dQ9KKU
         y7eMjNRYNZHJYMffkatwH+NwXWbrpqmH8zHQ8ifyDA/NXXKXF6KrqKGz7hkCt9a2dDLr
         Yzm0vO7JCWDCIj9xRthus55RGqgs/G6+Bfd0LzvSZW8liz8diZ1RRLqlGuvl9Ni4wJEX
         RFYQ==
X-Gm-Message-State: AOAM533JSLeYTcywrV67sRbo3dCo5bYQmuT6kMVySq2ix1Hz7KIo6QJ5
	PGlORK6gs4dnIr1te+zt5jM=
X-Google-Smtp-Source: 
 ABdhPJwueT9RDMdaD9odtNaSwGl1ArjfvHAnJhBtyz6mMccAozsJzPBjsNtmz6DAY6RDlUDmINB04A==
X-Received: by 2002:a17:90b:4b85:: with SMTP id
 lr5mr10926024pjb.66.1634270875655;
        Thu, 14 Oct 2021 21:07:55 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:605f:eda0:f2c4:9c0?
 ([2601:646:9200:a0f0:605f:eda0:f2c4:9c0])
        by smtp.gmail.com with ESMTPSA id
 a11sm3600301pgj.75.2021.10.14.21.07.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 21:07:55 -0700 (PDT)
Message-ID: <7d8b4a07-1900-d2ca-f21e-c914c5f88ad6@gmail.com>
Date: Thu, 14 Oct 2021 21:07:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [oe] [meta-oe][PATCH] protobuf-c: update to 1.4.0
Content-Language: en-US
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>,
 openembedded-devel@lists.openembedded.org
References: <20211014221419.3705787-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211014221419.3705787-1-open.source@oleksandr-kravchuk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 04:07:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93318



On 10/14/21 3:14 PM, Oleksandr Kravchuk wrote:
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>   .../0001-avoid-race-condition.patch           | 36 -------------------
>   ...rotobuf-c_1.3.3.bb => protobuf-c_1.4.0.bb} |  7 ++--
>   2 files changed, 2 insertions(+), 41 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
>   rename meta-oe/recipes-devtools/protobuf/{protobuf-c_1.3.3.bb => protobuf-c_1.4.0.bb} (87%)
> 
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
> deleted file mode 100644
> index 4fc7703d8..000000000
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-avoid-race-condition.patch
> +++ /dev/null

why is this patch dropped ?

> @@ -1,36 +0,0 @@
> -From 216e31260b618ec73862f9f5336597f391444dac Mon Sep 17 00:00:00 2001
> -From: Chen Qi <Qi.Chen@windriver.com>
> -Date: Sun, 29 Sep 2019 17:20:42 +0800
> -Subject: [PATCH] avoid race condition
> -
> -It's possible that the cxx-generate-packed-data.cc is compiled
> -while the t/test-full.pb.h is being generated. This will result
> -the following error.
> -
> -  DEBUG:	./t/test-full.pb.h:4:0: error: unterminated #ifndef
> -  ./t/test-full.pb.h:4:0: error: unterminated #ifndef
> -
> -Add a dependency to avoid such problem.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ----
> - Makefile.am | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index b0cb065..1608ae0 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -156,6 +156,7 @@ noinst_PROGRAMS += \
> - t_generated_code2_cxx_generate_packed_data_SOURCES = \
> - 	t/generated-code2/cxx-generate-packed-data.cc \
> - 	t/test-full.pb.cc
> -+t/generated-code2/cxx-generate-packed-data.cc: t/test-full.pb.h
> - $(t_generated_code2_cxx_generate_packed_data_OBJECTS): t/test-full.pb.h
> - t_generated_code2_cxx_generate_packed_data_CXXFLAGS = \
> - 	$(AM_CXXFLAGS) \
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
> rename to meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> index 1a0bf535c..cc037d393 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.3.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.0.bb
> @@ -12,11 +12,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=cb901168715f4782a2b06c3ddaefa558"
>   
>   DEPENDS = "protobuf-native protobuf"
>   
> -SRCREV = "f20a3fa131c275a0e795d99a28f94b4dbbb5af26"
> -
> -SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
> -           file://0001-avoid-race-condition.patch \
> -          "
> +SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
> +SRCREV = "f224ab2eeb648a818eb20687d7150a285442c907"
>   
>   S = "${WORKDIR}/git"
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93306): https://lists.openembedded.org/g/openembedded-devel/message/93306
> Mute This Topic: https://lists.openembedded.org/mt/86326318/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

