Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E94D29DD8
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 06:35:59 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53378.1768286149933901393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jan 2026 22:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YsTfFDfq;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d256c2a9so3586328f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 22:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768286148; x=1768890948; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQLsxpVSgzIjzaVJ4xSb/5h5HjbmI6AZlAT8CZEUWwg=;
        b=YsTfFDfqRR0Sbz7A9C1Lwnt1WQ8DM2i+TMMGiIQe1gIjR8SyKyScf318eHGsEra8B4
         cEfSSfiNRuH9GUoRvy9jvspIfdAjsidsInqqQ0hEZQwJ4kfkmlG8a3Iro6Hgeow1kRQf
         OjBlICArU91E45rdTiJPt5nP7uyKQVKyjEGw4wyFxj8foB9hqeH9dV4yZiJzkwkjFh1F
         j+WOdN9r9YYpyzwPiMzZvv2jAuGBduJl6uX7aK2rPweAPUxJNfsJZ48R3d1Ho0ijWzq7
         dl9Rdz4IItcv0ipFjc4XEBq9l7XRNTvnUU3c8ozskS5Z9qE9xH7Gw0qU5o0zQg4nEzLW
         7/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768286148; x=1768890948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oQLsxpVSgzIjzaVJ4xSb/5h5HjbmI6AZlAT8CZEUWwg=;
        b=o/Pe6c+S+s/gyAICvUY9ntObDhjnDYRe/sJh85Xcd2FSVcJpta+CQuUD/peEFj1ZlZ
         IfcNcBSX+Do9o8Wwono+DugK/ebGDAGCHZJL/R/nhEgdFUA1IAa/WAW/qth1wDA0b27Y
         6/FdebSJrlEL2//ZbdyrRFOkyUpWvMIm7BesJ9/+VcdT0l+4/zda8lG4yhfPsGmAD8UN
         0OvnQcnylGWKKEvDUndYt8lgYyBESbuW56asX0mvK6TJdk+Fz/517ZRJH4ALb6bZ0x+h
         4v13xGdPXmS3boZyA7H+7Qtn7IpMOlms63TOf6RWPN9YjeyFwxFWJ4kcBQg7Zd4ZdhQx
         dvxA==
X-Gm-Message-State: AOJu0Yzt05a73QThc+H2iiMand0yAtx8fXLN+RobNoTHmum24TY4Wsq9
	O/UvEKVrrTpHpz9SVTqOyPY4xEO72I94+Suoi9KOnhAqYaMMOttRYLgtKa60hQ==
X-Gm-Gg: AY/fxX6vuAtNU+2pwzezIwpxyApW+V0NH0c7DlOMHuE6N3r3Ax4tAVQBUUWU1/vUFw5
	6/nOGZahO1wNxKIb3miwsmQEjYG6hC9ZWurwYsm8yEQ7ECDUC79h8s6cIkGUlhBY3Urgy/gD3KZ
	oHEgrpkK22jN4+tD9CdhwUfHZVGm/ol+l0q2WTeJo+I/3Z5tN6AFmYJI9jp0q6bKbmsF9RQyTDa
	U9xneYgpjTJVzlKX56qLiQ5na5iMOzlSMRWUaMeaVfi1M474HDBjfZi/BSErkAmnOF9rYhmySEc
	pVCkS5iUWe2492N1LUVJbKj9bzpZAPHoceE3mOaYUv1WIc+o2FWsVxDghoz5tBN34XbpP8pWivv
	gpSkdF3UMqvHbWslRyT4d5MmpXoMQzQcgiV/jS/PTB1GwHzH9veM7rQDV93LLrUeYSBRzs522c8
	1nsAfEZ54F
X-Google-Smtp-Source: AGHT+IH9RsXlW05ViRwcUt4frfx0jGIFAUSxDsqPZCC6u3l3giqlJFFyjJYGNUxJpiecY1F9CWObjQ==
X-Received: by 2002:a05:6000:26c2:b0:430:fdfc:7dd0 with SMTP id ffacd0b85a97d-432c37a36e7mr24641120f8f.63.1768286148175;
        Mon, 12 Jan 2026 22:35:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5edb7esm42273385f8f.30.2026.01.12.22.35.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 22:35:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 3/5] python3-ldap: patch CVE-2025-61911
Date: Tue, 13 Jan 2026 07:35:44 +0100
Message-ID: <20260113063546.1497839-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113063546.1497839-1-skandigraun@gmail.com>
References: <20260113063546.1497839-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 06:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123398

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-61911

Pick the patch referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-ldap/CVE-2025-61911.patch  | 41 +++++++++++++++++++
 .../python/python3-ldap_3.4.0.bb              |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch

diff --git a/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch
new file mode 100644
index 0000000000..39426268ac
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-ldap/CVE-2025-61911.patch
@@ -0,0 +1,41 @@
+From ecbd037205723884036b4a467c19d7904b8b6cee Mon Sep 17 00:00:00 2001
+From: lukas-eu <62448426+lukas-eu@users.noreply.github.com>
+Date: Fri, 10 Oct 2025 19:47:46 +0200
+Subject: [PATCH] Merge commit from fork
+
+CVE: CVE-2025-61911
+Upstream-Status: Backport [https://github.com/python-ldap/python-ldap/commit/3957526fb1852e84b90f423d9fef34c7af25b85a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ Lib/ldap/filter.py     | 2 ++
+ Tests/t_ldap_filter.py | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/Lib/ldap/filter.py b/Lib/ldap/filter.py
+index 782737a..5bd41b2 100644
+--- a/Lib/ldap/filter.py
++++ b/Lib/ldap/filter.py
+@@ -24,6 +24,8 @@ def escape_filter_chars(assertion_value,escape_mode=0):
+       If 1 all NON-ASCII chars are escaped.
+       If 2 all chars are escaped.
+   """
++  if not isinstance(assertion_value, str):
++    raise TypeError("assertion_value must be of type str.")
+   if escape_mode:
+     r = []
+     if escape_mode==1:
+diff --git a/Tests/t_ldap_filter.py b/Tests/t_ldap_filter.py
+index 313b373..5431205 100644
+--- a/Tests/t_ldap_filter.py
++++ b/Tests/t_ldap_filter.py
+@@ -49,6 +49,10 @@ class TestDN(unittest.TestCase):
+             ),
+             r'\c3\a4\c3\b6\c3\bc\c3\84\c3\96\c3\9c\c3\9f'
+         )
++        with self.assertRaises(TypeError):
++            escape_filter_chars(["abc@*()/xyz"], escape_mode=1)
++        with self.assertRaises(TypeError):
++            escape_filter_chars({"abc@*()/xyz": 1}, escape_mode=1)
+ 
+     def test_escape_filter_chars_mode2(self):
+         """
diff --git a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
index 4299058315..59ced40021 100644
--- a/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-ldap_3.4.0.bb
@@ -13,6 +13,7 @@ PYPI_PACKAGE = "python-ldap"
 
 inherit pypi setuptools3
 
+SRC_URI += "file://CVE-2025-61911.patch"
 SRC_URI[sha256sum] = "60464c8fc25e71e0fd40449a24eae482dcd0fb7fcf823e7de627a6525b3e0d12"
 
 do_configure:prepend() {

