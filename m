Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.12376.1597383435655167814
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 22:37:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=e/mtQqDV;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id u128so4015695pfb.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2020 22:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yJM+Up9/bDlBo+DdO04xvsyqBwytuPEjdSKGoBmcA7E=;
        b=e/mtQqDVMb6oK9E0sHLXuTzkkfvn2m07Nppa5PztL0I71LUYqvnAeS7RBIV8aMAJIJ
         7hHZ9Ho/oY+ODxVWIjOMGWEWflGFhu41koHAmfRq214pmcnxiBm+T9rQdaUcdzPxJ3um
         K5E6MRURf7+Mj9cleGp+fTr6hSz1tdgIzj+ti+UnnZpTIE4+DXim1jWMC3xXYMbDRdVq
         nVRB94TqBQiviJy4IQv0agOPS/2QsnZJK2pR8l7wdg5c/DorUwz1uAK6nZ0C+NBCu9Mi
         ISBBcFB4qIx+a+FtSbhuUQ/TDFrNyvJCasUhl7vWjzJBUnqWP8WqQE3LUtZVdiC+4rCz
         D6rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yJM+Up9/bDlBo+DdO04xvsyqBwytuPEjdSKGoBmcA7E=;
        b=gRr9e7AHemdyw/PGaEjXpxj+5NCKym/JQpFQbUqRdty6hylwatLCGV0ElITAdoCZtr
         teeVNfPCFaGRILU/GP4ZbEkNVU6C4cqmL3Op4J9sIwO1PCoSn1U0nSv+6WpeLY+IIfN5
         IxBm3rk22tVsoW03OBHvcux6Xg9M6tpkcmFHLg3ESa3I9lvhzDeb0Dm7dzA/SdiLGS8m
         nAwJJcQwH+TyQUwyIaTtJgj/0oBfnG4ixpTs8kVMIGyg8X/VeM7r7AjO2xedDEJcGxf/
         t9w7TOD465/Ky38sSdFy7D46egp9vII2ui4yHnHcIZHjjtIZaiaUg+jswLgFPrmaKUs0
         4Acw==
X-Gm-Message-State: AOAM532QZWp1M1FC8MxD+XOdkBsupU0FGTQJ2ngEJhGT6z8yCZKwjSQE
	J5iJmErGeHxyvWnd3q8/d5lhCBiAX/pDzQ==
X-Google-Smtp-Source: ABdhPJzzfUyfhiTo+M/aBAhAHjqTy9spZ6EofMOrrwxxZXWBrjM+Q+Stekz0N3BX+sY+Ll1AOIfyAw==
X-Received: by 2002:aa7:9e45:: with SMTP id z5mr695021pfq.166.1597383434801;
        Thu, 13 Aug 2020 22:37:14 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id k21sm7013974pgl.0.2020.08.13.22.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 22:37:14 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/21] ifplugd: Fix build with gcc10/-fno-common
Date: Thu, 13 Aug 2020 22:36:51 -0700
Message-Id: <20200814053657.1701247-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814053657.1701247-1-raj.khem@gmail.com>
References: <20200814053657.1701247-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...erface.h-Make-declarations-as-extern.patch | 31 +++++++++++++++++++
 .../ifplugd/ifplugd_0.28.bb                   |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/ifplugd/ifplugd/0001-src-interface.h-Make-declarations-as-extern.patch

diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd/0001-src-interface.h-Make-declarations-as-extern.patch b/meta-oe/recipes-connectivity/ifplugd/ifplugd/0001-src-interface.h-Make-declarations-as-extern.patch
new file mode 100644
index 0000000000..77de9e6c52
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd/0001-src-interface.h-Make-declarations-as-extern.patch
@@ -0,0 +1,31 @@
+From b990146a149e1729c12e4541a67e32ed1dd6e578 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 13 Aug 2020 19:41:08 -0700
+Subject: [PATCH] src/interface.h: Make declarations as extern
+
+Fixed build with -fno-common
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/interface.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/interface.h b/src/interface.h
+index d223b1f..fd4a5f4 100644
+--- a/src/interface.h
++++ b/src/interface.h
+@@ -21,8 +21,8 @@
+  * Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
+  */
+ 
+-int interface_auto_up;
+-int interface_do_message;
++extern int interface_auto_up;
++extern int interface_do_message;
+ 
+ typedef enum { IFSTATUS_UP, IFSTATUS_DOWN, IFSTATUS_ERR } interface_status_t;
+ 
+-- 
+2.28.0
+
diff --git a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
index 0b5c5a6ce8..7dc83e85f7 100644
--- a/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
+++ b/meta-oe/recipes-connectivity/ifplugd/ifplugd_0.28.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "libdaemon"
 
-SRC_URI = "http://0pointer.de/lennart/projects/ifplugd/ifplugd-${PV}.tar.gz"
+SRC_URI = "http://0pointer.de/lennart/projects/ifplugd/ifplugd-${PV}.tar.gz \
+           file://0001-src-interface.h-Make-declarations-as-extern.patch \
+          "
 
 SRC_URI_append_libc-musl = " file://Fix-build-with-musl.patch"
 
-- 
2.28.0

