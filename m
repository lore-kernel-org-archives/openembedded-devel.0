Received: from smtp204.alice.it ([82.57.200.100])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1SrcYL-0002r1-SU
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 00:17:05 +0200
Received: from gnutoo-laptop.workgroup (79.1.133.74) by smtp204.alice.it
	(8.6.023.02) (authenticated as editempo@alice.it)
	id 5006060B000A23BB; Thu, 19 Jul 2012 00:00:28 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: martin.jansa@gmail.com
Date: Thu, 19 Jul 2012 00:00:15 +0200
Message-Id: <1342648817-23943-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.5.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/3] kernel.bbclass: fix external module building
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
X-List-Received-Date: Wed, 18 Jul 2012 22:17:06 -0000

Without that fix we have the following while compiling compat-wireless.
  include/linux/mmzone.h:18:30: fatal error: generated/bounds.h: No such file or directory

Note that the compat-wireless recipe will be added in another commit.

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 meta-oe/classes/kernel.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/classes/kernel.bbclass b/meta-oe/classes/kernel.bbclass
index 810d6de..1cd2540 100644
--- a/meta-oe/classes/kernel.bbclass
+++ b/meta-oe/classes/kernel.bbclass
@@ -192,6 +192,9 @@ kernel_do_install() {
 		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
 	fi
 
+	# Necessary for building modules like compat-wireless.
+	cp include/generated/bounds.h $kerneldir/include/generated/bounds.h
+
 	# Remove the following binaries which cause strip or arch QA errors
 	# during do_package for cross-compiled platforms
 	bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
-- 
1.7.5.4



