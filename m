Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.107762.1597916330275621486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2020 02:38:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gPRCf3Pv;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id p14so998161wmg.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2020 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R98gYvgxFiXTAF/bcWwXyR3clnmOxrvPE0qLIptmwoU=;
        b=gPRCf3PvyvIm8nCw1YjBwqrdMFh9oyB5xAPcO/Ato5AJJMJuAsj/xIcwNKVe74u71v
         1BCaB61UYg1l/5/Gb2mFy+fO6xrgFBVnvU/qV7jQn5vG8LuxznlZoSvubIZrQFrC81pq
         223aFpsNM/CXfCtC50wXiTCSklEWpjZFl3tSU94xYXyFTcofqzUuQVjLVN02bcIcP4nh
         otEbCqO8hm7s/QSzmUmDtmPc9pDg1zqSroFKDqGtmC1+KnShbtxRcQ/I6Dex4gd/RXYF
         dSNpy7VWDmZXlrCrPLklvkxyhoix51H0FlcjeocH9KR0EjXxTYkGejl8aOhRaagDuAms
         RMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R98gYvgxFiXTAF/bcWwXyR3clnmOxrvPE0qLIptmwoU=;
        b=o4C+Xvf+HFiVVEqBO1wKbiJYAR9ubyOi0CzkxjTccZOY8YklsPFz/ubv3vvufQ3N8f
         um14c+gbiLUy40WcCCU82i/LF8a5mL5D8mYdDQUd3pIXfgQz9DMgWlw0Os0G5SQohGkn
         OrpNqoqjHNU4AlHjwteGlCMnIzR/E9AwS8W698AIq2NbM5i/ty/SMfL0PrWBTChI7TkO
         /ewX8Jcx4A66SZAu5yMxBrsKCsUuagUI8wjQiFaKL2MiUsTbKJfILf8vNzc0WYJv+8FS
         XeldtppbCq08I1LCjE0VALhHEsOluB94+48Cvdopizsobkg1LB6VCU5aJZOryPApU/CM
         Gq6A==
X-Gm-Message-State: AOAM533ki1T7zrMl6eZ/+0iaDxSjKMN1VAkbSTTR9sSnmSqKPir64HpR
	XQnMiomP9Qak6YfHUXM7Gdm/WFqppLY=
X-Google-Smtp-Source: ABdhPJyUFvIrNVWTrUiMqE8B+oSW5Xx3uVcnLW8og75VVrDRuzw/L+ZIDwV7nTvYISIPsNiSq5Dwww==
X-Received: by 2002:a7b:c10d:: with SMTP id w13mr2594964wmi.2.1597916328529;
        Thu, 20 Aug 2020 02:38:48 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id j5sm3319129wma.45.2020.08.20.02.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 02:38:47 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCHv2] valijson: Move it to networking-layer under BBFILES_DYNAMIC
Date: Thu, 20 Aug 2020 11:38:45 +0200
Message-Id: <20200820093845.507549-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

it has a hard dependency on curlpp package which comes from
meta-networking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-oe/conf/layer.conf                                        | 1 +
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend   | 3 +++
 .../recipes-devtools/valijson/valijson_0.3.bb                  | 0
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb     | 2 +-
 4 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
 rename meta-oe/{ => dynamic-layers/networking-layer}/recipes-devtools/valijson/valijson_0.3.bb (100%)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5bf1f6cfd9..5178678da2 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -27,6 +27,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 # to ensure yocto compatibility check pass
 BBFILES_DYNAMIC += " \
 meta-python:${LAYERDIR}/dynamic-layers/meta-python/recipes-*/*/*.bb \
+networking-layer:${LAYERDIR}/dynamic-layers/networking-layer/recipes-*/*/*.bb \
 perl-layer:${LAYERDIR}/dynamic-layers/perl-layer/recipes-*/*/*.bb \
 "
 
diff --git a/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
new file mode 100644
index 0000000000..b39a4d68ff
--- /dev/null
+++ b/meta-oe/dynamic-layers/networking-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
@@ -0,0 +1,3 @@
+RDEPENDS_packagegroup-meta-oe-devtools += "\
+    valijson \
+"
diff --git a/meta-oe/recipes-devtools/valijson/valijson_0.3.bb b/meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb
similarity index 100%
rename from meta-oe/recipes-devtools/valijson/valijson_0.3.bb
rename to meta-oe/dynamic-layers/networking-layer/recipes-devtools/valijson/valijson_0.3.bb
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 0812da1af6..4dc3afe454 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -116,7 +116,7 @@ RDEPENDS_packagegroup-meta-oe-devtools ="\
     mpich msgpack-c nlohmann-json openocd pax-utils \
     ipc-run libdbd-mysql-perl libdbi-perl libio-pty-perl php \
     protobuf protobuf-c \
-    rapidjson serialcheck sip3 tclap uftrace uw-imap valijson \
+    rapidjson serialcheck sip3 tclap uftrace uw-imap \
     xmlrpc-c yajl yasm \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geany geany-plugins glade tk", "", d)} \
     ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "nodejs", "", d)} \
-- 
2.25.1

