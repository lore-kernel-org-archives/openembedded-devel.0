Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98FCC61DA4
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 07:17:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.68631.1674717465071111068
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Jan 2023 23:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lCPpe34M;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id jl3so1123204plb.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Jan 2023 23:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFKL8myfzWiZtTxmk1gBBeX/2I4YjViX2dbv7+YBpDk=;
        b=lCPpe34MLiRcFceZ3xBesm+wRFcEykSQRydwUf/gLOjqz8J2O7Z+nyuYXY6G3lo+bu
         bBbLR6ZJTwQ1J4iisQk3fQgvMRzCjqQMDmgZUo8OnKPpsUNQ+42HeKAb92F7sINavIBq
         YNd9VvlEtYOf7Vtb0Uk45udS2Drde9p5QC39SvFu2wZXgeNyCd1jS3lJtz8YISs5nVbx
         lkSYhbj0zFvWxKDWtu2PyCa0gor6Gd0pZ+dpUq3JZRUdmByE0yk5NqjWZTF9x/XHI5Zo
         QlbdmOWqua04up7x3kfNUyRSMxEuNBinbl9GbEvXEwU909ndl+W6dRfL09LNzXVp+UN9
         IfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bFKL8myfzWiZtTxmk1gBBeX/2I4YjViX2dbv7+YBpDk=;
        b=McjYgW/60utN13Vdu2esXh70IEYzna64dOXtZsa+/uAW/W16qLRMygGjifJxb63gRO
         tElaBMS9Gi3v+atxf38Bser7SGo/Pj20ZRNfTpfknr+yy1131cruONQ3ycbQ682MT6Y0
         /asZA42Vm/CcjlkWyjUz1gAP91cxGF+A9+WtUJnhF9eq5RuzPQXTzFmQkYHn9Xyyub45
         wV8FtxsZEAi7t+blBEJyXz8xS+QiI+OGs7s2Gv8pGeOxZUVY8iLy3PVH7JyHYV2c9m13
         oZxBCLO3JP6JzMO4bTQ7fOadM0CP+iS7AKx2R/Ltz5U7W/09vBV9Wx+8PuOdOGcCOM02
         9NUA==
X-Gm-Message-State: AO0yUKXNW1atMyLNhK26WsMcLUfV/kFH0Pc6amX4D3PupRIuxnqFrXRi
	MPh/S51UVGv5kxgx3SbJnnxGN6mm8mzkAg==
X-Google-Smtp-Source: AK7set/UbF4Nn7sVzS/Pj8fWZuqyECrxX4i0BtL8sEV1RqAXi98xqp4xX6KMvBAf06bK01ePF5/urg==
X-Received: by 2002:a17:902:e383:b0:191:7d3:7fdd with SMTP id g3-20020a170902e38300b0019107d37fddmr673222ple.60.1674717464177;
        Wed, 25 Jan 2023 23:17:44 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::aee3])
        by smtp.gmail.com with ESMTPSA id c17-20020a170902b69100b00196025a34b9sm458815pls.159.2023.01.25.23.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 23:17:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/13] rdfind: Fix build with gcc13
Date: Wed, 25 Jan 2023 23:17:29 -0800
Message-Id: <20230126071735.2444745-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126071735.2444745-1-raj.khem@gmail.com>
References: <20230126071735.2444745-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Jan 2023 07:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100789

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-standard-headers-limits-and-cstdint.patch | 54 +++++++++++++++++++
 .../recipes-support/rdfind/rdfind_1.5.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch

diff --git a/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch b/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch
new file mode 100644
index 0000000000..bd59b74412
--- /dev/null
+++ b/meta-oe/recipes-support/rdfind/rdfind/0001-include-standard-headers-limits-and-cstdint.patch
@@ -0,0 +1,54 @@
+From 8c317f0fd5fde95a9aae2319053a196a166aec88 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 21:12:47 -0800
+Subject: [PATCH] include standard headers <limits> and <cstdint>
+
+gcc 13 moved some includes around and as a result <cstdint> is no longer
+transitively included [1]. Explicitly include it for uint64_t.
+
+Fixes errors like below
+
+../rdfind-1.5.0/rdfind.cc:225:30: error: 'numeric_limits' is not a member of 'std'
+  225 |     o.maximumfilesize = std::numeric_limits<decltype(o.maximumfilesize)>::max();
+      |                              ^~~~~~~~~~~~~~
+
+...
+
+| ../rdfind-1.5.0/Fileinfo.hh:70:20: error: 'std::int64_t' has not been declared
+
+[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
+
+Upstream-Status: Submitted [https://github.com/pauldreik/rdfind/pull/129]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Fileinfo.hh | 1 +
+ rdfind.cc   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/Fileinfo.hh b/Fileinfo.hh
+index 3ffb837..23ed54e 100644
+--- a/Fileinfo.hh
++++ b/Fileinfo.hh
+@@ -8,6 +8,7 @@
+ #define Fileinfo_hh
+ 
+ #include <array>
++#include <cstdint>
+ #include <string>
+ 
+ // os specific headers
+diff --git a/rdfind.cc b/rdfind.cc
+index fbd6cb8..64dd8f6 100644
+--- a/rdfind.cc
++++ b/rdfind.cc
+@@ -9,6 +9,7 @@
+ // std
+ #include <algorithm>
+ #include <iostream>
++#include <limits>
+ #include <string>
+ #include <vector>
+ 
+-- 
+2.39.1
+
diff --git a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb b/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
index 0d776b4e97..8f2c5e8852 100644
--- a/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
+++ b/meta-oe/recipes-support/rdfind/rdfind_1.5.0.bb
@@ -7,6 +7,7 @@ DEPENDS = "nettle autoconf-archive"
 
 SRC_URI = "https://rdfind.pauldreik.se/${BP}.tar.gz \
            file://0001-configure-Fix-check-for-AC_CHECK_LIB.patch \
+           file://0001-include-standard-headers-limits-and-cstdint.patch \
 "
 
 SRC_URI[sha256sum] = "4150ed1256f7b12b928c65113c485761552b9496c433778aac3f9afc3e767080"
-- 
2.39.1


