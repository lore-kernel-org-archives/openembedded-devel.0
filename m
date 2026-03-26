Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ABB010A88C2
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:32:35 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51222.1774539149315865408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:32:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Y1U+ngZU;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso8746515e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774539147; x=1775143947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlIH3kP2G6WIt/i8RQ9q5duxSihdUOCh7gLVs480Wsc=;
        b=Y1U+ngZUEAzFh7asAcQE1CQhrQDO0vNX7BO7ZxaagygieJ1VkT5AFAObO/iYQ/rXSx
         3hoMF00FjIlLAGrcDjFP2cCNCnnVyThvnm9Ge3BrU0H6/MAyJqCisASUDl8W/2QAGwMQ
         t/4ncZQAz8vjxfqzRfhFo7glEGCgTQNb6I2szlXGVZQ6P8QMpilhuRRVu4zHAnW6Qxxo
         LuDOhYrLwdrbWCuR+cuH5dLFFALS7db5n0XxB0wIpig041iVIBYb0SBWirok//EVXPyR
         hS2XoEX4gLYVjaVEdlxWovyxhWQKb87XqcipWUYyRsB/AKmELW1PjHqo0PXHUdrTT9KV
         M9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774539147; x=1775143947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlIH3kP2G6WIt/i8RQ9q5duxSihdUOCh7gLVs480Wsc=;
        b=FpPd0/mJC2/jWUHa6HjfPL+X9V43Dk7i34AAr5znic4DK0+YOL2xsTeFp8UGnM1Xi3
         Wen/61X75tX+wZFM/vlBRRAIW80gt1uXLoZV4wd0aHToojaAh4xpqJZ8d3BUPYgWHfv2
         Q5I6oh5Neumx+Z+EJMzozzvZpFLvzh/TNywDeXNW1MRmZvQUUhuldslwSelUT63C7Cn4
         CKCyxzJsyTimhw9VQcoCwOka9COD7n8bBc2xZiMKRlj03H+bR85CJO25EeTR8mLaXLl5
         7Ge45kLpN/9YLZVED0yXtt7IPznsu6Fgv/GixlKSUaaK+ZahRUvSMtb4o5mxXLh/jMll
         5StQ==
X-Gm-Message-State: AOJu0YwkoclbMee0OFTPyNM3xRDmaQ7t8gk2dLzjwfiY55+cIG39hc4K
	kdAfVif36zyZA/Rwyb3BrgxoWlQCkmJtC4TnWmAt5vBkUL6rzUvFk0APGLlxGg==
X-Gm-Gg: ATEYQzw1Swn/MW5rxTNqnLQJ5V79FAqJMWYEUoTdjBoa+bxxwEDFGeNMBzMyEjkGT0y
	4rR6dLdEJwpD2iKY2uZw9Vc7ndzbJRjD0ucK6/lKppW+wUBNr7TQEcVJCr8M0xokcYZv8+2wSLC
	eFNcV5XPGp6Ilglk5AS/VnAy71T0/MIK4bVQzvHRbZF19BM5LcgoqB+OzTQCANKCfEocgWTZ+q8
	zivWMRifjqLJkVAqlEGV+nwIzX/utKYwa+K8tb5cIhXJFrrpM9lG5KD2VV0OpNQWzkoBUHWEf9z
	HIeJl4OznoqtaXdCs0VgGgeNreKhU0bcNOPLQdzmY7lpDHNLSGNFKMjb0DKL+/8agk4sQ6jPHsd
	q9/q7mo9QB7ccQq4moEWaO12qcmM70huGT1uaSD5EfyIAmRSZquBAxG5Xq6WxUqH+loYAa8YLUY
	/tf+HHe2fCJzfztg==
X-Received: by 2002:a05:600c:4ecb:b0:487:1520:d107 with SMTP id 5b1f17b1804b1-487160aa232mr119969195e9.31.1774539146624;
        Thu, 26 Mar 2026 08:32:26 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm66936295e9.1.2026.03.26.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:32:25 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][meta-gnome][PATCH 2/6] libuser: Support Python free-threading
Date: Thu, 26 Mar 2026 16:25:06 +0100
Message-ID: <20260326153210.2245962-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326153210.2245962-1-zboszor@gmail.com>
References: <20260326153210.2245962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125755

libuser installs its python module into the ABI-less
site-packages directory.

Move the installed site-packages directory to the correct
location if needed.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-gnome/recipes-support/libuser/libuser_0.64.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-gnome/recipes-support/libuser/libuser_0.64.bb b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
index 64b51e6c97..dbba5877c2 100644
--- a/meta-gnome/recipes-support/libuser/libuser_0.64.bb
+++ b/meta-gnome/recipes-support/libuser/libuser_0.64.bb
@@ -36,6 +36,12 @@ do_configure:prepend() {
     cd -
 }
 
+do_install:append () {
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
+}
+
 PACKAGES += "${PN}-python "
 
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
-- 
2.53.0


