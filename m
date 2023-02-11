Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34648C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:33:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.9084.1676122424622127730
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kG1AN6AP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122422; i=@fujitsu.com;
	bh=vTnJ37ROspDE1H1GlqlJupiTPrOOcYGNTkp2nb7OuF4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kG1AN6APUCuqKqulR6+1oGY3hJ8UngTYS0FE0fDc3IhOwgHatlYYbhsXLnmhuXKrs
	 1dl/3LvWdvIYMlacDGHkPwE/o1I9yf7Y25TpJRBW8PxnFsbcH/kSoys0mYgCSXe6PJ
	 3+yAO4Md2ELSXdbi0oh0bcOiZN+Br4gfTAlpWktSxxWGfrZPcs2FSpGTguCBF3Xaji
	 vROMlt0OX5t1a0xgUuNvjDmvP/lXZ3pXvWV5/cMPEbL3yB8d5yCxixeGORKDIvuXLL
	 9OjyT77q9B2k+7kHpC5TlTHnj6ifGDJjrjC8ziJCJg8YnTBNapJfHg1C975fxlsBT4
	 S431U4uMfjftw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORqGs683m
  ywYyJOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8abV4eYCt5EV+xt+MzUwNjr18XIxSEk8IRR
  4uSLp4wQzg0miVOHJrFDOHsZJZ6t2MXUxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAr8T0NUvB4iwCqhKvL0xnAbF5BRwl3v1vBauREFCQmPLwPVANBwengJNE6wlNkLAQUM
  n2o4/YIMoFJU7OfMICMV5C4uCLF8wQrYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoWpxaVpRbpWuolFWWmZ5TkJmbm6CVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek
  6OWllmxiBIZuSjGr0w7G431/9Q4xSnIwKYnyLtv8NFmILyk/pTIjsTgjvqg0J7X4EKMMB4eSB
  O+yic+ThQSLUtNTK9Iyc4BxBJOW4OBREuHtng6U5i0uSMwtzkyHSJ1iNOb4cOjKXmaOq1eApB
  BLXn5eqpQ470WQSQIgpRmleXCDYPF9iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw79QpQFN
  4MvNK4Pa9AjqFCegUBqmnIKeUJCKkpBqYuowML9xOU390J0/7x5EVrH+e/ghz4blc4nHy2NSl
  zcoX/Tx/7wxi0jhh+lYjMr9ZcPHWr7UFD6N11HftLv3w0yH8IN8BHm2+2zcVPzDYCb6T3XU1M
  OVJ9v5qEya9fFdejjAjhcqDeSkfv8yyFuWcFTTpwDM+4SVaf4+vF5l56olei4WgPfu+Pdqehd
  v1PiZs3ZAXx3xs49OzvK5B/K8yT6T3vRXJX7OgwcogQNuJlXnj4z9MS9cJ37tpoSVcfayrvTF
  td12ZypT5H6IWrnV6kbJS6rvwx8OJWzK7tcQZXkXWxtbFWnJv0StW4w5b4L9GOqR7/ayoz13u
  P03L+MLzBbMdjd5+DLepVIrVZFRiKc5INNRiLipOBADuWrPBagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1676122421!443700!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32615 invoked from network); 11 Feb 2023 13:33:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:33:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 56601100191
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:41 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 49451100043
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:33:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pykickstart: upgrade 3.34 -> 3.43
Date: Sat, 11 Feb 2023 21:33:22 +0800
Message-ID: <1676122405-5945-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
References: <1676122405-5945-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:33:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101023

From: Wang Mingyu <wangmy@fujitsu.com>

0001-support-authentication-for-kickstart.patch
0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
0004-load.py-retry-to-invoke-request-with-timeout.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...support-authentication-for-kickstart.patch | 35 ++++++++++---------
 ...er.py-add-lock-for-readKickstart-and.patch | 17 ++++-----
 ...retry-to-invoke-request-with-timeout.patch | 18 +++++-----
 ...rt_3.34.bb => python3-pykickstart_3.43.bb} |  2 +-
 4 files changed, 38 insertions(+), 34 deletions(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.34.bb => python3-pykickstart_3.43.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index 5f95d74bf..23a06bf62 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -12,15 +12,14 @@ which the invoker could parse this specific error.
 Upstream-Status: inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  pykickstart/errors.py | 17 +++++++++++++++++
- pykickstart/load.py   | 34 ++++++++++++++++++++++++++++------
+ pykickstart/load.py   | 32 +++++++++++++++++++++++++++-----
  pykickstart/parser.py |  4 ++--
- 3 files changed, 47 insertions(+), 8 deletions(-)
+ 3 files changed, 46 insertions(+), 7 deletions(-)
 
 diff --git a/pykickstart/errors.py b/pykickstart/errors.py
-index 8294f59a..3d20bf82 100644
+index 8294f59..3d20bf8 100644
 --- a/pykickstart/errors.py
 +++ b/pykickstart/errors.py
 @@ -32,6 +32,9 @@ This module exports several exception classes:
@@ -52,16 +51,15 @@ index 8294f59a..3d20bf82 100644
 +    def __str__(self):
 +        return self.value
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index 30e2fcfa..b984876d 100644
+index eb76b65..f51cf08 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
-@@ -18,9 +18,12 @@
+@@ -18,9 +18,11 @@
  # with the express permission of Red Hat, Inc.
  #
  import requests
 +from requests.auth import HTTPDigestAuth
 +from requests.auth import HTTPBasicAuth
-+
  import shutil
  
 -from pykickstart.errors import KickstartError
@@ -69,7 +67,7 @@ index 30e2fcfa..b984876d 100644
  from pykickstart.i18n import _
  from requests.exceptions import SSLError, RequestException
  
-@@ -28,7 +31,7 @@ _is_url = lambda location: '://' in location  # RFC 3986
+@@ -28,7 +30,7 @@ is_url = lambda location: '://' in location  # RFC 3986
  
  SSL_VERIFY = True
  
@@ -78,21 +76,20 @@ index 30e2fcfa..b984876d 100644
      '''Load a destination URL or file into a string.
      Type of input is inferred automatically.
  
-@@ -39,7 +42,7 @@ def load_to_str(location):
+@@ -39,7 +41,7 @@ def load_to_str(location):
      Raises: KickstartError on error reading'''
  
-     if _is_url(location):
+     if is_url(location):
 -        return _load_url(location)
 +        return _load_url(location, user=user, passwd=passwd)
      else:
          return _load_file(location)
  
-@@ -69,11 +72,30 @@ def load_to_file(location, destination):
+@@ -69,11 +71,31 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
 -def _load_url(location):
--    '''Load a location (URL or filename) and return contents as string'''
 +def _get_auth(location, user=None, passwd=None):
 +
 +    auth = None
@@ -101,7 +98,7 @@ index 30e2fcfa..b984876d 100644
 +        if user is None or passwd is None:
 +            log.info("Require Authentication")
 +            raise KickstartAuthError("Require Authentication.\nAppend 'ksuser=<username> kspasswd=<password>' to boot command")
- 
++
 +        reasons = request.headers.get("WWW-Authenticate", "").split()
 +        if reasons:
 +            auth_type = reasons[0]
@@ -113,8 +110,9 @@ index 30e2fcfa..b984876d 100644
 +    return auth
 +
 +def _load_url(location, user=None, passwd=None):
-+    '''Load a location (URL or filename) and return contents as string'''
+     '''Load a location (URL or filename) and return contents as string'''
 +    auth = _get_auth(location, user=user, passwd=passwd)
+ 
      try:
 -        request = requests.get(location, verify=SSL_VERIFY)
 +        request = requests.get(location, verify=SSL_VERIFY, auth=auth)
@@ -122,10 +120,10 @@ index 30e2fcfa..b984876d 100644
          raise KickstartError(_('Error securely accessing URL "%s"') % location + ': {e}'.format(e=str(e)))
      except RequestException as e:
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index b23e54f1..e10f06b5 100644
+index 7edf8aa..46c5299 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -796,7 +796,7 @@ class KickstartParser(object):
+@@ -790,7 +790,7 @@ class KickstartParser(object):
          i = PutBackIterator(s.splitlines(True) + [""])
          self._stateMachine(i)
  
@@ -134,7 +132,7 @@ index b23e54f1..e10f06b5 100644
          """Process a kickstart file, given by the filename f."""
          if reset:
              self._reset()
-@@ -817,7 +817,7 @@ class KickstartParser(object):
+@@ -811,7 +811,7 @@ class KickstartParser(object):
          self.currentdir[self._includeDepth] = cd
  
          try:
@@ -143,3 +141,6 @@ index b23e54f1..e10f06b5 100644
          except KickstartError as e:
              raise KickstartError(_("Unable to open input kickstart file: %s") % str(e), lineno=0)
  
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
index 4a001f338..5e0d6166f 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch
@@ -1,7 +1,7 @@
 From 62fdead139edb0f29b2f222efcb8f39be15b057e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 30 Jul 2018 15:47:13 +0800
-Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and 
+Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and
  support https without certification
 
 - Add lock for readKickstart to fix race issue
@@ -9,18 +9,19 @@ Subject: [PATCH 2/4] pykickstart/parser.py: add lock for readKickstart and
 - Support to download kickstart file through https without certification
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
 ---
  pykickstart/load.py   |  2 +-
  pykickstart/parser.py | 18 ++++++++++++++++++
  2 files changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index c6f013f..7adb751 100644
+index 8da8051..e856c8d 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
-@@ -30,7 +30,7 @@ from requests.exceptions import SSLError, RequestException
+@@ -32,7 +32,7 @@ log = logging.getLogger("anaconda.main")
  
- _is_url = lambda location: '://' in location  # RFC 3986
+ is_url = lambda location: '://' in location  # RFC 3986
  
 -SSL_VERIFY = True
 +SSL_VERIFY = False
@@ -28,10 +29,10 @@ index c6f013f..7adb751 100644
  def load_to_str(location, user=None, passwd=None):
      '''Load a destination URL or file into a string.
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index e44099b..e68174d 100644
+index b95ba90..a55a9a3 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -55,6 +55,20 @@ from pykickstart.i18n import _
+@@ -51,6 +51,20 @@ from pykickstart.i18n import _
  STATE_END = "end"
  STATE_COMMANDS = "commands"
  
@@ -52,7 +53,7 @@ index e44099b..e68174d 100644
  def _preprocessStateMachine(lineIter):
      l = None
      lineno = 0
-@@ -788,6 +802,10 @@ class KickstartParser(object):
+@@ -791,6 +805,10 @@ class KickstartParser(object):
          self._stateMachine(i)
  
      def readKickstart(self, f, reset=True, username=None, password=None):
@@ -64,5 +65,5 @@ index e44099b..e68174d 100644
          if reset:
              self._reset()
 -- 
-2.7.4
+2.34.1
 
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
index bf5a19723..b09bb74df 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -11,19 +11,18 @@ network is up, the fetch works.
 Upstream-Status: inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
 ---
  pykickstart/load.py | 31 +++++++++++++++++++++++++++++++
  1 file changed, 31 insertions(+)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index f75fe5d3..a8f3ed1d 100644
+index 58faba6..e856c8d 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
-@@ -21,12 +21,16 @@ import requests
+@@ -20,12 +20,16 @@
+ import requests
  from requests.auth import HTTPDigestAuth
  from requests.auth import HTTPBasicAuth
- 
 +import time
  import shutil
  
@@ -34,10 +33,10 @@ index f75fe5d3..a8f3ed1d 100644
 +import logging
 +log = logging.getLogger("anaconda.main")
 +
- _is_url = lambda location: '://' in location  # RFC 3986
+ is_url = lambda location: '://' in location  # RFC 3986
  
  SSL_VERIFY = False
-@@ -72,6 +76,29 @@ def load_to_file(location, destination):
+@@ -71,6 +75,29 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
@@ -67,7 +66,7 @@ index f75fe5d3..a8f3ed1d 100644
  def _get_auth(location, user=None, passwd=None):
  
      auth = None
-@@ -93,6 +120,10 @@ def _get_auth(location, user=None, passwd=None):
+@@ -92,6 +119,10 @@ def _get_auth(location, user=None, passwd=None):
  
  def _load_url(location, user=None, passwd=None):
      '''Load a location (URL or filename) and return contents as string'''
@@ -76,5 +75,8 @@ index f75fe5d3..a8f3ed1d 100644
 +        raise KickstartError(_("Connection %s failed" % location))
 +
      auth = _get_auth(location, user=user, passwd=passwd)
+ 
      try:
-         request = requests.get(location, verify=SSL_VERIFY, auth=auth)
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.43.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.43.bb
index 6bf9ada58..6f2edf224 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.43.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "bfd836cfdd8439d984595aca015811ed5c6be733"
+SRCREV = "6d488a0120f4da40aa0b04e29f37d7bb3297247f"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.34.1


