Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0286EC10F13
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:52:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.57807.1702626773389067340
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iEpUXBNl;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c2db2ee28so4738605e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626772; x=1703231572; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGeZ5fcEoDZpG726+zmJXFzbmOs51hYXH+8YXmcfxDA=;
        b=iEpUXBNlQS9FIcQPLglsZHzBXFxSns1DYpfrIuqIOtZXYDAbkMYb89HHo0VFi2fN6v
         pb5/Yvmfwc7yE7cgHH0Yk3C5/l9U3fdeRC4D1i1ahgEnfVNSbw+qq5HLz3Hey02Cf8Sw
         64rpl4QwTukLHuj7hST5o3nqQ69439tR8O06hwOmmSilXyBBl2IvUt3TC7DgaXfL2uXA
         wR4MCvuY0AGcV31adbrI3r11ppc4KqI+DnVpK78wP6cQQ+LpRtjONpSUqyT7utQj8yMh
         4Ei8JaAo44ZKWHLq6+LZn1YAXGL5MQtuYByhIt14jEYtcERW0j5U0WFOrsfrJJt1F7Nh
         vXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626772; x=1703231572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGeZ5fcEoDZpG726+zmJXFzbmOs51hYXH+8YXmcfxDA=;
        b=husct6Tn17rQv98RxuJjW24q6EdtKkHUXKXs+2wv9FBD8AY/rZ+6f6UyZocAS/cBac
         r9ICFXiFAhYG4wgLaN0/FPaZ87djHQJVHM4wBY5TmRZ/STggnt5r9Q4ZwvO71vF5C14m
         N94YjZZD7fOLDacPdifRDfcJULJ3tourn9qMe+2SzxBMi221uBCNsgGhUtvKdNMk51Zj
         oGzsO3ZkDi5/rLWbYNOPw61i8dLcoK79IfbSoNA04RO4Fe8r7Ikq59QMcVS6JyvZ3hu+
         PYcwqOTPajwK1LBEHLUVs4GftWBC204TKzG2fJu/+Af87vbT4TObbW/W7+LNwfw3FXmH
         Pipw==
X-Gm-Message-State: AOJu0YzNHpXgxPL2K3eryNfKFe0HSL2/aBHV6zBtjHWwjK911ud1/GhI
	ah7actqiyCbUZBEh3BiID1X+QTlZ6mc=
X-Google-Smtp-Source: AGHT+IE4Joz41zoiqmfDNINg7n02d3mRzFMj0LVEHyhDPhdknTmq981sQ0MJbfHeXciigqXOIGfcyA==
X-Received: by 2002:a7b:c40f:0:b0:40b:5e59:ccd3 with SMTP id k15-20020a7bc40f000000b0040b5e59ccd3mr5900869wmi.180.1702626771705;
        Thu, 14 Dec 2023 23:52:51 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/20] python3-eventlet: backport a patch to remove distutils dependency
Date: Fri, 15 Dec 2023 08:52:30 +0100
Message-Id: <20231215075239.3049865-11-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107504

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...o-host-0-is-not-supported-on-OpenInd.patch | 78 +++++++++++++++++++
 .../python/python3-eventlet_0.33.3.bb         |  2 +-
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch

diff --git a/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch b/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch
new file mode 100644
index 000000000..61a37d94e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-eventlet/0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch
@@ -0,0 +1,78 @@
+From ac2f960a50710bb257e87bed4e3c95a746f2a0fe Mon Sep 17 00:00:00 2001
+From: Sergey Shepelev <temotor@gmail.com>
+Date: Mon, 27 Mar 2023 22:07:15 +0300
+Subject: [PATCH] tests: getaddrinfo(host, 0) is not supported on OpenIndiana
+ platform
+
+https://github.com/eventlet/eventlet/issues/791
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/greendns_test.py | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/tests/greendns_test.py b/tests/greendns_test.py
+index feab2b6..3802f44 100644
+--- a/tests/greendns_test.py
++++ b/tests/greendns_test.py
+@@ -613,14 +613,14 @@ class TestGetaddrinfo(tests.LimitedTestCase):
+     def test_getaddrinfo_only_a_ans(self):
+         greendns.resolve = _make_mock_resolve()
+         greendns.resolve.add('example.com', '1.2.3.4')
+-        res = greendns.getaddrinfo('example.com', 0)
++        res = greendns.getaddrinfo('example.com', None)
+         addr = [('1.2.3.4', 0)] * len(res)
+         assert addr == [ai[-1] for ai in res]
+ 
+     def test_getaddrinfo_only_aaaa_ans(self):
+         greendns.resolve = _make_mock_resolve()
+         greendns.resolve.add('example.com', 'dead:beef::1')
+-        res = greendns.getaddrinfo('example.com', 0)
++        res = greendns.getaddrinfo('example.com', None)
+         addr = [('dead:beef::1', 0, 0, 0)] * len(res)
+         assert addr == [ai[-1] for ai in res]
+ 
+@@ -637,7 +637,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
+         res.raises = greendns.dns.exception.Timeout
+         greendns.resolver._resolver = res()
+ 
+-        result = greendns.getaddrinfo('example.com', 0, 0)
++        result = greendns.getaddrinfo('example.com', None, 0)
+         addr = [('1.2.3.4', 0)] * len(result)
+         assert addr == [ai[-1] for ai in result]
+ 
+@@ -654,7 +654,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
+         res.raises = greendns.dns.exception.DNSException
+         greendns.resolver._resolver = res()
+ 
+-        result = greendns.getaddrinfo('example.com', 0, 0)
++        result = greendns.getaddrinfo('example.com', None, 0)
+         addr = [('1.2.3.4', 0)] * len(result)
+         assert addr == [ai[-1] for ai in result]
+ 
+@@ -667,7 +667,7 @@ class TestGetaddrinfo(tests.LimitedTestCase):
+         greendns.resolver._resolver = res()
+ 
+         with tests.assert_raises(socket.gaierror):
+-            greendns.getaddrinfo('example.com', 0, 0)
++            greendns.getaddrinfo('example.com', None, 0)
+ 
+     def test_getaddrinfo_hosts_only_dns_error(self):
+         hostsres = _make_mock_base_resolver()
+@@ -678,13 +678,13 @@ class TestGetaddrinfo(tests.LimitedTestCase):
+         greendns.resolver._resolver = res()
+ 
+         with tests.assert_raises(socket.gaierror):
+-            greendns.getaddrinfo('example.com', 0, 0)
++            greendns.getaddrinfo('example.com', None, 0)
+ 
+     def test_canonname(self):
+         greendns.resolve = _make_mock_resolve()
+         greendns.resolve.add('host.example.com', '1.2.3.4')
+         greendns.resolve_cname = self._make_mock_resolve_cname()
+-        res = greendns.getaddrinfo('host.example.com', 0,
++        res = greendns.getaddrinfo('host.example.com', None,
+                                    0, 0, 0, socket.AI_CANONNAME)
+         assert res[0][3] == 'cname.example.com'
+ 
diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
index c1256661b..fe4d4f020 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
@@ -4,6 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
+SRC_URI += "file://0001-tests-getaddrinfo-host-0-is-not-supported-on-OpenInd.patch"
 SRC_URI[sha256sum] = "722803e7eadff295347539da363d68ae155b8b26ae6a634474d0a920be73cfda"
 
 inherit pypi setuptools3
@@ -11,6 +12,5 @@ inherit pypi setuptools3
 RDEPENDS:${PN} += " \
 	${PYTHON_PN}-dnspython \
 	${PYTHON_PN}-six \
-	${PYTHON_PN}-distutils \
 	${PYTHON_PN}-greenlet \
 "
-- 
2.39.2


