Return-Path: <amarnath.valluri@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A777E60807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 11:25:01 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 13 Oct 2016 04:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,339,1473145200"; d="scan'208";a="19243768"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 13 Oct 2016 04:25:02 -0700
Received: from avalluri-GigaByte.fi.intel.com (avalluri-gigabyte.fi.intel.com
	[10.237.72.170]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4AB856A4080
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 04:24:30 -0700 (PDT)
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 14:25:02 +0300
Message-Id: <1476357902-17249-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-java][PATCH] ant-native: Fix random build failure
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
X-List-Received-Date: Thu, 13 Oct 2016 11:25:01 -0000

Due to lack of task dependency between 'do_removebinaries' and 'do_removecruft'
when both run parallelly sometimes, 'find' in do_removebinaries referring on
directories that sare already removed by do_removecruft.

This change makes sure that both tasks execute sequentially.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 recipes-core/ant/ant-native_1.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/ant/ant-native_1.8.1.bb b/recipes-core/ant/ant-native_1.8.1.bb
index 35b45d6..be65d3b 100644
--- a/recipes-core/ant/ant-native_1.8.1.bb
+++ b/recipes-core/ant/ant-native_1.8.1.bb
@@ -30,7 +30,7 @@ do_removecruft() {
 	rm -rf ${S}/src/main/org/apache/tools/ant/taskdefs/optional/NetRexxC.java
 }
 
-addtask removecruft before do_patch after do_unpack
+addtask removecruft before do_patch after do_removebinaries
 
 do_compile() {
   mkdir -p build
-- 
2.7.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


