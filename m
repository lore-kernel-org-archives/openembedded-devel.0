Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 383027036C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Aug 2014 06:46:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7M6kO54009191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Aug 2014 23:46:24 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 21 Aug 2014 23:46:24 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Aug 2014 02:46:22 -0400
Message-ID: <1408689982-30374-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-cython: add RDEPENDS on some required python modules
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Aug 2014 06:46:25 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

python-distribute:
    File "/usr/bin/cython", line 5, in <module>
    ImportError: No module named pkg_resources

python-netserver:
    File "_tempita.py", line 34, in init Cython.Tempita._tempita
    ImportError: No module named cgi

python-subprocess:
    File "/usr/lib/python2.7/site-packages/Cython/Debugger/Cygdb.py", line 19, in <module>
    ImportError: No module named subprocess

python-shell:
    File "/usr/lib/python2.7/site-packages/Cython/Debugger/Cygdb.py", line 16, in <module>
    ImportError: No module named glob

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-python/recipes-devtools/python/python-cython_0.20.2.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
index 9f357ec..8578a14 100644
--- a/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
+++ b/meta-python/recipes-devtools/python/python-cython_0.20.2.bb
@@ -14,3 +14,10 @@ SRC_URI[md5sum] = "7fc13e1c665bdf7cea19ad08906af91f"
 SRC_URI[sha256sum] = "ed13b606a2aeb5bd6c235f8ed6c9988c99d01a033d0d21d56137c13d5c7be63f"
 
 inherit setuptools
+
+RDEPENDS_${PN} += "\
+    python-distribute \
+    python-netserver \
+    python-subprocess \
+    python-shell \
+"
-- 
2.0.0


