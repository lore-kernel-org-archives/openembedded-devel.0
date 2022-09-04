Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA43C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.11378.1662276895520903269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hSTRfZab;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id q15so5860252pfn.11
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lWA+dIzwBuYx/KtvNPoJgDIn7/EWhv+A9UyhCYq3bmM=;
        b=hSTRfZabF0sDGwmOu4oe5Aoj10k82e6PpWvj5T9Pka48jLTzZidP5gWnTYC+KHuSzf
         X8t/5+OUL5XKvWNjB1KSYN+Am3cibHLyQMOryu2RsD/w45NJKNR/Igmj/rSOHIz4mO31
         J3hR4iWbdggFLot5NkOOM0THns3M0VRzJcqbkeHjDCGeKNmonheiyIsgtbC3B2gc6860
         ASOuCJOKdCvlU/x67OXot9w8yEzpcs7TbPu3M4UU+7i5ntYd2Tk/IJ4r5ee4RD48Rx+Z
         47yVEUekTDuHluZBYFgc3hQO3Da3YeariGDJwY9fRfto7BxByzuHE+tcb0otAex40Zec
         xKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lWA+dIzwBuYx/KtvNPoJgDIn7/EWhv+A9UyhCYq3bmM=;
        b=l85t3HhgvV/RuB9V0MiuSxXgLpkgFh7QBZmtZFDzQ/jv1CEjMrrCO37HOv7XrXaMX6
         yMm5GT+iXHfJ2AEjrr6bJqz/E9oDbX04G9Bm40pOprXrMq8Ym4/txtPv6koj1MpTXMB+
         EdtABPHy2TBS9x3yvAZQhzQkYDPNu87c1oSQE66FmkBTOcWWeh6ed47KLcWyydCjYffv
         /gvxF7NLcNTqqEavLym0Pp2sOkWv5r4zmLw91wLvgLpD61vJr9OFmwiu7uOG6kHHqUhn
         l18AcAYnivjZyZ1Uv6JoSdm8tbt27gLuAtZ3H96QjT4gwsZbzBw7Cg7z09I2IVaWSz6z
         L93w==
X-Gm-Message-State: ACgBeo0IUfGMfbAk+j2qAlFpvdqSnmUdNlcvet0UwZyPAmsztbXIxeok
	9UwjsGL4iamqZ3/iAMho5T4iFH+WI4ebIg==
X-Google-Smtp-Source: 
 AA6agR73RuQbTVOnpwKNSNnUhKwvIxJTI+4p5e1YeIheXNVuD7CGk6UMgB3VfTZR7dAK+5bPxAQRKA==
X-Received: by 2002:a05:6a02:206:b0:427:93bb:9f99 with SMTP id
 bh6-20020a056a02020600b0042793bb9f99mr36571875pgb.542.1662276894675;
        Sun, 04 Sep 2022 00:34:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 33/63] libx86: Fix pointer typecasting in assignment
Date: Sun,  4 Sep 2022 00:33:47 -0700
Message-Id: <20220904073417.3251865-33-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98627

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-type-of-the-void-pointer-assignment.patch | 33 +++++++++++++++++++
 .../recipes-extended/libx86-1/libx86-1_1.1.bb |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch

diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch
new file mode 100644
index 0000000000..ea3c306fd7
--- /dev/null
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch
@@ -0,0 +1,33 @@
+From c782e208021409e9b78acb2200abd4319072e78a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 00:28:05 -0700
+Subject: [PATCH] Fix type of the void pointer assignment
+
+Fixes build with clang
+
+x86-common.c:216:9: error: incompatible integer to pointer conversion assigning to 'void *' from 'long' [-Wint-conversion]
+        offset = mem_info.offset - REAL_MEM_BASE;
+               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ x86-common.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/x86-common.c b/x86-common.c
+index 137bc3c..6f737ed 100644
+--- a/x86-common.c
++++ b/x86-common.c
+@@ -213,7 +213,7 @@ void *LRMI_common_init(int high_page)
+ 	if (!real_mem_init(high_page))
+ 		return NULL;
+ 
+-	offset = mem_info.offset - REAL_MEM_BASE;
++	offset = (void*)(mem_info.offset - REAL_MEM_BASE);
+ 
+ 	/*
+ 	 Map the Interrupt Vectors (0x0 - 0x400) + BIOS data (0x400 - 0x502)
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
index d303147259..9dc91f3f6f 100644
--- a/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
+++ b/meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.codon.org.uk/~mjg59/libx86/downloads/${BPN}-${PV}.tar.gz \
            file://libx86-mmap-offset.patch \
            file://0001-assume-zero-is-valid-address.patch \
            file://makefile-add-ldflags.patch \
+           file://0001-Fix-type-of-the-void-pointer-assignment.patch \
 "
 
 SRC_URI[md5sum] = "41bee1f8e22b82d82b5f7d7ba51abc2a"
-- 
2.37.3


