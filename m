Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2B49A73181
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:25:55 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 133so15300810wmq.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z/dw7zeDB4yCBFpC4ZdtV6qtja9s0iwumgK8lNbfNQc=;
	b=ttBSiGgV9+rsqnqGoYY7jR6cjz+N7/xdfvIiCpJIMzk5CUCR7tp2nCAxKsUvUBsn7f
	YJQLsyJBGCx7UcWzbs7eCC1gzYvogkXXKaZMpgYbd1aEN1bfB0fuanxQMQCSv54zkcvp
	1BjHXeZ7TnW2PyD3Iu6MfjOhbXpvMlaajkwCwNrHh91g44XKrHY3rNIJ4EGk3LqMWYfi
	mnhzewqfXs6DB1N6FsYnWAQyV6yl94crQ+GqUcpMeDMUe+7ie/oLhy4GbPXxGYfwa3ix
	7s6VAy5w1rNy0KOw6hIDhqDkpBhML31p06ccNGMIZF257BtPhrDiM61oE75qka+n2a5k
	rwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z/dw7zeDB4yCBFpC4ZdtV6qtja9s0iwumgK8lNbfNQc=;
	b=cFlI2gMFdc5M6QVl2g4kPxjqXz4qZkPRiI7BogLp4ZKKGRQz2md6c1fakPPpK/dRBi
	cBTTzcAXib13tFF18Bb+nBfFMWa6bmIVd+1RQtJZSaFY0nkxQ+2AFG6FGsldLu6XU+1c
	qjRbuQiPTlAZ+F6GaZEjNjVCtqZ9Zn+y7cu3S5uQ386pnj1MEpYU+MAnI8NVEPywuVuo
	kWmjZxDQ7CXcbsBMMj7QGuk6Rj3nITY6+ZmgbaYPfprxJx+npNf/VtPm0F7MXfYU/ZPO
	Ksz1PdioXqls/erLfNQ/iJtWofTUed3xEY/L3SHy6oimR5jThAzZp1wKFQJKVw2AMa0V
	9ttg==
X-Gm-Message-State: AE9vXwOf9+B5gNoqACShcwXBqxB3bCK00LGHmApJPsZZ/LP/0/cYQ4kthinVbRxv4lP1eA==
X-Received: by 10.28.199.3 with SMTP id x3mr7387094wmf.41.1474295156294;
	Mon, 19 Sep 2016 07:25:56 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	b128sm22425212wmb.21.2016.09.19.07.25.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:25:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:25:47 +0200
Message-Id: <20160919142547.11541-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20160919142547.11541-1-Martin.Jansa@gmail.com>
References: <20160919142547.11541-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/5] chrony: add PACKAGECONFIG for nss, libcap
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2016 14:25:56 -0000

* fixes autodetected dependencies
  http://logs.nslu2-linux.org/buildlogs/oe/world/log.report.20160905_011801.log
  chrony-2.4: chronyc rdepends on nss, but it isn't a build dependency, missing nss in DEPENDS or PACKAGECONFIG? [build-deps]
  chrony-2.4: chrony rdepends on libcap, but it isn't a build dependency, missing libcap in DEPENDS or PACKAGECONFIG? [build-deps]
  chrony-2.4: chrony rdepends on nss, but it isn't a build dependency, missing nss in DEPENDS or PACKAGECONFIG? [build-deps]
* also use PACKAGECONFIG_CONFARGS instead of EXTRA_OECONF in do_configure

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/chrony/chrony_2.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_2.4.bb b/meta-networking/recipes-support/chrony/chrony_2.4.bb
index 4bc4ce0..a8898dc 100644
--- a/meta-networking/recipes-support/chrony/chrony_2.4.bb
+++ b/meta-networking/recipes-support/chrony/chrony_2.4.bb
@@ -67,6 +67,8 @@ PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = ",--disable-privdrop,libcap"
 PACKAGECONFIG[scfilter] = "--enable-scfilter,--without-seccomp"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
+PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 
 # --disable-static isn't supported by chrony's configure script.
 DISABLE_STATIC = ""
@@ -74,7 +76,7 @@ DISABLE_STATIC = ""
 do_configure() {
     ./configure --sysconfdir=${sysconfdir} --bindir=${bindir} --sbindir=${sbindir} \
                 --localstatedir=${localstatedir} --datarootdir=${datadir} \
-                ${EXTRA_OECONF}
+                ${PACKAGECONFIG_CONFARGS}
 }
 
 do_install() {
-- 
2.10.0


