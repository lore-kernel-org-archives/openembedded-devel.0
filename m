Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 262557489A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:00:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q60k9j013321
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:00:46 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:00:45 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:01:00 +0800
Message-ID: <1529992863-24711-17-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 17/20] python3-prctl: upgrade 1.6.1 -> 1.7
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
X-List-Received-Date: Tue, 26 Jun 2018 06:00:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../python/{python3-prctl_1.6.1.bb => python3-prctl_1.7.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-prctl_1.6.1.bb => python3-prctl_1.7.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.7.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb
rename to meta-python/recipes-devtools/python/python3-prctl_1.7.bb
index 5de83ce48..54620a066 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.7.bb
@@ -5,13 +5,13 @@ limitations in C and linux. This module provides a nice non-messy python(ic) \
 interface."
 SECTION = "devel/python"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5eb2f4bcd60326f83e5deb542372d52f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=23ff9f50449d4bd0e513df16e4d9755f"
 
 S = "${WORKDIR}/git"
 B = "${S}"
 
-SRCREV = "1107d0be7bec4b28c85c62c454882d16844c930a"
-PV = "1.6.1+git${SRCPV}"
+SRCREV = "57cd0a7cad76e8f8792eea22ee5b5d17bae0a90f"
+PV = "1.7+git${SRCPV}"
 
 SRC_URI = "git://github.com/seveas/python-prctl;branch=master \
            file://0001-support-cross-complication.patch \
-- 
2.11.0


