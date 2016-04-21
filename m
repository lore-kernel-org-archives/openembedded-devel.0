Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ACFFC6057B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Apr 2016 03:10:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 20 Apr 2016 20:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,512,1455004800"; d="scan'208";a="689667499"
Received: from badger.amr.corp.intel.com ([10.64.103.34])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Apr 2016 20:10:18 -0700
From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2016 20:09:49 -0700
Message-Id: <1461208189-2377-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] udisks2: add acl to DEPENDS
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
X-List-Received-Date: Thu, 21 Apr 2016 03:10:17 -0000

fixes:
| configure: error: *** ACL headers not found.
---
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
index d273948..1e00f71 100644
--- a/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks2_2.1.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "udisks provides dbus interfaces for disks and storage devices"
 LICENSE = "GPLv2+ & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dd79f6dbbffdbc8e86b086a8f0c0ef43"
 
-DEPENDS = "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native"
+DEPENDS = "libatasmart polkit libgudev dbus-glib glib-2.0 intltool-native gnome-common-native acl"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 
 RDEPENDS_${PN} = "acl"
-- 
1.9.1


