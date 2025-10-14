Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79105CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 04:23:56 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.7686.1760415835022299967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 21:23:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fiieVItz;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-791c287c10dso4121718b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 21:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760415834; x=1761020634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+408JwBOYiJgv+W1BaQNtRq8FaUCcJieDzSiko+0Cg=;
        b=fiieVItzU7js1FEov9To5hJJP6m/J04IlNX2mA/FBeg6WTkEjp7NoMsBRvyayKHagB
         +f0J6Dj38Pw8xazT4f3bTAxQIuopL9sDG0u2jekubH2btrOisa4039x3qYWczupJBjys
         tlpNaHUYHvnGmEcwHaM8atDg+2LBPo880Aq2KMQef4hO8O7dam7WZIy+FvrNDaYbqgXq
         ZqhSgTaL6dAMfmibzPBvU5//hf93d94gnLY2Sx1iqffSf3FYh5vG1mJW5tdUWzIqTAx3
         qXJdGVTAhnGvPaNN7adRshXKNKAhPg/w13m2zpPvg+I2OsX/WO4zSStgCUj/wJ/rXSoK
         8Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760415834; x=1761020634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+408JwBOYiJgv+W1BaQNtRq8FaUCcJieDzSiko+0Cg=;
        b=kKpZWVmcVPMEdnaTGM5QEb+XGlFpxA/L7ORiER/XmYGY6nYJAiLq9+mOT6HQNwjRnS
         KbKJaNoP3ugZAbqapfk2o9krCVmGG0k9W/XPa1GY2s5CfAiIPdA3oucVfngdjJZuRYCO
         xVzs+5MQi39sflglGZzVYV3G2OSCcsCJj9UDTgZtoDo64BCPtyvupLMs0XNQiw3tIsC5
         XOd+Uh07HXx7dXzGSi743NbFBm5YJwEklqKC0IbpMB8Ojhe8Vno6C0b9AXHkXbq7siQf
         mTKUOpr3c1n81OO5jn8pn2POfxtSVEFVfqFX4DuopxzO23A9OlyHBdvTERsuuJ9j2qa3
         fezg==
X-Gm-Message-State: AOJu0YyBnykEhjR73Fq5ov2fywceHcSDgCRkJWuJxtWcnBqcqvuqw+cl
	jFMtmizjXtSBnvGzELrVW07Ubegmj+hL31kdSQahGpo52lGQw6KAB5QE17VWpmCa
X-Gm-Gg: ASbGncv52pU+Pt8hNAzrh59UIFTZ/0hssidC1Lr/KzyoDoK5Fy8lkMQb4AyLWdksXjM
	FLQnlohkx7vmQ61sMtdl+iuBBcaHkTNPN6TqdaTOtlMyGETB+2kjwCVj1+HbZDNO3Llh2be6xkV
	Cv+Uul4cdH9NhEM2xSvN+ix+XL5QKHlV2T8dBnTDbeA2ENR4lpS62PAsjJbqvmtf44J3vdVaG/5
	XGlUVqIbBzrPAxd3ch+I34/CgF3b/RgNPQMuJJMEFDjpumnsOpqoNRmRWztDi6emwcHeC8ay0RC
	cjBydrZSTO1ZuzS0C1O59eeum9W092dxgFdPrBaY7vOLvdScIfkeDLEkT4DvyN4WJAqO4Uof1rG
	I6zIbqSgBtxx+lPPM3Pt+hmZIK1OkVTavNvtdqtuw
X-Google-Smtp-Source: AGHT+IHI6UFSSFVlpU4VEDquTN6xZOIUiFqWPQh9Ipej+pRoH/FZVpF8qiZ2kDXPLFEgQYX1loZmVQ==
X-Received: by 2002:a05:6a00:1146:b0:77f:472b:bc73 with SMTP id d2e1a72fcca58-793859f31cemr29376155b3a.6.1760415833702;
        Mon, 13 Oct 2025 21:23:53 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d096740sm13504959b3a.38.2025.10.13.21.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:23:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-typing-inspection: Upgrade to 0.4.2
Date: Mon, 13 Oct 2025 21:23:50 -0700
Message-ID: <20251014042351.465422-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 04:23:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120553

4.2

Add typing_objects.is_noextraitems()

4.1

Fix compatibility with latest Python 3.14 release
Add typing_objects.is_forwardref()
Fix implementation of is_union_origin()
Add SPDX license identifier
Use list as a type hint for InspectedAnnotation.metadata

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-inspection_0.4.0.bb => python3-typing-inspection_0.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typing-inspection_0.4.0.bb => python3-typing-inspection_0.4.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-typing-inspection_0.4.2.bb
index 52d846f799..217e89feb7 100644
--- a/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typing-inspection_0.4.2.bb
@@ -4,9 +4,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07cbaa23fc9dd504fc1ea5acc23b0add"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "9765c87de36671694a67904bf2c96e395be9c6439bb6c87b5142569dcdd65122"
 
 inherit pypi python_hatchling ptest-python-pytest
+SRC_URI[sha256sum] = "ba561c48a67c5958007083d386c3295464928b01faa735ab8547c5692e87f464"
 
 RDEPENDS:${PN}-ptest += "python3-typing-extensions"
 

