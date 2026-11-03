Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7978.1793701471921507533
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 02:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ET7eSOCo;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so33401385e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 02:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793701470; x=1794306270; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vBSWh+PFVjg6q7Jag9tQdxu2I4pQQpcpLmFe/321URg=;
        b=ET7eSOCocgKnlxdxT/z+fprZF1jyLpGD1xlqtlzCeBh5tuf7eQ9Gpa1nVt0NdObZm/
         wMQs0JT+blNmwehWFKB5bmV9VkDkSZokxnR/a8vFMkOBWweSIpkVATrssoZNSpBS1Yft
         AoXroMJ0U46kCJBMdTN7D7sM/oWVV1Wv4fKKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701470; x=1794306270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vBSWh+PFVjg6q7Jag9tQdxu2I4pQQpcpLmFe/321URg=;
        b=mpSq7ivzbYoSu3p2V7GAa9ke9wVjESKBmVmC2p0e/fd1Sz5iz0mh5O5A6xgbjQP0ow
         R+gnIIP12WlnzLDFHPGqdtbFHikvC2XRMWANbfaFfRAAXF87gwuhtUEk7brv4S0W2uOr
         DnuyKw4ff4Be9nRTaaEfBaohnW0GmcX4jFBou7BXIa3mevuLK4EN7+ZiHxIgvncLgoJg
         LtWH9Bh2f5mm21wKrI+vdPnowsQU/F6ObFDGyndATM5IwP4Ey1TSzsL+ak2VER9//kmw
         PzQdhCbpLdn/ZNgqhDBSyVPmcm1i09FiWsryMb84E7duKzV0ZLSDxIjUFzcqxE93mS5l
         Iclg==
X-Gm-Message-State: APuU4Z+LYLjkylSZW5JiwpvOHnZuljgEqC5yUQoam63VA4TRsf7pZ8aL
	NiVND+4PKB2DTNSKl6sY8efjqhDHP/3XOaPXovtN1K01VQm6n17J5GYx66GhyOEq5saPX6FXyOL
	+sJZ7
X-Gm-Gg: AYBFou3ywTg2Do5D2Z7Gk+O/yBlVmPj427e54jtjuL7Oh6OFPtnqs46r+5hkqFQvBfH
	eMRHhFzr2RguAwpRRGQvaZ+JErdfsOsEqX/zWBNOhEzeeqcepCId/RmHsU0MP4jAl2wepXqIQqt
	ilbJoaGGPWG2+N+NcCdFiV2HzgSKaketUltuGl20esQLCFc+xxbAQKWksFv1cUBtbA0dQIJ2Oa4
	o+Lk2e4dXRt6UwYAMOpQeWetVI8rUzgEI+4qbicfpBjl5yRP7XpQ54XxpH6Z9zDjEJCn17E/rbz
	Fkvu3fl7Znuyg/0Ikc7Dp/jrEnWvi9KIIFhsQzyIniRAfi8LrPdMri0l1hlYsHgLDPxZBvvGe51
	w+8P38i+pjTinalNhHQbhrQCygitvCYLzf3XhcJ0a+7wggzrjMEDrJKCCAoHE+HbGGree5D9JMA
	6JJgAPMRTk/2mmWkqfszlRSE6Zj1X52Uw7vs/RlZPtVQBUtQAXLsaQGhd2CKpmT0VePy0kOenTq
	OrT5ncRvQi9xi8VVrI5aCYN5u0H1K4j+B3hkURe/jf59lC0ArKzqB38Qqxe7f/2MtzJrA9+Z8Cm
	UHHHLqV3ra5qaXVOQ42mJAtNdMgVtY369Nx9NgQexIiyuCrmkU6luparQTtGr0lR/9FR+3ArJMP
	Cce+fbS25MhEpbz7f29oA0X9Uf+ozDxKLA7OEJCZ9bLbLlCqWR0jivA==
X-Received: by 2002:a05:600c:c118:b0:4af:79ee:f660 with SMTP id 5b1f17b1804b1-4af79eef775mr147209755e9.31.1793701470248;
        Tue, 03 Nov 2026 02:24:30 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9fafe08sm73017225e9.3.2026.11.03.02.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:24:29 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 21/22] python3-wtforms: Upgrade 3.3.1 -> 3.3.2
Date: Tue,  3 Nov 2026 12:23:49 +0200
Message-ID: <20261103102350.1952237-21-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103102350.1952237-1-leon.anavi@konsulko.com>
References: <20261103102350.1952237-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 10:24:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131784
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.3.2:

What's Changed:

- chore(deps): Bump the "dependencies" group with 1 update across
  multiple ecosystems

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wtforms_3.3.1.bb => python3-wtforms_3.3.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.3.1.bb => python3-wtforms_3.3.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.3.1.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.3.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.3.2.bb
index dbf472a618..e90768669a 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=17ed54aa95f4a6cd0d7a4747d14b64d0"
 
-SRC_URI[sha256sum] = "9d10ccb5740290c9ae6673522d87bcae3b669cf0cb4e4584aee229b4694af10c"
+SRC_URI[sha256sum] = "49bb51d10b7832d497e758736da4d56f7d129a015db24756f36f28992f175404"
 
 inherit pypi python_hatchling
 
-- 
2.47.3

