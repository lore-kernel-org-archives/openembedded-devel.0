Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1QAWXN-0004YG-3F
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 02:05:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C0BFC3150233
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 02:03:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Hnq3D84cdhsc
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 02:03:03 +0200 (CEST)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id CA67E315022D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Apr 2011 02:03:02 +0200 (CEST)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Fri, 15 Apr 2011 00:03:02 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 00:03:01 +0000
Message-Id: <1302825782-17120-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 1/2] kernel.bbclass: pass KERNEL_VERSION through legitimize_package_name
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
X-List-Received-Date: Fri, 15 Apr 2011 00:05:25 -0000

- KERNEL_VERSION may contain characters unsuitable for package
  names, e.g. underscores. Use legitimize_package_name to replace
  those characters.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 classes/kernel.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 0187fb3..bded15d 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -245,8 +245,8 @@ RDEPENDS_kernel = "kernel-base"
 # Allow machines to override this dependency if kernel image files are 
 # not wanted in images as standard
 RDEPENDS_kernel-base ?= "kernel-image"
-PKG_kernel-image = "kernel-image-${KERNEL_VERSION}"
-PKG_kernel-base = "kernel-${KERNEL_VERSION}"
+PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
+PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
 ALLOW_EMPTY_kernel = "1"
 ALLOW_EMPTY_kernel-base = "1"
 ALLOW_EMPTY_kernel-image = "1"
-- 
1.7.2.5



