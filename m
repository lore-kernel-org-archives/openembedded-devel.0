Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DA9CCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 11:05:00 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.7417.1761303892433042091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 04:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mFD8yAnj;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so15620075e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 04:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761303891; x=1761908691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9cVulQX4r+DlDOqyOzzH6KyfttP7m7FO0X7+jjOJXg=;
        b=mFD8yAnjgiCZxP3D+BcT3lq1SsGTJqdBd7TQjFz0jhUaXkL7ymD+hUdONzfl/+MCQt
         pkn0dO8Q3NF+sXcbUPk8j1wmquhNhZ0K707awJQRpom21tyOhvqK/WxJTfjGdfhfcOYI
         tp+Oc9ZOXTP65cbP2zSP5d6AsPKKAt0RuL5TpdDkVi1PZyXRLmEgSjQ58c+GnnUiZtt9
         jnF/l8656qNPUJ+w9X7ys/kf8gADcMTfA5zShlTNLSbDOvmwBxCCA2S3az8mXsQcZWJY
         WQMXjEPv2UBzPnkYvmSYDskmXIdnexh31wF4xeBwdeiP8p2fs64rGi81kV/dGMXk+Ixz
         TBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761303891; x=1761908691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9cVulQX4r+DlDOqyOzzH6KyfttP7m7FO0X7+jjOJXg=;
        b=lFcA8YpXlQvbF2CkcICqQ346WVszFTp1CZHi32lTPyAQXZcbHXLonXIW2KZzaIL/MR
         TEwxb/OA7cwIjnVTEAPk0H7dceFqF5sVVALAVbvceG6r52ALDJ0/Y7GBiQdxrdUCyB9M
         GPPj0ERg5jk5ol7gwcmfbWDSUlCV0Y8RlToInPyJCimF3mhqMPEoWd4TqsfxozunV/7x
         tOQ0J5uHby+9gx2kHZS1Pr4CJG2sEujSZoUvfJn1PHNoY0jCLDfh77z1oDpsiqRQA4gZ
         KwlWXvoQqnfB/uhPEWfr4D+Q01sIHYaXpQG9P4+eF5q3XH8PBJndbY1M0tuoVBCCkitO
         cAjg==
X-Gm-Message-State: AOJu0Yyz0JPdykcTt/jFjzpcIKSYAfqtLI6EW72uhPBQFOAj20OtKjjL
	9eNtdlKi/QO3wTaexgS+L6/zIH8BahT3tz/Lu4XKxeDMrFDhoLCBmtn5KmMNPg==
X-Gm-Gg: ASbGncslXqdaYkfs2JozAzQOsLxigqXMPPZBR+Afr9oehuyC+dmM39eJqCoh4Q1L69L
	aM4kHwNBW5CavYejuHDDIpViYuDSa4OJzLMEWGbi/ri5jPL7xl8fd4fDERuK2apQ5nI5PdcfKIS
	KVfhOCyxTsAHS0K/ybW2yKPi2UsC2gj8g5J+hlHEGRHz+a2BYiEE2Ra9Q4l1jFiQ/cMxTbxF+KY
	rBABEPUR1CvcoR1HzR6Zi7x6EuQK5g2zdc4hjYT/RYHY/7uHY6qMrmXsGzDsqawXxB4Ss78oK2h
	FHo+KmSNT8eeR3+aLYddvg4QefE4thpjycnksfAhdUMRHUCgA1MK2WNqiWeL9oQ8nE7s6c+z8xW
	QlyDlTsruD+BqeiQqXC5UiYg15ji71ihdfpjL+ono4GW8+uJkSc8zZYRlq+Bq9lismEMpN5ttsT
	AQDm3HVGNf
X-Google-Smtp-Source: AGHT+IFZqVPVjy0rncPOkbbwYcNhdQ3448lmsBsLgRawlbRVb9DlRxQuqiJqf/1liTVB6j6w9UYFgA==
X-Received: by 2002:a05:600c:8b28:b0:46e:41b0:f0cb with SMTP id 5b1f17b1804b1-475d2ebf863mr13800045e9.25.1761303890687;
        Fri, 24 Oct 2025 04:04:50 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47496c653a5sm84479175e9.6.2025.10.24.04.04.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 04:04:50 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/2] python3-gunicorn: add patch work with geventlet
Date: Fri, 24 Oct 2025 13:04:48 +0200
Message-ID: <20251024110448.1174021-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251024110448.1174021-1-skandigraun@gmail.com>
References: <20251024110448.1174021-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120950

python3-gunicorn depends on python3-geventlet. geventlet has made some
breaking changes (which is part of meta-oe/kirkstone), however gunicorn
wasn't adapted to this, and it broke some features (at least ptests).

This patch backports the change that adapts gunicorn to the used version
of geventlet.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...et-worker-ALREADY_HANDLED-WSGI_LOCAL.patch | 54 +++++++++++++++++++
 .../python/python3-gunicorn_20.1.0.bb         |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch b/meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch
new file mode 100644
index 0000000000..d385423445
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gunicorn/eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch
@@ -0,0 +1,54 @@
+From 6a8ebb4844b2f28596ffe7421eb9f7d08c8dc4d8 Mon Sep 17 00:00:00 2001
+From: Sergey Shepelev <temotor@gmail.com>
+Date: Thu, 6 May 2021 12:54:06 +0300
+Subject: [PATCH] eventlet worker: ALREADY_HANDLED -> WSGI_LOCAL
+
+Eventlet v0.30.3+ removed wsgi.ALREADY_HANDLED in favor of
+`wsgi.WSGI_LOCAL.already_handled: bool`
+
+Sorry, this breaking change happened during only patch
+version increase 0.30.2 -> 0.30.3
+
+https://github.com/eventlet/eventlet/issues/543
+https://github.com/eventlet/eventlet/pull/544
+
+Upstream-Status: Backport [https://github.com/benoitc/gunicorn/commit/6a8ebb4844b2f28596ffe7421eb9f7d08c8dc4d8]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+---
+ gunicorn/workers/geventlet.py | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/gunicorn/workers/geventlet.py b/gunicorn/workers/geventlet.py
+index ffdb206c0..ea82f3d62 100644
+--- a/gunicorn/workers/geventlet.py
++++ b/gunicorn/workers/geventlet.py
+@@ -17,11 +17,16 @@
+ 
+ from eventlet import hubs, greenthread
+ from eventlet.greenio import GreenSocket
+-from eventlet.wsgi import ALREADY_HANDLED as EVENTLET_ALREADY_HANDLED
++import eventlet.wsgi
+ import greenlet
+ 
+ from gunicorn.workers.base_async import AsyncWorker
+ 
++# ALREADY_HANDLED is removed in 0.30.3+ now it's `WSGI_LOCAL.already_handled: bool`
++# https://github.com/eventlet/eventlet/pull/544
++EVENTLET_WSGI_LOCAL = getattr(eventlet.wsgi, "WSGI_LOCAL", None)
++EVENTLET_ALREADY_HANDLED = getattr(eventlet.wsgi, "ALREADY_HANDLED", None)
++
+ 
+ def _eventlet_socket_sendfile(self, file, offset=0, count=None):
+     # Based on the implementation in gevent which in turn is slightly
+@@ -125,6 +130,10 @@ def patch(self):
+         patch_sendfile()
+ 
+     def is_already_handled(self, respiter):
++        # eventlet >= 0.30.3
++        if getattr(EVENTLET_WSGI_LOCAL, "already_handled", None):
++            raise StopIteration()
++        # eventlet < 0.30.3
+         if respiter == EVENTLET_ALREADY_HANDLED:
+             raise StopIteration()
+         return super().is_already_handled(respiter)
diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
index f381b9df2b..903e054d34 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
@@ -9,12 +9,13 @@ inherit pypi setuptools3 ptest
 
 SRC_URI += " \
 	file://run-ptest \
+	file://eventlet-worker-ALREADY_HANDLED-WSGI_LOCAL.patch \
 "
 
 RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-eventlet \
     ${PYTHON_PN}-gevent \
-	${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytest \
 "
 
 do_install_ptest() {

