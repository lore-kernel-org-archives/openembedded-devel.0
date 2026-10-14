Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B057CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 09:25:48 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9260.1791969943627373529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 02:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=USBLniRV;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8874539bccbso128880b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791969943; x=1792574743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VTjVlb+otFRnQCorDsRBLqqwQiAElB9jBQmGoR879kA=;
        b=USBLniRVcEIsclfsGM0SAQ+qHnGUJs7PmC2240GZ+hYFVLDjjhvBeGeFda/x6dtQtn
         IFtspo1+9+5RWWZRDZOAKOpAuB54KYxWaQevU1C6i0POizRXDxljrlpEL0+EgCkc94ej
         I0bKlMxEMKJVWEr9stvKcTozA3wwIX7kzJ7F2pAMZA7hUKkkn6XjkrzDCyhRIRf6Xiry
         xxouE0rlfHyzuBhfGTX+rj+wB07wyaA4JNzbWJ5Sw6uYZWXbNWw4LG0iOKG3qPe+hiE1
         81FGBVDGKw/ruMpdRB0HNA/ZsB/NjtT29KAZjeZoZ2D2flqO+/WZC+B1MdW5ErLX5Qvk
         Q2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791969943; x=1792574743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VTjVlb+otFRnQCorDsRBLqqwQiAElB9jBQmGoR879kA=;
        b=0uf7UvSLD7EocsKiEJb4+3SSVt1CISc5TI8sKbw8NtK820l3Dxqk9MGuGH369Rw2+j
         nNtlsGZM0e348TW0a5Dv5E2crgaJQd+1omFhRcDCdWSOGvagWdA/iaK1NsqR3r0BYuK0
         PXxhgaO71swSlARky39DdGuVw6X8FpudJqOTZ2NNz+kuAAVQLnzKBpE62VAA/g/ZtSqT
         ZAfQ3D/Bemu/S+r/ffxl5nRRXH5t9NoQbt7yprdI46kmbsL4bAuzpBgKbL7meJluxDRI
         CmX2PCNiFmBvSgzGvxnpBPaPSxqLsLmCmfRh4w/fYgIvdf4QzygHNVR8kpUM0v0u5Xz+
         HVLQ==
X-Gm-Message-State: AFq9FYLpeivC50wwm76t/n+9wAq4U0aX1w2aQx/YlTA7YxZE5fIB6RGJ
	kOJHBbeDKCrkul+klQY9o8VTgnKpZTv2CEuK8k7XnY8Xst0N750kr+Xzc+FLmg==
X-Gm-Gg: AYBFou1MfAyYCz1M3aZDHP3NR+oDN32e0gZoFeSFF6OjhZH937SB+LKaENZ3llYxfKs
	/WwvOI4CQ4z/cYr1JKf2ardmH+bX0WfInEoOZnZGJ0V+0AcDs/u9Iktup+J73t7tKfjdXAB5jv3
	czoO8zL1A5nY7HSF9tphvxKsVWsscUU/8UdHgtja02UG4QgMgLBo+2v5VUAqEE+g0hgfW1vm9Yn
	oMs4TN/n6ujRdyolyGgLfIZrylxQ91XUmfr3JcouuS+La2cwd+Ptb5hwaaXY+apRE84ZSxzYoI7
	4jGyKMH8mKe4quizgcJQeZz1PrVmaR0tvct3m53oIyw++7b17isFKPQOtqVTWUthcZ1AwQ4dH9p
	qeSWbl426424x//OY++VRfl2KAEcW9nNaBVHgHhvt3Ku+XBIt1+J2QLpx8x6ay67SlZ5j7rJZwt
	C63M26aIbc5ueMAR0zPhOKkNL76uUwyUtgjIlrAuLvrkVtx8sEVAyt7uclCSkS73Bp+X1Wixyqq
	n3zi7QpXrlmBJFwwYsHbvXCupBhWKIjM/IgFtY=
X-Received: by 2002:a05:6a00:b51:b0:882:ae75:b846 with SMTP id d2e1a72fcca58-897c3ef90f3mr14093309b3a.4.1791969942885;
        Wed, 14 Oct 2026 02:25:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d804ec645sm865426b3a.43.2026.10.14.02.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 02:25:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 8/17] swagger-ui: upgrade 5.33.1 -> 5.33.2
Date: Wed, 14 Oct 2026 22:25:04 +1300
Message-ID: <20261014092514.454505-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
References: <20261014092514.454505-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 09:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130876

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/swagger-api/swagger-ui/releases/tag/v5.33.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.33.1.bb => swagger-ui_5.33.2.bb} (94%)

diff --git a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
similarity index 94%
rename from meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
rename to meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
index db2bb498a8..aeee9e4da6 100644
--- a/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.1.bb
+++ b/meta-webserver/recipes-devtools/swagger-ui/swagger-ui_5.33.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://github.com/swagger-api/swagger-ui;branch=main;protocol=https;tag=v${PV}"
 
-SRCREV = "cac3d136b5e37bfbe3288c8591f6f4fcf9870599"
+SRCREV = "e89a91f13cdee432d97ca9d3d1ac1969ff797036"
 
 CVE_STATUS[CVE-2016-1000229] = "fixed-version: fixed since 2.2.1"
 

