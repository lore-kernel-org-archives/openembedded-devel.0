Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id D4E4E6B41A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:15 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1255436eek.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=2g5WxcoDdpuxc5uiioPLBDUrLlBSUKGYxaLfxhVJpJM=;
	b=HkRodCEXfHCZPl55YUenDpKBa1BQafJKOVUmDROAL0xZit9xskm3Ylys93h30ZWgpc
	3nLgolKmhB4RqmxaFZQ6yoz0CBJA/PFgDQS+nIpbBhsCvAAeMAdfQHP78efuyLq/M2TF
	UsahQQ8T1oI4mdnkktqHtKjxeJ7eSf91GkmAQJCC9TgAZYIvuwGbjkDK0sTIu3Gc72FL
	4qCTrk3G8ktVJ/iRqGqYYd2ZrLAxVuj9yMnzyNgp6cqr9iOjUHOWGRkxrcQzN1PP1x3I
	Tj+Fm14gkvSz+FX7JRa+N07vwicYrK9XMunFx2YOy3MEAAv9e5A//EUzgRlRI4d0vmkT
	D6vQ==
X-Received: by 10.15.67.131 with SMTP id u3mr14236248eex.34.1375652836053;
	Sun, 04 Aug 2013 14:47:16 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a4sm28819238eez.0.2013.08.04.14.47.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:37 +0200
Message-Id: <1375652867-10498-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 05/15] claws-mail: add curl dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Aug 2013 21:47:16 -0000

* it's needed by libetpan:
  | configure:20812: checking whether libetpan-config hints compiles and links fine
  | configure:20826: arm-oe-linux-gnueabi-gcc  -march=armv5te -marm -mthumb-interwork --sysroot=sysroots/qemuarm -o conftest -O2 -pipe -g -feliminate-unused-debug-types -Wno-unused-function -Wno-pointer-sign -Wall   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c  -lm  -Lsysroots/qemuarm/usr/lib -letpan -pthread -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lcurl -lgcrypt -lgnutls -lz -lexpat -lgnutls -llockfile >&5
  | sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.1/ld: error: cannot find -lcurl
  | collect2: error: ld returned 1 exit status

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 8368498..122e130 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -1,6 +1,6 @@
 SECTION = "x11/network"
 DESCRIPTION = "Mail user agent"
-DEPENDS = "gtk+ libetpan openssl aspell"
+DEPENDS = "gtk+ libetpan openssl aspell curl"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
 
-- 
1.8.3.2


