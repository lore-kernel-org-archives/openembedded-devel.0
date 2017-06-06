Return-Path: <krisztian.litkey@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7DF5C607F8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Jun 2017 16:48:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jun 2017 09:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,306,1493708400"; d="scan'208";a="111084606"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2017 09:48:34 -0700
Received: from mandark.fi.intel.com (mandark.fi.intel.com [10.237.72.54])
	by linux.intel.com (Postfix) with ESMTP id A3CC35805CF;
	Tue,  6 Jun 2017 09:48:32 -0700 (PDT)
From: Krisztian Litkey <krisztian.litkey@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Jun 2017 19:46:37 +0300
Message-Id: <20170606164637.28029-1-krisztian.litkey@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Cc: Krisztian Litkey <krisztian.litkey@intel.com>
Subject: [meta-oe][PATCH] fuse: let overriding base_sbindir have the proper effect.
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
X-List-Received-Date: Tue, 06 Jun 2017 16:48:34 -0000

From: Krisztian Litkey <krisztian.litkey@intel.com>

Set MOUNT_FUSE_PATH explicitly to ${base_sbindir} before configure.
Making this explicit will let people override base_sbindir with the
desired effect (for instance when building a distro with merged /
and /usr).

Signed-off-by: Krisztian Litkey <krisztian.litkey@intel.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
index 153fcb4..16fc807 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.4.bb
@@ -44,6 +44,11 @@ FILES_fuse-utils-dbg = "${bindir}/.debug ${base_sbindir}/.debug"
 DEBIAN_NOAUTONAME_fuse-utils = "1"
 DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
 
+do_configure_prepend() {
+    # Make this explicit so overriding base_sbindir propagates properly.
+    export MOUNT_FUSE_PATH="${base_sbindir}"
+}
+
 do_install_append() {
     rm -rf ${D}${base_prefix}/dev
 
-- 
2.9.3


