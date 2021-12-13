Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F9A3C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 08:43:14 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.8784.1639384992415690084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 00:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OU6sEyob;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 207so22565420ljf.10
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:references:in-reply-to:content-transfer-encoding;
        bh=t6wdHzcsJhKHnUJHmBavJ+/h5/uGW6k5GTK8qm8I5uU=;
        b=OU6sEyobkWqWiiWDp0FAT5nq0/4FTgRgmnE+RhA8Jtr7rwfT1HbUrtjWIXwIMBFWK/
         BoPNOf/R+dELsMXsUofpDcAznECdTSMKQIdl6qoN2LOrTdLH9LtdCTSeoSYU7mXDP0cc
         0wkzgpcJmq4CfyWFHTAUXiihcnZJStKUcTgFDPbwz8z9FVwrXF9GL3gPtIIh3Baj+Fhj
         Ejd4EIx0c9j4qbxsXFW0sQW+VrTNn2qtIremlQI59J7vSi1rVTV2JajkPFt6wMFs1I/T
         8WQFn2pIVK4hJfbeDjIbWbUoclJwrh4BPbzESHGMwjhkcM5YWH3dTj1tInfbUHSo8rbu
         Et/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=t6wdHzcsJhKHnUJHmBavJ+/h5/uGW6k5GTK8qm8I5uU=;
        b=0WCbvp/2+2D0Tg2cEwdFtQFSaBwZXRa4j0lI6HGPIPPtpzhoT7SfiD9N9FbaccdNMP
         1uy19dMpbcT1qnR1xCreqexhwo3mlhT8kwsByINmRR0levZ6nNKvSAIHhJbrmoKfjzpT
         AtNJyozkLEI/CPHCK4ve37IZzaVkavD5i0zIhNPa1N0P9sg3521iOWWJHXYK1oeOVAES
         U+0dRfIxTyyaNm2dNZ1Hckewkdy+PYH3oJQ/lodSTaL2BuV+m8Dr4WNNgU8QzBu5Mve7
         MhRxBZeek1M7zXwcGL+h8MVVaqavnQzamJZFsc2LSTiTva/tuh+sdQAAM0UED2q+ClsP
         a6hQ==
X-Gm-Message-State: AOAM532SqU5q/FDHNu46960QCikqUQ/YnxJre7dFPHD0V59+8YAdKrsB
	J5yttxn4PnvNQFQLjIB3dggFs0yAlHrc7A==
X-Google-Smtp-Source: 
 ABdhPJzsfNH+iS0rQcnfu8ugvZ9vsBs2u/ocPY++nQ4qxxMUDKscPFautKAW0CkZp3Whi83y1U+EHA==
X-Received: by 2002:a2e:a7ce:: with SMTP id
 x14mr28160823ljp.390.1639384990254;
        Mon, 13 Dec 2021 00:43:10 -0800 (PST)
Received: from [192.168.10.175] (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 h7sm1334127lfu.253.2021.12.13.00.43.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 00:43:09 -0800 (PST)
Message-ID: <a7d63d9b-3d21-8507-b58d-49ac80d5d37e@gmail.com>
Date: Mon, 13 Dec 2021 09:43:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [meta-oe][PATCH] Revert "ccid: Fix floating runtime dependency on
 flex"
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org
References: <20211206090820.1009099-1-jacob.kroon@gmail.com>
In-Reply-To: <20211206090820.1009099-1-jacob.kroon@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 08:43:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94312

On 12/6/21 10:08, Jacob Kroon wrote:
> With the switch to recipe-specific sysroots this patch is no longer
> needed. Tested building with and without the patch and the resulting
> binaries are identical.
> 
> This reverts commit 960314be5d854212ee65604a68a92a3616b2a544.
> 
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  .../ccid/ccid/no-dep-on-libfl.patch            | 18 ------------------
>  meta-oe/recipes-support/ccid/ccid_1.4.33.bb    |  1 -
>  2 files changed, 19 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
> 
> diff --git a/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch b/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
> deleted file mode 100644
> index 477cc31ad..000000000
> --- a/meta-oe/recipes-support/ccid/ccid/no-dep-on-libfl.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -No need to link with libfl.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Jacob Kroon <jacob.kroon@mikrodidakt.se>
> -
> -Index: ccid-1.4.8/src/Makefile.am
> -===================================================================
> ---- ccid-1.4.8.orig/src/Makefile.am
> -+++ ccid-1.4.8/src/Makefile.am
> -@@ -53,7 +53,7 @@ PROVIDED_BY_PCSC = debug.c
> - endif
> - 
> - libccid_la_SOURCES = $(COMMON) $(USB) $(TOKEN_PARSER) $(PROVIDED_BY_PCSC) $(T1)
> --libccid_la_LIBADD = $(LEXLIB) $(LIBUSB_LIBS) $(PTHREAD_LIBS)
> -+libccid_la_LIBADD = $(LIBUSB_LIBS) $(PTHREAD_LIBS)
> - libccid_la_CFLAGS = $(PCSC_CFLAGS) $(LIBUSB_CFLAGS) $(PTHREAD_CFLAGS) \
> - 	$(SYMBOL_VISIBILITY) -D$(CCID_VERSION) -DSIMCLIST_NO_DUMPRESTORE
> - libccid_la_LDFLAGS = -avoid-version
> diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb b/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
> index 4b1c42173..e3cb7cef1 100644
> --- a/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
> +++ b/meta-oe/recipes-support/ccid/ccid_1.4.33.bb
> @@ -7,7 +7,6 @@ DEPENDS = "virtual/libusb0 pcsc-lite"
>  RDEPENDS:${PN} = "pcsc-lite"
>  
>  SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
> -    file://no-dep-on-libfl.patch \
>      file://0001-Add-build-rule-for-README.patch \
>  "
>  
> 

ping

