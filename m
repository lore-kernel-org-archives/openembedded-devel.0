Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4315DC36002
	for <webhook@archiver.kernel.org>; Wed,  9 Apr 2025 09:37:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4340.1744191471325757584
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Apr 2025 02:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6194bfbfb2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5395HLlw002051
	for <openembedded-devel@lists.openembedded.org>; Wed, 9 Apr 2025 02:37:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m4taa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 02:37:50 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 9 Apr 2025 02:37:49 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 9 Apr 2025 02:37:48 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-pykickstart: Upgrade 3.48 -> 3.62
Date: Wed, 9 Apr 2025 17:37:48 +0800
Message-ID: <20250409093748.1116764-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: pxmwvHmnBjZa87v2m9hQ0kkpNGYI9BVY
X-Proofpoint-ORIG-GUID: pxmwvHmnBjZa87v2m9hQ0kkpNGYI9BVY
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f63fee cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=vTr9H3xdAAAA:8 a=t7CeM3EgAAAA:8 a=omOdbC7AAAAA:8 a=20KFwNOVAAAA:8
 a=8FfwG5XrBwCjxXivmHgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_03,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504090051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Apr 2025 09:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116733

From: Mingli Yu <mingli.yu@windriver.com>

License-update:
Remove control characters from license [1].

Remove one backported patch.

Changelog:
https://github.com/pykickstart/pykickstart/releases

[1] https://github.com/pykickstart/pykickstart/commit/6f35a9eedabf33c9b27317449848333ead3a3c6b

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...support-authentication-for-kickstart.patch | 26 ++++---
 ...er.py-add-lock-for-readKickstart-and.patch | 19 ++---
 ...retry-to-invoke-request-with-timeout.patch | 16 +++--
 ...o-behavior-change-in-upstream-_parse.patch | 71 -------------------
 ...rt_3.48.bb => python3-pykickstart_3.62.bb} |  5 +-
 5 files changed, 37 insertions(+), 100 deletions(-)
 delete mode 100644 meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.48.bb => python3-pykickstart_3.62.bb} (79%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index 309a00122a..ed656f6c6a 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -1,4 +1,4 @@
-From 3540ddcc7448dc784b65c74424c8a25132cb8534 Mon Sep 17 00:00:00 2001
+From 80190be8d9c82ed816fb571abef416a1fbfb9a35 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 31 Jul 2018 17:24:47 +0800
 Subject: [PATCH] support authentication for kickstart
@@ -12,11 +12,14 @@ which the invoker could parse this specific error.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 3.62
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
  pykickstart/errors.py | 17 +++++++++++++++++
- pykickstart/load.py   | 32 +++++++++++++++++++++++++++-----
+ pykickstart/load.py   | 33 ++++++++++++++++++++++++++++-----
  pykickstart/parser.py |  4 ++--
- 3 files changed, 46 insertions(+), 7 deletions(-)
+ 3 files changed, 47 insertions(+), 7 deletions(-)
 
 diff --git a/pykickstart/errors.py b/pykickstart/errors.py
 index 8294f59..3d20bf8 100644
@@ -51,7 +54,7 @@ index 8294f59..3d20bf8 100644
 +    def __str__(self):
 +        return self.value
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index eb76b65..f51cf08 100644
+index e8301a4..45d402a 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -18,9 +18,11 @@
@@ -85,7 +88,7 @@ index eb76b65..f51cf08 100644
      else:
          return _load_file(location)
  
-@@ -69,11 +71,31 @@ def load_to_file(location, destination):
+@@ -69,11 +71,32 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
@@ -111,19 +114,20 @@ index eb76b65..f51cf08 100644
 +
 +def _load_url(location, user=None, passwd=None):
      '''Load a location (URL or filename) and return contents as string'''
-+    auth = _get_auth(location, user=user, passwd=passwd)
  
++    auth = _get_auth(location, user=user, passwd=passwd)
++
      try:
--        request = requests.get(location, verify=SSL_VERIFY)
-+        request = requests.get(location, verify=SSL_VERIFY, auth=auth)
+-        request = requests.get(location, verify=SSL_VERIFY, timeout=120)
++        request = requests.get(location, verify=SSL_VERIFY, auth=auth, timeout=120)
      except SSLError as e:
          raise KickstartError(_('Error securely accessing URL "%s"') % location + ': {e}'.format(e=str(e)))
      except RequestException as e:
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index 7edf8aa..46c5299 100644
+index 12b0467..351dc1b 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -790,7 +790,7 @@ class KickstartParser(object):
+@@ -831,7 +831,7 @@ class KickstartParser(object):
          i = PutBackIterator(s.splitlines(True) + [""])
          self._stateMachine(i)
  
@@ -132,7 +136,7 @@ index 7edf8aa..46c5299 100644
          """Process a kickstart file, given by the filename f."""
          if reset:
              self._reset()
-@@ -811,7 +811,7 @@ class KickstartParser(object):
+@@ -852,7 +852,7 @@ class KickstartParser(object):
          self.currentdir[self._includeDepth] = cd
  
          try:
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
index f5483db825..cf5dd95d48 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
@@ -1,8 +1,8 @@
-From 62fdead139edb0f29b2f222efcb8f39be15b057e Mon Sep 17 00:00:00 2001
+From 42076483ed38d50400156cbb75d4c9b0180e6957 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 30 Jul 2018 15:47:13 +0800
-Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and
- support https without certification
+Subject: [PATCH] pykickstart/parser.py: add lock for readKickstart and support
+ https without certification
 
 - Add lock for readKickstart to fix race issue
 
@@ -13,15 +13,18 @@ Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
 Upstream-Status: Pending
 
+Rebase to 3.62
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
  pykickstart/load.py   |  2 +-
  pykickstart/parser.py | 18 ++++++++++++++++++
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 8da8051..e856c8d 100644
+index 45d402a..6eeffde 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
-@@ -32,7 +32,7 @@ log = logging.getLogger("anaconda.main")
+@@ -28,7 +28,7 @@ from requests.exceptions import SSLError, RequestException
  
  is_url = lambda location: '://' in location  # RFC 3986
  
@@ -31,10 +34,10 @@ index 8da8051..e856c8d 100644
  def load_to_str(location, user=None, passwd=None):
      '''Load a destination URL or file into a string.
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index b95ba90..a55a9a3 100644
+index 351dc1b..aef59ca 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -51,6 +51,20 @@ from pykickstart.i18n import _
+@@ -54,6 +54,20 @@ from pykickstart.i18n import _
  STATE_END = "end"
  STATE_COMMANDS = "commands"
  
@@ -55,7 +58,7 @@ index b95ba90..a55a9a3 100644
  def _preprocessStateMachine(lineIter):
      l = None
      lineno = 0
-@@ -791,6 +805,10 @@ class KickstartParser(object):
+@@ -832,6 +846,10 @@ class KickstartParser(object):
          self._stateMachine(i)
  
      def readKickstart(self, f, reset=True, username=None, password=None):
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
index abe2c87e00..e2c65ee957 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -1,4 +1,4 @@
-From 737e9a7c11233183f48ce6c83d38b504c8ffed12 Mon Sep 17 00:00:00 2001
+From d5e6304dff890b39a53a96f03819aa118deb701a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 30 Jul 2018 15:52:21 +0800
 Subject: [PATCH] load.py: retry to invoke request with timeout
@@ -11,12 +11,15 @@ network is up, the fetch works.
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Rebase to 3.62
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- pykickstart/load.py | 31 +++++++++++++++++++++++++++++++
- 1 file changed, 31 insertions(+)
+ pykickstart/load.py | 30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 58faba6..e856c8d 100644
+index 6eeffde..da0032f 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
 @@ -20,12 +20,16 @@
@@ -66,11 +69,10 @@ index 58faba6..e856c8d 100644
  def _get_auth(location, user=None, passwd=None):
  
      auth = None
-@@ -92,6 +119,10 @@ def _get_auth(location, user=None, passwd=None):
- 
+@@ -93,6 +120,9 @@ def _get_auth(location, user=None, passwd=None):
  def _load_url(location, user=None, passwd=None):
      '''Load a location (URL or filename) and return contents as string'''
-+
+ 
 +    if not _access_url(location):
 +        raise KickstartError(_("Connection %s failed" % location))
 +
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch b/meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
deleted file mode 100644
index e2b34ab937..0000000000
--- a/meta-python/recipes-extended/python-pykickstart/files/0005-options-adjust-to-behavior-change-in-upstream-_parse.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From f753d4d6ad1f4846d14735beb3d1b157b9914b51 Mon Sep 17 00:00:00 2001
-From: Adam Williamson <awilliam@redhat.com>
-Date: Wed, 2 Oct 2024 09:48:39 -0700
-Subject: [PATCH] options: adjust to behavior change in upstream
- _parse_optional
-
-In Python 3.13 and 3.12.7, the behavior of _parse_optional has
-changed. It used to raise an error on multiple matching actions
-itself, and only ever return None or an option tuple. Now the
-"raise error on multiple matching actions" code was moved out
-into consume_optional, and _parse_optional returns either None
-or a *list* of option tuples, which contains more than one if
-multiple actions match. See:
-
-https://github.com/python/cpython/pull/124631
-https://github.com/python/cpython/issues/58573
-
-This adapts to the change in a way that should work on both older
-and newer Pythons.
-
-Signed-off-by: Adam Williamson <awilliam@redhat.com>
-
-Upstream-Status: Backport [https://github.com/pykickstart/pykickstart/commit/f753d4d]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- pykickstart/options.py | 20 +++++++++++++++++---
- 1 file changed, 17 insertions(+), 3 deletions(-)
-
-diff --git a/pykickstart/options.py b/pykickstart/options.py
-index 2e3a0721..ca0e18af 100644
---- a/pykickstart/options.py
-+++ b/pykickstart/options.py
-@@ -177,9 +177,23 @@ class KSOptionParser(ArgumentParser):
-         self.lineno = None
- 
-     def _parse_optional(self, arg_string):
--        option_tuple = ArgumentParser._parse_optional(self, arg_string)
-+        # Before 3.13 and 3.12.7, this returned None or a single
-+        # option tuple. From 3.13 / 3.12.7 onwards it returns None
-+        # or a *list* of option tuples
-+        option_tuple_or_tuples = ArgumentParser._parse_optional(self, arg_string)
-+        # all we want to do here is a custom warning if the action is
-+        # deprecated. we can only safely do this if there's exactly
-+        # one matching action
-+        if isinstance(option_tuple_or_tuples, list):
-+            if len(option_tuple_or_tuples) == 1:
-+                option_tuple = option_tuple_or_tuples[0]
-+            else:
-+                return option_tuple_or_tuples
-+        else:
-+            option_tuple = option_tuple_or_tuples
-+
-         if option_tuple is None or option_tuple[0] is None:
--            return option_tuple
-+            return option_tuple_or_tuples
- 
-         action = option_tuple[0]
-         option = action.option_strings[0]
-@@ -191,7 +205,7 @@ class KSOptionParser(ArgumentParser):
-                             "kickstart. Please modify your kickstart file to remove this option.")
-                           % {"lineno": self.lineno, "option": option}, KickstartDeprecationWarning)
- 
--        return option_tuple
-+        return option_tuple_or_tuples
- 
-     def add_argument(self, *args, **kwargs):
-         if "introduced" in kwargs:
--- 
-2.47.1
-
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.62.bb
similarity index 79%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.62.bb
index df66a8ebf7..9b15f957de 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.62.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "A python library for manipulating kickstart files"
 HOMEPAGE = "https://fedoraproject.org/wiki/pykickstart"
 LICENSE = "GPL-2.0-or-later"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+LIC_FILES_CHKSUM = "file://COPYING;md5=81bcece21748c91ba9992349a91ec11d"
 
 inherit python_setuptools_build_meta
 
@@ -16,9 +16,8 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
-           file://0005-options-adjust-to-behavior-change-in-upstream-_parse.patch \
            "
-SRCREV = "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
+SRCREV = "27f1bd96d1be83da5bea0159f785753ae393ee2d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.34.1


