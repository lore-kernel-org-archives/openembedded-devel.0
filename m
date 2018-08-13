Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19AE178F74
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 16:11:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7DGBrhr018908
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 09:11:53 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 09:11:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 14 Aug 2018 00:22:17 +0800
Message-ID: <dec82ceeab6ff742c182b017d45cff1275802b70.1534177115.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534177115.git.hongxu.jia@windriver.com>
References: <cover.1534177115.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/5] python-pykickstart: fix typo
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
X-List-Received-Date: Mon, 13 Aug 2018 16:11:53 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../files/0001-support-authentication-for-kickstart.patch      | 10 +++++-----
 .../0004-load.py-retry-to-invoke-request-with-timeout.patch    |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index 6af4bde..e7533f4 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -1,4 +1,4 @@
-From b7070a79432b790dffa82401364e4fd8d906eb2b Mon Sep 17 00:00:00 2001
+From f05f5fc363e2510f6943532f3e14a6423f6a2cf1 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 31 Jul 2018 17:24:47 +0800
 Subject: [PATCH 1/4] support authentication for kickstart
@@ -51,7 +51,7 @@ index bf08ac5..aada7aa 100644
 +    def __str__(self):
 +        return self.value
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index fb935f2..c6f013f 100644
+index fb935f2..41a2e9e 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -18,10 +18,13 @@
@@ -101,7 +101,7 @@ index fb935f2..c6f013f 100644
 +        if user is None or passwd is None:
 +            log.info("Require Authentication")
 +            raise KickstartAuthError("Require Authentication.\nAppend 'ksuser=<username> kspasswd=<password>' to boot command")
-+
+ 
 +        reasons = request.headers.get("WWW-Authenticate", "").split()
 +        if reasons:
 +            auth_type = reasons[0]
@@ -111,9 +111,9 @@ index fb935f2..c6f013f 100644
 +            auth=HTTPDigestAuth(user, passwd)
 +
 +    return auth
- 
++
 +def _load_url(location, user=None, passwd=None):
-+     '''Load a location (URL or filename) and return contents as string'''
++    '''Load a location (URL or filename) and return contents as string'''
 +    auth = _get_auth(location, user=user, passwd=passwd)
      try:
 -        request = requests.get(location, verify=SSL_VERIFY)
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
index c950be6..6ed15ab 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -1,4 +1,4 @@
-From a86ba22d7133199d850ef3d893571f27d6b0faed Mon Sep 17 00:00:00 2001
+From ffe06c6dd812b604d6482e4353d5564fad78bc90 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 30 Jul 2018 15:52:21 +0800
 Subject: [PATCH 4/4] load.py: retry to invoke request with timeout
@@ -16,7 +16,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 31 insertions(+)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 7adb751..b62245e 100644
+index ad3bad1..a5cbbc5 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -21,6 +21,7 @@ import requests
@@ -70,7 +70,7 @@ index 7adb751..b62245e 100644
 @@ -94,6 +121,10 @@ def _get_auth(location, user=None, passwd=None):
  
  def _load_url(location, user=None, passwd=None):
-      '''Load a location (URL or filename) and return contents as string'''
+     '''Load a location (URL or filename) and return contents as string'''
 +
 +    if not _access_url(location):
 +        raise KickstartError(_("Connection %s failed" % location))
-- 
2.7.4


