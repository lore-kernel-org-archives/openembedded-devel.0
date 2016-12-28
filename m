Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0724F60765
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 10:38:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uBSAc3mq011943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 02:38:03 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Dec 2016 02:38:02 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Dec 2016 18:33:51 +0800
Message-ID: <20161228103351.863-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] python-pygobject: empty the RDEPENDS for native
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
X-List-Received-Date: Wed, 28 Dec 2016 10:38:04 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The RDEPENDS for native package is not needed,
and it will fail since there is no provider for
python-importlib-native:

| ERROR: Nothing RPROVIDES 'python-importlib-native'

so empty the RDEPENDS for native package.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
index e490ae5..f02c62a 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.20.1.bb
@@ -26,6 +26,7 @@ BBCLASSEXTEND = "native"
 EXTRA_OECONF = "--disable-cairo --with-python=${PYTHON}"
 
 RDEPENDS_${PN} += "python-setuptools python-importlib"
+RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
     # Remove files that clash with python3-pygobject; their content is same
-- 
2.7.4


