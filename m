Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30AE97671F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 05:57:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t775vdDn004008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 6 Aug 2015 22:57:39 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 6 Aug 2015 22:57:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Aug 2015 13:54:41 +0800
Message-ID: <1438926881-9474-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-python] python-paste: create recipe
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
X-List-Received-Date: Fri, 07 Aug 2015 05:57:42 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

python-paste is a tools for using a Web Server Gateway Interface stack

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../recipes-devtools/python/python-paste_2.0.2.bb      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-paste_2.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-paste_2.0.2.bb b/meta-python/recipes-devtools/python/python-paste_2.0.2.bb
new file mode 100644
index 0000000..6338def
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-paste_2.0.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Tools for using a Web Server Gateway Interface stack"
+HOMEPAGE = "http://pythonpaste.org/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+SRCNAME = "Paste"
+RDEPENDS_${PN} = "python-six"
+
+LIC_FILES_CHKSUM = "file://docs/license.txt;md5=1798f29d55080c60365e6283cb49779c"
+
+SRC_URI = "http://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz;name=paste"
+SRC_URI[paste.md5sum] = "4bfc8a7eaf858f6309d2ac0f40fc951c"
+SRC_URI[paste.sha256sum] = "adac3ac893a2dac6b8ffd49901377dd6819e05be3436b374d698641071daba99"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit setuptools
+
+FILES_${PN} += "/usr/lib/*"
-- 
1.9.1


