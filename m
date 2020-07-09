Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.2144.1594281304355233315
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 00:55:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0697t2Mq026950
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Jul 2020 00:55:02 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Thu, 9 Jul 2020 00:55:02 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pykickstart: 3.22 -> 3.26
Date: Thu, 9 Jul 2020 15:54:59 +0800
Message-ID: <20200709075459.40502-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update python3-pykickstart from 3.22 to 3.26.

* Update context of 0001-support-authentication-for-kickstart.patch

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-support-authentication-for-kickstart.patch    | 10 +++++-----
 ...pykickstart_3.22.bb => python3-pykickstart_3.26.bb} |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.22.bb => python3-pykickstart_3.26.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index e7533f476..0e64ce420 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -32,10 +32,10 @@ index bf08ac5..aada7aa 100644
  And some warning classes:
  
      KickstartWarning - A generic warning class.
-@@ -131,3 +134,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
+@@ -125,3 +128,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
+     """A class for warnings occurring during parsing related to using deprecated
         commands and options.
      """
-     pass
 +
 +class KickstartAuthError(KickstartError):
 +    """An exception for errors relating to authentication failed while
@@ -43,7 +43,7 @@ index bf08ac5..aada7aa 100644
 +    """
 +    def __init__(self, msg):
 +        """Create a new KickstartAuthError exception instance with the
-+           descriptive message val.  val should be the return value of
++           descriptive message val. val should be the return value of
 +           formatErrorMsg.
 +        """
 +        KickstartError.__init__(self, msg)
@@ -125,7 +125,7 @@ diff --git a/pykickstart/parser.py b/pykickstart/parser.py
 index d8880eb..22d14cb 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -787,7 +787,7 @@ class KickstartParser(object):
+@@ -801,7 +801,7 @@ class KickstartParser(object):
          i = PutBackIterator(s.splitlines(True) + [""])
          self._stateMachine(i)
  
@@ -134,7 +134,7 @@ index d8880eb..22d14cb 100644
          """Process a kickstart file, given by the filename f."""
          if reset:
              self._reset()
-@@ -808,7 +808,7 @@ class KickstartParser(object):
+@@ -822,7 +822,7 @@ class KickstartParser(object):
          self.currentdir[self._includeDepth] = cd
  
          try:
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
index 041abd3e8..7aeb5d6c9 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.22.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.26.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "674c17b1e231f56a0d8a5ced4a204cdbc4c1edf3"
+SRCREV = "4c93e84c8798da511da1c05f1912d2f908f8f85f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.17.1

