Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A9AE77188
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 11:21:11 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.149928.1734693665213917023
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 03:21:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=iYf96weC;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7265c18d79bso2050708b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 03:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1734693664; x=1735298464; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rirCmQQ91LZLeWPdJIAd1RaTB4/Dy8DDT6Sgr0zZ3U=;
        b=iYf96weCuMmwlpj533d5P0id4oLA3JT7EboOHoJSzZae44Nt/1ovRgyam6DIhvvASk
         NUH2rHg6BaN4IYuKEZkyUueJ1iZnQpD2mgSmQWLTshRIkTmwGYpF1IqLAmHg/jyNH6SW
         Kysiih6hLkrJnl9CI9lwG27wrJBL00it/6kLU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734693664; x=1735298464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rirCmQQ91LZLeWPdJIAd1RaTB4/Dy8DDT6Sgr0zZ3U=;
        b=Qp7JtMnwwp1zKIk3P9SLJfFzCc6+N0e4GUGez33BA2gmo8KdLD2EBce9gmXBgfX39s
         RIh0uKKzq9IG276WXpqO6w0Ak2cXR7WqTTB1qArcuxR7e4B8ohCWEKFv7VWqA7E/8msM
         b2K8mMxqygqyuqABLGY1IarQp8lZpqsXhztp7iDHPKVfBfL3ybkelnc/wynzJrPMg5W/
         d/sIbf+FaF42MV1PuEfUmWA6nPVXy8LiZBC10GF2qMXThoFAwKjdllc2Qf4v5eG1u1iu
         VJaBZZ6EzzB/oUC/Hl9+Ci3s97F4NcAVXRJehnSzSSBFZb3QaxhFr3/DFJeTa2D/Ug8Q
         ZXDg==
X-Gm-Message-State: AOJu0Yz5mIT0UAtlr5J1vN0/XzucXu8NDbTHcE+eUesDGqhotAi2eAVV
	txtIxORxYKkHGfr+dYWWAdpHRbwybDJJwxOiSB4Lats5ISH74b6LgPYzysFFv5gFftGpe6C1WPM
	B8pY=
X-Gm-Gg: ASbGncuECR7wTbpTlyIk0fnIA4x+57LED3W/6kEYoHh1+uj1bXi4m12eIMXOlii0UDM
	Dh7TSuozSwiUWCKMDC5iYCg4XcaKzyP39UGPL1WGGs5Im/CHoTcmiHTcAF0GCKPvbXe5MxA0jiY
	8s81m4l/9EERBe49cuVFP495gUS5GvB6w5tjAeG0gBzx4prBx2THDZBcalLlrVenD56/roOopqL
	TVbJIAeNRWBTsdf0313V9P5dKyUVn2Uqibm7P6vTocJzZU9/l0G+TJl+LHJk47ktyJUSwE=
X-Google-Smtp-Source: AGHT+IF/RrLFKbfuZYkChJLAI3VeI0pilK0J1+UW1ucYjS4aRIP8NaFB9kpKHltdnVrVDcaPRx3Hdw==
X-Received: by 2002:a05:6a00:8085:b0:725:e309:7110 with SMTP id d2e1a72fcca58-72abdd3bf64mr3897121b3a.5.1734693663699;
        Fri, 20 Dec 2024 03:21:03 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882f:7af7:716c:47cc:4544:7388])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dba83sm2859847b3a.116.2024.12.20.03.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:21:02 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH] php: upgrade 8.2.24 -> 8.2.26
Date: Fri, 20 Dec 2024 16:50:53 +0530
Message-Id: <20241220112053.1866849-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 11:21:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114434

From: Vijay Anusuri <vanusuri@mvista.com>

Includes fix for CVE-2024-8929, CVE-2024-11236, CVE-2024-11234 and CVE-2024-11233

Changelog:
https://www.php.net/ChangeLog-8.php#8.2.26

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.24.bb => php_8.2.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.24.bb => php_8.2.26.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.24.bb b/meta-oe/recipes-devtools/php/php_8.2.26.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.24.bb
rename to meta-oe/recipes-devtools/php/php_8.2.26.bb
index 034f3bef1..10ef2c36e 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.24.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.26.bb
@@ -34,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "4cc76ec644eee97d17c92bfe8d0e84714fedf299a538b7dfadc0639dd0dc432f"
+SRC_URI[sha256sum] = "be57c347d451c905bcb4336832a864d9928dd0e20989b872705fea0ba6476c6b"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.25.1


