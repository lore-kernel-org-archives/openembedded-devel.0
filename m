Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 575797F33A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 10:14:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xBUAEl8e001207
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 02:14:47 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 30 Dec 2019 02:14:34 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Dec 2019 18:14:32 +0800
Message-ID: <20191230101432.11734-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] volume-key: not create python2 bindings
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
X-List-Received-Date: Mon, 30 Dec 2019 10:14:46 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

If create python2 bindings for volume-key, it requires to inherit
pythonnative which conflict with python3native.bbclass. And python2
reachs EOL, so remove package config 'python' and not create python2
bindings for volume-key.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
index 3103748e4..e036f714b 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb
@@ -28,9 +28,10 @@ DEPENDS += " \
 "
 
 PACKAGECONFIG ??= "python3"
-PACKAGECONFIG[python] = "--with-python,--without-python,python,python"
 PACKAGECONFIG[python3] = "--with-python3,--without-python3,python3,python3"
 
+EXTRA_OECONF = "--without-python"
+
 RDEPENDS_python3-${BPN} += "${PN}"
 
 PACKAGES += "python3-${BPN}"
-- 
2.17.1


