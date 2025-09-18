Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CCECAC5AE
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 11:24:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.11621.1758194634387718337
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 04:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZKnD5etH;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-62ef469bb2cso1389026a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 04:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758194633; x=1758799433; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMnQlRqbcv8v1AqQkIuLKWMtMgw54+9euEEMQcjQb0E=;
        b=ZKnD5etHwb/YHEjkudeQfzb4xBPTc2ikPfcSNYjzrCc8wDcW9t1wHx4qdd7oDFYw4+
         j9BGxo/FcuFSIwSSkd8pZTE28VJEz57BPD5NQTC/JgFPOt/XGZfi1xREXHVMQoBDDdwe
         Yj6NFQcCmDzKPKpCRSSXyVheSnkzxmLqRC992Q4wlmH5g3YVqIAmk/j9xz8qnYYcgAj6
         M5kqrb4vBoiLeE4Je1AQ4/mNOv0+doGs+cPwaIkfXZxiuUsG5tjkh7Dhi2RZ6NwybIMM
         COti95WO1t048vjL7ebgWVSlEaKccQ2Uj5rd+vatW0TltOXBmlW9T9zFcz1fprOPyqmd
         C09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758194633; x=1758799433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMnQlRqbcv8v1AqQkIuLKWMtMgw54+9euEEMQcjQb0E=;
        b=pJYrb/rL7PAZkiYVPRuK2sNHzSgPaNXSb59IDq/lxEqapln5Ap9EcNKcc4K444Rh5J
         dB4TI9Bs25rV43El5BHHGe0NaeCQAtLPcigXMFY7Ic+JLLgT5o2xL7kJpKOBZj61E9H7
         eS9101v0UcjP2C+4wACLd3tEJ7tk+ZBl8h/TGGjGnN9t7fxIBHT5jYRWAEBUY6uj+rzA
         /ZHNLDqx2jrv54RkvkeGfur+PoiJ3T/PK+rgUEfj96PdnEdIRWxjPXI44mhXezZX4RnN
         xp8pBSclNspwnGGgRo85Aq6sRKe085nX/jKGVrsLYp/BYQVGwgPKU4J343UDaVbm8S8t
         n8bg==
X-Gm-Message-State: AOJu0YxEMfNx9sa5g28w0q0zK6frgzI9y8IKLWWvarbaL7h/GlCRQi5E
	znkl2pBGNyouvmmFTW+jaESLGcC9sJO1XLyKQGrYlQYVlXbfRYcWEybuBQa8Iw==
X-Gm-Gg: ASbGncstlZ9ACBkDkeqb7tXgdOhngTf+ytz35ff2cTjWBDlEXHdgU9lwMnXHsz160z8
	eYged4xCD6cuD1DN68dRee11lprLcH2HGuIPmNUnNHl0SR9BEpCIOdwXbVtqgp32UQO9/L0OXSe
	RGa7/yCEugNFmo9vhayMJFGEXB+xcL/VZx0n94XneD1Rtz8srUMx5Iv7ziG0L5bmzw73y27hBW1
	oMJjzeHr1JnQ6lm81BdawplZOd5ThUcJtbUUZHdR5emRXtjauBoUpGo/y435OX2b7RvhhQAxDjD
	sAIJKRoMERjtQAcr0tL6THAABq3ifeFh0/vHZ2feIkyNZscSegSpe1iW6S5pEJ1Y0IVLgBETuB1
	kfXoxhiM8eFGE38h/oxKtQ3vvddxVNlBoEzRq1j8=
X-Google-Smtp-Source: AGHT+IGxYPXDnTk0ceXZ8jbG2VqC0xWQxIia7CLyA/2LRcQ/iV0zdRKV0w+OIP9zw0N0PXKVA3OQlQ==
X-Received: by 2002:a17:906:4e94:b0:b21:f643:dc32 with SMTP id a640c23a62f3a-b21f643e05bmr145970666b.3.1758194632612;
        Thu, 18 Sep 2025 04:23:52 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc75ac5e1sm180410366b.43.2025.09.18.04.23.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 04:23:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 06/10] avro-c: upgrade 1.11.0 -> 1.11.1
Date: Thu, 18 Sep 2025 13:23:40 +0200
Message-ID: <20250918112347.1331393-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250918112347.1331393-1-skandigraun@gmail.com>
References: <20250918112347.1331393-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 11:24:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119565

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d6a30ef441adfb4e92dbc689266b61192c4add3b)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/avro/{avro-c_1.11.0.bb => avro-c_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/avro/{avro-c_1.11.0.bb => avro-c_1.11.1.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.0.bb b/meta-oe/recipes-support/avro/avro-c_1.11.1.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.11.0.bb
rename to meta-oe/recipes-support/avro/avro-c_1.11.1.bb
index 8558f75c50..bb0bd7d752 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.0.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "4e1fefca493029ace961b7ef8889a3722458565a"
+SRCREV = "3a9e5a789b5165e0c8c4da799c387fdf84bfb75e"
 SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
           "
 

