Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 8F3E06D50C
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Dec 2018 19:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=908dk+5gFxOgmpFHsGgxlXQ65A+EhTDgsG1Dgufky4s=; 
	b=fVn1jPtVz3Kw9hlJKi8IxShDz5bFZzkQgyv9ZMhT0os0Mjjt1MR0geBODAPt0FM+8MDVr97rD6ieVA+H07rl80JJEARIaCtzJsVogBbFKqLcBh3gqNVJFvh0PoJ9oFwQ9w59dMAy32+DSFEeCcQxv8u+XOA4j7yXavHQE3Ila6OMaSnwh3WfFya/xjoWqrGX+nwgFbYECqMLGaKQQ6AtKXxQ49S6wqfCtXUFiDzjrB6eI2ENWlbiNZJUn4sGaN9JidUR6dXF/qpeJE4d1jn2V1UlVhPEN+tfcFHR47i+rKyXvPTp6KNmKM4ZyI2J+77iV7hhcsPGVbm1mqr4bjc2gw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTBQA-000699-TB
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 01 Dec 2018 20:59:22 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Dec 2018 20:59:10 +0100
Message-Id: <20587d4b524b590f8bb3c067cf680d82333e35ca.1543694144.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543694144.git.psaavedra@igalia.com>
References: <cover.1543694144.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v3 1/7] pyzy: add pyzy recipe
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
X-List-Received-Date: Sat, 01 Dec 2018 19:59:24 -0000

The chinese pinyin and bopomofo conversion library

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 meta-oe/recipes-support/pyzy/pyzy_git.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-support/pyzy/pyzy_git.bb

diff --git a/meta-oe/recipes-support/pyzy/pyzy_git.bb b/meta-oe/recipes-support/pyzy/pyzy_git.bb
new file mode 100644
index 000000000..2a1df6187
--- /dev/null
+++ b/meta-oe/recipes-support/pyzy/pyzy_git.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "The Chinese PinYin and Bopomofo conversion library"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
+SECTION = "inputmethods"
+
+SRCREV = "6d9c3cdff364e0da75e1c26222240f26370ebf73"
+SRC_URI = "git://github.com/pyzy/pyzy.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+DEPENDS = "glib-2.0 util-linux sqlite3"
+
+EXTRA_OECONF += " \
+    --disable-opencc \
+    --disable-db-open-phrase \
+    --disable-db-android \
+"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


