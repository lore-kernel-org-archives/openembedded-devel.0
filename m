Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Rkk7y-0005iO-R7
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Jan 2012 23:25:10 +0100
Received: from mizar.localdomain (87.9.229.96) by smtp206.alice.it (8.6.023.02)
	id 4ECA60790725C02C; Tue, 10 Jan 2012 23:17:41 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Jan 2012 23:17:38 +0100
Message-Id: <1326233858-4486-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [meta-oe] [PATCH] kexec-tools_2.0.2.bbappend: remove, packages are now split in oe-core
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
X-List-Received-Date: Tue, 10 Jan 2012 22:25:10 -0000

* packaging split from meta-openembedded has been accepted in oe-core
* as per commit id 1f40a5486f703684c5d1d7360ef3cbdf75577495

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../kexec/kexec-tools_2.0.2.bbappend               |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend

diff --git a/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend b/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend
deleted file mode 100644
index c59c916..0000000
--- a/meta-oe/recipes-kernel/kexec/kexec-tools_2.0.2.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-PACKAGES =+ "kexec kdump"
-
-FILES_kexec = "${sbindir}/kexec"
-FILES_kdump = "${sbindir}/kdump"
-- 
1.7.3.4



