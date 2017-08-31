Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3492377E0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 05:28:34 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so5610561pfr.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 22:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LzWYjOGUNuExBZyPWHN5IjAsHOmu1C2bg7mLspLLHzQ=;
	b=JDiEbQkCvPXu1A/RGCVJ2pU1F+C0K+asAeT1KqqVmUWEHVZeuAvXXddIv3QY2byHWA
	KzYMnehzBd0jJgCKhkfOkHMlg1E2WaMuTw9oaDQf9LjuJFqepiOMWJRAIdXwpHKElaPJ
	ufCfRhc/q8CZPCsbSYgyAKTQbfQUDA5Vmqf7b4GIPKZNbFKe59GE2BGEYvTvE87uA6Q0
	UJRUiuISEK7Zt3lKbBWuyhosJbnltc0Qo2zIeWda58kwfuNBdlPNWbxuXXG/79QWYgvO
	6VHAxx7AEOqxBDnEYvE3Z8yhnwL6bZke19V2YmvcOJg1TNOjclLBENXNtEedBvRKx/px
	0PWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LzWYjOGUNuExBZyPWHN5IjAsHOmu1C2bg7mLspLLHzQ=;
	b=oYJRP/v2SeKmUSg2ruN8JM5iyc2OmRyZ/x0Yf6qYFnlxNYDF/m5PsaQmdRSO+bxydx
	oKTHVmQL0j5eIu920Wzu+uQoHHL+F3guRrNPhY+weP2HuUsfd3b5B4N5Z61awZC0fF1w
	HD0vntEd/xcxfMlIV19Rpf/b9oNgoCZuIY/2yZD14XSPu74SHS7oCWDaCvd0tuQ1rl7+
	kb1dYpRKlSF9PQgoqApFTmNeNBCjGQZbUvU6Zrj/jSiWGW8RePaTLyX2PJyEcYAbxYTJ
	CfMZyewGWAWn843LnQyODNFHf8HQFVnDWx9v++ro73mwJiTOq0VFAxk2rvVcBjJWfy1H
	ppaA==
X-Gm-Message-State: AHYfb5ggvenaysgqCLUb5yimD62Mt98j2mZIs5m8oeZ+zqg1GZdoIWUh
	6AYaPpETJ9ECttFE
X-Received: by 10.99.1.5 with SMTP id 5mr1106955pgb.313.1504157316122;
	Wed, 30 Aug 2017 22:28:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	y81sm11737754pfi.153.2017.08.30.22.28.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 22:28:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Aug 2017 22:28:26 -0700
Message-Id: <20170831052827.34529-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] serial-forward: Fix build with hardening+musl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Aug 2017 05:28:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...al_forward-Disable-default-static-linking.patch | 29 ++++++++++++++++++++++
 .../serial-utils/serial-forward_git.bb             |  6 +++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch

diff --git a/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch b/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch
new file mode 100644
index 000000000..7dcc67d11
--- /dev/null
+++ b/meta-oe/recipes-support/serial-utils/serial-forward/0001-serial_forward-Disable-default-static-linking.patch
@@ -0,0 +1,29 @@
+From a0d815ad9918aba977aed9275b3bf3d750a1709b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 30 Aug 2017 19:24:40 -0700
+Subject: [PATCH] serial_forward: Disable default static linking
+
+This does not work with ssp turned on with hardening flags on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/serial_forward/src/Makefile.am | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/tools/serial_forward/src/Makefile.am b/tools/serial_forward/src/Makefile.am
+index 3f598286..bcac9bc9 100644
+--- a/tools/serial_forward/src/Makefile.am
++++ b/tools/serial_forward/src/Makefile.am
+@@ -20,9 +20,6 @@ serial_forward_SOURCES = \
+ 	cy8mrln.h \
+ 	$(NULL)
+ 
+-serial_forward_LDFLAGS = \
+-	-all-static
+-
+ pty_forward_SOURCES = \
+ 	pty_forward.c \
+ 	$(NULL)
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
index 6494de9d3..0ef829856 100644
--- a/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
+++ b/meta-oe/recipes-support/serial-utils/serial-forward_git.bb
@@ -3,10 +3,12 @@ AUTHOR = "Holger 'Zecke' Freyther'"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07"
 SECTION = "console/devel"
-SRCREV = "00dbec2636ae0385ad028587e20e446272ff97ec"
+SRCREV = "07c6fdede0870edc37a8d51d033b6e7e29aa7c91"
 PV = "1.1+gitr${SRCPV}"
 
-SRC_URI = "git://github.com/freesmartphone/cornucopia.git"
+SRC_URI = "git://github.com/freesmartphone/cornucopia.git \
+           file://0001-serial_forward-Disable-default-static-linking.patch;striplevel=3 \
+          "
 S = "${WORKDIR}/git/tools/serial_forward"
 
 inherit autotools
-- 
2.14.1


