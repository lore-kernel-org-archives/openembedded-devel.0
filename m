Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE8678284
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 07:44:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6K7ifdV018678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Jul 2017 00:44:41 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Jul 2017 00:44:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Jul 2017 03:44:29 -0400
Message-ID: <99cfe7a25e0a23e0345a4c32e9705784a77389a1.1500536448.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1500536448.git.hongxu.jia@windriver.com>
References: <cover.1500536448.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/8] python3-pykickstart: add recipe 2.35
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
X-List-Received-Date: Thu, 20 Jul 2017 07:44:41 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...0001-support-authentication-for-kickstart.patch | 151 +++++++++++++++++++++
 ...-parser.py-add-lock-for-readKickstart-and.patch |  76 +++++++++++
 ...-sections-shutdown-and-environment-in-gen.patch |  48 +++++++
 ...d.py-retry-to-invoke-request-with-timeout.patch |  82 +++++++++++
 .../python-pykickstart/python3-pykickstart_2.35.bb |  26 ++++
 5 files changed, 383 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
 create mode 100644 meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
new file mode 100644
index 0000000..617699d
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -0,0 +1,151 @@
+From d0d8890b5ef74c315381c9e1cff4b1d32892116b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 15:07:36 +0800
+Subject: [PATCH 1/4] support authentication for kickstart
+
+While download kickstart file from web server,
+we support basic/digest authentication.
+
+Add KickstartAuthError to report authentication failure,
+which the invoker could parse this specific error.
+
+Upstream-Status: inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pykickstart/errors.py | 19 +++++++++++++++++++
+ pykickstart/load.py   | 32 +++++++++++++++++++++++++++-----
+ pykickstart/parser.py |  4 ++--
+ 3 files changed, 48 insertions(+), 7 deletions(-)
+
+diff --git a/pykickstart/errors.py b/pykickstart/errors.py
+index b76e84c..fd81bc8 100644
+--- a/pykickstart/errors.py
++++ b/pykickstart/errors.py
+@@ -35,6 +35,10 @@ It also exports several exception classes:
+ 
+     KickstartVersionError - An exception for errors relating to unsupported
+                             syntax versions.
++
++    KickstartAuthError - An exception for errors relating to authentication
++                         failed while downloading kickstart from web server
++
+ """
+ import warnings
+ 
+@@ -103,3 +107,18 @@ class KickstartVersionError(KickstartError):
+ 
+     def __str__ (self):
+         return self.value
++
++class KickstartAuthError(KickstartError):
++    """An exception for errors relating to authentication failed while
++       downloading kickstart from web server
++    """
++    def __init__(self, msg):
++        """Create a new KickstartAuthError exception instance with the
++           descriptive message val.  val should be the return value of
++           formatErrorMsg.
++        """
++        KickstartError.__init__(self, msg)
++
++    def __str__(self):
++        return self.value
++
+diff --git a/pykickstart/load.py b/pykickstart/load.py
+index 1f69b9c..0f5741b 100644
+--- a/pykickstart/load.py
++++ b/pykickstart/load.py
+@@ -18,10 +18,13 @@
+ # with the express permission of Red Hat, Inc.
+ #
+ import requests
++from requests.auth import HTTPDigestAuth
++from requests.auth import HTTPBasicAuth
++
+ import shutil
+ import six
+ 
+-from pykickstart.errors import KickstartError
++from pykickstart.errors import KickstartError, KickstartAuthError
+ from pykickstart.i18n import _
+ from requests.exceptions import SSLError, RequestException
+ 
+@@ -29,7 +32,7 @@ _is_url = lambda location: '://' in location # RFC 3986
+ 
+ SSL_VERIFY = True
+ 
+-def load_to_str(location):
++def load_to_str(location, user=None, passwd=None):
+     '''Load a destination URL or file into a string.
+     Type of input is inferred automatically.
+ 
+@@ -40,7 +43,7 @@ def load_to_str(location):
+     Raises: KickstartError on error reading'''
+ 
+     if _is_url(location):
+-        return _load_url(location)
++        return _load_url(location, user=user, passwd=passwd)
+     else:
+         return _load_file(location)
+ 
+@@ -71,13 +74,32 @@ def load_to_file(location, destination):
+         _copy_file(location, destination)
+         return destination
+ 
++def _get_auth(location, user=None, passwd=None):
++
++    auth = None
++    request = requests.get(location, verify=SSL_VERIFY)
++    if request.status_code == requests.codes.unauthorized:
++        if user is None or passwd is None:
++            log.info("Require Authentication")
++            raise KickstartAuthError("Require Authentication.\nAppend 'ksuser=<username> kspasswd=<password>' to boot command")
+ 
++        reasons = request.headers.get("WWW-Authenticate", "").split()
++        if reasons:
++            auth_type = reasons[0]
++        if auth_type == "Basic":
++            auth = HTTPBasicAuth(user, passwd)
++        elif auth_type == "Digest":
++            auth=HTTPDigestAuth(user, passwd)
+ 
+-def _load_url(location):
++    return auth
++
++def _load_url(location, user=None, passwd=None):
+     '''Load a location (URL or filename) and return contents as string'''
+ 
++    auth = _get_auth(location, user=user, passwd=passwd)
++
+     try:
+-        request = requests.get(location, verify=SSL_VERIFY)
++        request = requests.get(location, verify=SSL_VERIFY, auth=auth)
+     except SSLError as e:
+         raise KickstartError(_('Error securely accessing URL "%s"') % location + ': {e}'.format(e=str(e)))
+     except RequestException as e:
+diff --git a/pykickstart/parser.py b/pykickstart/parser.py
+index d2b0fbe..26b5de9 100644
+--- a/pykickstart/parser.py
++++ b/pykickstart/parser.py
+@@ -773,7 +773,7 @@ class KickstartParser(object):
+         i = PutBackIterator(s.splitlines(True) + [""])
+         self._stateMachine (i)
+ 
+-    def readKickstart(self, f, reset=True):
++    def readKickstart(self, f, reset=True, username=None, password=None):
+         """Process a kickstart file, given by the filename f."""
+         if reset:
+             self._reset()
+@@ -794,7 +794,7 @@ class KickstartParser(object):
+         self.currentdir[self._includeDepth] = cd
+ 
+         try:
+-            s = load_to_str(f)
++            s = load_to_str(f, user=username, passwd=password)
+         except KickstartError as e:
+             raise KickstartError(formatErrorMsg(0, msg=_("Unable to open input kickstart file: %s") % str(e)))
+ 
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
new file mode 100644
index 0000000..cb21235
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
@@ -0,0 +1,76 @@
+From e6e747b883114bfad51ad93f823e65f5a4d6438a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 15:12:29 +0800
+Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and
+ support https without certification
+
+- Add lock for readKickstart to fix race issue
+
+- Support to download kickstart file through https without certification
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pykickstart/load.py   |  2 +-
+ pykickstart/parser.py | 24 ++++++++++++++++++++++++
+ 2 files changed, 25 insertions(+), 1 deletion(-)
+
+diff --git a/pykickstart/load.py b/pykickstart/load.py
+index 0f5741b..48c8276 100644
+--- a/pykickstart/load.py
++++ b/pykickstart/load.py
+@@ -30,7 +30,7 @@ from requests.exceptions import SSLError, RequestException
+ 
+ _is_url = lambda location: '://' in location # RFC 3986
+ 
+-SSL_VERIFY = True
++SSL_VERIFY = False
+ 
+ def load_to_str(location, user=None, passwd=None):
+     '''Load a destination URL or file into a string.
+diff --git a/pykickstart/parser.py b/pykickstart/parser.py
+index 26b5de9..264ba05 100644
+--- a/pykickstart/parser.py
++++ b/pykickstart/parser.py
+@@ -57,6 +57,26 @@ STATE_COMMANDS = "commands"
+ 
+ ver = version.DEVEL
+ 
++import logging
++log = logging.getLogger("anaconda")
++
++import inspect
++import threading
++_private_ks_lock = threading.RLock()
++
++class KsLock(object):
++    def __enter__(self):
++        log.info("%s %s" % (self.__class__.__name__, inspect.stack()[0][3]))
++        _private_ks_lock.acquire()
++        return _private_ks_lock
++
++    def __exit__(self, exc_type, exc_val, exc_tb):
++        log.info("%s %s" % (self.__class__.__name__, inspect.stack()[0][3]))
++        _private_ks_lock.release()
++
++
++_ks_lock = KsLock()
++
+ def _preprocessStateMachine (lineIter):
+     l = None
+     lineno = 0
+@@ -774,6 +794,10 @@ class KickstartParser(object):
+         self._stateMachine (i)
+ 
+     def readKickstart(self, f, reset=True, username=None, password=None):
++        with _ks_lock:
++            self._readKickstart(f, reset=reset, username=username, password=password)
++
++    def _readKickstart(self, f, reset=True, username=None, password=None):
+         """Process a kickstart file, given by the filename f."""
+         if reset:
+             self._reset()
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
new file mode 100644
index 0000000..9fb25fb
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/0003-comment-out-sections-shutdown-and-environment-in-gen.patch
@@ -0,0 +1,48 @@
+From be6012a5dd49ae5e8ac035654ab1c6f37f0dc8f4 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 1 Jun 2017 15:15:15 +0800
+Subject: [PATCH 3/4] comment out sections shutdown and environment in
+ generated kickstart file
+
+Both of them is disabled by default.
+
+Upstream-Status: Inappropriate[oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+fixup! add comments of shutdown for user
+---
+ pykickstart/commands/reboot.py | 3 +++
+ pykickstart/parser.py          | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/pykickstart/commands/reboot.py b/pykickstart/commands/reboot.py
+index 88799ba..2d0cea9 100644
+--- a/pykickstart/commands/reboot.py
++++ b/pykickstart/commands/reboot.py
+@@ -41,6 +41,9 @@ class FC3_Reboot(KickstartCommand):
+         elif self.action == KS_SHUTDOWN:
+             retval += "# Shutdown after installation\nshutdown"
+             retval += self._getArgsAsStr() + "\n"
++        else:
++            retval += "# Shutdown after installation\n#shutdown"
++            retval += self._getArgsAsStr() + "\n"
+ 
+         return retval
+ 
+diff --git a/pykickstart/parser.py b/pykickstart/parser.py
+index 264ba05..b3f33d7 100644
+--- a/pykickstart/parser.py
++++ b/pykickstart/parser.py
+@@ -383,7 +383,7 @@ class Packages(KickstartObject):
+ 
+         if not self.default:
+             if self.environment:
+-                pkgs += "@^%s\n" % self.environment
++                pkgs += "#@^%s\n" % self.environment
+ 
+             grps = self.groupList
+             grps.sort()
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
new file mode 100644
index 0000000..70254f6
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -0,0 +1,82 @@
+From c0e63f0d3c09bdabb0ad2c88b7cc73e7618dd86a Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 15 Jun 2017 17:35:33 +0800
+Subject: [PATCH 4/4] load.py: retry to invoke request with timeout
+
+While networkless, use request to fetch kickstart file from
+network, it failed and wait 300s to break, we should retry
+to invoke request with timeout explicitly. So if it the
+network is up, the fetch works.
+
+Upstream-Status: inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ pykickstart/load.py | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+diff --git a/pykickstart/load.py b/pykickstart/load.py
+index 48c8276..74b266b 100644
+--- a/pykickstart/load.py
++++ b/pykickstart/load.py
+@@ -21,6 +21,7 @@ import requests
+ from requests.auth import HTTPDigestAuth
+ from requests.auth import HTTPBasicAuth
+ 
++import time
+ import shutil
+ import six
+ 
+@@ -28,6 +29,9 @@ from pykickstart.errors import KickstartError, KickstartAuthError
+ from pykickstart.i18n import _
+ from requests.exceptions import SSLError, RequestException
+ 
++import logging
++log = logging.getLogger("anaconda")
++
+ _is_url = lambda location: '://' in location # RFC 3986
+ 
+ SSL_VERIFY = False
+@@ -74,6 +78,29 @@ def load_to_file(location, destination):
+         _copy_file(location, destination)
+         return destination
+ 
++def _access_url(location):
++    status = False
++
++    # Retry 45 times, wait 45s~135s
++    i = 0
++    while i < 45:
++
++        try:
++            request = requests.get(location, verify=SSL_VERIFY, timeout=2)
++        except RequestException as e:
++            log.info("Try '%s' %d times, %s" % (location, i, str(e)))
++            status = False
++            i += 1
++            time.sleep(1)
++            continue
++
++        else:
++            status = True
++            return status
++
++    return status
++
++
+ def _get_auth(location, user=None, passwd=None):
+ 
+     auth = None
+@@ -96,6 +123,9 @@ def _get_auth(location, user=None, passwd=None):
+ def _load_url(location, user=None, passwd=None):
+     '''Load a location (URL or filename) and return contents as string'''
+ 
++    if not _access_url(location):
++        raise KickstartError(_("Connection %s failed" % location))
++
+     auth = _get_auth(location, user=user, passwd=passwd)
+ 
+     try:
+-- 
+2.7.4
+
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
new file mode 100644
index 0000000..e96af43
--- /dev/null
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_2.35.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "A python library for manipulating kickstart files"
+HOMEPAGE = "http://fedoraproject.org/wiki/pykickstart"
+LICENSE = "GPLv2+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+DEPENDS = "python3"
+RDEPENDS_${PN} = "python3 \
+                  python3-requests \
+                  python3-six \
+"
+
+S = "${WORKDIR}/git"
+SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=pykickstart-2 \
+           file://0001-support-authentication-for-kickstart.patch \
+           file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
+           file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
+           file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
+           "
+SRCREV = "b2787a818540e678c2f9c5dca0c6bbd65b8b55e5"
+
+inherit setuptools3
+
+PROVIDES = "pykickstart"
+RPROVIDES_${PN} = "pykickstart"
-- 
2.8.1


