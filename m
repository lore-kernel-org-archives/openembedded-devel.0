Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 068CFC9831C
	for <webhook@archiver.kernel.org>; Sat, 17 Jan 2026 09:46:29 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5753.1768643180599492718
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 01:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MW3oqyE0;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a102494058so18975365ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 01:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768643180; x=1769247980; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtwTz01RfF4ZMsJckDzCz+VTj2iNfnwKwo6W4EHDpjQ=;
        b=MW3oqyE0bJpe4C+aFwJV/+Aydobg4xURPkbxnn3wxPdrMyiOXExnNGM4zmlncGJQXq
         knZPwTtAgo2rs9So64GLEm8UeCh9PfGqzPbpQusaSht6AQXe59pzwlmoYWqBqdpErwmA
         uI/K30sumRmvC+0pTe4bk9zrYY3ICVJwQSB0rORwtnP1VMhWH6JeCkR/1tZGwtPftS2O
         eUIQewgRb8ctdpf5WC39fnJYNQOVvfAzKEJYfBPPAU6f3EwL10RP6gRTedUAeB8SeG06
         lWglca31Xaxx6UZs+pBzk9DAajcQCi3VNeOUVnaX5yQxh57W02ZFv3qsg6KuS+5/IxIU
         Luug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768643180; x=1769247980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JtwTz01RfF4ZMsJckDzCz+VTj2iNfnwKwo6W4EHDpjQ=;
        b=KtdBQITOjWeVsX6LR95bp3FPYyejEE8drCCpDaywdxe8GwPiUJMzmGCR7tBYqS+tmj
         RzIT/p+jswrbauu8Mjkq4zpeh+egrdmJF35If9PY/RLLBwtH2WSSlMNc90DH7WtWl1re
         rTjOilQQnzQgrPbvuuxzgKmGeWLhAh+FNizD2g1wzBIdL4vMGT5feFZIfnHAWi8SazF9
         iZjGbl+RDC648kLb+qHOuaVDgZ93qd1T7LcA0E84VF2eV6LNwlVhjpT2HIBFZSejkuN0
         te+YdBspc80g2Lkl7IZQ9jVTVNKXcgLhK8wpMepBIitfduUPyG+6CZuRUEF5vwuglC1z
         X4VA==
X-Gm-Message-State: AOJu0Yxba28CiYCTOK23FVMQp0GnifpwMiyL31EKcEFY/DxG5ETsffXL
	wPhHlIzE6Cggr0knNchK2mW/GnshLv660bdS4FYSVQARBMMgLYCYSseSg7A1M0nN
X-Gm-Gg: AY/fxX5e6SNNFr4i5v1EZveYC3A3H5sSBbFMfYrHXYRvpa1W3WA0v8kfbu3YMtMBzkk
	olEAYLXSg6IQwcC4Y+hBvRSfLYczZlK/mXJ6W6cE6EekTgy6eFzcwTHHZUIq1deDa7jmj3GI25A
	QTS2u0Iasq6ODb1TAiVeJ+OVDE1PLSoh6JrerR3dE15aIBd1CgG2OscjXahWdb8qO9fuO5x7eEf
	+aVK7YV0I249XKtlOagYacQxlf/8ByxjxZE9ZyaDZOI5Nzo5LiVBuLlhBjGGaMRxjiA17OclOLd
	Rsn6LlJZjWZbqCe3N04EB87hYD6ptxjloaue+ogkLNK/Eb0UatP15caMav4lfc/D61cmrUorTgp
	Xmqb7VEQW/0YqTiZljheH9KOA4h75ANqKO24FL0bMlSeJfuaA+RC55wWCSlEYeY3BNcSxeBXbRv
	JODU2oPDaMfHr4PiIlDAp0V/8=
X-Received: by 2002:a17:902:f686:b0:2a0:e5c3:d149 with SMTP id d9443c01a7336-2a71780a3e3mr48743265ad.23.1768643179810;
        Sat, 17 Jan 2026 01:46:19 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190c9ee9sm42289845ad.22.2026.01.17.01.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 01:46:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 6/6] lmdb: patch CVE-2026-22185
Date: Sat, 17 Jan 2026 22:45:35 +1300
Message-ID: <20260117094535.4191231-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
References: <20260117094535.4191231-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 09:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123552

From: Gyorgy Sarvari <skandigraun@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-22185

Pick the patch that is mentioned as a solution in the related upstream bug[1].

[1]: https://bugs.openldap.org/show_bug.cgi?id=10421

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e0f86a4a7f8e413c682fbd4a9c01b12b0234cd71)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../lmdb/files/CVE-2026-22185.patch           | 31 +++++++++++++++++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb       |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch

diff --git a/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
new file mode 100644
index 0000000000..6c85b2b8ed
--- /dev/null
+++ b/meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
@@ -0,0 +1,31 @@
+From 94ca20e5aed5d8730e045bb945fa3485b28a7981 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 6 Jan 2026 20:52:25 +0000
+Subject: [PATCH] ITS#10421 mdb_load: check for malicious input
+
+From: Howard Chu <hyc@openldap.org>
+
+CVE: CVE-2026-22185
+Upstream-Status: Backport [https://github.com/LMDB/lmdb/commit/8e1fda85532a3c74276df38a42d234dcdfa1e40d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libraries/liblmdb/mdb_load.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/libraries/liblmdb/mdb_load.c b/libraries/liblmdb/mdb_load.c
+index d2a3cec..7eccf40 100644
+--- a/libraries/liblmdb/mdb_load.c
++++ b/libraries/liblmdb/mdb_load.c
+@@ -208,6 +208,12 @@ badend:
+ 
+ 	c1 = buf->mv_data;
+ 	len = strlen((char *)c1);
++	if (!len) {
++		/* This can only happen with an intentionally invalid input
++		 * with a NUL byte after the leading SPACE
++		 */
++		goto badend;
++	}
+ 	l2 = len;
+ 
+ 	/* Is buffer too short? */
diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
index b2f1920f6b..0d06c74602 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
            file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
+           file://CVE-2026-22185.patch;striplevel=3 \
            "
 
 SRCREV = "ce201088de95d26fc0da36ba805bf2ddc2ba74ff"

