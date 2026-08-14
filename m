Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9D2C5DF75
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24379.1786747594077076161
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q56uYOBI;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cab973140bso25078095ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747593; x=1787352393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjtI6tLUtYFwmRZze877Q2XPQqmmmIpPUcAmYZJm8Mo=;
        b=Q56uYOBIIbDXfIBS+H/m9GuUQc8yFmnfiQ5NWa3yW0LTtWlXOJoXl3jYOq4WSC6OuF
         dKAYRT+6ns8yoUoByovSZ9YN/oUUWJE0j4IkyVpt55TSbNfYYL/5rN5+TgQnCNZfIUPB
         2F/FxYfstxRxTcWKZPBMkaVH5QFFbizCsyYBfUdyj1PRIYJMJhzqzJGO+htFxvjC9GQ3
         L/9WmnvrbnFzqCKSt0DS7OV7ZONv8WWspP1aktr9HU+xJMfqON9o1rvsKoGbNUtasxdP
         RsBzmxN+hodrykMorEqvflKrCLrumhHMLMl5kFi7GLVNn/6IW1jBvTDhTRgV/icC3sFc
         DQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747593; x=1787352393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CjtI6tLUtYFwmRZze877Q2XPQqmmmIpPUcAmYZJm8Mo=;
        b=Q4CxjyWr+IsuAJCjcwzJuu8lCrvFcmAmfsloMPyM1DvRAjVEjM32H2TnW8k3+atcUM
         Myz6IhzAMW9iUx/rXIlsQIFaga81NVmgybMxaLS56DmVOOcr4cJhhkXDdOxhP5HUZqXU
         Q7+vgM/wqYntVptE/5ZewVqg4vyLajBxn2IJ6VjcWoQ9aGqIoi1mob59V5Pi1VkXOghA
         CE3IIADSlPgkuS5gdP3Wi9DvNM0oOgAdKH+MaWJ7jsP0W6jcYmkxFkza7lOCNHb1pidO
         Yfkb6JPgiEnDyD4MSslh6JjVZm53C4JZeGSmvW0uFpypickC1GgDWvNBtOYWnBBuU/Rr
         b+NA==
X-Gm-Message-State: AOJu0YwDXL9Rsw5E3ZlKB/sxCLPoay/YBousXfbpujC5rtsP8S5d57k+
	8iVLdBCARsJkYTFK1+SnLtAErC+y2wfY9Myk9GS0GkiXKf1QIkDQbi/1iDtLB69b
X-Gm-Gg: AR+sD12UGV1W/e3GKiKxxgNieSkRWWxbqLQhOiUmWMapIboxe5OQ8Vmx0MRffWHqpAJ
	er8shdeaXgnS3J8oM0wA/zY8vtnozlZz5O7xR4vng+RyaC4QGmbHhsB1wuqE1DIx9ISim8EdPwS
	wJuAq6aQvQDAb9aMjuJi3ApEeQz73PNW3xzSDCV1E11dcq5yICu2+cMNf+3Km1dEg+t3JXwuWX/
	FcUw9m2F+Eq+EqNJgTRL518tAv0WaNiPrkDgiZl0ZpsPzIlTq0RzYRztQA4gnnbupzGJSPl/XSj
	g9Z5PmHVP3XE5kGHwiMIEb+z15h74d3ciev6J/wTocFk+VH6ZY3ITC6BYj7595F2OLzv0EyBt6g
	wYGy1UNDSnUAkmnCzEmwRgYprXbC1XStv0U2CbAhFDm95zNdpjRMnT/6Gk85yY3piWd9rwp1nKJ
	Mu537KkT4GNHTA56vSrDdx4f+DxUSikeIZ3j5ZhDBX4arFhnraSKs9bruQeYrBsAVj6exgfZrrw
	zfKTjpNjFddMjbdHszSn1zt2e9UR2QOClvc4BLTeJZoeCvzSwF7ueaAukdaqEs5ZBw5p0aQLKV7
	uRafZCYrAjGIeeliEdfpx4hiJMg2Ai7/amV0t8DYoLlMZqgrbnHtvHp6P91AJYrD4t2afA5dp7K
	4B4hIW8ynM1Oy/4xlemJTy76bO7kH+WlM5osC219ZN4K5o8lXSEeXABbR
X-Received: by 2002:a05:6a21:398a:b0:3cb:7b9d:9869 with SMTP id adf61e73a8af0-3cc71eb2977mr11047882637.35.1786747593366;
        Fri, 14 Aug 2026 15:46:33 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 045/109] logwatch: upgrade 7.14 -> 7.15
Date: Fri, 14 Aug 2026 15:44:31 -0700
Message-ID: <20260814224539.1523174-45-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129109

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../logwatch/{logwatch_7.14.bb => logwatch_7.15.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/logwatch/{logwatch_7.14.bb => logwatch_7.15.bb} (97%)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.15.bb
similarity index 97%
rename from meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
rename to meta-oe/recipes-extended/logwatch/logwatch_7.15.bb
index 7370023219..687ce532f2 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.14.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.15.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "2fc66eca83419053991484b7d6e778f46b03704ce778893473d7a9cb7dd915f9"
+SRC_URI[sha256sum] = "5913783d52fe02a18fd796acee2335eeca43cb17e913eca33e2f211e64f2fcdb"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/logwatch/files/"
 UPSTREAM_CHECK_REGEX = "logwatch-(?P<pver>\d+(\.\d+)+)/"
 

