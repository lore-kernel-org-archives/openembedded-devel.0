Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48610107BCF1
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 00:50:04 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1814.1773449402888934962
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 17:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I5fs7ia3;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2aae146b604so18049335ad.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773449402; x=1774054202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UhJnnduOjygcvmLt3q+c9TzZgMf2cJJDtwcJQU2KIac=;
        b=I5fs7ia3ndVXjv3136YpUd7P76wnsOJJqgXb7GADVT41dzbvtvPA0V2JcRXBMo0Pul
         UcfWV0lE4iYNaNQ3pX81UxAo3sfSnww4gO12IIUiuhSwTG+S+1PpcSp+Yv/FwgsWsxra
         7YGQiXSm+xuvUwjBaQMBdOhz21ge5A373NIqtR+qRvcLx2RqWFbWP22vn63laDVHTC5w
         Kf3QwjDAUv1OqfxH+npc5dr6vJiQgO5r0b1fU9BZWbhQEe64UHkbo2MPvCsIPwuhYEZc
         CaD1/ur30X8PNMk9TbWtPhozJI8Sm8YoQv8oq6QKklhcbfqp1By/nMDbONV2frtQwcgX
         28/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773449402; x=1774054202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UhJnnduOjygcvmLt3q+c9TzZgMf2cJJDtwcJQU2KIac=;
        b=MKGjK/K5WOstR7pZDSfJAq9TjS+CvpvDKmBLxTHf2IRmg6hhp4GVnSXn5ZBzwAOiP1
         modw7Drva/aezFQWYB39ajqE0Y2R0IbRLYfwKwP/QUO02TOveDIkN00mb8ntJwAfcRgl
         jxph0/y2mjeNbQHaUS+NohBLaOdP1U4Q9KMeS9m0rk/5Uvyc0iHC2REXLwjsGfoavAIO
         Zp8G2rPiy0oEBq7rWViufL5+ivmJ66EuaPJuGB/VCzGPRBmgFDhtwixic6Q8VvzZuLbj
         1dm8GBxD8T/J4rDmT+PZvyv0y7cBRYqhJS9DPmHshFfNRB9ECYc8BpXQUCl+CFG47Hvl
         3mmQ==
X-Gm-Message-State: AOJu0YymdpPsUvY0puHkISM+ftWzkxaswqdhOtvwhI7lGM+6K7nhARXK
	f8WdCeX2MsZh85+dhsYWTvzvwL8BU98jJRf8TOqFlg0IyWdQmbJKGRy/TADrRA==
X-Gm-Gg: ATEYQzx8HHciE6YnX4wk/+U7L7zhQuXdt/TGHA9WKK43c45MLB+vhsa1zpP29J46LQe
	H5cg5VRYk3CB080MTO9OgFwh8jKbsKgCr/rm9YfxwNOdL0vWCqsmYPHOlhNCUDjQ085QvAmb3qx
	bS9yhj5v8yJzOGcrRrFmU/OXh8bxzzv53csGzTlqAoadl1HTbFMHgVpsApi6z/uCPwvzY7qKiqV
	NGYDcZQIMfcUnw3OVPcchcvps3zNuGP/jEV0vAT46hAjUwKc5hYoGRmNer3nH/ArrIRC3i+4z8L
	kaBBUlPS7kIlzgtxXm4Kl7XNgU4xsRP+OaC8bnW5NiDd+T+sMSVzYiuCdsZP26vwYImtX63buZg
	o7sB3jH7sHaYRTWJGrEY0uWiymUV3H8Rp5moce/CHH3m2GX/mZdVGQu8WzGsp7bDpu5+9cuZbMm
	p4EqqXRiofdCoU22cSbDgrVqBNePc2wNNTeNs=
X-Received: by 2002:a17:902:ccc4:b0:2ae:7fa0:85c5 with SMTP id d9443c01a7336-2aeca9a120emr57679985ad.17.1773449402127;
        Fri, 13 Mar 2026 17:50:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece838d3fsm46873695ad.77.2026.03.13.17.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 17:50:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 2/2] php: upgrade 8.4.18 -> 8.4.19
Date: Sat, 14 Mar 2026 13:49:45 +1300
Message-ID: <20260314004945.317114-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260314004945.317114-1-ankur.tyagi85@gmail.com>
References: <20260314004945.317114-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 00:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125196

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://www.php.net/ChangeLog-8.php#8.4.19

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.18.bb => php_8.4.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.18.bb => php_8.4.19.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.18.bb b/meta-oe/recipes-devtools/php/php_8.4.19.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.18.bb
rename to meta-oe/recipes-devtools/php/php_8.4.19.bb
index a9be742317..4a5a5fa5b8 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.18.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.19.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "586b32d92cebcfbca495c5f6ad1a33640553d0a9c0bfd2e6715334d959cf9858"
+SRC_URI[sha256sum] = "bceb7798ed37b442fe523ae7ef345ccc2231db0b022d30735c2e378d3254a0d4"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

