Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.2320.1613440707445689429
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Feb 2021 17:58:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hXfgY92x;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id e9so4680932plh.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Feb 2021 17:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xspJv2DosZ9Dlqc22qAy5Wwt9gWfYdBqc6LHirmSnNk=;
        b=hXfgY92xRk9cAiX4DOJunpPLjqZF0PGgR3dlLQovv4v2sndb+Yj6RFITDtaaCkcbwP
         6JJED6wXNKEyYdUAu6cUgD/IMZD1a52sb5lYrVWSm0THQg6ryp6FhFYe0x7OnH21IXgG
         GL7cYZ0VDFUphoTtTcMxKeShSY+YT7kSbGic852IG0Dv6QGnUCYvRyk8yEQuZwuUdvHp
         kXIRUq4Cvce8UV7urfiIEMk3+JbIAGMyrSjti5w+7zYaVE8il+PjTNkCfp/QmLCkMTo4
         U0BAWPhR0X68epRLcqSoH3jQ9/2oISkThD+yGhF4urZRALLurNbZVGtzR2+o3qGbCqOy
         UMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xspJv2DosZ9Dlqc22qAy5Wwt9gWfYdBqc6LHirmSnNk=;
        b=KaVe86ehnp42G4JGPmaDLdsC+ZoeLl21Zh3Vu/U+4FFN0s0b5WcjVIMCSz8ehbYX8p
         A2uSXW9H1O7XgboasbBPO+sYTIB1SS8aTqnz8UGx3QCwkgKdtcFbwYf2cOHUVa06sjQt
         82qu9Ivoqo4YVli6tVARdvEi0Gn1nWhhcexMwO+KqFByDmbPBUK9WOXjj/coyQ3iPWiU
         EO88j1X6BBu5ZbCxDM4feUf5a1FKLoe/XsobJ7VvXpqZ/fPQonL2SBHcrzJNZwg0w8IR
         6p2L9fkMZP+Nt/aA1FV8Cmt47yorU/dbz4varEiV2Awx7maubbqMMLAEwL8tzw6QA9bB
         DsLw==
X-Gm-Message-State: AOAM532AZHPXPrLmn/W2hb+F6sFT1mdnSrOqmnkBoDaENP2o90FKB++u
	eZkvKF5zVXB9EG7REoHfRm5dMBN30Ql20g==
X-Google-Smtp-Source: ABdhPJxDKgf3KXB9tfAhqgaT59kY++U5YsHCRqYRxBL4+5R+IE4P3xXzQ0ZR4WrDBdlDvCpPa41HIA==
X-Received: by 2002:a17:90a:a88e:: with SMTP id h14mr1719779pjq.59.1613440706809;
        Mon, 15 Feb 2021 17:58:26 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:3567:4d62:c82e:b7f7])
        by smtp.gmail.com with ESMTPSA id c24sm19756159pfo.209.2021.02.15.17.58.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 17:58:26 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 04/11] libuv: fix CVE-2020-8252
Date: Mon, 15 Feb 2021 17:58:12 -0800
Message-Id: <b1de50b2fcbe43cf10508cece48f229e18009cd0.1613440394.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1613440394.git.akuster808@gmail.com>
References: <cover.1613440394.git.akuster808@gmail.com>

From: Andrej Kozemcak <andrej.kozemcak@siemens.com>

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libuv/libuv/CVE-2020-8252.patch           | 41 +++++++++++++++++++
 .../libuv/libuv_1.36.0.bb                     |  3 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch

diff --git a/meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch
new file mode 100644
index 0000000000..dd99b44873
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libuv/libuv/CVE-2020-8252.patch
@@ -0,0 +1,41 @@
+From 0e6e8620496dff0eb285589ef1e37a7f407f3ddd Mon Sep 17 00:00:00 2001
+From: Ben Noordhuis <info@bnoordhuis.nl>
+Date: Mon, 24 Aug 2020 11:42:27 +0200
+Subject: [PATCH] unix: don't use _POSIX_PATH_MAX
+
+Libuv was using _POSIX_PATH_MAX wrong. Bug introduced in commit b56d279b
+("unix: do not require PATH_MAX to be defined") from September 2018.
+
+_POSIX_PATH_MAX is the minimum max path size guaranteed by POSIX, not
+the actual max path size of the system libuv runs on. _POSIX_PATH_MAX
+is always 256, the real max is often much bigger.
+
+This commit fixes buffer overruns when processing very long paths in
+uv_fs_readlink() and uv_fs_realpath() because libuv was not allocating
+enough memory to store the result.
+
+Fixes: https://github.com/libuv/libuv/issues/2965
+PR-URL: https://github.com/libuv/libuv/pull/2966
+
+Upstream-Status: Backport [https://github.com/libuv/libuv/commit/0e6e8620496dff0eb285589ef1e37a7f407f3ddd]
+CVE: CVE-2020-8252
+Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
+---
+ src/unix/internal.h | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/unix/internal.h b/src/unix/internal.h
+index 30711673e0..9d3c2297f8 100644
+--- a/src/unix/internal.h
++++ b/src/unix/internal.h
+@@ -62,9 +62,7 @@
+ # include <AvailabilityMacros.h>
+ #endif
+ 
+-#if defined(_POSIX_PATH_MAX)
+-# define UV__PATH_MAX _POSIX_PATH_MAX
+-#elif defined(PATH_MAX)
++#if defined(PATH_MAX)
+ # define UV__PATH_MAX PATH_MAX
+ #else
+ # define UV__PATH_MAX 8192
diff --git a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
index deeaa2b15c..7577207318 100644
--- a/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
+++ b/meta-oe/recipes-connectivity/libuv/libuv_1.36.0.bb
@@ -5,7 +5,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
 
 SRCREV = "533b738838ad8407032e14b6772b29ef9af63cfa"
-SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
+SRC_URI = "git://github.com/libuv/libuv;branch=v1.x \
+           file://CVE-2020-8252.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

