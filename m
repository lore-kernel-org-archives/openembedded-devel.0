Return-Path: <jake42@rommel.stw.uni-erlangen.de>
Received: from sheldon.rommel.stw.uni-erlangen.de
	(mail.rommel.stw.uni-erlangen.de [131.188.24.4])
	by mail.openembedded.org (Postfix) with ESMTP id D07366DE52
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 18:31:39 +0000 (UTC)
Received: from rommel-9-145.rommel.stw.uni-erlangen.de ([172.17.9.145]
	helo=ahorn.rommel.stw.uni-erlangen.de)
	by sheldon.rommel.stw.uni-erlangen.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <jake42@rommel.stw.uni-erlangen.de>)
	id 1W2mIV-00026c-F3; Mon, 13 Jan 2014 19:31:39 +0100
From: Jakob Drexel <jake42@rommel.stw.uni-erlangen.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 19:31:20 +0100
Message-Id: <1389637881-16013-2-git-send-email-jake42@rommel.stw.uni-erlangen.de>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1389637881-16013-1-git-send-email-jake42@rommel.stw.uni-erlangen.de>
References: <1389627492-4327-1-git-send-email-jake42@rommel.stw.uni-erlangen.de>
	<1389637881-16013-1-git-send-email-jake42@rommel.stw.uni-erlangen.de>
Subject: [meta-oe][PATCH v2 1/2] pidgin: Add libotr recipe and patch to fix QA-issue
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
X-List-Received-Date: Mon, 13 Jan 2014 18:31:40 -0000

Signed-off-by: Jakob Drexel <jake42@rommel.stw.uni-erlangen.de>
---
 .../pidgin/libotr/fix_qa-issue_include.patch           | 18 ++++++++++++++++++
 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb         | 14 ++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/libotr/fix_qa-issue_include.patch
 create mode 100644 meta-oe/recipes-support/pidgin/libotr_4.0.0.bb

diff --git a/meta-oe/recipes-support/pidgin/libotr/fix_qa-issue_include.patch b/meta-oe/recipes-support/pidgin/libotr/fix_qa-issue_include.patch
new file mode 100644
index 0000000..b786633
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libotr/fix_qa-issue_include.patch
@@ -0,0 +1,18 @@
+libotr: Fix QA-issue where also files from buildhost would be included
+
+Warning was:
+cc1: warning: include location "/usr/include" is unsafe for
+cross-compilation [-Wpoison-system-directories]
+
+Upstream-Status: Pending
+
+Signed-off-by: Jakob Drexel <jake42@rommel.stw.uni-erlangen.de>
+
+--- a/toolkit/Makefile.am	2012-05-03 15:52:22.000000000 +0200
++++ b/toolkit/Makefile.am	2014-01-13 12:12:26.030369357 +0100
+@@ -1,4 +1,4 @@
+-INCLUDES = -I$(includedir) -I../src @LIBGCRYPT_CFLAGS@
++INCLUDES = -I../src @LIBGCRYPT_CFLAGS@
+ 
+ noinst_HEADERS = aes.h ctrmode.h parse.h sesskeys.h readotr.h sha1hmac.h
+ 
diff --git a/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
new file mode 100644
index 0000000..bb79501
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/libotr_4.0.0.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "(OTR) Messaging allows you to have private conversations over instant messaging"
+HOMEPAGE = "http://www.cypherpunks.ca/otr/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
+DEPENDS = "libgcrypt libgpg-error"
+
+SRC_URI = "http://www.cypherpunks.ca/otr/${P}.tar.gz \
+           file://fix_qa-issue_include.patch \
+"
+
+SRC_URI[md5sum] = "00979dca82d70383fcd1b01f3974363c"
+SRC_URI[sha256sum] = "3f911994409898e74527730745ef35ed75c352c695a1822a677a34b2cf0293b4"
+
+inherit autotools pkgconfig
-- 
1.8.3.2


