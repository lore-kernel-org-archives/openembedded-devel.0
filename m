Received: from smtprelay-b12.telenor.se ([62.127.194.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ulf_samuelsson@telia.com>) id 1RGXsg-0003Ri-NH
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 17:16:34 +0200
Received: from iph1.telenor.se (iph1.telenor.se [195.54.127.132])
	by smtprelay-b12.telenor.se (Postfix) with ESMTP id 0E03BE9E47
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 17:10:35 +0200 (CEST)
X-SENDER-IP: [83.227.57.13]
X-LISTENER: [smtp.bredband.net]
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Au1qALjnnk5T4zkNPGdsb2JhbABEiTyQS45sGQEBAQE3MoFuAQEFSwEKIxAgHxI5ChQZiAKnbQGNZ4gbBJN+kVk
X-IronPort-AV: E=Sophos;i="4.69,372,1315173600"; d="scan'208";a="498639099"
Received: from c-0d39e353.011-39-73746f12.cust.bredbandsbolaget.se (HELO
	nazgul.atmel.com) ([83.227.57.13])
	by iph1.telenor.se with ESMTP; 19 Oct 2011 17:10:35 +0200
From: ulf_samuelsson@telia.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Oct 2011 17:10:14 +0200
Message-Id: <1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
Cc: Ulf Samuelsson <ulf_samuelsson@telia.com>,
	Ulf Samuelsson <ulf.samuelsson@telia.com>
Subject: [PATCH 3/3] Update checksums for binutils-2.20.1.tar.bz2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2011 15:16:34 -0000

From: Ulf Samuelsson <ulf_samuelsson@telia.com>

Tarball is updated to 2.20.1b so checksums have changed.

Signed-off-by: Ulf Samuelsson <ulf.samuelsson@telia.com>

---
 recipes/binutils/binutils_2.20.1.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes/binutils/binutils_2.20.1.bb b/recipes/binutils/binutils_2.20.1.bb
index 5154e2d..0497675 100644
--- a/recipes/binutils/binutils_2.20.1.bb
+++ b/recipes/binutils/binutils_2.20.1.bb
@@ -1,7 +1,7 @@
 require binutils.inc
 LICENSE = "GPLv3"
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 EXTRA_OECONF += "--disable-werror"
 
 #COMPATIBLE_TARGET_SYS = "."
@@ -24,10 +24,11 @@ SRC_URI_append_nios2 =" \
 	file://binutils-nios2.patch \
 	"
 
-SRC_URI[tarball.sha256sum] = "228b84722d87e88e7fdd36869e590e649ab523a0800a7d53df906498afe6f6f8"
-SRC_URI[tarball.md5sum] = "9cdfb9d6ec0578c166d3beae5e15c4e5"
+SRC_URI[tarball.sha256sum] = "71d37c96451333c5c0b84b170169fdcb138bbb27397dc06281905d9717c8ed64"
+SRC_URI[tarball.md5sum] = "2b9dc8f2b7dbd5ec5992c6e29de0b764"
 
 # powerpc patches
 SRC_URI += "\
      file://binutils-2.16.1-e300c2c3.patch \
      "
+
-- 
1.7.5.4



