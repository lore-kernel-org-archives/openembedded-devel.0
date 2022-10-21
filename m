Return-Path: <hadkeakash4@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EEEC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:12:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.9648.1666357966974595088
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Oct 2022 06:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jcuwr02q;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: hadkeakash4@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id u10so4825226wrq.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 06:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wH6cErenVak0Py3uMwI6w8ApXr1VbieHc5+e4qimDBc=;
        b=jcuwr02qYKp/ItdOcEBJjJEBj/BAstUr7RVJXR1qhHiQ+vlw+Zv6vhUjIryx+Bm2YI
         s6hOwceeg7b5rgA191uo7e35+gziPbh+5Ij9Fr7abJ9BeWEHNNQCUaBV4rcS2hEm657k
         TtllhryE9NqcUXyR0KxRVcJxngtP8yKAD61D6U3sbd/QCFgVCD0+z6VwI/rSDFSszcgM
         lDwHypH3813AV8rDgp4gjSFknOg5zo4KcaZeHysbwDXEYBuuECi8x9w4Hpd+KnDSPR6o
         uc3zrkV33yuC6JEs5Oh9Pif2dX75JBoEY+T0JWCkneMbHIAmKwKYNXkbO08gAKWIyxE8
         IYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wH6cErenVak0Py3uMwI6w8ApXr1VbieHc5+e4qimDBc=;
        b=p3ICy0uv5TKWb+RZvU3ScQ3SK6syQ5haHNbReNpwDWfld6fh73FvIK2q77NwlnPxHz
         feFy7kH2NFU8XBKvUyMUv/+yI0iPZejx1jtJy0i0uC4oMa+67tNC9bVt8w3SjAgltUl3
         QA4S9cGc0QdoFAKZH5Pn1o/uIYDXklSClS6HhOjCSI50KW2UuCVSNa2R+ORks+iWC/iV
         aH5gAD2kb3I9pbYZDMZgLGZSrUWbZHw1gWvVYXkMVPA+aIgs+K2J/+jETDroo6cJuVvs
         ZfaAy4JOVSSwo1PJFSMZkn81sgIvR6rkSPT7VoTHkDgHuZIj0VBig9fGDs2mH6ax8Kzw
         LCPw==
X-Gm-Message-State: ACrzQf1IQrTt+8iG+sdcAksYZD6uBj07XmGDUuMHpKwVcXsFu3zioAkq
	SJwNQPhVzHhnF49VF8PYx5Fd4tIo0X0=
X-Google-Smtp-Source: AMsMyM68j3GyCpPqFrq0PdVXscEp1tFpOEJXloIoG7ylZPqL1CVhGuw4XOmI8Ok8PCb9jBZhMkE48w==
X-Received: by 2002:a05:6000:607:b0:235:d82c:ccea with SMTP id bn7-20020a056000060700b00235d82ccceamr5730695wrb.135.1666357964702;
        Fri, 21 Oct 2022 06:12:44 -0700 (PDT)
Received: from GL-449.bmw-carit.intra ([212.118.206.70])
        by smtp.gmail.com with ESMTPSA id g5-20020a5d4885000000b0022e55f40bc7sm18723679wrq.82.2022.10.21.06.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:12:44 -0700 (PDT)
From: Akash Hadke <hadkeakash4@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	Akash Hadke <hadkeakash4@gmail.com>,
	Akash Hadke <akash.hadke@kpit.com>
Subject: [oe][meta-oe][master][kirkstone][PATCH] audit: Fix compile error for audit_2.8.5
Date: Fri, 21 Oct 2022 15:12:11 +0200
Message-Id: <20221021131211.32353-1-hadkeakash4@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Oct 2022 13:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99253

Fix below compile errors
1. Fix build with linux 5.17+
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

Take reference of upstream commit
ee3c680c3 audit: Upgrade to 3.0.8 and fix build with linux 5.17+

Update 0002-Fixed-swig-host-contamination-issue.patch

2. Fix ipx.h missing file bug for kernel 5.15
ipx.h header file is removed in kernel 5.15
Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/include/net?id=6c9b40844751ea30c72f7a2f92f4d704bc6b2927

which is causing below error for system with kernel equal and
higher than 5.15

| ../../git/auparse/interpret.c:48:10: fatal error: linux/ipx.h: No such file or directory
|    48 | #include <linux/ipx.h>
|       |          ^~~~~~~~~~~~~

Add below patch to fix this issue.
0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
Link: https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c

Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
---
 ...retation-dependent-on-the-ipx-header.patch | 65 +++++++++++++++++++
 ...-Fixed-swig-host-contamination-issue.patch |  9 ++-
 meta-oe/recipes-security/audit/audit_2.8.5.bb |  6 ++
 3 files changed, 78 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch

diff --git a/meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch b/meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
new file mode 100644
index 000000000..054f50ab2
--- /dev/null
+++ b/meta-oe/recipes-security/audit/audit/0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch
@@ -0,0 +1,65 @@
+From 6b09724c69d91668418ddb3af00da6db6755208c Mon Sep 17 00:00:00 2001
+From: Steve Grubb <sgrubb@redhat.com>
+Date: Thu, 2 Sep 2021 15:01:12 -0400
+Subject: [PATCH] Make IPX packet interpretation dependent on the ipx header
+ file existing
+
+Upstream-Status: Backport [https://github.com/linux-audit/audit-userspace/commit/6b09724c69d91668418ddb3af00da6db6755208c.patch]
+Comment: Remove one hunk from changelog file and refresh rest hunks as per codebase of audit_2.8.5
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+---
+ auparse/interpret.c | 8 ++++++--
+ configure.ac        | 6 ++++++
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/auparse/interpret.c b/auparse/interpret.c
+index 63829aa0e..6c316456d 100644
+--- a/auparse/interpret.c	2022-10-14 11:22:20.833880000 +0200
++++ b/auparse/interpret.c	2022-10-14 11:35:13.196455950 +0200
+@@ -44,8 +44,10 @@
+ #include <linux/ax25.h>
+ #include <linux/atm.h>
+ #include <linux/x25.h>
+-#include <linux/if.h>   // FIXME: remove when ipx.h is fixed
+-#include <linux/ipx.h>
++#ifdef HAVE_IPX_HEADERS
++  #include <linux/if.h>   // FIXME: remove when ipx.h is fixed
++  #include <linux/ipx.h>
++#endif
+ #include <linux/capability.h>
+ #include <sys/personality.h>
+ #include <sys/prctl.h>
+@@ -1158,6 +1160,7 @@
+ 					      x->sax25_call.ax25_call[6]);
+                         }
+                         break;
++#ifdef HAVE_IPX_HEADERS
+                 case AF_IPX:
+                         {
+                                 const struct sockaddr_ipx *ip =
+@@ -1167,6 +1170,7 @@
+ 					str, ip->sipx_port, ip->sipx_network);
+                         }
+                         break;
++#endif
+                 case AF_ATMPVC:
+                         {
+                                 const struct sockaddr_atmpvc* at =
+diff --git a/configure.ac b/configure.ac
+index 8f541e4c0..005eb0b5b 100644
+--- a/configure.ac	2022-10-14 11:22:20.833880000 +0200
++++ b/configure.ac	2022-10-14 11:36:32.391044084 +0200
+@@ -414,6 +414,12 @@
+ 	AC_DEFINE_UNQUOTED(HAVE_LIBWRAP, [], Define if tcp_wrappers support is enabled )
+ fi
+ 
++# linux/ipx.h - deprecated in 2018
++AC_CHECK_HEADER(linux/ipx.h, ipx_headers=yes, ipx_headers=no)
++if test $ipx_headers = yes ; then
++	AC_DEFINE(HAVE_IPX_HEADERS,1,[IPX packet interpretation])
++fi
++
+ # See if we want to support lower capabilities for plugins
+ LIBCAP_NG_PATH
+ 
+
diff --git a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
index 4a1b97997..39a090c83 100644
--- a/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
+++ b/meta-oe/recipes-security/audit/audit/0002-Fixed-swig-host-contamination-issue.patch
@@ -13,6 +13,11 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
 Signed-off-by: Joe Slater <jslater@windriver.com>
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+Comment: Refresh hunk from auditswig.i to fix build with linux 5.17+
+Reference-Commit: ee3c680c3 audit: Upgrade to 3.0.8 and fix build with linux 5.17+
+Signed-off-by: Akash Hadke <akash.hadke@kpit.com>
+Signed-off-by: Akash Hadke <hadkeakash4@gmail.com>
 ---
  bindings/swig/python3/Makefile.am | 3 ++-
  bindings/swig/src/auditswig.i     | 2 +-
@@ -43,12 +48,12 @@ diff --git a/bindings/swig/src/auditswig.i b/bindings/swig/src/auditswig.i
 index 7ebb373..424fb68 100644
 --- a/bindings/swig/src/auditswig.i
 +++ b/bindings/swig/src/auditswig.i
-@@ -39,7 +39,7 @@ signed
+@@ -39,7 +39,7 @@
  #define __attribute(X) /*nothing*/
  typedef unsigned __u32;
  typedef unsigned uid_t;
 -%include "/usr/include/linux/audit.h"
-+%include "linux/audit.h"
++%include "../lib/audit.h"
  #define __extension__ /*nothing*/
  #include <stdint.h>
  %include "../lib/libaudit.h"
diff --git a/meta-oe/recipes-security/audit/audit_2.8.5.bb b/meta-oe/recipes-security/audit/audit_2.8.5.bb
index 347c85506..f846b27f9 100644
--- a/meta-oe/recipes-security/audit/audit_2.8.5.bb
+++ b/meta-oe/recipes-security/audit/audit_2.8.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=2.8_maintena
            file://auditd \
            file://auditd.service \
            file://audit-volatile.conf \
+           file://0001-Make-IPX-packet-interpretation-dependent-on-the-ipx-header.patch \
 "
 
 S = "${WORKDIR}/git"
@@ -72,6 +73,11 @@ FILES:${PN}-python = "${libdir}/python${PYTHON_BASEVERSION}"
 CONFFILES:auditd = "${sysconfdir}/audit/audit.rules"
 RDEPENDS:auditd = "bash"
 
+do_configure:prepend() {
+        sed -e 's|buf\[];|buf[0];|g'  ${STAGING_INCDIR}/linux/audit.h > ${S}/lib/audit.h
+        sed -i -e 's|#include <linux/audit.h>|#include "audit.h"|g' ${S}/lib/libaudit.h
+}
+
 do_install:append() {
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.a
 	rm -f ${D}/${libdir}/python${PYTHON_BASEVERSION}/site-packages/*.la
-- 
2.17.1


