Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D68C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 09:20:58 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6322.1676539252381686525
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 01:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SwF8TuGQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C3920FF80B;
	Thu, 16 Feb 2023 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1676539250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TgqZpKDM7z/kpVuq3MNBhsy2CA2KfBFlfr8uGPrvCGs=;
	b=SwF8TuGQHzf8IK5T2rGE/3ZPLS3hgSyWs4/+clWgkbK2AasR5JGaz6bJBIn8KzzQGfyh2e
	SMwSOl6mTWvPtYcCPBCV9/mtMvI1uY4+Qn2yE+3sWixU9VaWnsrs9ST6BFHYbhM0vDul/N
	yrTjaZW2dw9fpUODXGOIpdV1k/pm13tChzXWdpXL9ahaBdECDdGmzuqeXKEi9EGZLPmRAq
	crt8SsMJ+oy5jFmb6cMRvj0+oYz+/d57rC7xT0CmkpBYHNvQZb7yQdzPrb0e1xVbkDSv0z
	de1kYtMYyIp2Bj3sPl2+H3OPrnmIzqweiuev8p0HgiZFUBaTzDNyKR0K4wecRw==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [meta-networking][PATCH] ipcalc: update to 1.0.2
Date: Thu, 16 Feb 2023 10:20:43 +0100
Message-Id: <20230216092043.2360570-1-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 09:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101101

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

- Now built with meson
- Update the source git repository and home page
  https://github.com/nmav/ipcalc redirects to https://gitlab.com/ipcalc/ipcalc
- USE_GEOIP = "no" not necessary in the recipe, already
  set by default in the code.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...001-Makefile-pass-extra-linker-flags.patch | 29 -------------------
 .../recipes-support/ipcalc/ipcalc_0.2.3.bb    | 21 --------------
 .../recipes-support/ipcalc/ipcalc_1.0.2.bb    | 14 +++++++++
 3 files changed, 14 insertions(+), 50 deletions(-)
 delete mode 100644 meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
 delete mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
 create mode 100644 meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb

diff --git a/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch b/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
deleted file mode 100644
index e95b6f993..000000000
--- a/meta-networking/recipes-support/ipcalc/ipcalc/0001-Makefile-pass-extra-linker-flags.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 7fd0e0b88df692dfc67335f235a1bb74854a0498 Mon Sep 17 00:00:00 2001
-From: Mariia Movchan <mmovchan@cisco.com>
-Date: Tue, 6 Mar 2018 16:03:39 +0200
-Subject: [PATCH] Makefile: pass extra linker flags
-
-Fixes
-ERROR: QA Issue: No GNU_HASH in the elf binary
-
-Upstream-Status: Pending
-
-Signed-off-by: Mariia Movchan <mmovchan@cisco.com>
-
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 54569c1..798988f 100644
---- a/Makefile
-+++ b/Makefile
-@@ -8,7 +8,7 @@ LIBS?=
- VERSION=0.2.3
- CC?=gcc
- CFLAGS?=-O2 -g -Wall
--LDFLAGS=$(LIBS)
-+LDFLAGS+=$(LIBS)
- 
- ifeq ($(USE_GEOIP),yes)
- ifeq ($(USE_DYN_GEOIP),yes)
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb b/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
deleted file mode 100644
index efac3c86e..000000000
--- a/meta-networking/recipes-support/ipcalc/ipcalc_0.2.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
-HOMEPAGE = "https://github.com/nmav/ipcalc"
-
-SECTION = "net"
-
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-S = "${WORKDIR}/git"
-SRCREV = "c3ee70c878b9c5833a77a1f339f1ca4dc6f225c5"
-SRC_URI = "\
-    git://github.com/nmav/ipcalc.git;protocol=https;;branch=master \
-    file://0001-Makefile-pass-extra-linker-flags.patch \
-"
-
-export USE_GEOIP = "no"
-
-do_install() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${S}/ipcalc ${D}/${bindir}
-}
diff --git a/meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb
new file mode 100644
index 000000000..1b7b68a7a
--- /dev/null
+++ b/meta-networking/recipes-support/ipcalc/ipcalc_1.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Tool to assist in network address calculations for IPv4 and IPv6."
+HOMEPAGE = "https://gitlab.com/ipcalc/ipcalc"
+
+SECTION = "net"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
+SRCREV = "4c4261a47f355946ee74013d4f5d0494487cc2d6"
+
+S = "${WORKDIR}/git"
+
+inherit meson
-- 
2.37.2


