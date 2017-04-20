Return-Path: <krisztian.litkey@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9778A72F24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Apr 2017 15:21:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 20 Apr 2017 08:21:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,225,1488873600"; d="scan'208";a="76792020"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2017 08:21:11 -0700
Received: from mandark.fi.intel.com (mandark.fi.intel.com [10.237.72.54])
	by linux.intel.com (Postfix) with ESMTP id 1E95D6A4080;
	Thu, 20 Apr 2017 08:20:59 -0700 (PDT)
From: Krisztian Litkey <krisztian.litkey@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Apr 2017 18:17:50 +0300
Message-Id: <20170420151750.2627-1-krisztian.litkey@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Krisztian Litkey <krisztian.litkey@intel.com>
Subject: [meta-oe][PATCH] multipath-tools: don't blindly assume base_sbindir to be /sbin.
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
X-List-Received-Date: Thu, 20 Apr 2017 15:21:10 -0000

From: Krisztian Litkey <krisztian.litkey@intel.com>

Don't blindly assume base_sbindir is /sbin. Pass its real value
instead to the build process to make sure binaries end up in the
right place even when base_sbin happens to point somewhere else.

Signed-off-by: Krisztian Litkey <krisztian.litkey@intel.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index a63982e..838a47a 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -39,6 +39,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 #
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
                 OPTFLAGS="${CFLAGS}" \
+                bindir=${base_sbindir} \
                 LIB=${base_libdir} libdir=${base_libdir}/multipath \
                 unitdir=${systemd_system_unitdir} \
                 ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
-- 
2.9.3


