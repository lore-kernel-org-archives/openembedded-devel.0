Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web09.12493.1607819738551148964
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Dec 2020 16:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sti8RH+h;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id c12so9449286pgm.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Dec 2020 16:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BPMPyat/mpPI+O8UOwUFPoXhzmXiYhDfAT/fINDRsms=;
        b=sti8RH+hjLCkosRsNRnIDImqI/jCqSuWdpw2589xnAZCGbLDoi9x7EfT/Q0JsyOF5v
         6m3YuDoyKCKa6UDrVJlq1lc2oXmBwa37FJ+UMckA+H+zTSzzSVMhrqyfawVL3KWurew/
         Tv9cRqyuoA+hla3RI2rGbXmaUNq5saIm2YUA1tRRxqgBHDjX2gQBpb2SZQUWOy/lscII
         irDolMrbIiMPoP8rAndq0X8H5tKeoM0OAaUu7fvm3QFEuncIf+BwBYDD76EH7/adQzFa
         BL9z/mrNYUzeiK30qCipFI5xx4owXDZDdq/epuRkRXRJ2DsC5PDvLs3YPdA4xayrZPvT
         mFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BPMPyat/mpPI+O8UOwUFPoXhzmXiYhDfAT/fINDRsms=;
        b=CqU27kgLvU3L2WRezaXDj0bYlSbfAvIlzwWO2OXACSb+Fw5IlUv53WKmfhYxowhFL5
         ROeoNAg5hdKrFandy82MSDxb6dXabm3KqJWEF9FwBUhPVzHnlInozelDH+t665sE2CP8
         P+S7bTpJp2kBntNDY6vCRQ7ZWHfSsFyxlWZgkqxXegXkJpruZt7797vj+JElkfSXtOOa
         pRW+kBpwLcRkrR3/VVHT6B1GLs9NMYY+Ur8DXUNv9bhpQpBLpIdx/q1qSijbC3FlWoJN
         Lw1WBs+HUKpaNADss6g6mjstH/zdXl/a2ypBMJc0rHMEyYK/L9tFgCIkUd/KNn7p8PU4
         rQ0w==
X-Gm-Message-State: AOAM531CLterYUxyfXjyDvFwqNiuHFnxc4Qr9CgOF5IW0RjsFg62IH8N
	W2tSP66ivdnmJy0FKmDgj8CueTslp5NFPA==
X-Google-Smtp-Source: ABdhPJzCB1dHSdSPDHdngz0eAIxbWN04KA0xpi9HXUQiR6W8Pne0R6aGp7ebV//w2cEmkPbmo3il+A==
X-Received: by 2002:aa7:86d5:0:b029:1a3:61b6:9c1 with SMTP id h21-20020aa786d50000b02901a361b609c1mr4106165pfo.55.1607819737824;
        Sat, 12 Dec 2020 16:35:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id s5sm14900901pju.9.2020.12.12.16.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 16:35:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] sdbus-c++-libsystemd: Fix reallocarray check in meson
Date: Sat, 12 Dec 2020 16:35:34 -0800
Message-Id: <20201213003534.3469717-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213003534.3469717-1-raj.khem@gmail.com>
References: <20201213003534.3469717-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-meson-Fix-reallocarray-check.patch   | 25 +++++++++++++++++++
 .../sdbus-c++/sdbus-c++-libsystemd_243.bb     |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
new file mode 100644
index 0000000000..d3d339d56d
--- /dev/null
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd-243/0001-meson-Fix-reallocarray-check.patch
@@ -0,0 +1,25 @@
+From 1ebf1a1df17afd8b89f84b1928a89069035bf20b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Dec 2020 16:15:57 -0800
+Subject: [PATCH] meson: Fix reallocarray check
+
+reallocarray() is defined in stdlib.h, so that would be right header to
+check for its presense.
+
+Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/17951]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -501,7 +501,7 @@ foreach ident : [
+                                  #include <sys/stat.h>
+                                  #include <unistd.h>'''],
+         ['explicit_bzero' ,   '''#include <string.h>'''],
+-        ['reallocarray',      '''#include <malloc.h>'''],
++        ['reallocarray',      '''#include <stdlib.h>'''],
+         ['set_mempolicy',     '''#include <stdlib.h>
+                                  #include <unistd.h>'''],
+         ['get_mempolicy',     '''#include <stdlib.h>
diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
index c8e81a4123..4b93087f4f 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++-libsystemd_243.bb
@@ -41,6 +41,7 @@ SRC_URI_MUSL = "\
                file://0002-src-login-brightness.c-include-sys-wait.h.patch \
                file://0003-src-basic-copy.c-include-signal.h.patch \
                file://0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch \
+               file://0001-meson-Fix-reallocarray-check.patch \
                "
 
 PACKAGECONFIG ??= "gshadow idn"
-- 
2.29.2

