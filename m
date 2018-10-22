Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78A3E79BA7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 21:19:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Oct 2018 14:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,413,1534834800"; d="scan'208";a="90408972"
Received: from pgeddapp-mobl3.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.65.239])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2018 14:19:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Oct 2018 10:19:30 +1300
Message-Id: <989d0e787f2adb3e7248aa0665b84384a01cd428.1540243091.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1540243091.git.paul.eggleton@linux.intel.com>
References: <cover.1540243091.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/1] libssh: upgrade to 0.8.4
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
X-List-Received-Date: Mon, 22 Oct 2018 21:19:44 -0000

Notable changes since 0.7.3:
  * Fixed CVE-2018-10933 authentication bypass
  * Removed support for deprecated SSHv1 protocol
  * Added support for OpenSSL 1.1
  * Added support for chacha20-poly1305 cipher
  * Added ECDSA support with gcrypt backend
  * Improved threading support (note: libssh_threads is now gone)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libssh/{libssh_0.7.3.bb => libssh_0.8.4.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libssh/{libssh_0.7.3.bb => libssh_0.8.4.bb} (86%)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
similarity index 86%
rename from meta-oe/recipes-support/libssh/libssh_0.7.3.bb
rename to meta-oe/recipes-support/libssh/libssh_0.8.4.bb
index 6064969ae..8566741a3 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.8.4.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=388a4fb1dea8ceae0be78ba9b01fc139"
 
 DEPENDS = "zlib openssl libgcrypt"
 
-SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=v0-7"
-SRCREV = "cdf7690e038230623cbbf6b024ece62f41efa98d"
+SRC_URI = "git://git.libssh.org/projects/libssh.git;branch=stable-0.8"
+SRCREV = "789df0b7d0c7abd6b85db9fc5247e146e3d4ddba"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.2


