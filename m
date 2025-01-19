Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94E1C02183
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 06:52:13 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.11486.1737269530261552578
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jan 2025 22:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=B+555WwN;
 spf=pass (domain: konsulko.com, ip: 209.85.214.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2161eb94cceso41904915ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 22:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737269529; x=1737874329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3gK+N8cBYufRNNTAT/Ur0ggVQiT8qF/5+Hut/e1+E+o=;
        b=B+555WwNkCVbBf9SzRifL1Sn6mmeOUVa0F1IjYqUDSgyA6G6Htr7DhnRN7+oET9G3m
         fto1+OMeJH5AQ/9IjT9Hwb+iB9RIpJRSW544e0cQlzXNO26Ck/T8DpnS/Ej1RwBDoKn6
         w1suAR7dXKTM8KOai29DtAU20ep0yB0284+/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737269529; x=1737874329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3gK+N8cBYufRNNTAT/Ur0ggVQiT8qF/5+Hut/e1+E+o=;
        b=RuQUoMHAp4VOCBTLf1B8Ct+whBUDrxBaT+nE87rfgDpeUtIGEceglVuehb58AGXSuV
         RrRkvmWaB0LUp0PElRmGvQmsyNHnebdvcxws7Wf8UdC2YpVfSfNOQMDfj5wKBk1HIYhk
         6SiYfE6M8yhK90GxYqqKsH8+crrVnCHVOBgiUmh9G3croPVGvo5UTXQcc+eTWQBXRHYb
         rbqDUefZvNC1EIf+IRfCn6ceoenLTQoKWdRK6bLyDB2X7+SKKpVhEoELi5obfXqmaKzC
         zN36bDYcumKA5qHg4rXL5yPxG8wbI94OPsrgNhTQD9N1JaA0rBOmEiDWleF3gwoC6fsv
         eSYg==
X-Gm-Message-State: AOJu0YyI769jU5sZZhK8Wgec1EtaIcJtlV33hNho4mljNmMkd14/sN/4
	CnNG+QDwN5CXX9GlHMO47DOQj6orUdSXsrOl8wJaL3q5UBoSdjvAlC1uLAwc9pMpI4KP7yHDifK
	3tVA=
X-Gm-Gg: ASbGncvZy/OoZWXlavOy/1PmRjlhVWF7vxyDMhJaTiXQiSglggJx6nLHverJ4cZP+5/
	YTq4dtWTYdq2gqLZ6zZamABavqqcn7EvR9gXQnRvDMFZqWc3uacC8AYr1U5F89MyjLgRegY5PPz
	hbv5jfTo0FwMCf0tJOsXxHM7SlWzs004Kb+RpXWeDxHanvnAsuXS32ZNtgl1U6nGq4vwLh1Dv/y
	TQSs2q1fX6VPf3GvmWL24AvjTyGn1T3yrKlA7lzmpMvIBvlpr/qlz7h6UYWDaS7DDfQL0x45owG
	JhPcuSZ2Vg6qgrUcjApnvCqhDWF9xjS2Qg==
X-Google-Smtp-Source: AGHT+IHEXoKlGRAt3buPawRy7gTAlrLnSwyuAKlmQm/8nX5AxhkQYGVYH0ryszbd2KIKMnemRtIOmA==
X-Received: by 2002:a05:6a20:7491:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1eb21568535mr13356771637.27.1737269529267;
        Sat, 18 Jan 2025 22:52:09 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdebeeb3csm4464899a12.65.2025.01.18.22.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 22:52:07 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-devel@lists.openembedded.org,
	yocto-patches@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] CONTRIBUTING: move to yocto-patches mailing list
Date: Sat, 18 Jan 2025 22:51:55 -0800
Message-ID: <20250119065155.1947971-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jan 2025 06:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114955

From: Tim Orling <tim.orling@konsulko.com>

Since the definitive, canonical repository remains
https://git.yoctoproject.org/meta-java the official
mailing list should remain in the yoctoproject.org
domain. Move to the new yocto-patches@lists.yoctoproject.org.

Please remember to set the "meta-java" subject-prefix:
git format-patch -M -s --subject-prefix='meta-java][PATCH' -1

This makes it much easier to find patches for meta-java.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 CONTRIBUTING.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index 5420797..00c7b88 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -23,7 +23,7 @@ for some useful guidelines to be followed when submitting patches.
 
 Mailing list:
 
-    http://lists.openembedded.org/mailman/listinfo/openembedded-devel
+    http://lists.yoctoproject.org/mailman/listinfo/yocto-patches
 
 Source code:
 
@@ -41,7 +41,7 @@ Therefore use something like:
 
 When sending patches, please use something like:
 
-    git send-email --to openembedded-devel@lists.openembedded.org <generated patch(es)>
+    git send-email --to yocto-patches@lists.yoctoproject.org <generated patch(es)>
 
 Please add the main layer maintainers to CC:
 
-- 
2.43.0


