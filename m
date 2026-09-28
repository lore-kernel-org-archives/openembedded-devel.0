Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2EDC9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:24 +0000 (UTC)
Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46612.1790553793812603716
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SDKArR2Q;
 spf=pass (domain: gmail.com, ip: 74.125.227.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d93ff61046so12438365ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553793; x=1791158593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5/xIMnAgGfL96MOb4h2ML7NyJ/K9HSedmtKRXipWNI4=;
        b=SDKArR2Qo/igPtZSYyr+KlyJghOwTCEUqVZedOIwMxuib61bNQ5eSGfiyJAhSVwdfO
         uR++pgYxczCq97bfCr2TFih2TV+VoE1mMtGlR2PpTuArCYOkvU8yWcYrkSutbzkCUozP
         U+kprhWC8w/tHGfDUBJAFEMNnCu9EtDae6PEe1Le9QkpEyxH5JdumXO2slU+S3vwJznF
         FZNpi9S1iuqVJqPuQ4GjP3yEE5D3Ljb0R0BtvjRmZOZq1I8MErGr34mhXtglZl7TgWbI
         73C1JWs1x35kcVy5e3TLgSVu4Vljsu9rs5M732t+XQs4TkKC2a4HIajqiJ3vfgNTauZY
         OSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553793; x=1791158593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5/xIMnAgGfL96MOb4h2ML7NyJ/K9HSedmtKRXipWNI4=;
        b=ObY2BXzx33TRteYsTxRY8WJRn/U2vSNHXaD2YsXmJvqKWLGr4WNEz7S5Ats2zLmqVk
         rVKq0Ir3is9iOgYPWZRbQoOJp+V+8X5FNDSDcFK0ozO0VrCZrAwWE7aJFYh5o0yMTF2f
         tUEOcSe86aQiAYxIACUPvqG875ZcDpfaAm2m4PI4vN6xf5i8QhGeDEdqKpssxf5BV0NB
         Dh/jsRMQ2DYcOf9fo4aaCo91C6KN7/FQZ01lPnu9Tv1fIH8Sp5giVFAph4onkUg/bloZ
         60QthhlnCnJtEGVUPV4QJlbE9XgtXR4GyCcwtEXcjsfR2opEUrHnwRmP0y0ztD+7ywmO
         Hi/Q==
X-Gm-Message-State: AFq9FYLh8YNLZHNIDnq4CZL4P2mS8Fi4h0LdSNYHdY1ZSgiuwBCAxH1F
	ET7oUGsAlNRoPZbw7NZ42oYmbz16iT4TUTlSYmBCk4PHdqCE12QvsdnUsehYIg==
X-Gm-Gg: AYBFou25jSZeaMiXExF9NaBQpAIfgLnyFOSN/81WLLxa7JAQXesRYvcXxlr94DxMPea
	rlS3cQIzyqJ2EUtvIjsSSk1KDC1zkFzH3oQ7x8Dvy8i4ugQ3zZjoh/S1Q9PHx6I16Zeg+q1wlPM
	Foq8+fp70U/R5IwdRAyTxgBC7/Hb5Qof9so4On0AP1cYmbgzTguAsvcaQFDXi8FuMpikkiPbt1W
	eFDNJHCxjfE6qgKFYAtfzgl2GuUtZe3yb1zDLXQwaaPvw0ikUnLXm8KtSHVv4hGmRrke/gahz8K
	Hj9xFkK7aE5Vnux4oq0YOoJhfFF4KaxuRLcyNoJbMbz5SOCnyI+yBdh7u1Xxrhx6hdv6Gbeel7I
	JH7Mf44bUaJ/Lg6wrnvnkANghrrFIi5nhK0btxfTOP0rpM3/t3KC2pGC2optT1f5OJbPmA5TRkD
	0xSMIzyT8UU7hQMFDmqk2MAgk9d1y90UvWwSzX0DEanlirVMZW0bQdAmrN+jcBdNzGYXx+VOlNv
	mu4PmlFszrH9iGWGccj7ZDoy86gDTV4vQ==
X-Received: by 2002:a17:903:1aee:b0:2dd:c100:313f with SMTP id d9443c01a7336-2df7e25a740mr91738645ad.59.1790553792971;
        Sun, 27 Sep 2026 17:03:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][PATCH 3/30] nginx: upgrade 1.30.4 -> 1.30.5
Date: Mon, 28 Sep 2026 13:02:35 +1300
Message-ID: <20260928000302.2528437-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130390

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://nginx.org/en/CHANGES-1.30

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.4.bb => nginx_1.30.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.4.bb => nginx_1.30.5.bb} (74%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
similarity index 74%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
index 7b24e05f0d..4dda52c62d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
@@ -2,7 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "4261dc90e9e47c1c4041276e9aaa3d48ebe2e664f728e14fa95ae6c67d57a08b"
+SRC_URI[sha256sum] = "6c20565aa2325cb82216ae804f4a4ff1875179014759a381c42ddc8e11c4906d"
 
 inherit upstream-version-is-even
 

