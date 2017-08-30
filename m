Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E862A71975
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 03:08:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7U38IRg007152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:08:18 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 29 Aug 2017 20:08:17 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 30 Aug 2017 11:13:17 +0800
Message-ID: <1504062797-27983-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] udisk: fix dependency about libdevmapper
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
X-List-Received-Date: Wed, 30 Aug 2017 03:08:18 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

We have separated libdevmapper from lvm2, so we need to also fix related
dependency for udisk.

Instead of simply replacing lvm2 with libdevmapper in DEPENDS, we add
PACKAGECONFIG for libdevmapper.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-support/udisks/udisks_1.0.5.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index ffe2c26..e332660 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A storage daemon that implements well-defined D-Bus interfaces th
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73d83aebe7e4b62346afde80e0e94273"
 
-DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-native lvm2 \
+DEPENDS = "libatasmart sg3-utils polkit libgudev dbus-glib glib-2.0 intltool-native \
     dbus-glib-native \
 "
 # optional dependencies: device-mapper parted
@@ -24,7 +24,8 @@ SRC_URI[udisks.sha256sum] = "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3
 
 inherit autotools-brokensep systemd gtk-doc
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "libdevmapper"
+PACKAGECONFIG[libdevmapper] = "--enable-devmapper,--disable-devmapper,libdevmapper"
 PACKAGECONFIG[parted] = "--enable-parted,--disable-parted,parted"
 
 EXTRA_OECONF = "--disable-man-pages --libdir=${base_libdir} --sbindir=${base_sbindir}"
-- 
1.9.1


