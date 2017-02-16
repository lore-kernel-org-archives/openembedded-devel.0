Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 72C1671DEF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2017 02:56:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1G2ud2E008268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:56:40 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 15 Feb 2017 18:56:39 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Feb 2017 10:49:03 +0800
Message-ID: <ede2a9d70cd6eb0eb2e201695734d96d20b67041.1487213217.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1487213217.git.jackie.huang@windriver.com>
References: <cover.1487213217.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python-mock: add RDEPENDS on python-pbr and python-funcsigs
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
X-List-Received-Date: Thu, 16 Feb 2017 02:56:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-pbr and python-funcsigs are required by python-mock,
or it fails with:

>>> import mock
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python2.7/site-packages/mock/__init__.py", line 2, in <module>
    import mock.mock as _mock
  File "/usr/lib64/python2.7/site-packages/mock/mock.py", line 69, in <module>
    from pbr.version import VersionInfo
ImportError: No module named pbr.version

>>> import mock
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib64/python2.7/site-packages/mock/__init__.py", line 2, in <module>
    import mock.mock as _mock
  File "/usr/lib64/python2.7/site-packages/mock/mock.py", line 80, in <module>
    import funcsigs
ImportError: No module named funcsigs

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-mock_2.0.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
index b4557b7..840c36e 100644
--- a/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-mock_2.0.0.bb
@@ -16,4 +16,7 @@ RDEPENDS_${PN} += " \
     python-pyparsing \
     python-mccabe \
     python-pep8 \
-    python-pyflakes"
+    python-pyflakes \
+    python-pbr \
+    python-funcsigs \
+"
-- 
2.8.3


