Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id 96A727F1BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=908dk+5gFxOgmpFHsGgxlXQ65A+EhTDgsG1Dgufky4s=; 
	b=Z0opbttB/hunW+FHfRtj/p0X/9Iq7xPzuEmgejbgIYoZ2xV4wzT6kdKujfTQ0Iy0lgazAtDe3PyMMU0mIlf6gZdE77BHGcJ23oodF8wP15BwMY91kQJVzaxNcGNMy8vk7rbM6h3yniJHHb/gIxvWg/v7ckLsp82M9ixWNk8UKnc6UkQQQhLEfvUiV6iFrXkwXtVRDQUOeH/GGdteDvtgK1FRfROxLFJMmU89K+yOGPQ4hYNRsQrb3F7bGlU/hJa0C9YSmJYCHQpxWzQZ1P13dnn3QISzN3NV414ZdMMQeNNeZNhHSZ04XwpE/D6g5MGKWpWa2wY5w4ThDbury7Pdug==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1hqIbm-0003aA-2k
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 16:51:10 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2019 16:50:54 +0200
Message-Id: <20190724145100.88293-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-openembedded][PATCH v5 1/7] pyzy: add pyzy recipe
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
X-List-Received-Date: Wed, 24 Jul 2019 14:59:09 -0000

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


