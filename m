Return-Path: <psaavedra@igalia.com>
Received: from fanzine.igalia.com (fanzine.igalia.com [91.117.99.155])
	by mail.openembedded.org (Postfix) with ESMTP id B2C5165CF3
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Aug 2019 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Message-Id:Date:Subject:To:From;
	bh=908dk+5gFxOgmpFHsGgxlXQ65A+EhTDgsG1Dgufky4s=; 
	b=D2sAJUfiQ1Qdlduy39JUBFcxNyWT3s6lfvjPCAGW7VApG63sfHp//yuJz0W+RaVv/wwco+AjbBV335n83RLjZAcNA0+UqHN6I5+juLTqRtbtBdc/IigUveHHmkPvuD103gXyk23CXnAWd3VWcHOPNQ8GaWMfnsS3e0WN+cNe0MepMqp9y3KRF9rPkN3lgGWBhv8eQy86PIxPnKFpjj3SSYSZ/dwKNpTY4mRXRj28+0Jab4FL8/P2n3Nila3LNXFu8AlvfwGBEQa3We0AhM2jx9qiZ8VEZkHyyTgmuUE9+krpeV2wlEXuLSS798vRPuJA5iakR8mhhmFG12ikrwuuuA==;
Received: from buildbox.local.igalia.com ([192.168.10.88])
	by fanzine.igalia.com with esmtp (Exim) id 1htTGw-0001lC-2X
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Aug 2019 10:50:46 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Aug 2019 10:50:23 +0200
Message-Id: <20190802085032.32687-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-openembedded][PATCH v6 01/10] pyzy: add pyzy recipe
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
X-List-Received-Date: Fri, 02 Aug 2019 08:50:46 -0000

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


