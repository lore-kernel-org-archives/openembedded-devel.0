Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86A0D29DDB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:35:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53379.1768286150622724665
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bz3hTAry;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47755de027eso41104815e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 22:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768286149; x=1768890949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4hffrS6vYRFJMjiwY9lHkR3EsEmk5fNt9dFY4HI+MXE=;
        b=Bz3hTAry0tYFx3CdTLBOBUNypOH1Wh1C1stKY9nixmvDAx3ctbjY3ClXlamZ3/LhBo
         lwegF1g4ESYUJcaoh6sh06DhbzzJAue9Hqbp8TV058imKDt8OsfJxYuHTxRm/1QCSsUb
         CwU1+3Ba8YtEdpCmr9DVb0QBU7qPyggOavx448tlSKtyyVxbdwWLQfVuRZAnX6Fqw3lZ
         31kvx6ErqdD7ODzHj1350kjQMEQTakaKk7VWVmSp9VpNJYBmbic3nOKSfwSaAXqXpgRX
         prAMgeqgD+Asop2vGUGZLDo/9Mn3zZdseOfA3Psv5UNrsXe+hK0BdRQi6MYzAh8rT5JC
         pnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286149; x=1768890949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4hffrS6vYRFJMjiwY9lHkR3EsEmk5fNt9dFY4HI+MXE=;
        b=c8uT7sRpAO5m8Ex84fZfOAaDtQRxKmtdaZKjxDKwh8OaoYPAfvqS6k12/67q9IaEgv
         A+HavBpqVso70k/9N8BCVdIo0mPnkwHVEk4txkNit64ZgVCMKeZlai1mv+lmtC/RBtLo
         BP+cdAUXDn02EHgFHdSVUx0sryBmizde1MVJ1RLHOld80qWg3oVIwglopccL9T2BGxld
         nAydrsGct8DT4qiCC6VR2NTOJ/e83udR7S3YPzx+m81I5y9HOOStHBKwndUEwUyLXbhj
         GInNL3UuWziC9Gr9jxEakTuQgOlncuYQo1rKVE7g6bpTdNhlFMz53BSGR4fmhYwNuzxS
         s4zg==
X-Gm-Message-State: AOJu0YzTdQ/IoNreEzcyJ3qjNjWkJ7Z87fUSJmFUJC2uTvzp0QV1Ib0c
	TxSwTcvIO5XdcZQ4nv8KF5uUffCdOaHiSw7cM3BRK7/QjAuyGIj+CXpC7ihMOw==
X-Gm-Gg: AY/fxX7YTx8korRa0K5WqtPS+HdquRz0HXkB61Pvmlhv6uAJHSmu8AMag3K8wq1skeS
	dkUWXVHDVsTDFWnsBSMXFcE5RFXdKlfYzAdSoHGi1QypYrDlCTbrrx+Qmg2X1ArY88gbrTfbinR
	HikFlR2NlKujYaVkW9dpjJWkoSXxhRUI+Szmet5WlIT4dh8lU2EZB1kIhffuxhqqkl6ID3yrEcZ
	uZl5NqUz/7+sYz+rhpwqqs9rKQR8NO7tnY06s6V3gDXpQsndY893EDMYAXdgHnlgcQlglmaI6vq
	0SS02MqzEmEAL22aMJuXzNDOYRQp+LLOSgfBZKWLbt6t9EXps6l0xScWs1x/WXBygfJSRsujGLM
	yrSD++5LsTdPDmgebU6OJATSjUSdTHl9iXe5qYQavbEysZpcFXdkViDuaUwoTNCqYJsaC6FaQXR
	POF0QQrKlB
X-Google-Smtp-Source: AGHT+IF0yIuf4SbNRyez/c87E39cxuAkRnd4ZT514CEPtr1PhogpF0EKXAPKnfhOBa52itnM6+Vdcg==
X-Received: by 2002:a05:600c:a102:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47d84b32793mr205006755e9.23.1768286148881;
        Mon, 12 Jan 2026 22:35:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm42273385f8f.30.2026.01.12.22.35.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:35:48 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 4/5] python3-ldap: patch CVE-2025-61912
Date: Tue, 13 Jan 2026 07:35:45 +0100
Message-ID: <20260113063546.1497839-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113063546.1497839-1-skandigraun@gmail.com>
References: <20260113063546.1497839-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123399

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61912

Pick the patch that's mentioned by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-ldap/CVE-2025-61912.patch  | 42 +++++++++++++++++++
 .../python/python3-ldap_3.4.0.bb              |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch

diff --git a/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch
new file mode 100644
index 0000000000..1e3940e662
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61912.patch
@@ -0,0 +1,42 @@
+From b80ba3e3b41859bfc79830b726e95e457502ca00 Mon Sep 17 00:00:00 2001
+From: Simon Pichugin <simon.pichugin@gmail.com>
+Date: Fri, 10 Oct 2025 10:46:45 -0700
+Subject: [PATCH] Merge commit from fork
+
+Update tests to expect \00 and verify RFC-compliant escaping
+
+CVE: CVE-2025-61912
+Upstream-Status: Backport [https://github.com/python-ldap/python-ldap/commit/6ea80326a34ee6093219628d7690bced50c49a3f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Lib/ldap/dn.py     | 3 ++-
+ Tests/t_ldap_dn.py | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/ldap/dn.py b/Lib/ldap/dn.py
+index a9d9684..8d40673 100644
+--- a/Lib/ldap/dn.py
++++ b/Lib/ldap/dn.py
+@@ -26,7 +26,8 @@ def escape_dn_chars(s):
+     s = s.replace('>' ,'\\>')
+     s = s.replace(';' ,'\\;')
+     s = s.replace('=' ,'\\=')
+-    s = s.replace('\000' ,'\\\000')
++    # RFC 4514 requires NULL (U+0000) to be escaped as hex pair "\00"
++    s = s.replace('\x00' ,'\\00')
+     if s[-1]==' ':
+       s = ''.join((s[:-1],'\\ '))
+     if s[0]=='#' or s[0]==' ':
+diff --git a/Tests/t_ldap_dn.py b/Tests/t_ldap_dn.py
+index 86d3640..7c04777 100644
+--- a/Tests/t_ldap_dn.py
++++ b/Tests/t_ldap_dn.py
+@@ -49,7 +49,7 @@ class TestDN(unittest.TestCase):
+         self.assertEqual(ldap.dn.escape_dn_chars(' '), '\\ ')
+         self.assertEqual(ldap.dn.escape_dn_chars('  '), '\\ \\ ')
+         self.assertEqual(ldap.dn.escape_dn_chars('foobar '), 'foobar\\ ')
+-        self.assertEqual(ldap.dn.escape_dn_chars('f+o>o,b<a;r="\00"'), 'f\\+o\\>o\\,b\\<a\\;r\\=\\"\\\x00\\"')
++        self.assertEqual(ldap.dn.escape_dn_chars('f+o>o,b<a;r="\00"'), r'f\+o\>o\,b\<a\;r\=\"\00\"')
+         self.assertEqual(ldap.dn.escape_dn_chars('foo\\,bar'), 'foo\\\\\\,bar')
+ 
+     def test_str2dn(self):
diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
index 59ced40021..b2361608aa 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
@@ -13,7 +13,8 @@ PYPI_PACKAGE = "python-ldap"
 
 inherit pypi setuptools3
 
-SRC_URI += "file://CVE-2025-61911.patch"
+SRC_URI += "file://CVE-2025-61911.patch \
+            file://CVE-2025-61912.patch"
 SRC_URI[sha256sum] = "60464c8fc25e71e0fd40449a24eae482dcd0fb7fcf823e7de627a6525b3e0d12"
 
 do_configure:prepend() {

