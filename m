Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 38A106C1ED
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Nov 2018 13:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:Message-Id:Date:Subject:To:From;
	bh=uXOy2fK4MT0Uk5msWv4xtXrdhaAeeaXg6jXOGVIT6u4=; 
	b=ntT6FiJF8Bp19rm72/+VbKeLNxGYI0IfrESBSaz9GH4xPI1Jb1ofjFQp6TFqQLCX6NTlNR6rfo1EAgzJkjGqASwO9YeOcVtam+LFXKvJ0LpO8njvPESOc2cSXmbk2kxCHbOGHPPKIZ8M/5NfGX0IIbb1iXkjeVdhdbHWxu1EcOCbWv0bR6W86T0N1MI4NEZi7iWkpAkRZU7fjMaoUUgHgi/fXt9hVUz3s0Rb0cYu9rEGgRD8YwvAkZ9SnIuwWnkOmHWJVU/4X7IIhUsC+xHdZK9vKKqRE0TaK794COFMduhUqvIeNiAwAbZtDAmkKLnFkHCeIP0RNipisBrIBdVTLQ==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1gL6NJ-0003YN-RF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Nov 2018 13:59:01 +0100
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Nov 2018 13:58:53 +0100
Message-Id: <a29972642b6159538a90af057f9c3f34d54bee30.1541767729.git.psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1541767729.git.psaavedra@igalia.com>
References: <cover.1541767729.git.psaavedra@igalia.com>
Subject: [meta-openembedded][PATCH 1/6] pyzy: add pyzy recipe
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
X-List-Received-Date: Fri, 09 Nov 2018 13:14:43 -0000

The chinese pinyin and bopomofo conversion library
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


