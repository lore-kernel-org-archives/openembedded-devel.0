Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D1BEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 05:49:57 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6646.1688708987476662223
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 22:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123549335"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123549335"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:49:44 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DCFBC3F8B
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 14:49:37 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A13E4EA0AA
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 14:49:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B97A87E83;
	Fri,  7 Jul 2023 14:49:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] passwdqc: upgrade 2.0.2 -> 2.0.3
Date: Fri,  7 Jul 2023 13:49:31 +0800
Message-Id: <1688708971-3540-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.003
X-TMASE-Result: 10--6.058100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yaoXHZz/dXlxnJdsOLB4zv5fv9SYkzU9kdnf
	JrUSEbFDJMPD8FR5f58F1Ec/oUIRlVpCIuRr0RxK+Basxm9uZ4fBOVz0Jwcxl0fyM5VfgjG2Miw
	cxLTcjXZQGoanvsRLW8qi59sgP68Quh0tHimGLUY7Cl8sx4HBG2v34qCfZeB4S6QizeDUeN6yuh
	piqaRnanQYNnCFkMfmeTjw/FyRX6QfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8h+ICquNi0WJFPp8
	MNs43gI4On2vBeX86RMzjFbnwIbRzswDWR9tvOiftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 05:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103710

From: Wang Mingyu <wangmy@fujitsu.com>

makefile-add-ldflags.patch
refreshed for 2.0.3

Changelog:
===========
-Added pkg-config file.
-Changed enforce=users to support "chpasswd" PAM service in addition to
traditionally supported "passwd".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../passwdqc/passwdqc/makefile-add-ldflags.patch    | 13 ++++++++++++-
 .../{passwdqc_2.0.2.bb => passwdqc_2.0.3.bb}        |  2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-security/passwdqc/{passwdqc_2.0.2.bb => passwdqc_2.0.3.bb} (96%)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
index 6e4803f4f3..4e9659aa58 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
+++ b/meta-oe/recipes-security/passwdqc/passwdqc/makefile-add-ldflags.patch
@@ -3,10 +3,15 @@ Add LDFLAGS variable to Makefile so that extra linker flags can be sent via this
 Upstream-Status: Pending
 
 Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index 404f036..a9b18f0 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -68,18 +68,17 @@ XGETTEXT = xgettext
+@@ -75,13 +75,12 @@ XGETTEXT = xgettext
  XGETTEXT_OPTS = --keyword=_ --keyword=P2_:1,1 --keyword=P3_:1,2 --language=C --add-comments
  MSGMERGE = msgmerge
  
@@ -21,9 +26,15 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  	-Wl,--soname,$(SHARED_LIB),--version-script,$(MAP_LIB)
  LDFLAGS_lib_SUN = $(LDFLAGS_shared_SUN)
  LDFLAGS_lib_HP = $(LDFLAGS_shared_HP)
+@@ -90,7 +89,7 @@ LDFLAGS_lib_CYGWIN = $(LDFLAGS_shared) \
+ 	-Wl,--export-all-symbols \
+ 	-Wl,--enable-auto-import
  LDFLAGS_pam = $(LDFLAGS_shared)
 -LDFLAGS_pam_LINUX = $(LDFLAGS_shared_LINUX) \
 +LDFLAGS_pam_LINUX = $(LDFLAGS) $(LDFLAGS_shared_LINUX) \
  	-Wl,--version-script,$(MAP_PAM)
  LDFLAGS_pam_SUN = $(LDFLAGS_shared_SUN)
  LDFLAGS_pam_HP = $(LDFLAGS_shared_HP)
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
similarity index 96%
rename from meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
rename to meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
index 8462701b31..8694052e61 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.3.bb
@@ -30,7 +30,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ac99c8678577a1c2f9f04cccee411d5d"
 SRC_URI = "http://www.openwall.com/${BPN}/${BP}.tar.gz \
            file://makefile-add-ldflags.patch \
           "
-SRC_URI[sha256sum] = "ff1f505764c020f6a4484b1e0cc4fdbf2e3f71b522926d90b4709104ca0604ab"
+SRC_URI[sha256sum] = "53b0f4bc49369f06195e9e13abb6cff352d5acb79e861004ec95973896488cf4"
 
 # explicitly define LINUX_PAM in case DISTRO_FEATURES no pam
 # this package's pam_passwdqc.so needs pam
-- 
2.34.1


