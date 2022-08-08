Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BA1C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 18:38:02 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.2222.1659983877634708832
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 11:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o0GecRBi;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 h21-20020a17090aa89500b001f31a61b91dso15395938pjq.4
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=+KqJAbNsNllfSl2eZLDzm5ytfNwwvmRqCSN4iIKz3Rg=;
        b=o0GecRBidgOq6nEdbWZk8p0ZPUkNci2mpv1p9USMyCYikY+BBzDdgsOuZu6/Yxkpop
         nuBx+2VBMWWnRrGTcyaVVy6UAE+wjnhgHYAmgwavXeAltSEf5gU8O0pcwiTqIm+rdNM4
         QkWZueKAFzHo5FdMyF8QZh8itMfIfhdvGGqxBmpq+0UUkjimY+hGrgp36mlqP71sZ5sy
         gXR6oilEY/vccnjvXn7U7bOT8YtX7bOklLR85eg9EMTWNL7V51m+Xmw3GQHU/OYhkluz
         MsqiAQf+INaD0tbwLJ4MWiEKiNvlvmCPG2Vp6sBfwg7b34/V3jx17wUHIwPUEa+B0PfP
         Wx+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=+KqJAbNsNllfSl2eZLDzm5ytfNwwvmRqCSN4iIKz3Rg=;
        b=Aq/7ScEb2XcsxY7q8ip+wJnFIV5TOt311uQN6opjcIVYqaH3zQbxoz0AyRH+AJXukJ
         i9VR0GyaaRxwcsiUUXEqc1jjUu90r5OQzFX1EcbFU3uTKPGXPBI/YztIdK/m8aw0MMvW
         gWojLTU1V8detBDtgfWtZO2m9hJMu20xa1x82BJ4YOoPhdUGZMv8F6/gmnTHLQBGM+5o
         jcijDO+tn3dagroDc8+wXAODvzDcyL00e6qPLDSiAGzACmhtN0UenIgkZDHm1I2BXjYb
         OfWXw8zdkPWS/UjH7fbFmFrkYlLev+w7EJF5ZqmizEfEujPeVVnMRa1eRUm6wKzP40av
         8ZWA==
X-Gm-Message-State: ACgBeo09R0YiRuveClZzGPsodYTLPheI6dwAg4RSbuB5lbSgksA2c35s
	959CMci4cz7zc3zUy9aGtwh/Uk3wu3s=
X-Google-Smtp-Source: 
 AA6agR6dTYre5yfkVzi4rt2qoxyf6ACcYCiCQgdiWFLgc6pWb5yCBbhDXzVBvjjouhYVmn5bQob7NA==
X-Received: by 2002:a17:90b:1d0b:b0:1f5:6554:d556 with SMTP id
 on11-20020a17090b1d0b00b001f56554d556mr22294120pjb.168.1659983876425;
        Mon, 08 Aug 2022 11:37:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 a11-20020a634d0b000000b0041b672e93c2sm6623757pgb.17.2022.08.08.11.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:37:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-oe][PATCH] audit: Upgrade to 3.0.8 and fix build with linux
 5.17+
Date: Mon,  8 Aug 2022 11:37:53 -0700
Message-Id: <20220808183753.1462953-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 18:38:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98175

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
2.37.1


