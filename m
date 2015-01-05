Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7FBE3723D8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381150"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:54 +0000
Message-Id: <d5f5fbcfca49e7f704c5f26bb7cebf4a91801757.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 10/10] libssh: update to just after 0.6.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Jan 2015 11:01:32 -0000

Among other things, includes a fix for CVE-2014-8132.

(There are a couple of useful-looking fixes after 0.6.4 in the 0.6
branch, hence I have renamed the recipe to _git and set PV to the
standard format.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/libssh/{libssh_0.6.3.bb => libssh_git.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.6.3.bb => libssh_git.bb} (90%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb b/meta-oe/recipes-support/libssh/libssh_git.bb
similarity index 90%
rename from meta-oe/recipes-support/libssh/libssh_0.6.3.bb
rename to meta-oe/recipes-support/libssh/libssh_git.bb
index 771a47a..d21bdc3 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.6.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_git.bb
@@ -8,9 +8,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
 SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-6"
-SRCREV = "87145387aa12b720b52d6bc75b4dd6cd058c868a"
+SRCREV = "3880a8ed80a4b1e2c052bd62f328bba2f869d5ae"
 S = "${WORKDIR}/git"
 
+PV = "0.6.4+git${SRCPV}"
+
 EXTRA_OECMAKE = " \
     -DWITH_GCRYPT=1 \
     -DWITH_PCAP=1 \
-- 
1.9.3


