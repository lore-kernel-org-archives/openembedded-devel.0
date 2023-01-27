Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A980C636BD
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 05:54:58 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.96462.1674798888491056513
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Jan 2023 21:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MPiiASU2;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id z9-20020a17090a468900b00226b6e7aeeaso3934238pjf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 21:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFcgUD5Nbmsvzf/AlIxGZZvNTsPYaohm8i77YZ53P2Q=;
        b=MPiiASU23mrorBNVKg3yS8AaJ7THqTOvx8KysR9NiEjqd8mnEUBWknRcNP7Di5EHVu
         25Yg+dRof7QFBr+I6cf7LaAbVYg3Jyw8sq79gl6FXzkbKJ5x9XNGPK07PZtSVjkEJMD1
         1qzGvvyvB+YuTN+9f4Do77apVygPDFDCSBwyLS5BOjPZAz4yzCVwLuD49JF8EKhu6iqQ
         h8y2Hu9/s6ofYobhEAF/STHwB4bsJK643msgFAaSQckoT3209FFD1iKaj4ia9eD0gxOJ
         V7wWmRLivYHuxFOlQJMFuE3TwAh8ALjvDp3JxNLIrOLQje9YqguP2MH2ppl/WnFUXwEi
         B5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFcgUD5Nbmsvzf/AlIxGZZvNTsPYaohm8i77YZ53P2Q=;
        b=H6xiwE7+jUJyDHif5pye4VWKYqkXyeqpCaU4W2ig09/kvGKU10gcZeW6VnElUCvjbN
         z4JIeNUPxENDV5HNKzFymtqbMdDxSSAd/MWZWhRQdoL17+PufhMqyt1bUIqwiIlf/nEK
         BN9EXjYIngAc0shRgMeFeWISjXYYNeAH28WKGp1c6Mrdo/5dvZ4XPbKPfRz/xeb5H1re
         YK5BrZhj3Myhm+Ln2Gsmb1rU07LgTQq+SnUHT+2NIh6naMOEEGAcMBXBhNKlKlCCdlb+
         Z3siwWnuzcWzFijqBB4/6+3S0shfshzU30VJrnZ1LJyOD5PN1bEpbElZxlQzk5p0SDrm
         jI/g==
X-Gm-Message-State: AO0yUKVDyrRjL86HTXe8Z8Zq4ZFsjWIJcwOR8siouruAWKh/AmZEcpab
	ED5I9nrrDL/OcA+3qI4nbxLN1m63BUyvFw==
X-Google-Smtp-Source: AK7set88prYLGF2bxekRVPftIpPl0ruf0AKZ0EoenUueX3dxnJbh2Gp/AK9eU0U4v/edaMMnmZSphQ==
X-Received: by 2002:a17:902:c24d:b0:196:3bbb:e9db with SMTP id 13-20020a170902c24d00b001963bbbe9dbmr5495865plg.10.1674798887664;
        Thu, 26 Jan 2023 21:54:47 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id b13-20020a170902b60d00b001947982eb8fsm230074pls.60.2023.01.26.21.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 21:54:47 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/10] geos: Fix build with gcc13
Date: Thu, 26 Jan 2023 21:54:37 -0800
Message-Id: <20230127055440.2108933-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127055440.2108933-1-raj.khem@gmail.com>
References: <20230127055440.2108933-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jan 2023 05:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100811

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../geos/0001-include-missing-cstdint.patch   | 82 +++++++++++++++++++
 meta-oe/recipes-navigation/geos/geos_3.9.4.bb |  3 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch

diff --git a/meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch b/meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch
new file mode 100644
index 0000000000..6cfd2e81bc
--- /dev/null
+++ b/meta-oe/recipes-navigation/geos/geos/0001-include-missing-cstdint.patch
@@ -0,0 +1,82 @@
+From 11b9ef265a942cb3fdd373520d0c3fce67d3cdf9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 26 Jan 2023 18:05:33 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer transitively included [1]. Explicitly include it for uint{32,64}_t.
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Backport [https://github.com/kraj/geos/commit/0e8d4368b]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/geos/geomgraph/TopologyLocation.h   | 1 +
+ include/geos/io/WKTWriter.h                 | 1 +
+ include/geos/shape/fractal/HilbertCode.h    | 1 +
+ include/geos/shape/fractal/HilbertEncoder.h | 1 +
+ include/geos/shape/fractal/MortonCode.h     | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/include/geos/geomgraph/TopologyLocation.h b/include/geos/geomgraph/TopologyLocation.h
+index 4cbbacb3..a3ecd212 100644
+--- a/include/geos/geomgraph/TopologyLocation.h
++++ b/include/geos/geomgraph/TopologyLocation.h
+@@ -25,6 +25,7 @@
+ #include <geos/inline.h>
+ #include <geos/geom/Location.h>
+ 
++#include <cstdint>
+ #include <vector>
+ #include <array>
+ #include <string>
+diff --git a/include/geos/io/WKTWriter.h b/include/geos/io/WKTWriter.h
+index c0af8e71..0d60e975 100644
+--- a/include/geos/io/WKTWriter.h
++++ b/include/geos/io/WKTWriter.h
+@@ -25,6 +25,7 @@
+ 
+ #include <string>
+ #include <cctype>
++#include <cstdint>
+ 
+ #ifdef _MSC_VER
+ #pragma warning(push)
+diff --git a/include/geos/shape/fractal/HilbertCode.h b/include/geos/shape/fractal/HilbertCode.h
+index 46012efc..beeb28c6 100644
+--- a/include/geos/shape/fractal/HilbertCode.h
++++ b/include/geos/shape/fractal/HilbertCode.h
+@@ -17,6 +17,7 @@
+ 
+ #include <geos/export.h>
+ #include <string>
++#include <cstdint>
+ 
+ // Forward declarations
+ namespace geos {
+diff --git a/include/geos/shape/fractal/HilbertEncoder.h b/include/geos/shape/fractal/HilbertEncoder.h
+index 61c0010d..0126d3d9 100644
+--- a/include/geos/shape/fractal/HilbertEncoder.h
++++ b/include/geos/shape/fractal/HilbertEncoder.h
+@@ -16,6 +16,7 @@
+ #pragma once
+ 
+ #include <geos/export.h>
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/include/geos/shape/fractal/MortonCode.h b/include/geos/shape/fractal/MortonCode.h
+index 6743f87c..ad4a42e7 100644
+--- a/include/geos/shape/fractal/MortonCode.h
++++ b/include/geos/shape/fractal/MortonCode.h
+@@ -17,6 +17,7 @@
+ 
+ #include <geos/export.h>
+ #include <string>
++#include <cstdint>
+ 
+ // Forward declarations
+ namespace geos {
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-navigation/geos/geos_3.9.4.bb b/meta-oe/recipes-navigation/geos/geos_3.9.4.bb
index 7822cde30d..558acd92bf 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.9.4.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.9.4.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
+SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2 \
+           file://0001-include-missing-cstdint.patch"
 SRC_URI[sha256sum] = "70dff2530d8cd2dfaeeb91a5014bd17afb1baee8f0e3eb18e44d5b4dbea47b14"
 
 inherit autotools pkgconfig binconfig
-- 
2.39.1


