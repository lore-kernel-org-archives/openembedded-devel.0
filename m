Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.352.1598375147534519447
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 10:05:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=rvpxjLvT;
 spf=pass (domain: linaro.org, ip: 209.85.216.46, mailfrom: arthur.she@linaro.org)
Received: by mail-pj1-f46.google.com with SMTP id 2so1569457pjx.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GN05tiPRl4fl6YqduwQRxN/zYw8mTnH++3IAYNaUbiU=;
        b=rvpxjLvTl+SRmS6OwtFGCUcZlzBJFExfPdscG0tHuhBY/fBCWrPLsmJz+o+wMvx3Xj
         u6xhEdVpvRzwG3Hu/uqoPTvZF0feE7FHJkYJbKCOgqIZzDyYlha5l/NtnZgLv7qS0ns/
         HFVuTzF0MurtDsMzf7tT9W9Q+dkGrk7YIh4Xh1rdREZgpWmD7uZpesJbkm7Uh1SahGGe
         Jp8SRP5kYZOeCYw3Lw91Z1fSiyfzxKl8+5AcRWPexM7MGLLDqtGTYDoVa6gdEqxob42U
         i94OVpaKaujNRM9xSBr0imnRLKpWKgHZFX+PgUCb2NZtnPQk2O0vUFgPgRWDtJGSKsY+
         9tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GN05tiPRl4fl6YqduwQRxN/zYw8mTnH++3IAYNaUbiU=;
        b=gkUO4t7UT3IfCrgOWT/swXDRiX8mkj7xcoXL9ldVQIMCYC7fXF3tJlpaJkLS68G9Mf
         FJn5xEzh4gMQ+lXlZhIIuync2+n8j9XQDrKjE1axB4oO5LdWBBFdaZJyeoGsgDdv/UFA
         a72MJZr4sHlPRYGzmnmFoS3cpdQSbOyLESdJGJWRMm528+SGQPHLo+kV5MXqu8wbh48r
         yWeouhf0eUXGVqTO1JrZIFWvNihimL9n/IHxnx1puoDBYzhAXWxrZSWnVXcdBBCT0P42
         kDSqYcfrVl80ldlyWyKvuYEkpJ+MHzT2KW9kxGbKDEC9baNjaHn1t6FvalikVdKLTSSt
         7Y0A==
X-Gm-Message-State: AOAM533Q+p63qRMeqzrow2ZqJLQzZHYUG88UvJajLOAKrFMIhic74wJQ
	OriTMm65k+Ex3ZkK0O24WF0/cInS9GwC6A==
X-Google-Smtp-Source: ABdhPJw2gK7r9QKR5vCKAyZPbBJ5h4RZjdxFuLGBDQuOs2pDOSnaDNuMuZb+qljomup9yCvesHWE8g==
X-Received: by 2002:a17:90a:b78e:: with SMTP id m14mr2338985pjr.94.1598375146819;
        Tue, 25 Aug 2020 10:05:46 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id j4sm13487162pgf.8.2020.08.25.10.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 10:05:46 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [meta-oe][PATCH v2] xmlrpc-c: fix Makefile macro error
Date: Tue, 25 Aug 2020 10:05:43 -0700
Message-Id: <20200825170543.75398-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This error caused the curl library wouldn't to be linked correctly.

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 ...rc-Makefile-Fix-Makefile-macro-error.patch | 29 +++++++++++++++++++
 .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch
new file mode 100644
index 000000000..3d861fc62
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-src-Makefile-Fix-Makefile-macro-error.patch
@@ -0,0 +1,29 @@
+From ea4ca50ca9cab755f3722096158a46deec0e663a Mon Sep 17 00:00:00 2001
+From: Arthur She <arthur.she@linaro.org>
+Date: Tue, 25 Aug 2020 09:51:26 -0700
+Subject: [PATCH] src/Makefile: Fix Makefile macro error
+
+This error caused the curl library wouldn't be linked correctly.
+
+Upstream-Status: Pending
+Signed-off-by: Arthur She <arthur.she@linaro.org>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 1cdf8b0..acd04dd 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
+   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
+   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
+   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
+-  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
++  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)
+   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
+ endif
+ ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index c1f0b78ca..aba6dfd88 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
 SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0002-fix-formatting-issues.patch \
+           file://0003-src-Makefile-Fix-Makefile-macro-error.patch \
            "
 
 #Release 1.54.02
-- 
2.25.1

