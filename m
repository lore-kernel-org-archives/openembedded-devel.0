Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 789076C664
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=908dk+5gFxOgmpFHsGgxlXQ65A+EhTDgsG1Dgufky4s=; 
	b=l8ZnlCbSZSHz+0Yh30cKAR3qyAwofh9wvfbMobIifM04Uod5bnkY0fErLbsr2UXSkX4YLvJJEuVwuKZf0CqvWLLvVxQjQM5I68gVKQ7DqxEl0bYXgcO1kKAOM5lqBmQtYi2jo69IONP6xHhUBkvEcRQpAZoj/PgGyc97t97ucd5LlV3GdpOaHWuLn1irntGTN31U8hOf2awo3Et6dJ2+aDhrFL7j5LobbSJlaE2Ep3WqyxuH+4NlwKmUK5eC3MifjUxLAcjB25Y4qLS5INk1MwCt+nxcZTc3HSw8AGPJ9T0gpMDBDur9SKplGklykU/2vCI0B/KclE/E9mZdKbp8fw==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gTnb5-0007Lt-Lv
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:45:11 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2018 13:45:03 +0100
Message-Id: <20587d4b524b590f8bb3c067cf680d82333e35ca.1543840903.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1543840903.git.psaavedra@igalia.com>
References: <cover.1543840903.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH v4 1/7] pyzy: add pyzy recipe
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
X-List-Received-Date: Mon, 03 Dec 2018 12:45:13 -0000

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


