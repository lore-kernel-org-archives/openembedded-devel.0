Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D82BCD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 04:34:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.122686.1781498050229138724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Jun 2026 21:34:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T3gVb8sM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781498051; x=1813034051;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FuVKmb2xuU2HOPEel8Gca123RiI77gRejVwwpNc1q7k=;
  b=T3gVb8sMt31XDVvm5PV0XoXL90SOr4t82yuhazRZ9O0O2CDOD0PZsjez
   GX+Cac5WDvkOOr6KB0socYIflzwJhAD7OI5XJ0PHEX1F0PN8ibFe51+BH
   04gIAsmnRzFr3kxLnvG6jRuivFftE6R8qCJlm82oG0Yq9xndFWyKDRGOu
   IYU9oijqxrdzw0YRecVrrC/F+1mSnBYNwCTHhxCqV5I2MZeM3KhUj34yb
   85g1Qfr9TyBpTiL8bKBrWzsP//8CjoR/9/TeqK5BNB0bxlfaR+g85/c4g
   CpUaGOlZTId/QfJaGy+Qbk0ZHDhid38cyzBTQ4fOpP0ThSc3ZP92Wq4wx
   A==;
X-CSE-ConnectionGUID: t9ayBoXETteMP6KCDmyI1A==
X-CSE-MsgGUID: vHYc+1HTRvW+VGpJvdYq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="244130814"
X-IronPort-AV: E=Sophos;i="6.24,205,1774278000"; 
   d="scan'208";a="244130814"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 13:34:09 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2F8FEC000BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 04:34:08 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DAF83831C49
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 04:34:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id DB9BF200013C;
	Mon, 15 Jun 2026 04:34:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] opensaf: fix build error by adding const to comparators
Date: Mon, 15 Jun 2026 12:34:02 +0800
Message-ID: <20260615043402.2358-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jun 2026 04:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127579

From: Wang Mingyu <wangmy@fujitsu.com>

Comparator objects used in standard containers (such as std::set)
must be invocable as const. Opensaf contains several comparators
that lack the 'const' qualifier, leading to compilation failures like:

  error: passing 'const XxxCompare*' as 'this' argument discards qualifiers

Add a backported patch to fix the comparators in imm_xmlw_dump.cc
and amfd/node.h by adding the missing 'const' to operator().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-fix-NodeNameCompare-const.patch      | 56 +++++++++++++++++++
 .../opensaf/opensaf_5.26.02.bb                |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0001-fix-NodeNameCompare-const.patch

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-fix-NodeNameCompare-const.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-fix-NodeNameCompare-const.patch
new file mode 100644
index 0000000000..957f01e89d
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-fix-NodeNameCompare-const.patch
@@ -0,0 +1,56 @@
+From 5e9f2fd4c73c9e0b666290934227200f2515f206 Mon Sep 17 00:00:00 2001
+From: Wang Mingyu <wangmy@fujitsu.com>
+Date: Mon, 15 Jun 2026 03:32:05 +0000
+Subject: [PATCH] fix NodeNameCompare const
+
+Upstream-Status: Submitted [sourceforge]
+
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ src/amf/amfd/node.cc           | 2 +-
+ src/amf/amfd/node.h            | 2 +-
+ src/imm/tools/imm_xmlw_dump.cc | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/amf/amfd/node.cc b/src/amf/amfd/node.cc
+index 04f35e7..9785a01 100644
+--- a/src/amf/amfd/node.cc
++++ b/src/amf/amfd/node.cc
+@@ -43,7 +43,7 @@ bool operator<(const AVD_AVND &lhs, const AVD_AVND &rhs) {
+   }
+ }
+ 
+-bool NodeNameCompare::operator()(const AVD_AVND *lhs, const AVD_AVND *rhs) {
++bool NodeNameCompare::operator()(const AVD_AVND *lhs, const AVD_AVND *rhs) const {
+   return *lhs < *rhs;
+ }
+ 
+diff --git a/src/amf/amfd/node.h b/src/amf/amfd/node.h
+index 3456adb..c6527d5 100644
+--- a/src/amf/amfd/node.h
++++ b/src/amf/amfd/node.h
+@@ -170,7 +170,7 @@ struct NodeNameCompare
+   typedef AVD_AVND first_argument_type;
+   typedef AVD_AVND second_argument_type;
+   typedef bool result_type;
+-  bool operator()(const AVD_AVND *lhs, const AVD_AVND *rhs);
++  bool operator()(const AVD_AVND *lhs, const AVD_AVND *rhs) const;
+ };
+ 
+ extern AmfDb<std::string, AVD_AVND> *node_name_db;
+diff --git a/src/imm/tools/imm_xmlw_dump.cc b/src/imm/tools/imm_xmlw_dump.cc
+index f8474c3..2da9bef 100644
+--- a/src/imm/tools/imm_xmlw_dump.cc
++++ b/src/imm/tools/imm_xmlw_dump.cc
+@@ -39,7 +39,7 @@ typedef struct {
+ 
+ /* Comparision object for Object */
+ struct ObjectComp {
+-  bool operator()(const Object& lhs, const Object& rhs) {
++  bool operator()(const Object& lhs, const Object& rhs) const {
+     return (lhs.reversedDn.compare(rhs.reversedDn) < 0) ? true : false;
+   }
+ };
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb
index eede11515b..bc022c44d6 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.26.02.bb
@@ -29,6 +29,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Use-correct-printf-format-for-__fsblkcnt_t.patch \
            file://0002-configure-Disable-selected-warnings.patch \
            file://0001-To-fix-Werror-discarded-qualifiers-error.patch \
+           file://0001-fix-NodeNameCompare-const.patch \
            "
 SRC_URI[sha256sum] = "c51603bc486ce6db271a7023a75963bfc6f277f4d4486df2fe004a51c81cfdee"
 
-- 
2.43.0


