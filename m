Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9B0B7F385
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A544218422
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:54 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Pu_EbJQtl4ml
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id DD5EA18441
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA2701A06F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BED581A075
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by seth.se.axis.com (Postfix) with ESMTP id B2F4F4E4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.15.2/8.15.2) with ESMTPS id x9GGkpm3025599
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 18:46:51 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.15.2/8.15.2/Submit) id x9GGkpJU025598
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Oct 2019 18:46:51 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Oct 2019 18:46:50 +0200
Message-Id: <20191016164650.25544-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191016164650.25544-1-pkj@axis.com>
References: <20191016164650.25544-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [meta-oe][warrior][PATCH 2/2] kconfig-frontends: Retrieve the Git repository from GitLab
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
X-List-Received-Date: Wed, 16 Oct 2019 16:46:54 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The ymorin.is-a-geek.org site has been down since September and there
is no indication of when, if ever, it will be back. Retrieve the
repository from GitLab instead, recommended by the maintainer, Yann E
Morin.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kconfig-frontends/kconfig-frontends_4.11.0.1.bb           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
index de9a6eb99..fae80a79e 100644
--- a/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
+++ b/meta-oe/recipes-devtools/kconfig-frontends/kconfig-frontends_4.11.0.1.bb
@@ -7,13 +7,13 @@ the effort of keeping an up-to-date, out-of-tree, packaging of the \
 kconfig infrastructure, ready for use by third-party projects. \
 The kconfig-frontends package provides the kconfig parser, as well as all \
 the frontends"
-HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+HOMEPAGE = "https://gitlab.com/ymorin/kconfig-frontends"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
 SECTION = "devel"
 DEPENDS += "ncurses flex bison gperf-native bison-native"
 RDEPENDS_${PN} += "python3 bash"
-SRC_URI = "git://ymorin.is-a-geek.org/kconfig-frontends;branch=4.11.x \
+SRC_URI = "git://gitlab.com/ymorin/kconfig-frontends.git;protocol=https;branch=4.11.x \
 	   file://0001-Makefile-ensure-frontends-exits-before-writing-into-.patch \
            file://0001-Switch-utils-kconfig-diff-to-use-Python-3.patch"
 
-- 
2.21.0


