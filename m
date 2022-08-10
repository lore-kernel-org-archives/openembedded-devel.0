Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37EDC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 15:08:35 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.6909.1660144107483531699
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 08:08:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YsLukGnr;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so2399494pjf.2
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=KDfaw40sD9xzMCINtzGNs7/zqOIlVHdEMA1q/RdYe+w=;
        b=YsLukGnrNGarAn943OnLF8hCWSR05zIp/n4Prx53VYMqVUQekhMiR5eGWyIfQeCD1+
         kPpPJnzaYOMmqHsgnn3UUEWfLTu/yJvNNY0UrW+WnWhbEm9d5XBag449v514aC3owyyp
         00skGjqOuLb/Y6h2u+boEA1yGr26Hpjpbixr7eT9wRqITIganpED5w32LuyM5nR0bRu+
         aPsQLDYhsLwecwA6HtoSUpCYeQ3vScTTaUm15Odv8cAQ9qcgkHOPVq5Sc2clk2M5L9Xu
         5rWUsg5NUV/hCCu1o7Zm3MG3n9Tj8cU7/kR3jAJ6YHjaI8bHRBu03cEc+2bTTseEmiIL
         xPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=KDfaw40sD9xzMCINtzGNs7/zqOIlVHdEMA1q/RdYe+w=;
        b=vixnd3YNhWmg6vSVeXmbSAtRUueP38LsYwzYRksC5wMwxSjvVVXjVnUYR6rEU6ysI3
         KnDCTNNd2C9fE89HcNlgyejDHRDAFYDlCwvvN9mZ59BJG049GI73Cc5UTyyAZOcPkzTO
         Rw62JmWayi4gsWMXW1gT4suNihV/IatfHqfOPUXO2zTYwvhyO40Qlt8y7JN+zCEiLpGv
         b2Ua7FKJ5XOWoVXj5bvrcsXm61Xzhn68oDgj/TAgLvMhk5HS4m859oIUUuyObdj2k9Ym
         LhHhRB4InU4XkYjGQFBf1dFHwaAMIpdXCPCVgHTsHQ67K8cV26cNovN5abfn5dZBekvz
         w5TQ==
X-Gm-Message-State: ACgBeo0HbfykcVB7TsH49kJ1WbPngD0TpTv7PukFxN65RcwKzdHPX0Om
	h2+9FnDm7Dbesr2cSlYndpfDYRiqML0=
X-Google-Smtp-Source: 
 AA6agR7eDAjClbaRJiZHfdfIbqhYVDZ8dLvD2Hqr1jQeajReZV1WtycKKcLEOhDc3BhY0HS1hOMM4g==
X-Received: by 2002:a17:90b:380d:b0:1f5:2c6d:7de8 with SMTP id
 mq13-20020a17090b380d00b001f52c6d7de8mr4214884pjb.18.1660144106483;
        Wed, 10 Aug 2022 08:08:26 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 p3-20020a170902780300b0016d10267927sm12872263pll.203.2022.08.10.08.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 08:08:24 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] audit: Upgrade to 3.0.8 and fix build
 with linux 5.17+
Date: Wed, 10 Aug 2022 08:06:12 -0700
Message-Id: <20220810150612.817828-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220810150612.817828-1-akuster808@gmail.com>
References: <20220810150612.817828-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Aug 2022 15:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98188

From: Khem Raj <raj.khem@gmail.com>

audit errors out due to swig munging it does with kernel headers

| audit_wrap.c: In function '_wrap_audit_rule_data_buf_set':
| audit_wrap.c:4701:17: error: cast specifies array type
|  4701 |     arg1->buf = (char [])(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
|       |                 ^
| audit_wrap.c:4701:15: error: invalid use of flexible array member
|  4701 |     arg1->buf = (char [])(char *)memcpy(malloc((size)*sizeof(char)), (const char *)(arg2), sizeof(char)*(size));
|       |               ^
| audit_wrap.c:4703:15: error: invalid use of flexible array member
|  4703 |     arg1->buf = 0;
|       |               ^

These errors are due to VLAIS from kernel headers, so we copy
linux/audit.h and make the needed change in local audit.h and make
needed arrangements in build to use it when building audit package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit ee3c680c300237c49a3c70610aa5794185c4adac)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../audit/Fixed-swig-host-contamination-issue.patch | 13 +++----------
 .../audit/{audit_3.0.7.bb => audit_3.0.8.bb}        |  7 ++++++-
 2 files changed, 9 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.7.bb => audit_3.0.8.bb} (93%)

diff --git a/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
index 740bcb5a7f..b023c80ae4 100644
--- a/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
+++ b/meta-oe/recipes-security/audit/audit/Fixed-swig-host-contamination-issue.patch
@@ -18,11 +18,9 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  bindings/swig/src/auditswig.i     | 2 +-
  2 files changed, 3 insertions(+), 2 deletions(-)
 
-diff --git a/bindings/swig/python3/Makefile.am b/bindings/swig/python3/Makefile.am
-index dd9d934..61b486d 100644
 --- a/bindings/swig/python3/Makefile.am
 +++ b/bindings/swig/python3/Makefile.am
-@@ -22,6 +22,7 @@
+@@ -23,6 +23,7 @@
  CONFIG_CLEAN_FILES = *.loT *.rej *.orig
  AM_CFLAGS = -fPIC -DPIC -fno-strict-aliasing $(PYTHON3_CFLAGS)
  AM_CPPFLAGS = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
@@ -30,7 +28,7 @@ index dd9d934..61b486d 100644
  LIBS = $(top_builddir)/lib/libaudit.la
  SWIG_FLAGS = -python -py3 -modern
  SWIG_INCLUDES = -I. -I$(top_builddir) -I${top_srcdir}/lib $(PYTHON3_INCLUDES)
-@@ -36,7 +37,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/lib/libaudit.h ${top_builddir}/lib/libaudi
+@@ -37,7 +38,7 @@ _audit_la_DEPENDENCIES =${top_srcdir}/li
  _audit_la_LIBADD = ${top_builddir}/lib/libaudit.la
  nodist__audit_la_SOURCES  = audit_wrap.c
  audit.py audit_wrap.c: ${srcdir}/../src/auditswig.i 
@@ -39,8 +37,6 @@ index dd9d934..61b486d 100644
  
  CLEANFILES = audit.py* audit_wrap.c *~
  
-diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
-index 21aafca..dd0f62c 100644
 --- a/bindings/swig/src/auditswig.i
 +++ b/bindings/swig/src/auditswig.i
 @@ -39,7 +39,7 @@ signed
@@ -48,10 +44,7 @@ index 21aafca..dd0f62c 100644
  typedef unsigned __u32;
  typedef unsigned uid_t;
 -%include "/usr/include/linux/audit.h"
-+%include "linux/audit.h"
++%include "../lib/audit.h"
  #define __extension__ /*nothing*/
  %include <stdint.i>
  %include "../lib/libaudit.h"
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-security/audit/audit_3.0.7.bb b/meta-oe/recipes-security/audit/audit_3.0.8.bb
similarity index 93%
rename from meta-oe/recipes-security/audit/audit_3.0.7.bb
rename to meta-oe/recipes-security/audit/audit_3.0.8.bb
index d77aec2964..3dbfc9e604 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.7.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "f60b2d8f55c74be798a7f5bcbd6c587987f2578a"
+SRCREV = "54a62e78792fe583267cf80da717ee480b8f42bc"
 
 inherit autotools python3native update-rc.d systemd
 
@@ -71,6 +71,11 @@ FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 
 CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
 
+do_configure:prepend() {
+	sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/lib/audit.h
+        sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
+}
+
 do_install:append() {
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
-- 
2.25.1


