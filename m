Return-Path: <net147@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 700F97316B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 09:44:51 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id hk6so2069082pad.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 01:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=XZ3/z22sXeW4RcFzYgNbxDFuU1OcC+w8KEenNEpcBG0=;
	b=xxwrtGxRBrA4IFGSp6OMgryp9frYMvtnAoSADJpVm63VkbAfEIuq8+4sYZB/+WQhrO
	sG1gsF4jv551uzvNJ/L3BqAM800/NMIbS+ruKIgBbg6YvbB8RJOaCDYOA5ZvhgBWVLtA
	KdbsbFddwTNT1m6XIjFEt5ksI+SNKzXcqHf9aTeQeQXcppUYXTN+lQsGy4wQvz574zcT
	I2d5Mwv5RluE/EIUvEBG8cRaE26/w7lhcSErIdoC8sBVIOT53isTolWq9rdlsBqmhofh
	vhMkvYcZ94lw3p2PJJ56JdvLo3vQ+b4xzjv/7FXRmpxDwxuhXujj0in/hlzQ5+1b3h6u
	3kug==
X-Received: by 10.67.6.38 with SMTP id cr6mr52780060pad.104.1450172692207;
	Tue, 15 Dec 2015 01:44:52 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id r5sm1003117pfi.73.2015.12.15.01.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Dec 2015 01:44:51 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Dec 2015 20:44:28 +1100
Message-Id: <1450172669-20882-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [meta-qt5][PATCH 1/2] packagegroup-qt5-toolchain-target: do not check for meta-ruby layer
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
X-List-Received-Date: Tue, 15 Dec 2015 09:44:53 -0000

The ruby recipe has been moved into OE-core so checking for the
meta-ruby layer is no longer needed as the ruby recipe will always
be present.
---
 recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
index 30d0622..cc4d4b5 100644
--- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
+++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
@@ -7,7 +7,7 @@ inherit packagegroup
 
 PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
 
-# Requires meta-ruby to work
+# Requires Ruby to work
 USE_RUBY = " \
     qtquick1-dev \
     qtquick1-mkspecs \
@@ -95,7 +95,7 @@ RDEPENDS_${PN} += " \
     qttools-staticdev \
     qttools-tools \
     ${@base_contains('DISTRO_FEATURES', 'wayland', '${USE_WAYLAND}', '', d)} \
-    ${@base_contains('BBFILE_COLLECTIONS', 'ruby-layer', '${USE_RUBY}', '', d)} \
+    ${USE_RUBY} \
     ${@base_contains('DISTRO_FEATURES', 'x11', '${USE_X11}', '', d)} \
     qtwebsockets-dev \
     qtwebsockets-mkspecs \
-- 
2.6.4


