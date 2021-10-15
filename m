Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FBCC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:55:35 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.4279.1634338534529976823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Uf6nFMR+;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id j21so48211251lfe.0
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UNMoGn8cksAiQAkQM54s0hn2EaMWOk6vjOs1aFkQ9oQ=;
        b=Uf6nFMR+o6smUQeQeOk0S6MnZ5tKMXHwFTXOFjHDugzEQ3uzOamN877oIdZAoz3lIE
         Ujqo+xOXZtm2zevBy1C2EeMo/NjVBHzWE2OOgPTu5hmsgb1LKyKTFJ7AtjFR3Y9ZWUf2
         9cMGC8XrNRc6SgKppFvjbwGwpbfveXAbJ2uXQYaaE1/zULsMVct9w3hBtvzV8RhqJeob
         tdobzBbh4L5H9sbD4I45yUNCqkMn7Q7PVYsPPaFPrR2FLL0fAjcKLSfnTso5UEa0MKrK
         TBuBXVnlKJ/ZeKhtBKupKLqfhIZfz/g6fwGM1ifTgaTDAl1rY7vSJlmcZJlbCxG6h+jP
         nAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UNMoGn8cksAiQAkQM54s0hn2EaMWOk6vjOs1aFkQ9oQ=;
        b=4wO86WbG8FToPE9Jpx7IaQqIa9LxKSHSUOFzk+f/bloKKCKKWr6P27uFQIbnntYc2M
         r8o/R4XOIIyasKTCDEhhGqZSWITaPvPGBvfm6h0ne1qA4CwEXX1TEyJsBKCnp7xa5lVp
         6R6qi8yI9IUs6UTaM4C4Vjm6fFE1gdHWITB8GY/BsR+bAX6TdIbEd6lh9RU/jJVjQNuP
         05V5vXYjJ6hwWfJi/3okGc27/ndnfSZTfy1Dzlm6YefppalMQiiVbZwReD+uvYyrctlD
         +hlgEQGDY1T/CagO7+WmChwGEA+9TKQxv63w4hRi42NUNPjNPkn7b5ay0cWZcrBwqMcR
         JoYg==
X-Gm-Message-State: AOAM530rdt/aPs8DtgdMz+74qLH/HRx4ePVRGaHqurpmoDxX0QHcxKnf
	2AUXvUlZFDeqMIGWknPtkModAZ8awbWHJumg
X-Google-Smtp-Source: 
 ABdhPJzp2x9LG2DVC2FlxEQ6TxJGeA4AF8LLp7hlAWMVuj0swQODp+bT0Qikq6DcxqbpxSsbXsz+Ew==
X-Received: by 2002:a19:7616:: with SMTP id
 c22mr13638847lff.450.1634338532094;
        Fri, 15 Oct 2021 15:55:32 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 l17sm653660lfj.78.2021.10.15.15.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:55:31 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pykickstart: update to 3.34
Date: Sat, 16 Oct 2021 00:55:27 +0200
Message-Id: <20211015225527.4161507-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:55:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93334

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...support-authentication-for-kickstart.patch | 27 +++++++++----------
 ...retry-to-invoke-request-with-timeout.patch | 19 ++++++-------
 ...rt_3.32.bb => python3-pykickstart_3.34.bb} |  2 +-
 3 files changed, 21 insertions(+), 27 deletions(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.32.bb => python3-pykickstart_3.34.bb} (94%)

diff --git a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
index 0e64ce420..5f95d74bf 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0001-support-authentication-for-kickstart.patch
@@ -1,7 +1,7 @@
-From f05f5fc363e2510f6943532f3e14a6423f6a2cf1 Mon Sep 17 00:00:00 2001
+From 3540ddcc7448dc784b65c74424c8a25132cb8534 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 31 Jul 2018 17:24:47 +0800
-Subject: [PATCH 1/4] support authentication for kickstart
+Subject: [PATCH] support authentication for kickstart
 
 While download kickstart file from web server,
 we support basic/digest authentication.
@@ -12,6 +12,7 @@ which the invoker could parse this specific error.
 Upstream-Status: inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  pykickstart/errors.py | 17 +++++++++++++++++
  pykickstart/load.py   | 34 ++++++++++++++++++++++++++++------
@@ -19,7 +20,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  3 files changed, 47 insertions(+), 8 deletions(-)
 
 diff --git a/pykickstart/errors.py b/pykickstart/errors.py
-index bf08ac5..aada7aa 100644
+index 8294f59a..3d20bf82 100644
 --- a/pykickstart/errors.py
 +++ b/pykickstart/errors.py
 @@ -32,6 +32,9 @@ This module exports several exception classes:
@@ -51,10 +52,10 @@ index bf08ac5..aada7aa 100644
 +    def __str__(self):
 +        return self.value
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index fb935f2..41a2e9e 100644
+index 30e2fcfa..b984876d 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
-@@ -18,10 +18,13 @@
+@@ -18,9 +18,12 @@
  # with the express permission of Red Hat, Inc.
  #
  import requests
@@ -62,14 +63,13 @@ index fb935f2..41a2e9e 100644
 +from requests.auth import HTTPBasicAuth
 +
  import shutil
- import six
  
 -from pykickstart.errors import KickstartError
 +from pykickstart.errors import KickstartError, KickstartAuthError
  from pykickstart.i18n import _
  from requests.exceptions import SSLError, RequestException
  
-@@ -29,7 +32,7 @@ _is_url = lambda location: '://' in location  # RFC 3986
+@@ -28,7 +31,7 @@ _is_url = lambda location: '://' in location  # RFC 3986
  
  SSL_VERIFY = True
  
@@ -78,7 +78,7 @@ index fb935f2..41a2e9e 100644
      '''Load a destination URL or file into a string.
      Type of input is inferred automatically.
  
-@@ -40,7 +43,7 @@ def load_to_str(location):
+@@ -39,7 +42,7 @@ def load_to_str(location):
      Raises: KickstartError on error reading'''
  
      if _is_url(location):
@@ -87,7 +87,7 @@ index fb935f2..41a2e9e 100644
      else:
          return _load_file(location)
  
-@@ -70,11 +73,30 @@ def load_to_file(location, destination):
+@@ -69,11 +72,30 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
@@ -122,10 +122,10 @@ index fb935f2..41a2e9e 100644
          raise KickstartError(_('Error securely accessing URL "%s"') % location + ': {e}'.format(e=str(e)))
      except RequestException as e:
 diff --git a/pykickstart/parser.py b/pykickstart/parser.py
-index d8880eb..22d14cb 100644
+index b23e54f1..e10f06b5 100644
 --- a/pykickstart/parser.py
 +++ b/pykickstart/parser.py
-@@ -801,7 +801,7 @@ class KickstartParser(object):
+@@ -796,7 +796,7 @@ class KickstartParser(object):
          i = PutBackIterator(s.splitlines(True) + [""])
          self._stateMachine(i)
  
@@ -134,7 +134,7 @@ index d8880eb..22d14cb 100644
          """Process a kickstart file, given by the filename f."""
          if reset:
              self._reset()
-@@ -822,7 +822,7 @@ class KickstartParser(object):
+@@ -817,7 +817,7 @@ class KickstartParser(object):
          self.currentdir[self._includeDepth] = cd
  
          try:
@@ -143,6 +143,3 @@ index d8880eb..22d14cb 100644
          except KickstartError as e:
              raise KickstartError(_("Unable to open input kickstart file: %s") % str(e), lineno=0)
  
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
index 6ed15ab09..bf5a19723 100644
--- a/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
+++ b/meta-python/recipes-extended/python-pykickstart/files/0004-load.py-retry-to-invoke-request-with-timeout.patch
@@ -1,7 +1,7 @@
-From ffe06c6dd812b604d6482e4353d5564fad78bc90 Mon Sep 17 00:00:00 2001
+From 737e9a7c11233183f48ce6c83d38b504c8ffed12 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 30 Jul 2018 15:52:21 +0800
-Subject: [PATCH 4/4] load.py: retry to invoke request with timeout
+Subject: [PATCH] load.py: retry to invoke request with timeout
 
 While networkless, use request to fetch kickstart file from
 network, it failed and wait 300s to break, we should retry
@@ -11,23 +11,23 @@ network is up, the fetch works.
 Upstream-Status: inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  pykickstart/load.py | 31 +++++++++++++++++++++++++++++++
  1 file changed, 31 insertions(+)
 
 diff --git a/pykickstart/load.py b/pykickstart/load.py
-index ad3bad1..a5cbbc5 100644
+index f75fe5d3..a8f3ed1d 100644
 --- a/pykickstart/load.py
 +++ b/pykickstart/load.py
-@@ -21,6 +21,7 @@ import requests
+@@ -21,12 +21,16 @@ import requests
  from requests.auth import HTTPDigestAuth
  from requests.auth import HTTPBasicAuth
  
 +import time
  import shutil
- import six
  
-@@ -28,6 +29,9 @@ from pykickstart.errors import KickstartError, KickstartAuthError
+ from pykickstart.errors import KickstartError, KickstartAuthError
  from pykickstart.i18n import _
  from requests.exceptions import SSLError, RequestException
  
@@ -37,7 +37,7 @@ index ad3bad1..a5cbbc5 100644
  _is_url = lambda location: '://' in location  # RFC 3986
  
  SSL_VERIFY = False
-@@ -73,6 +77,29 @@ def load_to_file(location, destination):
+@@ -72,6 +76,29 @@ def load_to_file(location, destination):
          _copy_file(location, destination)
          return destination
  
@@ -67,7 +67,7 @@ index ad3bad1..a5cbbc5 100644
  def _get_auth(location, user=None, passwd=None):
  
      auth = None
-@@ -94,6 +121,10 @@ def _get_auth(location, user=None, passwd=None):
+@@ -93,6 +120,10 @@ def _get_auth(location, user=None, passwd=None):
  
  def _load_url(location, user=None, passwd=None):
      '''Load a location (URL or filename) and return contents as string'''
@@ -78,6 +78,3 @@ index ad3bad1..a5cbbc5 100644
      auth = _get_auth(location, user=user, passwd=passwd)
      try:
          request = requests.get(location, verify=SSL_VERIFY, auth=auth)
--- 
-2.7.4
-
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
similarity index 94%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
index 829ada4f8..65fc88e77 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.32.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.34.bb
@@ -18,7 +18,7 @@ SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=ma
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "c56a5fbdd4079b187b21787f072ccc83dc09c28c"
+SRCREV = "bfd836cfdd8439d984595aca015811ed5c6be733"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.25.1


