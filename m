Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145ACC3ABBE
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 12:21:27 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.46331.1746436447251534143
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 02:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kQmGB9gJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso4166277b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746436446; x=1747041246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNzhkZxgprF8meM67E04MxVitR+DqzMECL2R0fXMy9E=;
        b=kQmGB9gJ90VW6UdeBlf+Jg0JuPJrKoxDRxKnnjIsWyIsH7+PDyej5UY8WmnurLG2CP
         3xYIGFDpZbwDOvLK1mRhb74FJT1wqHrSC6s3PpZL/12QvIWxop6ESaT6W6ElGt3daOf4
         fhH6xkubThT/wBorVyrFoFRrw4rRz6R5S78YdPIWhSfAhh5zyJAaM8h6I84Ze64v01Rq
         BDV+AyT5H1L5BXvlZKY63kVB+miIWRTTeO/848TAHOmtEU7dDWSSzBu4xpUoOUAR3qa0
         57yX6r5QPJtrcjhNclj2QuXrrq8gcFpEH8RznYZdeX8WwJAQroR8Z1xUY1eEP0xab1ff
         BWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746436446; x=1747041246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNzhkZxgprF8meM67E04MxVitR+DqzMECL2R0fXMy9E=;
        b=oOMACjCxF77sl56vKGd91OB6kIpvtxmd1VbnGbDE5lfLoxLV82deX64xINJ45dnwA8
         FvOGM/5R1o/6uxTeep0C8XtTmH5B+fnEnzPm2KoIlXhjUrC0PCnD/fbFSD3XE3sGl0rZ
         TjxLjS8fO3lzAF//6b/q4LDRitAzGD0F7lFLbMEgAfuYAPyK5alcg9ikhD5o/DY2g1ea
         4OxtQOqL0fg35qpDpCO4HuSVdlEydskz5aJComsiitcdsYl23tnEc8OMGf3xkB50Ty2c
         sj70cl8jV+h0A1jijLLG+UF7vN4eC2lKWhfxEW6Np/++qUh4N4Q+17GC4NnMJHULuY7I
         VV8g==
X-Gm-Message-State: AOJu0YxmPZoSj3nptTPTSFGZ9egGPxLMCHKpgeyN5FYb2CU2OCmlP9TR
	zNabKj9oErCecQ0JFM86BUF0wcEXgnd4hAegRl6Lu8BEyKuhWr5666moZw==
X-Gm-Gg: ASbGnctISgvHWyVFkwJeI7+DRBzv8jcSXKHJSfp25j9EyWtBACKNsEyzWAn9nayCW+f
	S/9T+lToJrcPU1vZC7yLjWFiwdAAc8sUWsjhVJXJTdCSh0DZPMEx0+K1PrR3Hacx92djUw+AQol
	SNaIGO+MN+YpZeStn0TSayCA/phpcQ/bdrOrqVOewRr6u6sha5nL0/ZKfJzBNfSib+03/Xd05Pu
	iaD6lOfOMwHvhLVHkzTNfHRPCgg2HkmLrI+IwO81LUh8HIdeu3LlDh3V7kcuvhfQjU631wcp2/H
	7L5m7/bb6fIOCL7YD9MQIhsETppDhegE4GYrL9TRiOVNB6Pgqptr
X-Google-Smtp-Source: AGHT+IEXaCd1gn8s3aefif6Av2BhX4HEJSSdJomhnj4T/OAkx0YECBBsUukXvPq4OjS5haT3PwTSqA==
X-Received: by 2002:a17:90b:57cc:b0:2ff:58c7:a71f with SMTP id 98e67ed59e1d1-30a4e692471mr16647210a91.32.1746436446337;
        Mon, 05 May 2025 02:14:06 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e151e9eb3sm49863955ad.91.2025.05.05.02.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:14:06 -0700 (PDT)
From: "Ashish Mishra" <emailaddress.ashish@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 3/4] Updates the SRC_URI for avalon-framework-api recipe
Date: Mon,  5 May 2025 14:43:03 +0530
Message-ID: <20250505091304.819905-4-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
References: <20250505091304.819905-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 12:21:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117312

Signed-off-by: Ashish Mishra <emailaddress.ashish@gmail.com>
---
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
index 081cfe7..e7b4d55 100644
--- a/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
+++ b/recipes-core/jakarta-libs/avalon-framework-api_4.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 PR = "r1"
 
 SRC_URI = " \
-	   http://archive.apache.org/dist/excalibur/avalon-framework/source/${BP}-src.tar.gz;name=archive \
+           https://archive.apache.org/dist/excalibur/excalibur-framework/source/${BP}-src.tar.gz;name=archive \
 	   http://archive.apache.org/dist/avalon/logkit/source/logkit-1.2.2-src.tar.gz;name=logkit \
 	  "
 

