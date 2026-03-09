Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9755EFCD8A
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11188.1773052327940673279
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9siO+ZV;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-829afe24fb5so1532837b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052327; x=1773657127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=91yPw1Kbdy20oN0W1Vbbfy3irPSb7ifKizZChL2DD0s=;
        b=b9siO+ZV4HcaTVYnW95SZBPoVgoMaAILvViw5ZAHTJikoaWomsRLizyA4IublcbU3P
         WmMw2kAgdGSS/YIqesJ8incTErE6PgyY8PFKxRnxI7b2v5N4afkppuRDbLZTjQXx0ir7
         8EkrvlXLKhnswGbrJMMzInbJIKoTklCm2PAZ689ipbrNGdM7drMyO5acbpTl005X7BUL
         C6ZBbENiqgKujS9y4iznfKCBj6xkU5Xe1ALY1KYn7dZ7j/amcaZ4sZg8ry2jHdLxNb+V
         q6iwprORI4eTNYYF5Ju9pEbp7otm1WKYh4TjxdWHj4flJhtn0PhH2o9lH7YkaqeX3CU2
         ngFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052327; x=1773657127;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91yPw1Kbdy20oN0W1Vbbfy3irPSb7ifKizZChL2DD0s=;
        b=cK31H/moNJ204/sLxNm1Fd+zLxVhgWxim/IEUawz9GX67z21tfqOhKj8pwT4kNc6kr
         bjUyNSwLD3Ey/E2fkxZ9QXhJ5U0NRG3kNVTXFI88CI8XeEXRHRCShn2fPfXA+0C7UVGX
         yXO9CYlKz2pY+WxXuFyT5yvSoudsxNJhEd5BWco+98QBZYxVr57i5JgiK1JcktSHn9v7
         bpQ3gz565se4Oei6mh7oOLhe/xtqC6ijHupH4plAjj0eqpq0+RoN5uf2KJvsYYbrhT8P
         4hfGmBsoVX9Mk9+kgKumS6DaQLUdG+kLBhGCD8p2bRz6MladxZefHj3OKVbNLJs59lkI
         BHLA==
X-Gm-Message-State: AOJu0YybCQqvPdQbtnK35eav1gmGjE/7Y86ulBZNKSghqOajyKrD+PhG
	BIwHShZThWluynnePWpjtYQNPbRZnbVqncSOd5cc0uogHh+CSM37urYO9R03IQ==
X-Gm-Gg: ATEYQzyWMCqcLabR8/+Dc6MrN9YrLlts1ascmrzfkG4XP70qDR7lBLfQOxuGXa+tAcC
	lcmMwN9HBG7K6GL06SyvVDKsrQ5Xh8M+tOvcbwKTOdN0usQajzPj+yVXNZ4db1X2/GdbcLRzkT3
	pk711G1pojygs+JMXg9vHLkpvGZyAUS4u6B3RsOn+t1D1TCY7uQgiok6iLK8GpUltf5Df9rCtC2
	ZIVuMdb+tEiNFyfRjpWhxnXvtuVSd4b0jVv+yCYB1vxsZ6DIHJ7Z5KoDEhMIPjJyXoA68o/b1ho
	Kkti1+8ZnKR28GELAcx5ZgDIQB9zKRkhAA64Ng8ckuK6CRS3eKHNsplKrhZTI3kA6PHuf0r7yYt
	FhArbdC2zFpw/u/XrXsGFFJzXIeTeyZihLlDrh45+EAGoiRTSqpAylBxmfAm3rMt6ybd/aQyiH9
	lVxHZLfhsZZWVhuOVX5ETl1pf4+Rt93i0YFjw=
X-Received: by 2002:a05:6a00:882:b0:824:9f22:1e95 with SMTP id d2e1a72fcca58-829a2f83a54mr9175294b3a.55.1773052327064;
        Mon, 09 Mar 2026 03:32:07 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 1/8] frr: upgrade 10.4.2 -> 10.4.3
Date: Mon,  9 Mar 2026 23:31:46 +1300
Message-ID: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124987

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/FRRouting/frr/releases/tag/frr-10.4.3

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-protocols/frr/{frr_10.4.2.bb => frr_10.4.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.4.2.bb => frr_10.4.3.bb} (99%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.4.2.bb b/meta-networking/recipes-protocols/frr/frr_10.4.3.bb
similarity index 99%
rename from meta-networking/recipes-protocols/frr/frr_10.4.2.bb
rename to meta-networking/recipes-protocols/frr/frr_10.4.3.bb
index a246b3459f..147e3b8a8b 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.4.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.4.3.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.4;
            file://CVE-2025-61099-61107-3.patch \
            "
 
-SRCREV = "642f65b9e5853c7207982a9cf8275732737d4e44"
+SRCREV = "6ddbeb5eaf71bc5a3f05f22e211684fb85a34091"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 

