Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 11F9871A3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2016 06:34:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9O6Yu9d025325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Oct 2016 23:34:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Sun, 23 Oct 2016 23:34:55 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Oct 2016 14:35:02 +0800
Message-ID: <1477290904-11557-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/3] libfastjson: add recipe
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
X-List-Received-Date: Mon, 24 Oct 2016 06:34:56 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This is a project under rsyslog. Add its recipe as it's needed
by new version of rsyslog.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb

diff --git a/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb
new file mode 100644
index 0000000..2e23d7e
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/libfastjson_0.99.4.bb
@@ -0,0 +1,15 @@
+SUMMARY = "A fork of json-c library"
+HOMEPAGE = "https://github.com/rsyslog/libfastjson"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a958bb07122368f3e1d9b2efe07d231f"
+
+DEPENDS = ""
+
+SRC_URI = "git://github.com/rsyslog/libfastjson.git;protocol=https"
+
+SRCREV = "6e057a094cb225c9d80d8d6e6b1f36ca88a942dd"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
-- 
1.9.1


