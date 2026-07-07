Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7DBC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 12:42:35 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.173509.1783428150551789390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 05:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NCd0arVR;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69a5ecbbfb2so2864668a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 05:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783428149; x=1784032949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7nAz0HqhvWMWar2RZv2JYR6/F1gR30WivZbwDtWmQA=;
        b=NCd0arVRT4BzTXA99L7Eqsg436OQj631A9V/4N50gobRfanIHPIbXClpepHn0Ro/lh
         UzU1HRz06ZkvRnXhEeoYDPo/X0hiBoNVVqPT3xFQouny8o/E3Y55YcNRNDUDE1nGUq21
         VKKrR/tjIvHS3KczdIMln5XB282U1h15g4RlxP3eH9/aJtwIs1eecTNBQlproiZIOiTN
         OHA28XStDcTBglJNKUFcPPQYaZvRG45Bk66BWQo9qZrmsNIP+A350AxWpWh+j3YsTZzJ
         V+wjSKEfg1sTYN+k7BDZwYwSA4ONNSL6X83YwpU7Z4mpls+p15XfSKGCUBBXlMBuE4m6
         mCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783428149; x=1784032949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7nAz0HqhvWMWar2RZv2JYR6/F1gR30WivZbwDtWmQA=;
        b=q3tz6s35bS9ERrsigolkxb+UA+bClRoyJSQnz3ZPMfxW7PY0BGlRiAsZPJ/sqSqQBW
         VpXH8kEKvZbBf/Q5ZyNNaQbZN4ttiGJKRUhqbX4GbYSnfoJ1/vxc9pxmftOgsLs10RA4
         ATcRaYJuPaMcCyWOAZRXIIBOiKb5OQAoZzNGFLCFBvLw9wGnOJw3jgBFMD10NPGPubPC
         CvRyOSrb8a3N5a6qGeqTMNhxDQVmgzQMJEEi+yM/mx8kGjp9Ph4/QHuu2qOvYFM6f7Oa
         x89QeNCNXeiOXZcJzr/X2km4I8BMIABQvh3jNJEdqj/SfByXDRMqp+WpqjuxJs81gtHA
         02tQ==
X-Gm-Message-State: AOJu0YwQ14gA7idyVK6Zvm++/boDKCmd4lxoJ4DGhNmahPYp342+1Mki
	UDZ922rEicgQaYH6IL5g9SoLetzpitR0MjvMCP5TbEPxQ2rwQhPhRlDQ34d5rA==
X-Gm-Gg: AfdE7cnc4xNEyN2BTQGumGlD1bsCX6n4J1VGtcPil/IPjHQ5hQHBPwLsCkWDkfCsRGn
	wPZvrO/HWKJXA1O3WqV8BtrWcULrPhliuOUV/wE1hL0v3mpcwUScjwu8DJFb1PyRKsFy41lmq7J
	RmDldGSsRrRNPFfupfQfSj6a3gIlSwLhQKPcFu5iYfNAt0A5ByJaYt/Ilj//OKjcs1i+KKYrZZ3
	y76E/fky3YQs9p9wK7jWH3JSWP2Z5DAQ7SVMdXyH93vYjKLFnQqmmC8jmP8a8w06ymTnul2V9w/
	qvrtdQaw15uuHxju3747Fl7ZO/h97UrSeV18zF7H8BRzw4DsqxjJGKDP9+Uy9Dpng+RFT0qcPG4
	uxnllEpUM8IhCwWsjJDDs7y1AOZfooh4KVn2Pi7SnZ7I/rIkc8xWVisOvF2PtNChpCo155/Mg8H
	WplwRKDBlkSjGcBkMUOIpxsf+isNsqwWXqJxynJR00k3u87nxakf3g7ocdQWvoQPj4jPpORJAi
X-Received: by 2002:a05:6402:4506:b0:698:3b7c:3b37 with SMTP id 4fb4d7f45d1cf-69a85c32acemr2918833a12.35.1783428148511;
        Tue, 07 Jul 2026 05:42:28 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daa799sm5589217a12.23.2026.07.07.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 05:42:27 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-python][PATCH] python3-pyroute2: Add sqlite3 to RDEPENDS
Date: Tue,  7 Jul 2026 13:41:41 +0100
Message-ID: <20260707124141.495612-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 12:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128060

python3-sqlite is required by the NDB code, irrespective of ptest:

  File "/usr/lib/python3.14/site-packages/pyroute2/__init__.py", line 31, in <module>
  File "/usr/lib/python3.14/site-packages/pyroute2/ipdb/__init__.py", line 16, in <module>
  File "/usr/lib/python3.14/site-packages/pyroute2/ndb/main.py", line 317, in <module>
  File "/usr/lib/python3.14/site-packages/pyroute2/ndb/task_manager.py", line 9, in <module>
  File "/usr/lib/python3.14/site-packages/pyroute2/ndb/schema.py", line 99, in <module>
ModuleNotFoundError: No module named 'sqlite3'

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
index 834546b9db03..5f5b33704e4e 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.9.6.bb
@@ -10,15 +10,16 @@ inherit python_setuptools_build_meta pypi ptest-python-pytest
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
+    python3-fcntl \
     python3-io \
     python3-json \
-    python3-fcntl \
     python3-logging \
     python3-multiprocessing \
     python3-pickle \
     python3-pkgutil \
     python3-pprint \
     python3-shell \
+    python3-sqlite3 \
     python3-unittest \
     python3-unixadmin \
 "
@@ -27,7 +28,6 @@ RDEPENDS:${PN}-ptest += " \
     python3-fcntl \
     python3-html \
     python3-netclient \
-    python3-sqlite3 \
 "
 
 do_install_ptest:append () {

