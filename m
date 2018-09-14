Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3D87960722
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Sep 2018 02:02:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8E22afg002043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 19:02:36 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 13 Sep 2018 19:02:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Sep 2018 09:51:44 +0800
Message-ID: <1536889904-31218-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python(3)-ndg-httpsclient: use update-alternatives to avoid do_rootfs failure
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
X-List-Received-Date: Fri, 14 Sep 2018 02:02:35 -0000
Content-Type: text/plain

Use update-alternaives to manage /usr/bin/ndg_httpclient to avoid the following
do_rootfs failure.

Error: Transaction check error:
  file /usr/bin/ndg_httpclient conflicts between attempted installs of python-ndg-httpsclient-0.5.1-r0.core2_64 and python3-ndg-httpsclient-0.5.1-r0.core2_64

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb | 6 +++++-
 .../recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb        | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
index ca0eb32..9cd881a 100644
--- a/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python-ndg-httpsclient_0.5.1.bb
@@ -1,2 +1,6 @@
 require python-ndg-httpsclient.inc
-inherit pypi setuptools
+inherit pypi setuptools update-alternatives
+
+ALTERNATIVE_${PN} = "ndg_httpclient"
+ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
+ALTERNATIVE_PRIORITY = "20"
diff --git a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
index 3f07b2e..65a8c81 100644
--- a/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ndg-httpsclient_0.5.1.bb
@@ -1,2 +1,6 @@
-inherit pypi setuptools3
+inherit pypi setuptools3 update-alternatives
 require python-ndg-httpsclient.inc
+
+ALTERNATIVE_${PN} = "ndg_httpclient"
+ALTERNATIVE_LINK_NAME[ndg_httpclient] = "${bindir}/ndg_httpclient"
+ALTERNATIVE_PRIORITY = "30"
-- 
2.7.4


