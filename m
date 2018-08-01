Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 286BF78DF8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Aug 2018 07:12:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w717C1w6004320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 00:12:01 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 00:11:59 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 1 Aug 2018 15:21:39 +0800
Message-ID: <f452bca600e790bb5723ab9d3568c62fdc729a59.1533107855.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533107855.git.hongxu.jia@windriver.com>
References: <cover.1533107855.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/16] python3-pykickstart: 2.35 -> 3.15
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
X-List-Received-Date: Wed, 01 Aug 2018 07:12:01 -0000
Content-Type: text/plain

- Rebase 0001 ~ 0004
- Drop 0005-tweak-shebang-to-python3.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...0001-support-authentication-for-kickstart.patch | 59 ++++++++++------------
 ...-parser.py-add-lock-for-readKickstart-and.patch | 36 +++++--------
 ...-sections-shutdown-and-environment-in-gen.patch | 10 ++--
 ...d.py-retry-to-invoke-request-with-timeout.patch | 25 ++++-----
 .../files/0005-tweak-shebang-to-python3.patch      | 25 ---------
 ...ckstart_2.35.bb => python3-pykickstart_3.15.bb} |  5 +-
 6 files changed, 62 insertions(+), 98 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_2.35.bb => python3-pykickstart_3.15.bb} (86%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index 617699d..6af4bde 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -1,6 +1,6 @@
-From d0d8890b5ef74c315381c9e1cff4b1d32892116b Mon Sep 17 00:00:00 2001
+From b7070a79432b790dffa82401364e4fd8d906eb2b Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 1 Jun 2017 15:07:36 +0800
+Date: Tue, 31 Jul 2018 17:24:47 +0800
 Subject: [PATCH 1/4] support authentication for kickstart
 
 While download kickstart file from web server,
@@ -13,30 +13,29 @@ Upstream-Status: inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- pykickstart/errors.py | 19 +++++++++++++++++++
- pykickstart/load.py   | 32 +++++++++++++++++++++++++++-----
+ pykickstart/errors.py | 17 +++++++++++++++++
+ pykickstart/load.py   | 34 ++++++++++++++++++++++++++++------
  pykickstart/parser.py |  4 ++--
- 3 files changed, 48 insertions(+), 7 deletions(-)
+ 3 files changed, 47 insertions(+), 8 deletions(-)
 
 diff --git a/pykickstart/errors.py b/pykickstart/errors.py
-index b76e84c..fd81bc8 100644
+index bf08ac5..aada7aa 100644
 --- a/pykickstart/errors.py
 +++ b/pykickstart/errors.py
-@@ -35,6 +35,10 @@ It also exports several exception classes:
- 
+@@ -32,6 +32,9 @@ This module exports several exception classes:
      KickstartVersionError - An exception for errors relating to unsupported
                              syntax versions.
-+
+ 
 +    KickstartAuthError - An exception for errors relating to authentication
 +                         failed while downloading kickstart from web server
 +
- """
- import warnings
- 
-@@ -103,3 +107,18 @@ class KickstartVersionError(KickstartError):
+ And some warning classes:
  
-     def __str__ (self):
-         return self.value
+     KickstartWarning - A generic warning class.
+@@ -131,3 +134,17 @@ class KickstartDeprecationWarning(KickstartParseWarning, DeprecationWarning):
+        commands and options.
+     """
+     pass
 +
 +class KickstartAuthError(KickstartError):
 +    """An exception for errors relating to authentication failed while
@@ -51,9 +50,8 @@ index b76e84c..fd81bc8 100644
 +
 +    def __str__(self):
 +        return self.value
-+
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 1f69b9c..0f5741b 100644
+index fb935f2..c6f013f 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -18,10 +18,13 @@
@@ -71,7 +69,7 @@ index 1f69b9c..0f5741b 100644
  from pykickstart.i18n import _
  from requests.exceptions import SSLError, RequestException
  
-@@ -29,7 +32,7 @@ _is_url = lambda location: '://' in location # RFC 3986
+@@ -29,7 +32,7 @@ _is_url = lambda location: '://' in location  # RFC 3986
  
  SSL_VERIFY = True
  
@@ -89,10 +87,12 @@ index 1f69b9c..0f5741b 100644
      else:
          return _load_file(location)
  
-@@ -71,13 +74,32 @@ def load_to_file(location, destination):
+@@ -70,11 +73,30 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
+-def _load_url(location):
+-    '''Load a location (URL or filename) and return contents as string'''
 +def _get_auth(location, user=None, passwd=None):
 +
 +    auth = None
@@ -101,7 +101,7 @@ index 1f69b9c..0f5741b 100644
 +        if user is None or passwd is None:
 +            log.info("Require Authentication")
 +            raise KickstartAuthError("Require Authentication.\nAppend 'ksuser=<username> kspasswd=<password>' to boot command")
- 
++
 +        reasons = request.headers.get("WWW-Authenticate", "").split()
 +        if reasons:
 +            auth_type = reasons[0]
@@ -109,15 +109,12 @@ index 1f69b9c..0f5741b 100644
 +            auth = HTTPBasicAuth(user, passwd)
 +        elif auth_type == "Digest":
 +            auth=HTTPDigestAuth(user, passwd)
- 
--def _load_url(location):
-+    return auth
 +
-+def _load_url(location, user=None, passwd=None):
-     '''Load a location (URL or filename) and return contents as string'''
++    return auth
  
++def _load_url(location, user=None, passwd=None):
++     '''Load a location (URL or filename) and return contents as string'''
 +    auth = _get_auth(location, user=user, passwd=passwd)
-+
      try:
 -        request = requests.get(location, verify=SSL_VERIFY)
 +        request = requests.get(location, verify=SSL_VERIFY, auth=auth)
@@ -125,26 +122,26 @@ index 1f69b9c..0f5741b 100644
          raise KickstartError(_('Error securely accessing URL "%s"') % location + ': {e}'.format(e=str(e)))
      except RequestException as e:
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index d2b0fbe..26b5de9 100644
+index d8880eb..22d14cb 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -773,7 +773,7 @@ class KickstartParser(object):
+@@ -787,7 +787,7 @@ class KickstartParser(object):
          i = PutBackIterator(s.splitlines(True) + [""])
-         self._stateMachine (i)
+         self._stateMachine(i)
  
 -    def readKickstart(self, f, reset=True):
 +    def readKickstart(self, f, reset=True, username=None, password=None):
          """Process a kickstart file, given by the filename f."""
          if reset:
              self._reset()
-@@ -794,7 +794,7 @@ class KickstartParser(object):
+@@ -808,7 +808,7 @@ class KickstartParser(object):
          self.currentdir[self._includeDepth] = cd
  
          try:
 -            s = load_to_str(f)
 +            s = load_to_str(f, user=username, passwd=password)
          except KickstartError as e:
-             raise KickstartError(formatErrorMsg(0, msg=_("Unable to open input kickstart file: %s") % str(e)))
+             raise KickstartError(_("Unable to open input kickstart file: %s") % str(e), lineno=0)
  
 -- 
 2.7.4
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
index cb21235..4a001f3 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
@@ -1,28 +1,26 @@
-From e6e747b883114bfad51ad93f823e65f5a4d6438a Mon Sep 17 00:00:00 2001
+From 62fdead139edb0f29b2f222efcb8f39be15b057e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 1 Jun 2017 15:12:29 +0800
-Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and
+Date: Mon, 30 Jul 2018 15:47:13 +0800
+Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and 
  support https without certification
 
 - Add lock for readKickstart to fix race issue
 
 - Support to download kickstart file through https without certification
 
-Upstream-Status: Inappropriate[oe specific]
-
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  pykickstart/load.py   |  2 +-
- pykickstart/parser.py | 24 ++++++++++++++++++++++++
- 2 files changed, 25 insertions(+), 1 deletion(-)
+ pykickstart/parser.py | 18 ++++++++++++++++++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 0f5741b..48c8276 100644
+index c6f013f..7adb751 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -30,7 +30,7 @@ from requests.exceptions import SSLError, RequestException
  
- _is_url = lambda location: '://' in location # RFC 3986
+ _is_url = lambda location: '://' in location  # RFC 3986
  
 -SSL_VERIFY = True
 +SSL_VERIFY = False
@@ -30,38 +28,32 @@ index 0f5741b..48c8276 100644
  def load_to_str(location, user=None, passwd=None):
      '''Load a destination URL or file into a string.
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index 26b5de9..264ba05 100644
+index e44099b..e68174d 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -57,6 +57,26 @@ STATE_COMMANDS = "commands"
- 
- ver = version.DEVEL
+@@ -55,6 +55,20 @@ from pykickstart.i18n import _
+ STATE_END = "end"
+ STATE_COMMANDS = "commands"
  
-+import logging
-+log = logging.getLogger("anaconda")
-+
-+import inspect
 +import threading
 +_private_ks_lock = threading.RLock()
 +
 +class KsLock(object):
 +    def __enter__(self):
-+        log.info("%s %s" % (self.__class__.__name__, inspect.stack()[0][3]))
 +        _private_ks_lock.acquire()
 +        return _private_ks_lock
 +
 +    def __exit__(self, exc_type, exc_val, exc_tb):
-+        log.info("%s %s" % (self.__class__.__name__, inspect.stack()[0][3]))
 +        _private_ks_lock.release()
 +
 +
 +_ks_lock = KsLock()
 +
- def _preprocessStateMachine (lineIter):
+ def _preprocessStateMachine(lineIter):
      l = None
      lineno = 0
-@@ -774,6 +794,10 @@ class KickstartParser(object):
-         self._stateMachine (i)
+@@ -788,6 +802,10 @@ class KickstartParser(object):
+         self._stateMachine(i)
  
      def readKickstart(self, f, reset=True, username=None, password=None):
 +        with _ks_lock:
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
index 9fb25fb..81e351b 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
@@ -1,4 +1,4 @@
-From be6012a5dd49ae5e8ac035654ab1c6f37f0dc8f4 Mon Sep 17 00:00:00 2001
+From 44226393812399c61de9ca9281efa002ad4f4c01 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 1 Jun 2017 15:15:15 +0800
 Subject: [PATCH 3/4] comment out sections shutdown and environment in
@@ -17,10 +17,10 @@ fixup! add comments of shutdown for user
  2 files changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/pykickstart/commands/reboot.py b/pykickstart/commands/reboot.py
-index 88799ba..2d0cea9 100644
+index 2c1b1c0..b3ec717 100644
 --- a/pykickstart/commands/reboot.py
 +++ b/pykickstart/commands/reboot.py
-@@ -41,6 +41,9 @@ class FC3_Reboot(KickstartCommand):
+@@ -43,6 +43,9 @@ class FC3_Reboot(KickstartCommand):
          elif self.action == KS_SHUTDOWN:
              retval += "# Shutdown after installation\nshutdown"
              retval += self._getArgsAsStr() + "\n"
@@ -31,10 +31,10 @@ index 88799ba..2d0cea9 100644
          return retval
  
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index 264ba05..b3f33d7 100644
+index e68174d..efd78a6 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -383,7 +383,7 @@ class Packages(KickstartObject):
+@@ -385,7 +385,7 @@ class Packages(KickstartObject):
  
          if not self.default:
              if self.environment:
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
index 70254f6..c950be6 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -1,6 +1,6 @@
-From c0e63f0d3c09bdabb0ad2c88b7cc73e7618dd86a Mon Sep 17 00:00:00 2001
+From a86ba22d7133199d850ef3d893571f27d6b0faed Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 15 Jun 2017 17:35:33 +0800
+Date: Mon, 30 Jul 2018 15:52:21 +0800
 Subject: [PATCH 4/4] load.py: retry to invoke request with timeout
 
 While networkless, use request to fetch kickstart file from
@@ -12,11 +12,11 @@ Upstream-Status: inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- pykickstart/load.py | 30 ++++++++++++++++++++++++++++++
- 1 file changed, 30 insertions(+)
+ pykickstart/load.py | 31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 48c8276..74b266b 100644
+index 7adb751..b62245e 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -21,6 +21,7 @@ import requests
@@ -32,12 +32,12 @@ index 48c8276..74b266b 100644
  from requests.exceptions import SSLError, RequestException
  
 +import logging
-+log = logging.getLogger("anaconda")
++log = logging.getLogger("anaconda.main")
 +
- _is_url = lambda location: '://' in location # RFC 3986
+ _is_url = lambda location: '://' in location  # RFC 3986
  
  SSL_VERIFY = False
-@@ -74,6 +78,29 @@ def load_to_file(location, destination):
+@@ -73,6 +77,29 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
@@ -67,16 +67,17 @@ index 48c8276..74b266b 100644
  def _get_auth(location, user=None, passwd=None):
  
      auth = None
-@@ -96,6 +123,9 @@ def _get_auth(location, user=None, passwd=None):
- def _load_url(location, user=None, passwd=None):
-     '''Load a location (URL or filename) and return contents as string'''
+@@ -94,6 +121,10 @@ def _get_auth(location, user=None, passwd=None):
  
+ def _load_url(location, user=None, passwd=None):
+      '''Load a location (URL or filename) and return contents as string'''
++
 +    if not _access_url(location):
 +        raise KickstartError(_("Connection %s failed" % location))
 +
      auth = _get_auth(location, user=user, passwd=passwd)
- 
      try:
+         request = requests.get(location, verify=SSL_VERIFY, auth=auth)
 -- 
 2.7.4
 
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch b/meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch
deleted file mode 100644
index 3d61495..0000000
--- a/meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 8a1f598223bd4cbcc877eb2aba3f5586c75c9d14 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 21 Aug 2017 10:05:06 +0800
-Subject: [PATCH] tweak shebang to python3
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tools/ksvalidator.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/ksvalidator.py b/tools/ksvalidator.py
-index d6051d5..c3682e8 100755
---- a/tools/ksvalidator.py
-+++ b/tools/ksvalidator.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- #
- # Chris Lumens <clumens@redhat.com>
- #
--- 
-1.8.3.1
-
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.15.bb
similarity index 86%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.15.bb
index 8c13f3e..07876a9 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.15.bb
@@ -12,14 +12,13 @@ RDEPENDS_${PN} = "python3 \
 "
 
 S = "${WORKDIR}/git"
-SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=pykickstart-2 \
+SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master \
            file://0001-support-authentication-for-kickstart.patch \
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
-           file://0005-tweak-shebang-to-python3.patch \
            "
-SRCREV = "b2787a818540e678c2f9c5dca0c6bbd65b8b55e5"
+SRCREV = "07c4d89129fa6b460acc86daf58eb5ff64cdc832"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.7.4


