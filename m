Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7092865DAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 05:22:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43869527"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 13:18:56 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO5Ls7r031318;
	Mon, 24 Nov 2014 13:21:54 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 13:22:14 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 13:21:55 +0800
Message-ID: <1416806516-2182-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1416556558-15428-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH v3 1/2] indent: Add new recipe
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
X-List-Received-Date: Mon, 24 Nov 2014 05:22:16 -0000
Content-Type: text/plain

Indent is a GNU program for beautifying C code, so that it is easier
to read. Indent can also convert from one C writing style to a different
one. Indent understands correct C syntax and tries to handle incorrect C
syntax.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta-oe/recipes-extended/indent/indent_2.2.10.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-extended/indent/indent_2.2.10.bb

diff --git a/meta-oe/recipes-extended/indent/indent_2.2.10.bb b/meta-oe/recipes-extended/indent/indent_2.2.10.bb
new file mode 100644
index 0000000..dbd6b7b
--- /dev/null
+++ b/meta-oe/recipes-extended/indent/indent_2.2.10.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A GNU program for formatting C code"
+HOMEPAGE = "http://www.gnu.org/software/indent/"
+SECTION = "Applications/Text"
+DESCRIPTION = "Indent is a GNU program for beautifying C code, so that \
+it is easier to read. Indent can also convert from one C writing style \
+to a different one. Indent understands correct C syntax and tries to handle \
+incorrect C syntax. \
+Install the indent package if you are developing applications in C and \
+you want a program to format your code."
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+DEPENDS = "virtual/gettext"
+
+SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "be35ea62705733859fbf8caf816d8959"
+SRC_URI[sha256sum] = "8a9b41be5bfcab5d8c1be74204b10ae78789fc3deabea0775fdced8677292639"
+
+inherit autotools gettext
+
+FILES_${PN}-doc += "/usr/doc/indent/indent.html"
+
+BBCLASSEXTEND = "native"
-- 
1.8.3.1


