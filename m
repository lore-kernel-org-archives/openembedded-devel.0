Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D755C38A2E
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web08.4063.1649411900335458462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 02:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vf7YvZud;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: ranjitsinhrathod1991@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id p25so1220710pfn.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 02:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=tBmvCCsLrJmdS4rnWRDca2+BAJ4vQc/1D4FXnDuAWxY=;
        b=Vf7YvZudpNGZx7GKzqWC1h7WyCbPyNGAca5NfRaqD2e0CD9SuujTl2ytiCHoXwl5Yo
         oCEBfQ8HhepaulUUZmLd1cg6Z2ICzmlhvlkIAjZNpzu5FfCxGvHo5W6s3GTsw3/GpmEF
         5VO70ro8s6wagiQDsMiuWrHJfnZX/gnfLLe+RlS3xO4ig9zFNqnXgi6/3+VqX533zunv
         84puJdcRGYFKSNXHfeIMymmGWybjEE0cH0CzXsF+MD6bfqMf0FAjrFtnp5KtaFMis3Pw
         g7CHS6aqii84tv4Sqm90l7WQ8z/hWKTmuT3J2QDRkTyYEJuMi8jGsxW2Iragm3FMbD0I
         BfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tBmvCCsLrJmdS4rnWRDca2+BAJ4vQc/1D4FXnDuAWxY=;
        b=H16TdUbPosnwYq0NfA9K44RWMVdp6WdeyXodMQ2qwhyxz2z8vYae1Q+ipCXnsLnb9U
         ao82y32HOkj4G+fKmUC9kT9jXWnjoWI4aCr81dox3Xl+ZePRIykcpJBxiu6N5QeShA4I
         /ONDMk+2nKG2Zy3vuBKCHq/8csBxahFmGacAYqkfp38PsrMaRWBrNy16MB87uAriy7QL
         rBuV26iU/qrgWs0URew5DMOtZaT6MRp+Kr6i8JJ69cB+5z7pKk5SrccUQXxZNuwOw6Qt
         Yvc6ZXs2PPiipygZ1I2EAEk0eLAamItEpSquS23btH5xDmyMNi7x5v4+im47Eo2PhjDC
         iKaA==
X-Gm-Message-State: AOAM532uJjXHMsEFw14W1sKSB3g2FD8TdnkGr8Mfko9ObHoK6zeIDcDN
	RUr0cw19sFMkPyn3KAeTb/7v6LFBTxA=
X-Google-Smtp-Source: 
 ABdhPJxqps+O9cHLq1CUmUs9QklrUHUAirc9qEm93+00N8BORoRRxm/SMtZeqQeE8GOui6u7HJzIyg==
X-Received: by 2002:a63:1d0d:0:b0:382:5f9c:9391 with SMTP id
 d13-20020a631d0d000000b003825f9c9391mr15200663pgd.617.1649411899381;
        Fri, 08 Apr 2022 02:58:19 -0700 (PDT)
Received: from localhost.localdomain ([103.81.93.117])
        by smtp.gmail.com with ESMTPSA id
 u9-20020a056a00158900b004faad3ae570sm26487423pfk.189.2022.04.08.02.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 02:58:18 -0700 (PDT)
From: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com,
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>,
	Nikhil R <nikhil.r@kpit.com>
Subject: [meta-python][dunfell][PATCH] python3-urllib3: Fix CVE-2020-26137 and
 CVE-2021-33503
Date: Fri,  8 Apr 2022 15:27:49 +0530
Message-Id: <20220408095749.18200-1-ranjitsinhrathod1991@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96475

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

Add patch to fix CVE-2020-26137
Link: https://ubuntu.com/security/CVE-2020-26137
Link: https://github.com/urllib3/urllib3/commit/1dd69c5c5982fae7c87a620d487c2ebf7a6b436b.patch

Add patch to fix  CVE-2021-33503
Link: https://ubuntu.com/security/CVE-2021-33503
Link: https://github.com/urllib3/urllib3/commit/2d4a3fee6de2fa45eb82169361918f759269b4ec.patch

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
---
 .../python3-urllib3/CVE-2020-26137.patch      | 72 +++++++++++++++++++
 .../python3-urllib3/CVE-2021-33503.patch      | 67 +++++++++++++++++
 .../python/python3-urllib3_1.25.7.bb          |  6 +-
 3 files changed, 143 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-26137.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-urllib3/CVE-2021-33503.patch

diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-26137.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-26137.patch
new file mode 100644
index 000000000..3cc8bcd02
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2020-26137.patch
@@ -0,0 +1,72 @@
+From 1dd69c5c5982fae7c87a620d487c2ebf7a6b436b Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <sethmichaellarson@gmail.com>
+Date: Mon, 17 Feb 2020 15:34:48 -0600
+Subject: [PATCH] Raise ValueError if method contains control characters
+ (#1800)
+
+CVE: CVE-2020-26137
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/1dd69c5c5982fae7c87a620d487c2ebf7a6b436b.patch]
+Signed-off-by: Nikhil R <nikhil.r@kpit.com>
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: Removed one hunk in CHANGES.rst and refresh other to remove
+patch fuzz warnings
+
+---
+ src/urllib3/connection.py                    | 14 ++++++++++++++
+ test/with_dummyserver/test_connectionpool.py |  6 ++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/src/urllib3/connection.py b/src/urllib3/connection.py
+index 71e6790b1b..f7b1760938 100644
+--- a/src/urllib3/connection.py
++++ b/src/urllib3/connection.py
+@@ -1,4 +1,5 @@
+ from __future__ import absolute_import
++import re
+ import datetime
+ import logging
+ import os
+@@ -58,6 +59,8 @@ port_by_scheme = {"http": 80, "https": 443}
+ # (ie test_recent_date is failing) update it to ~6 months before the current date.
+ RECENT_DATE = datetime.date(2019, 1, 1)
+ 
++_CONTAINS_CONTROL_CHAR_RE = re.compile(r"[^-!#$%&'*+.^_`|~0-9a-zA-Z]")
++
+ 
+ class DummyConnection(object):
+     """Used to detect a failed ConnectionCls import."""
+@@ -184,6 +187,17 @@ class HTTPConnection(_HTTPConnection, object):
+         conn = self._new_conn()
+         self._prepare_conn(conn)
+ 
++    def putrequest(self, method, url, *args, **kwargs):
++        """Send a request to the server"""
++        match = _CONTAINS_CONTROL_CHAR_RE.search(method)
++        if match:
++            raise ValueError(
++                "Method cannot contain non-token characters %r (found at least %r)"
++                % (method, match.group())
++            )
++
++        return _HTTPConnection.putrequest(self, method, url, *args, **kwargs)
++
+     def request_chunked(self, method, url, body=None, headers=None):
+         """
+         Alternative to the common request method, which sends the
+diff --git a/test/with_dummyserver/test_connectionpool.py b/test/with_dummyserver/test_connectionpool.py
+index 57f0dbd2f4..79cbd27185 100644
+--- a/test/with_dummyserver/test_connectionpool.py
++++ b/test/with_dummyserver/test_connectionpool.py
+@@ -677,6 +677,12 @@ class TestConnectionPool(HTTPDummyServerTestCase):
+             with pytest.raises(MaxRetryError):
+                 pool.request("GET", "/test", retries=2)
+ 
++    @pytest.mark.parametrize("char", [" ", "\r", "\n", "\x00"])
++    def test_invalid_method_not_allowed(self, char):
++        with pytest.raises(ValueError):
++            with HTTPConnectionPool(self.host, self.port) as pool:
++                pool.request("GET" + char, "/")
++
+     def test_percent_encode_invalid_target_chars(self):
+         with HTTPConnectionPool(self.host, self.port) as pool:
+             r = pool.request("GET", "/echo_params?q=\r&k=\n \n")
diff --git a/meta-python/recipes-devtools/python/python3-urllib3/CVE-2021-33503.patch b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2021-33503.patch
new file mode 100644
index 000000000..838add955
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-urllib3/CVE-2021-33503.patch
@@ -0,0 +1,67 @@
+From 2d4a3fee6de2fa45eb82169361918f759269b4ec Mon Sep 17 00:00:00 2001
+From: Seth Michael Larson <sethmichaellarson@gmail.com>
+Date: Wed, 26 May 2021 10:43:12 -0500
+Subject: [PATCH] Improve performance of sub-authority splitting in URL
+
+CVE: CVE-2021-33503
+Upstream-Status: Backport [https://github.com/urllib3/urllib3/commit/2d4a3fee6de2fa45eb82169361918f759269b4ec.patch]
+Signed-off-by: Nikhil R <nikhil.r@kpit.com>
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: Refresh hunks to remove patch fuzz warnings
+
+---
+ src/urllib3/util/url.py |  8 +++++---
+ test/test_util.py       | 10 ++++++++++
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/src/urllib3/util/url.py b/src/urllib3/util/url.py
+index 6ff238fe3c..81a03da9e3 100644
+--- a/src/urllib3/util/url.py
++++ b/src/urllib3/util/url.py
+@@ -63,12 +63,12 @@ IPV6_ADDRZ_RE = re.compile("^" + IPV6_ADDRZ_PAT + "$")
+ BRACELESS_IPV6_ADDRZ_RE = re.compile("^" + IPV6_ADDRZ_PAT[2:-2] + "$")
+ ZONE_ID_RE = re.compile("(" + ZONE_ID_PAT + r")\]$")
+ 
+-SUBAUTHORITY_PAT = (u"^(?:(.*)@)?(%s|%s|%s)(?::([0-9]{0,5}))?$") % (
++_HOST_PORT_PAT = ("^(%s|%s|%s)(?::([0-9]{0,5}))?$") % (
+     REG_NAME_PAT,
+     IPV4_PAT,
+     IPV6_ADDRZ_PAT,
+ )
+-SUBAUTHORITY_RE = re.compile(SUBAUTHORITY_PAT, re.UNICODE | re.DOTALL)
++_HOST_PORT_RE = re.compile(_HOST_PORT_PAT, re.UNICODE | re.DOTALL)
+ 
+ UNRESERVED_CHARS = set(
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789._-~"
+@@ -368,7 +368,9 @@ def parse_url(url):
+             scheme = scheme.lower()
+ 
+         if authority:
+-            auth, host, port = SUBAUTHORITY_RE.match(authority).groups()
++            auth, _, host_port = authority.rpartition("@")
++            auth = auth or None
++            host, port = _HOST_PORT_RE.match(host_port).groups()
+             if auth and normalize_uri:
+                 auth = _encode_invalid_chars(auth, USERINFO_CHARS)
+             if port == "":
+diff --git a/test/test_util.py b/test/test_util.py
+index a5b68a084b..88409e2d6c 100644
+--- a/test/test_util.py
++++ b/test/test_util.py
+@@ -425,6 +425,16 @@ class TestUtil(object):
+                 query="%0D%0ASET%20test%20failure12%0D%0A:8080/test/?test=a",
+             ),
+         ),
++        # Tons of '@' causing backtracking
++        ("https://" + ("@" * 10000) + "[", False),
++        (
++            "https://user:" + ("@" * 10000) + "example.com",
++            Url(
++                scheme="https",
++                auth="user:" + ("%40" * 9999),
++                host="example.com",
++            ),
++        ),
+     ]
+ 
+     @pytest.mark.parametrize("url, expected_url", url_vulnerabilities)
diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
index 8d987a1f3..73399d943 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.25.7.bb
@@ -8,8 +8,10 @@ SRC_URI[sha256sum] = "f3c5fd51747d450d4dcf6f923c81f78f811aab8205fda64b0aba34a4e4
 
 inherit pypi setuptools3
 
-SRC_URI += "file://CVE-2020-7212.patch"
-
+SRC_URI += "file://CVE-2020-7212.patch \
+            file://CVE-2020-26137.patch \
+            file://CVE-2021-33503.patch \
+           "
 RDEPENDS_${PN} += "\
     ${PYTHON_PN}-certifi \
     ${PYTHON_PN}-cryptography \
-- 
2.17.1


