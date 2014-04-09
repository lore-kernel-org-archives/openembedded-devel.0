Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90DDA65DDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Apr 2014 07:35:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s397Z8rg013271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 9 Apr 2014 00:35:08 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.169.1; Wed, 9 Apr 2014 00:35:08 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 9 Apr 2014 15:34:57 +0800
Message-ID: <1397028897-4991-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [meta-oe][PATCH] swig: add native wrapper for SWIGLIB
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
X-List-Received-Date: Wed, 09 Apr 2014 07:35:08 -0000
Content-Type: text/plain

Native swig will read data from hard-coded SWIGLIB or the same
environment variable.

While using sstate, the hard-coded SWIGLIB will point to the project
that create original sstates. This would cause build issues, so add
a wrapper to set the environment variable SWIGLIB to a relative path
on current sysroot.

Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-devtools/swig/swig.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
index 8e83526..96cd02a 100644
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ b/meta-oe/recipes-devtools/swig/swig.inc
@@ -50,3 +50,10 @@ do_configure() {
     oe_runconf
 }
 
+def swiglib_relpath(d):
+    swiglib = d.getVar('datadir', True) + "/" + d.getVar('BPN', True) + "/" + d.getVar('PV', True)
+    return os.path.relpath(swiglib, d.getVar('bindir', True))
+
+do_install_append_class-native() {
+       create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
+}
-- 
1.8.4


