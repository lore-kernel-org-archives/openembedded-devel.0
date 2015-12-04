Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 03D166FF6B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Dec 2015 07:20:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB47Kq51017267
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 3 Dec 2015 23:20:53 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 3 Dec 2015 23:20:52 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 4 Dec 2015 15:09:15 +0800
Message-ID: <1449212956-2683-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] mce-inject: add recipe
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
X-List-Received-Date: Fri, 04 Dec 2015 07:20:53 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add recipe of mce-inject which is required to run mcelog ptest cases.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/mcelog/mce-inject_git.bb | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-support/mcelog/mce-inject_git.bb

diff --git a/meta-oe/recipes-support/mcelog/mce-inject_git.bb b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
new file mode 100644
index 0000000..f876144
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mce-inject_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Linux machine check injector tool"
+DESCRIPTION = "mce-inject allows to inject machine check errors on the \
+software level into a running Linux kernel. This is intended for \
+validation of the kernel machine check handler."
+SECTION = "System Environment/Base"
+
+SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mce-inject.git"
+
+SRCREV = "4cbe46321b4a81365ff3aafafe63967264dbfec5"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://README;beginline=30;md5=94c18755082a2da9c9cf97cba3ad47d6"
+
+S = "${WORKDIR}/git"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
+
+inherit autotools-brokensep
+
+EXTRA_OEMAKE = "destdir=${D}"
-- 
2.6.1


