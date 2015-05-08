Return-Path: <igor.santos@aker.com.br>
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id D742372B1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 18:09:01 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Fri, 8 May 2015 15:08:59 -0300
	(envelope-from igor.santos@aker.com.br)
Received: from igor.santos.devel.com.br (10.4.59.1) by mail.aker.com.br
	(10.0.0.20) with Microsoft SMTP Server id 8.3.342.0;
	Fri, 8 May 2015 15:06:45 -0300
From: Igor Santos <igor.santos@aker.com.br>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 May 2015 15:06:08 -0300
Message-ID: <1431108368-20646-3-git-send-email-igor.santos@aker.com.br>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1431108368-20646-1-git-send-email-igor.santos@aker.com.br>
References: <1431108368-20646-1-git-send-email-igor.santos@aker.com.br>
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: a5fc2d2b506f49fc2bd6d1c7ad2f56ee346d5d27
X-AkerSMTPGW-MessageID: 5db0abdf7e86f170b2777cc147ada1d807668434-15o
Subject: [meta-oe][PATCH 2/2] cscope: add
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
X-List-Received-Date: Fri, 08 May 2015 18:09:02 -0000
Content-Type: text/plain

Cscope is an interactive, screen-oriented tool that allows the user to
browse through C source files for specified elements of code.

Signed-off-by: Igor Santos <igor.santos@aker.com.br>
---
 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cscope/cscope_15.8b.bb

diff --git a/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb b/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
new file mode 100644
index 0000000..ecf7e6c
--- /dev/null
+++ b/meta-oe/recipes-devtools/cscope/cscope_15.8b.bb
@@ -0,0 +1,24 @@
+# Copyright (C) 2015 Igor Santos <igor.santos@aker.com.br>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Cscope is a text screen based source browser"
+DESCRIPTION = "Cscope is a developer's tool for browsing source code. \
+               It has an impeccable Unix pedigree, having been originally \
+               developed at Bell Labs back in the days of the PDP-11. \
+               Cscope was part of the official AT&T Unix distribution for \
+               many years, and has been used to manage projects involving 20 \
+               million lines of code!"
+
+HOMEPAGE = "http://cscope.sourceforge.net/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4667b67b483823043fcffa489ea343b"
+
+inherit autotools
+
+DEPENDS += "ncurses"
+
+SRC_URI = "http://downloads.sourceforge.net/project/cscope/cscope/${PV}/${PN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8f9409a238ee313a96f9f87fe0f3b176"
+SRC_URI[sha256sum] = "4889d091f05aa0845384b1e4965aa31d2b20911fb2c001b2cdcffbcb7212d3af"
-- 
2.1.0



