Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEA2C2A07A
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 08:32:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60169.1767601927953039033
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 00:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMIxpB1W;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4775e891b5eso55708275e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767601926; x=1768206726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2OUmkxZVu2JOar92QkRCoJQF+UiP+4jFcAeD51UxQ4=;
        b=FMIxpB1WlWUvmi4eUF0w3m//Pl09sd6y46xP011IK1i68QQGVdFG0hiniJ2HVx1IUs
         ihO27wFxmtq0ZccvWvrQ/PNHVbulO54rrdhgbJpWXqwcPKPmeK6jQXYDB52Gjczz3DN2
         76LAiiwMd3GgxOg7P8IYRtcRo+X6f6U6tZQ1eZmINj3J4ea128/UW+Rtecmg49ouWJNQ
         uPyT6dpRWsJ1hMrwjnrbvylpc4t+xVjaECnblH6oSFxg62I1XE2vM3Kl00ermfc8k8CL
         Tfx7oXDRs+x3LEpqocX48mBjxyfNvTf0+NZ4tYgF4tf0OuB+JR8wXq3zZ5HeyCMFeX6q
         tgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601926; x=1768206726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l2OUmkxZVu2JOar92QkRCoJQF+UiP+4jFcAeD51UxQ4=;
        b=Fz/oT9L/SYjUO/i0sMn1rv6+7np9vJnVfB+ShRZupUhOp0iGHPRNJD/vcImGVr7nLo
         hrt+DSGYc5/GZJMoIy6fJSdrHu7r0mk2bBT1K6P2OOYUFlDWLQORGyUc+zNA0gLYxv+j
         Vkqzl3QIPwevTDJAbee+/V0eyaIIj6ZWv6nzK8mRvJpgnhFxXAaQQAL65pi6+lGpTtIF
         beiN0XHxKJnhMWe5GbmFzK55dlzK5H0MhRN0nn3mLmDECcwe8FlS5puvByViw4uVj/Ca
         wAvtojbueSin484qEQYWQzpcqEAwnk3clQJgxzupdOVDM3rvUiyM7SwGLqzM5SqcClXj
         4naw==
X-Gm-Message-State: AOJu0YywhEittOKzCc6Qx75KgYmoyFn1q9IblIuptvxWskc8n4e8hJua
	dqnCc63icKx/lQ/HuE7sPeCghPa/18BO/g3Ol+Se10KJ7yLWPKa25PmEqO8gkg==
X-Gm-Gg: AY/fxX5VER4wAzNWFOq/RXJKN9pPIc36rQzz1mhQs9Uec3zSZZCnw3Rw2ioyezWTZlR
	TyHAxK2V+zSuKzwf2g6rs1NI4drFZJRQ6M3lKgQ2Lax9B3iGLiD+VN6RxhohHskfQe7sHVEQDF+
	Q3HrIXaxRMRg0kIK4QI0yY88lFwQzvEW7SiaGT2GfXsrR+FecxiHjqDDMUAHNYZZAttyVsjJYop
	RCnv17ewdggZEWFjI037s5DEPcNl6ExSfGiOtuuKSg+FVnCoOhoMZHg31OAD3dD3fbHpDU4tOHo
	0tiSMzSx3EJa+tUinFbaa0SyRKKyKbI1mzuFvkXCuYo6Lsz1G+weA0Nmg3vQb5UiWGOmaUgIy2+
	Ake1BNyAU9NJhd+QwfwZzOLS7eQNi9x7wXfp2fQUYvCUujHuJ1/lh6WqRHgp3NbwpiHZziJ3CR1
	AwmC9uMwq/
X-Google-Smtp-Source: AGHT+IF3KTk9tvxBjNdT94vJrZ08NHpJiOWFEjGjWr+rQfxIvG8fkNU4fL6s0iJyQCxZYMxQ8vaUrA==
X-Received: by 2002:a05:600c:1f84:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-47d3884cfdemr492272585e9.33.1767601926157;
        Mon, 05 Jan 2026 00:32:06 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6be53a0csm54867635e9.3.2026.01.05.00.32.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:32:05 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 5/5] python3-flask: patch CVE-2023-30861
Date: Mon,  5 Jan 2026 09:32:01 +0100
Message-ID: <20260105083201.1225143-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105083201.1225143-1-skandigraun@gmail.com>
References: <20260105083201.1225143-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 08:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123131

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-30861

Pick the patch referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../python/python3-flask/CVE-2023-30861.patch | 94 +++++++++++++++++++
 .../python/python3-flask_2.1.1.bb             |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-flask/CVE-2023-30861.patch

diff --git a/meta-python/recipes-devtools/python/python3-flask/CVE-2023-30861.patch b/meta-python/recipes-devtools/python/python3-flask/CVE-2023-30861.patch
new file mode 100644
index 0000000000..370f17bb7f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-flask/CVE-2023-30861.patch
@@ -0,0 +1,94 @@
+From 32cc429640d7307caa2075d15b0634fd886c6381 Mon Sep 17 00:00:00 2001
+From: David Lord <davidism@gmail.com>
+Date: Mon, 1 May 2023 08:01:32 -0700
+Subject: [PATCH] set `Vary: Cookie` header consistently for session
+
+CVE: CVE-2023-30861
+Upstream-Status: Backport [https://github.com/pallets/flask/commit/afd63b16170b7c047f5758eb910c416511e9c965]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/flask/sessions.py | 10 ++++++----
+ tests/test_basic.py   | 23 +++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 4 deletions(-)
+
+diff --git a/src/flask/sessions.py b/src/flask/sessions.py
+index 4e19270..039e30c 100644
+--- a/src/flask/sessions.py
++++ b/src/flask/sessions.py
+@@ -385,6 +385,10 @@ class SecureCookieSessionInterface(SessionInterface):
+         samesite = self.get_cookie_samesite(app)
+         httponly = self.get_cookie_httponly(app)
+ 
++        # Add a "Vary: Cookie" header if the session was accessed at all.
++        if session.accessed:
++            response.vary.add("Cookie")
++
+         # If the session is modified to be empty, remove the cookie.
+         # If the session is empty, return without setting the cookie.
+         if not session:
+@@ -397,13 +401,10 @@ class SecureCookieSessionInterface(SessionInterface):
+                     samesite=samesite,
+                     httponly=httponly,
+                 )
++                response.vary.add("Cookie")
+ 
+             return
+ 
+-        # Add a "Vary: Cookie" header if the session was accessed at all.
+-        if session.accessed:
+-            response.vary.add("Cookie")
+-
+         if not self.should_set_cookie(app, session):
+             return
+ 
+@@ -419,3 +420,4 @@ class SecureCookieSessionInterface(SessionInterface):
+             secure=secure,
+             samesite=samesite,
+         )
++        response.vary.add("Cookie")
+diff --git a/tests/test_basic.py b/tests/test_basic.py
+index 2a177e9..2da7699 100644
+--- a/tests/test_basic.py
++++ b/tests/test_basic.py
+@@ -558,6 +558,11 @@ def test_session_vary_cookie(app, client):
+     def setdefault():
+         return flask.session.setdefault("test", "default")
+ 
++    @app.route("/clear")
++    def clear():
++        flask.session.clear()
++        return ""
++
+     @app.route("/vary-cookie-header-set")
+     def vary_cookie_header_set():
+         response = flask.Response()
+@@ -590,11 +595,29 @@ def test_session_vary_cookie(app, client):
+     expect("/get")
+     expect("/getitem")
+     expect("/setdefault")
++    expect("/clear")
+     expect("/vary-cookie-header-set")
+     expect("/vary-header-set", "Accept-Encoding, Accept-Language, Cookie")
+     expect("/no-vary-header", None)
+ 
+ 
++def test_session_refresh_vary(app, client):
++    @app.get("/login")
++    def login():
++        flask.session["user_id"] = 1
++        flask.session.permanent = True
++        return ""
++
++    @app.get("/ignored")
++    def ignored():
++        return ""
++
++    rv = client.get("/login")
++    assert rv.headers["Vary"] == "Cookie"
++    rv = client.get("/ignored")
++    assert rv.headers["Vary"] == "Cookie"
++
++
+ def test_flashes(app, req_ctx):
+     assert not flask.session.modified
+     flask.flash("Zap")
diff --git a/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
index 24a7047703..edf9f628d2 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
@@ -6,6 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
+SRC_URI += "file://CVE-2023-30861.patch"
 SRC_URI[sha256sum] = "a8c9bd3e558ec99646d177a9739c41df1ded0629480b4c8d2975412f3c9519c8"
 
 PYPI_PACKAGE = "Flask"

