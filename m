Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91280CCD184
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 07:04:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1519.1760771088175599753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 00:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c5Hx8KoQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46b303f755aso26297765e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 00:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760771086; x=1761375886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkNVw2CmpXfvuLr1Yu6sPbUDgobF3rN9JDdJhsqqwqo=;
        b=c5Hx8KoQISJY5n4JhmYQJBsO8XZlJ2aD1qkDElsBpTw2IJeVBouUckzWK6MMswgyui
         JaYe9Ufk4EzR4uEyeCRc9O0bKsQGIozz0ElAwYsuR+SJF/0ms2gvqxsany7a9BdSwdXL
         VvY+eDlB1KavbM+4aNyCbEKdhdHeEWoi+U2KwassbEj+iwPVGtQRvAVWUDECdNnAyyyk
         1gXDaE6rcyhFXmYkYL4gKIpiDdVzToR+HJfLZ0G58NwHqr7JS4fC4AeGRlh+mJCoMRoV
         HY4cr2IkBl3U3/7xR7KqrMeRGeTyt6prGoosN7EtrQlOJQKHZ872AR0sw0fu+zN+SCmV
         Oa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760771086; x=1761375886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkNVw2CmpXfvuLr1Yu6sPbUDgobF3rN9JDdJhsqqwqo=;
        b=adpAnPhmFUPn8Nu8E5wRuqqI1XXpcjKbtkhv43oEpCzt/cPjGYtNP7wC5Jq/73XibR
         H/Y6UYDjpVjbXcKXJ/mn8m+LrnNpZ7Vk42QoaNuVaMvEmtteCJ2Bz4z/gm0hbJNYKagv
         BpGDTLd4Clu/cLNyF++ybTU40zUMGweslOdyq/5nN+6zJzrUZHLMZtDsseQ6j5sqAkfM
         muUlQxcxUy3i7NNKRCO2+2M6/TRB+l73Xn5854U+lbhpN4VDAqF6qIDia2+q5+vroyPa
         GFgesGNzaYdYWcv1e2QCOTuzc7t1Hi8DYqQNq4JNySa0GtQArwNXesgnkKWwRG70pnlq
         Kt1g==
X-Gm-Message-State: AOJu0Yx4/ppH+5ofsLA2RgV8oRZOzs4qfNi7Z5Uh4szoAQA6/M4VkLrq
	2ASDOc7qUpMl2TdMIdqMlMvQTrHYo0osuC+/y3ADuPReK0YSNTzJCyXFhWmGwA==
X-Gm-Gg: ASbGncupC+OYmGib5+B1BV0hxIMzY4ezWdN4AUUZXpI/m9PmrSvDG8mTcjd82TtZy/v
	1k1V4zrf2xMT9npzOlWQ4v3bYm9q5cA32/bB6NjizVGYNohcSZs6y3qFzTNH5+r5SvALrmdIe6G
	s2npMRa41tgXBi7FHNQgijd8h8Scvy0fz19HH3UcANzlox9MT0N+/ynqZmeOUGOe3LVNpZlpOCx
	p47M9Ma2YVYtYluoctFWsXqQSPbx+StaBlPWtFLkr1dTn8X6RXyzUWZNT36FH8IKsx63D8hw+oT
	SP0Ulf+t/Eg1KKRqrAZf2YYcrF+n4Yw3PftZYr9Zk39rYNqjmUplSq7IrkV4IzjmcKlcZK2JDC8
	2beUFHvuzAYpxQK0bIatH+MjjJM4trvPKl8gfR1jmj+vzbmis/bvLM5YeZEoiXRVipmD/6VhwyA
	==
X-Google-Smtp-Source: AGHT+IE4bebqhNqcyPCjSl8dYqVP18Iqmeq9aQ9PoMf7KlJ9i9Y6917UwFWGuEgcDIHd0uJbdiTdVA==
X-Received: by 2002:a05:600c:4fc6:b0:471:115e:624b with SMTP id 5b1f17b1804b1-471178aaa72mr40630325e9.17.1760771086058;
        Sat, 18 Oct 2025 00:04:46 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715e4e267fsm12988155e9.12.2025.10.18.00.04.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 00:04:45 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libxml++-5.0: fix ptests
Date: Sat, 18 Oct 2025 09:04:44 +0200
Message-ID: <20251018070444.3231537-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 07:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120781

The recipe inherits the ptest class, however installs no tests nor
run-ptest script.

This change rectifies this.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest |  4 ++++
 meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb  | 10 ++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest

diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest b/meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
new file mode 100644
index 0000000000..4f54f90e09
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+for t in `ls ./*_test`; do
+	$t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb b/meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb
index e4fdac2c2c..cd16ec862f 100644
--- a/meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb
+++ b/meta-oe/recipes-core/libxml/libxml++-5.0_5.4.0.bb
@@ -11,11 +11,21 @@ DEPENDS = "libxml2 glibmm"
 GNOMEBN = "libxml++"
 inherit gnomebase ptest
 
+SRC_URI += "file://run-ptest"
 S = "${UNPACKDIR}/libxml++-${PV}"
 
 SRC_URI[archive.sha256sum] = "e9a23c436686a94698d2138e6bcbaf849121d63bfa0f50dc34fefbfd79566848"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
+PACKAGECONFIG[tests] = "-Dbuild-tests=true, -Dbuild-tests=false"
+
+do_install_ptest(){
+	for t in `ls ${B}/tests/*_test`; do
+		install $t ${D}${PTEST_PATH}/
+	done
+}
+
 FILES:${PN}-doc += "${datadir}/devhelp"
 FILES:${PN}-dev += "${libdir}/libxml++-${@gnome_verdir("${PV}")}/include/libxml++config.h"

