Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 1B1D27715B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Oct 2015 15:58:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id CA843600680
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Oct 2015 16:58:06 +0100
Message-Id: <1445011086-6807-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] xerces-c: enable a native variant with BBCLASSEXTEND
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
X-List-Received-Date: Fri, 16 Oct 2015 15:58:23 -0000

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
index 8699d6f..165cb55 100644
--- a/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
+++ b/meta-oe/recipes-devtools/xerces-c/xerces-c_3.1.2.bb
@@ -37,3 +37,5 @@ FILES_libxerces-c-dev = "${libdir}/lib*.la \
 FILES_xerces-c-samples = "${bindir}/*"
 FILES_xerces-c-samples-dbg = "${bindir}/.debug/"
 FILES_libxerces-c-staticdev = "${libdir}/lib*.a"
+
+BBCLASSEXTEND = "native"
-- 
2.1.4


