Return-Path: <derek@asterius.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9B0C35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 15:45:00 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.54218.1703173493475568081
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Dec 2023 07:44:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: straka.derek@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7b71d65021dso22442639f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 07:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173492; x=1703778292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wpg7URWARhwJIEDHgYNG2gIxtBQFyoO5udBqTXC6JAA=;
        b=kwEFtw+gX6ub6i6so/9K4ichID7RItb3FaUETM6lQxKNp7QO29/rHWwqfLu6x9VpIQ
         PPS+B6St3UDYAwTLJ/uMLSokVIBfNfeo+O31R6SaXfEC0wkBxVRE0hE99GJAqkdNU6Zn
         Eqy6M9JQ6u+0RmToKsNXsEjWu1J1gu4njpbOOwtuc4USSm+7OUSqfSktRLyDxMnn7yIH
         3OMO9pGH6yKoqKMXZB2GWxxlk2QEBKBn7udJnE/JTSUs5XZ31xELUo0OnJumdlcDv3od
         f3/EpK6xpBOu6I4/ds4Lk+vuFvUMfhPS68asHOfakxl8LsvYGX46gxKkkzr8wz3sl+rd
         RNTQ==
X-Gm-Message-State: AOJu0Yw+twgOOPvrA+7jnkt7GS9j22GDZ5biYeKqxkKEMzhAxWFE9+uR
	2K8OXuin0q1TSGg8AAaV0HJHaKhG5+uKKA==
X-Google-Smtp-Source: AGHT+IH3UYfinXJBFK04VK+isyfHolFnentpKZHjIykAMRg1lGnhMHOPuBdoORQhCCcgPgyo6N6Log==
X-Received: by 2002:a05:6602:2433:b0:7b7:ea95:3d8e with SMTP id g19-20020a056602243300b007b7ea953d8emr766134iob.19.1703173491711;
        Thu, 21 Dec 2023 07:44:51 -0800 (PST)
Received: from sparta.internal.asterius.io (c-73-228-213-122.hsd1.mn.comcast.net. [73.228.213.122])
        by smtp.gmail.com with ESMTPSA id k28-20020a02ccdc000000b00469328386c8sm530578jaq.162.2023.12.21.07.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 07:44:50 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 4/5] python3-eventlet: update to version 0.34.1
Date: Thu, 21 Dec 2023 15:44:34 +0000
Message-Id: <20231221154435.3874910-4-derek@asterius.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231221154435.3874910-1-derek@asterius.io>
References: <20231221154435.3874910-1-derek@asterius.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Dec 2023 15:45:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107718

Remove patch incorporated in the upstream release

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...o-host-0-is-not-supported-on-OpenInd.patch | 78 -------------------
 ...t_0.33.3.bb => python3-eventlet_0.34.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 80 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.33.3.bb => python3-eventlet_0.34.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch b/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch
deleted file mode 100644
index 61a37d94e..000000000
--- a/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From ac2f960a50710bb257e87bed4e3c95a746f2a0fe Mon Sep 17 00:00:00 2001
-From: Sergey Shepelev <temotor@gmail.com>
-Date: Mon, 27 Mar 2023 22:07:15 +0300
-Subject: [PATCH] tests: getaddrinfo(host, 0) is not supported on OpenIndiana
- platform
-
-https://github.com/eventlet/eventlet/issues/791
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- tests/greendns_test.py | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/tests/greendns_test.py b/tests/greendns_test.py
-index feab2b6..3802f44 100644
---- a/tests/greendns_test.py
-+++ b/tests/greendns_test.py
-@@ -613,14 +613,14 @@ class TestGetaddrinfo(tests.LimitedTestCase):
-     def test_getaddrinfo_only_a_ans(self):
-         greendns.resolve = _make_mock_resolve()
-         greendns.resolve.add('example.com', '1.2.3.4')
--        res = greendns.getaddrinfo('example.com', 0)
-+        res = greendns.getaddrinfo('example.com', None)
-         addr = [('1.2.3.4', 0)] * len(res)
-         assert addr == [ai[-1] for ai in res]
- 
-     def test_getaddrinfo_only_aaaa_ans(self):
-         greendns.resolve = _make_mock_resolve()
-         greendns.resolve.add('example.com', 'dead:beef::1')
--        res = greendns.getaddrinfo('example.com', 0)
-+        res = greendns.getaddrinfo('example.com', None)
-         addr = [('dead:beef::1', 0, 0, 0)] * len(res)
-         assert addr == [ai[-1] for ai in res]
- 
-@@ -637,7 +637,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
-         res.raises = greendns.dns.exception.Timeout
-         greendns.resolver._resolver = res()
- 
--        result = greendns.getaddrinfo('example.com', 0, 0)
-+        result = greendns.getaddrinfo('example.com', None, 0)
-         addr = [('1.2.3.4', 0)] * len(result)
-         assert addr == [ai[-1] for ai in result]
- 
-@@ -654,7 +654,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
-         res.raises = greendns.dns.exception.DNSException
-         greendns.resolver._resolver = res()
- 
--        result = greendns.getaddrinfo('example.com', 0, 0)
-+        result = greendns.getaddrinfo('example.com', None, 0)
-         addr = [('1.2.3.4', 0)] * len(result)
-         assert addr == [ai[-1] for ai in result]
- 
-@@ -667,7 +667,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
-         greendns.resolver._resolver = res()
- 
-         with tests.assert_raises(socket.gaierror):
--            greendns.getaddrinfo('example.com', 0, 0)
-+            greendns.getaddrinfo('example.com', None, 0)
- 
-     def test_getaddrinfo_hosts_only_dns_error(self):
-         hostsres = _make_mock_base_resolver()
-@@ -678,13 +678,13 @@ class TestGetaddrinfo(tests.LimitedTestCase):
-         greendns.resolver._resolver = res()
- 
-         with tests.assert_raises(socket.gaierror):
--            greendns.getaddrinfo('example.com', 0, 0)
-+            greendns.getaddrinfo('example.com', None, 0)
- 
-     def test_canonname(self):
-         greendns.resolve = _make_mock_resolve()
-         greendns.resolve.add('host.example.com', '1.2.3.4')
-         greendns.resolve_cname = self._make_mock_resolve_cname()
--        res = greendns.getaddrinfo('host.example.com', 0,
-+        res = greendns.getaddrinfo('host.example.com', None,
-                                    0, 0, 0, socket.AI_CANONNAME)
-         assert res[0][3] == 'cname.example.com'
- 
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.34.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.34.1.bb
index fe4d4f020..cd6d2b25e 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.34.1.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI += "file://0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch"
-SRC_URI[sha256sum] = "722803e7eadff295347539da363d68ae155b8b26ae6a634474d0a920be73cfda"
+SRC_URI[sha256sum] = "0087763f3ae18a571a5cc60fdd06ceb02fdb9f006693e9ee1e8e8044ae3b470b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


