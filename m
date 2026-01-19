Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F6CCF2C6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:29:19 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31590.1768811352834424317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=helY6qX5;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f39438187so2161556b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811352; x=1769416152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj18Hryo/XTXpacrDoE++pTzLljZa0BaiYnjiZ39Nh8=;
        b=helY6qX5vJLVC6PHOMiiFosx9Y26gZxy93vmqVXM5aDKSTgfkqbQdjj1J+b5MSnz4p
         vQdwgmPExIXPyaSN55tD2PcBgn54RkVFTb2W3fpGaMFKynfC8c2JnIMVTRceh11PdPls
         NB/wgRFqP0R2GxO+Tem6eg8Z+ZcWKAuw3QWxM9LFlr4yqHYEADF5bHKP2eiVSYkVXuCi
         7iwNjOLanV3aMn2jG48oqGy75mNZg94z6vFMLAyzUdypnboJ7m/og6q1sZTpivi9vRQM
         49tr16we3A2zUZE/ib7fDh5kpsnuAlas05Gsq4SVwig2lf8pUFrWI2yRJaF54q+H2/O1
         ESzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811352; x=1769416152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pj18Hryo/XTXpacrDoE++pTzLljZa0BaiYnjiZ39Nh8=;
        b=Ul3sGJaHhc7maSVCYKXTl+XNoPiM9skLDnxQ9XkmdQiWhIG4MGA8T+wWE2R8FjO+6P
         Y4lLKZr49vXRtqcQZoWKeQozH6qzY7zPJEvJ3oTD+3wUZ8TiralkTTVJTc/LuAJt1iZK
         /Pkq2Zbc+5StDP/CQZjZhdOqQ1ukY39soK/aFxfiT5suxVkrnOB+fnLehloBQxhICMDz
         j8SJpSZKaJiF9QKoo7l2jKL2igtlxp9MNqgDNLjj8hAZpULyeBbO9cLmw3edXkh2gvhU
         mZ9F6PdqGURaC0IjTuBf257uHcYX/XXJTYaZD6iamMkGl87pbO5IzAtN12qU0v8GT9PD
         83nQ==
X-Gm-Message-State: AOJu0YzvK1OvhkP4JXNvQi4hJLvFI5swx0vx4tCNe1NVggLYt0a6lMQj
	MtZ7DY4wtxmwdbnpgSF3Brp5WKSBg/mBk1dX+HKuBdj7Oqcn4IskR7n7XitJYw==
X-Gm-Gg: AY/fxX71G4FA+RhKjqeGnn/OQ3oYn9NJoLnA0pBt8K6US0u/aGx7+PI7W/yPe3DctoM
	rxmrX5xvJyh5cGt36EDDUmESJWA0iA4ELLJJqNEDMhjVv42YadZCSJOv6GqDkhbK655/TVaMPkE
	6eWD7Dp2iUboWbxThNjHe3glBI3Zngp6zndzufIgsbzKxZ8d6mQpSnIj6+0AHXk6I86OeXgLByi
	gp4U8JZJCCed7Fdiz5ngG6mKrEjRIvSaIbrXiNNiBxbBvZI6Aue+/tbCSOVM1IpygrOxGnW+cJt
	9Z0lbrTES6zsI2iPyclYDePSJuxmFtYJoyGBRAfyXDRvHICBzBYevNG4xpYaSO3uWw9xLJUc+5c
	19HKvqESfyKyqRTFHWl2bdGEr8Yv5jqxjrHd6UPD1hLu48isPCiUwns1BO7mY+hZY6YzZJ6UWwv
	9W1fgvwDixT1bv8nHnmsjHTiVhAwzjz8suMQ==
X-Received: by 2002:a05:6a20:938a:b0:341:262f:6510 with SMTP id adf61e73a8af0-38dfe71c779mr8851769637.41.1768811352006;
        Mon, 19 Jan 2026 00:29:12 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm88002455ad.68.2026.01.19.00.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:29:11 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 27/28] lmdb: patch CVE-2026-22185
Date: Mon, 19 Jan 2026 21:27:49 +1300
Message-ID: <20260119082752.4120991-27-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
References: <20260119082752.4120991-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123621

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
index 065c8559ff..29bfbb81fa 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/LMDB/lmdb.git;nobranch=1;protocol=https \
            file://run-ptest \
            file://0001-Makefile-use-libprefix-instead-of-libdir.patch \
            file://0001-make-set-soname-on-liblmdb.patch;patchdir=../.. \
+           file://CVE-2026-22185.patch;striplevel=3 \
            "
 
 SRCREV = "ce201088de95d26fc0da36ba805bf2ddc2ba74ff"

