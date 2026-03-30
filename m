Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D2AFB3D05
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:39:29 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48202.1774867162175599552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ky+c7gSp;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35c2fe0d90fso1645291a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774867161; x=1775471961; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dydVkOfH9d5qL157Cm/Lh55CpYtKK6lRFD2Gv9d8H28=;
        b=Ky+c7gSpPBFtuJJFfeAblH234ecnR8HPWZGuPtELzNIasX1RJBBWh0qhkFe4fxZbLK
         2dFwBkH+7TtORA2eYbItKs92yazJ6vHPb0UYHL5yYFIqZbQHjqAFcpL1+fl/uRU4z5PO
         Va3IHE8jd3+ORP5nIC9UQzyvxa8Oma7Jpl2DkguavK3llVEu5maW6wMiiKE/ce6QOe28
         PuCy5lisbK9C7OkmhhiSct3/KebS4nGMGXG+/UekNldYy//qOXD48ZfAUxKnMpIlVhaL
         UkJuuUnw1w0kjsZFp7/z7TYS9Y6V4XYj7y38HVG+ad2OO6yXA87ymjE7aNWk4t3ytqTB
         jMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774867161; x=1775471961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dydVkOfH9d5qL157Cm/Lh55CpYtKK6lRFD2Gv9d8H28=;
        b=AIVL4JAKwHlWghZckJOrkcPh75hLIbIndBMDOCec5b7DEYppdeyHWa0tWYw1LNqPyw
         kn6UgAdBU0vCDh63AK97ptmbLaKygmOsGJtulUz/StGGayHfL2zn4/lucGiV9SO/Ol4p
         XAfOh5IW/1foCUV+UZCO5Tf7e1pYX/Z3UO3V4dLUEqSAghgqWpLJdO+L83xRP8Zn09GG
         eH7WNdNC6muU7VAW2vnRYQdNtbMnP7wUVYADcBAOAw3TceIEnLRCgGjXwTjnNH4hYSc6
         7Ey3eQcED6yRhAwMnHBPdFqCNeKIQ72b299YzSpVxQprvYgkM8KsEiEnjAVst1GngTat
         /psg==
X-Gm-Message-State: AOJu0Ywg9kqlgPAGwCk6ZMNEYC2YgXLfQUpBQPF4n8rvtlc7zR2mwg+K
	wpiIBCQBW4WBetOOWZ5hqTIiTk4pfDxfn+TXbmr45BYBtiLJIp7fFyIi0ZIORA==
X-Gm-Gg: ATEYQzz55K3YwwE5oRQG0n4aKnydcb/IzfJfL/MkH4pqSqU69DQtIzhiKtaknXK6TMh
	y3d22a+emHxHl9z3142slMLK8y4GNIDyYy0fdfnvFa+XdtXUPV0xUvUd29ty/BeUn7rmd+xi0TK
	XKbQyPE12atNEocAOUCvGeYHH6phw0xP3U5sGd79SXdYqHcS+4vYTCzHSUdQ+LC8khPCl0Sukyc
	HujLXz9upfi9hfGD0CIwyXrbUkZ2IHK0U2nYBuitHko81+l4CWAl/U8EtwXlvrj99Ibr5YDdy5w
	R0ypZ96LuwHSg1HXKoDq36i44ZxoKsVdzVYG3Pxn47swPBGq6D6uXLjVPNJu98tYOPn3Gt5SqWE
	GNpCjhpjaOe4t8D9kh35AMCuMK8cDDdNRccXW5Q2Q6LHB1NMMSNhV2nFFzsklzjMZB1LzHE7HMq
	L/G31FnVppMmbCn1zsJXZXMOukvyEDkjc+zw0=
X-Received: by 2002:a17:90b:3b4f:b0:35c:cba:3453 with SMTP id 98e67ed59e1d1-35c30076fe2mr11820530a91.22.1774867161199;
        Mon, 30 Mar 2026 03:39:21 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507dc3bsm6831652a91.9.2026.03.30.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 03:39:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 7/19] nginx: upgrade 1.29.1 -> 1.29.2
Date: Mon, 30 Mar 2026 23:38:34 +1300
Message-ID: <20260330103846.3381644-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
References: <20260330103846.3381644-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125850

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changes with nginx 1.29.2

*) Feature: now nginx can be built with AWS-LC.
*) Bugfix: now the "ssl_protocols" directive works in a virtual server
   different from the default server when using OpenSSL 1.1.1 or newer.
*) Bugfix: SSL handshake always failed when using TLSv1.3 with OpenSSL
   and client certificates and resuming a session with a different SNI
   value; the bug had appeared in 1.27.4.
*) Bugfix: the "ignoring stale global SSL error" alerts might appear in
   logs when using QUIC and the "ssl_reject_handshake" directive; the
   bug had appeared in 1.29.0.
*) Bugfix: in delta-seconds processing in the "Cache-Control" backend
   response header line.
*) Bugfix: an XCLIENT command didn't use the xtext encoding.
*) Bugfix: in SSL certificate caching during reconfiguration.

https://nginx.org/en/CHANGES

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.29.1.bb => nginx_1.29.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.29.1.bb => nginx_1.29.2.bb} (77%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.2.bb
similarity index 77%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.29.2.bb
index 0282388817..bc98f638fb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.2.bb
@@ -6,6 +6,6 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
-SRC_URI[sha256sum] = "c589f7e7ed801ddbd904afbf3de26ae24eb0cce27c7717a2e94df7fb12d6ad27"
+SRC_URI[sha256sum] = "5669e3c29d49bf7f6eb577275b86efe4504cf81af885c58a1ed7d2e7b8492437"
 
 SRC_URI += "file://CVE-2026-1642.patch"

