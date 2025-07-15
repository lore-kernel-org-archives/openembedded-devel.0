Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0BCC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 10:05:16 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.4773.1752573911375744424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 03:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=darscdm6;
 spf=pass (domain: mvista.com, ip: 209.85.214.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2350fc2591dso50412225ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1752573910; x=1753178710; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyVQxdSNXKVcIWMO2hK7q4MrnA1c7Lq7M8C3biPI4rk=;
        b=darscdm67fMRJjXx8i1GarKFkHYR8kGC9AZw9XHDdoMw2v2bzp9MnuMW+DXSv1C8XI
         d27ce/mKwW3tYquxUc+94rJWvgFDQarXdd0B5dGXjVhSVg10/gyUL0yx7lnqgIH2vBB2
         fkgosV9mHEizU4v0XflQH3WHIjjD2n2mum6z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752573910; x=1753178710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pyVQxdSNXKVcIWMO2hK7q4MrnA1c7Lq7M8C3biPI4rk=;
        b=JXLFtkbiF5a20OE0KTgJb6wi1eT3L6Ls1QGm3GLZ+oKY0hclJDITX710xI3CMo448S
         9K3pgtE1RRxG0kKU6vgfhba2wAKF0FXNcJMQ5M9vcHnP2a8ONQJCe+8pvYI1j6pE0GF9
         ZZ8/4woxLYyu40f+DaM7dL8Z1CbEZbN8zn/kc7BfX+SYQbF/tGeYquVfvrMOQ3bMlZGh
         VxYvwpVIf0iN/i2k2Fv0v3tMH0G8TR5c0YMTX/wCgosYLed6XKL5YpRGb+o13gDc3I0x
         BxO6G/AOlNpjkydlWs26mMiR98DS+Zx0EdcPlPhBbr5Pe7SylDysez1jne8rXUt/sDld
         aloA==
X-Gm-Message-State: AOJu0Yzy9Nzzs8UF9f1yhXvAGoT55DSrucxY9K83FL1PlXaqlZPxtJpv
	t//MgIu8Rv7VNgGVlbCoPMcneyYvCbVQxa8nhyse7wpp84562kZg2Vtm5ts1dAvUJoR6VhbKZuI
	6K1u6HrI=
X-Gm-Gg: ASbGncveX0xXxBM5NxB32cO62pNRFAhZ2OzU3bwWwKj+bFFWZu74h7IGNET+sUTcIf3
	OdYVm6xNGPOzTEsHcpQ1xlEBm2wN/syKQ15MR+H7J9dAAeZOIsBHfCy/BckaLMn7RgwnM2iP86N
	UV91FWNo1yznPdd+fTtPviUP251o6H3SBCLnmbKlmbvZ/MzOYC9JpQnghfWYv0Gqbvw6XfSFpe3
	14WkLm4HqPWaMsvDNz0mbJqQpN7YIwvAoSG7DU8ndZA/e2AY7yCJYJJyzQp2FvXGV8fv8SNAexK
	G67L6Z5ElefV6yz7/e8jhBIuZoCuENl/dOt+z3gJXHc4azQC0qKOxXvWOVewmuGGykDkjlryD7U
	G6oReebvS7ykC/R3VMfmvY3duBxEZjJ5G
X-Google-Smtp-Source: AGHT+IG4Wj4Wu2yKA5/ULMw3ypMJG4IPaZIi0VI4l8aSPvAkeHkvVZEue0pAI+wL+HzIKljUW/GHQw==
X-Received: by 2002:a17:902:f78a:b0:231:fd73:f8e5 with SMTP id d9443c01a7336-23e1a4be1b8mr41437945ad.24.1752573910076;
        Tue, 15 Jul 2025 03:05:10 -0700 (PDT)
Received: from localhost.localdomain ([49.207.236.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm104712495ad.180.2025.07.15.03.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 03:05:09 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-webserver][scarthgap][PATCH] apache2: Upgrade 2.4.62 -> 2.4.64
Date: Tue, 15 Jul 2025 15:33:37 +0530
Message-Id: <20250715100337.1397804-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 10:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118558

From: Vijay Anusuri <vanusuri@mvista.com>

This upgrade incorporates the fixes for CVE-2025-53020, CVE-2025-49812,
CVE-2025-49630, CVE-2025-23048, CVE-2024-47252, CVE-2024-43394,
CVE-2024-43204, CVE-2024-42516 and other bugfixes.

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.64

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../apache2/{apache2_2.4.62.bb => apache2_2.4.64.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => apache2_2.4.64.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
index 66a017a864..f587935b8f 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.64.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
+SRC_URI[sha256sum] = "120b35a2ebf264f277e20f9a94f870f2063342fbff0861404660d7dd0ab1ac29"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.25.1


