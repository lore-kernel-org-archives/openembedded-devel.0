Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A05CE63F14
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 20:20:47 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5801.1771186839748536917
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Feb 2026 12:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cm4vKj1L;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79495b1aaa7so23687767b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Feb 2026 12:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771186839; x=1771791639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0H10GMmvbQkW2jQbVr4xtJsOIHqWwpYTbWC55d0bsVM=;
        b=cm4vKj1LnGqEJqScrjkmjRm/YWC/ZaaaizYmojHfaxOlh63KOxZ9hBCUTvBCyrdUXH
         ikUyIvgxo2kZXUvq70cI+eFgWGmx1BupSxHdFXritO4qUudMFjpi1Qoq2EwXaL1tN1S3
         co9sUExGo/nGkd6LzR6HOhH92jA55evZfggeL2iAxPPYKdEbAJVpifkVUrsYTDJU84ua
         4J+WQHrGcUgMx5EonILADRn6BVF7mCki/E84guSxJTUcPCGu2oQwO5tR5mbgHQHiORxY
         nJF0OLNFXonwhJwTpoVWqAGopyt+a1cU8GhsVZp25QHDH2heTXKQhIXVn7Uc55DE7v3f
         g7kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771186839; x=1771791639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0H10GMmvbQkW2jQbVr4xtJsOIHqWwpYTbWC55d0bsVM=;
        b=EJX0Zut5OAV3ftk2LkWLDg6H1M6cScLwVTeDMWDgn5uxhFffB5lkAvC/tHmeIoHugN
         xn9VDNB0LXI6vpg2SP1Xy9lozKA2UXsSdRQkDWjGPLNDB7kizxF6zX5DhUcw7Cs9AnI/
         /zAaBiOeYvCyxCNeY8t1PjMSPLvoOmFYhgZsKE/BGYzdKnMEpOD//Kpz6fZJSNeupSKX
         mGt3P9tgQHFt8BAvbXZ03nnyCTrlQFQEVCiGD3Mg203Uks0WsD/C7nZNmxsFZDWAaAtt
         KZZ1evm9BQf32tXLzeqSiN/0bR+83oi7slHaDTUPOHSD8iS/WivNHLIDPgQ2xHSNAC0O
         46zw==
X-Gm-Message-State: AOJu0YyVQcx30QmQ78MaPCpeiMllxmQA0BZDykOnbxBZw1sqejyflstO
	oLeM4AO1OkSTx4yrOetiUR/8wf2pQLdZD8xFNiXcr4xFgGDkRnLqNKY0ziQgXD4n
X-Gm-Gg: AZuq6aKq+EZoznrtR/1KdCyLgeuuGXnzyS65Eivj1NKgNI3ggVy8TTFI2SRgLN2Jd4O
	IKl90fIozslcgp24uxLM8weyO/svIPOwIkLYHbSB0xMnecHqABs8hldtEao0Thqz9eOMfZnjv5T
	z+1p80C4dJul71cmsOikQU+kZhXYx/2bxnVYh9/8WbRLzpr3hZfWYN1asiAW9QE1rLopsCzuAgq
	SQyaDcvJ1lFfj4kQZIcTBjFiFHKQuSqgH1patyWglFW2gjldpz3XD7l7x8NqCVgn1MOKTYS5wpm
	bIYBpwSGzgeh+9qV9x3AWe/YOnXS62buunxYnfKQ8WtgW2G+SSGeBoTXrfn2JFnEqcbjWSYa0Vj
	NE+xR0odSj7FcxgW1XxdGm7cvHbKGLNs9YB1NpKH0muFdSabjSSCpS+4jf1LQR8EMxdO5Huc/F/
	StlR40NRPHdDY8P7av8DJxdmZZTSmVQv8i1PHl/kg0c9hsYjenTTdA/iy+dNaJZc+tz7oAHBxrd
	dnOA15mzlqPvwr1nTThVLlRco8HYE8bDYgx2Guo5eTUUPgPHsF7zfK5mYtwMg==
X-Received: by 2002:a05:690c:4990:b0:797:afeb:de55 with SMTP id 00721157ae682-797afebe4b0mr42453807b3.32.1771186838565;
        Sun, 15 Feb 2026 12:20:38 -0800 (PST)
Received: from localhost.localdomain ([67.233.59.72])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c254d82sm93309137b3.39.2026.02.15.12.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 12:20:38 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][whinlatter][PATCH] php: upgrade 8.4.17 -> 8.4.18
Date: Sun, 15 Feb 2026 15:20:23 -0500
Message-ID: <20260215202023.191218-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Feb 2026 20:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124407

This is a bug fix release.

Changelog: https://www.php.net/ChangeLog-8.php#8.4.18

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/php/{php_8.4.17.bb => php_8.4.18.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.4.17.bb => php_8.4.18.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.4.17.bb b/meta-oe/recipes-devtools/php/php_8.4.18.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.4.17.bb
rename to meta-oe/recipes-devtools/php/php_8.4.18.bb
index 72901f2a34..a9be742317 100644
--- a/meta-oe/recipes-devtools/php/php_8.4.17.bb
+++ b/meta-oe/recipes-devtools/php/php_8.4.18.bb
@@ -32,7 +32,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/php-(?P<pver>\d+(\.\d+)+)"
 
 S = "${UNPACKDIR}/php-${PV}"
 
-SRC_URI[sha256sum] = "ea67d83d72dd6f3abaaeae7f532f78fd12192861d96aba8e9eca3b2ddade42d2"
+SRC_URI[sha256sum] = "586b32d92cebcfbca495c5f6ad1a33640553d0a9c0bfd2e6715334d959cf9858"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."
-- 
2.43.0


