Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.6896.1598328488037592486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 21:08:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=X7SftyU4;
 spf=pass (domain: linaro.org, ip: 209.85.216.41, mailfrom: arthur.she@linaro.org)
Received: by mail-pj1-f41.google.com with SMTP id j13so528587pjd.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 21:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A99qIK0jkvvupujf+zX9ERJ7dnPaovQSYzfUNTMs2ko=;
        b=X7SftyU4RIe+DaAFxj7txRUhf9P10l6T87iOkApgq5Re2a/PDTkeuO1nOCBu2IgMgT
         GW5hXQCgShCWax4JSr/0RLnh/5eB4yrkZt/O1iFsAM9ujNfCjQ1ULDCpzPpgGeTB3lB8
         t43WAtQM/OmTSwP8DdlJYpEQ6YpvmeAyGWTXXN29Z/pf0fVVEcHBw3A+DbpJE4fMjRE1
         SK8SxjS2BxyisNS5Ms4oB5DD3oFvX2AeNxuU4DGK5CMgJahwyEvAcjzn4ZFns+1YejMP
         ODq5Z3Er2f8bhFglvGwjoHN8p0WdFSESWYMLnR2gj8VDf/NLU5815Rlk4N4F5QgEpBA0
         BG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A99qIK0jkvvupujf+zX9ERJ7dnPaovQSYzfUNTMs2ko=;
        b=PhjlaX11Su8/BQ/v2ZMgwmaCbZ2NmEGqgb/1U4wWatyFHhM9AwrS5AgecLSXry8CTk
         zMuJW5RtFmh+NF8nTVz0O2v5kZbxc9Sesa7x9jNx583OAm9e2oOumGcHHszwSXd/Fv/h
         GpYjyE3aeqXHQNmeL8o9pyRNq1cPeiJHroMkMHFZXraMBmtiDIbL/BxJXocdQ7qBak3C
         Avu62vXaWseuOq54z/1raZb28m6NNX8e7AGFoupOb+N9EbhZgyB0AxDxSZdljRkXORgt
         oFNEX2teMDQ6vVg7hHiiDb3NP8/sgdKp2xqCIc0GPmjUNjGaSlQscJHU/+Qr6tEiQcyh
         p2NQ==
X-Gm-Message-State: AOAM530D9IXnDYoSwaqQ15DeqCyss/LMfMBrSdcr0cvZIbKOtYMoNxmu
	6q9LoyfJsB4+9k6gtPU1R/mx3p4yLyCx/w==
X-Google-Smtp-Source: ABdhPJwHPsGNfXGd/WzJnCKoa69x6n9beg3mNg8izr/mvP4RlrL06rW5MwVE8oOx5D1W0ENZdj4EHQ==
X-Received: by 2002:a17:90a:aa90:: with SMTP id l16mr20114pjq.210.1598328486933;
        Mon, 24 Aug 2020 21:08:06 -0700 (PDT)
Return-Path: <arthur.she@linaro.org>
Received: from arthur-X1E.hitronhub.home (S0106a84e3f840fe3.vn.shawcable.net. [50.68.230.12])
        by smtp.gmail.com with ESMTPSA id m22sm998081pja.36.2020.08.24.21.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 21:08:06 -0700 (PDT)
From: "Arthur She" <arthur.she@linaro.org>
To: openembedded-devel@lists.openembedded.org
Cc: Arthur She <arthur.she@linaro.org>
Subject: [meta-oe][PATCH] xmlrpc-c: fix Makefile macro error
Date: Mon, 24 Aug 2020 21:08:03 -0700
Message-Id: <20200825040803.837645-1-arthur.she@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This error caused the curl library not to be linked.

Signed-off-by: Arthur She <arthur.she@linaro.org>
---
 .../0003-Fix-Makefile-macro-error.patch       | 26 +++++++++++++++++++
 .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
new file mode 100644
index 000000000..e0be24bf7
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
@@ -0,0 +1,26 @@
+From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00 2001
+From: Arthur She <arthur.she@linaro.org>
+Date: Mon, 24 Aug 2020 20:50:58 -0700
+Subject: [PATCH] Fix Makefile macro error
+
+The libcurl will not be liked due to this error.
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
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
index c1f0b78ca..eec945824 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
 SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
            file://0002-fix-formatting-issues.patch \
+           file://0003-Fix-Makefile-macro-error.patch \
            "
 
 #Release 1.54.02
-- 
2.25.1

