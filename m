Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC2C71DCF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1DA4Zc9001849
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 02:04:36 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:34 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:21 -0800
Message-ID: <bd1abb0df0ae55a993e31271116e291f07281dcf.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/13] python-pbr: add python-setuptools-native to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:36 -0000
Content-Type: text/plain

Fixed:
ERROR: python setup.py build execution failed.
Traceback (most recent call last):
  File "setup.py", line 17, in <module>
    import setuptools
ImportError: No module named setuptools

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-python/recipes-devtools/python/python-pbr_1.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
index fd35197..3a57b45 100644
--- a/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python-pbr_1.10.0.bb
@@ -11,6 +11,7 @@ inherit pypi setuptools
 
 DEPENDS_class-target += " \
         python-pip \
+        python-setuptools-native \
         "
 
 BBCLASSEXTEND = "native"
-- 
2.9.0


