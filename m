Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 348CD73174
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:18:25 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n66so7405824qkf.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=yyZWBhMseetjD4DOYjwNxVKwJhQY1y5232KzqVIjo7E=;
	b=d1jFuinoQ3dSn8IaUwpcnrIDg8l68im01xXgsyPwcqG4vtO7aEP9J6pBYZbH9tS0O0
	4XEWfETp8P2ymxE95qb87iVix1zJqrWy5fGQwS5Vfg1NMxsviUNxTZ0pptGfGpWpdxDq
	PY5OGUDuyq/Dty0o4ss0AxbkRgTt7cjljULN5GZDe0SJLTT+b/5EAGrAc9lpC57/NDJ0
	WEjqUOY1kC2B2vIVTq7s0KftYGNuRDGFLMQX9ROJzVdYln0gFxXhXDRhMqM1+80u4z5M
	RiT3JdZELfvjcDwQE58rPdjfhQuwO43CA0PPHSZipII259Z57fMfKIYJ1B71xJfWJTSa
	Z5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=yyZWBhMseetjD4DOYjwNxVKwJhQY1y5232KzqVIjo7E=;
	b=QtlhDZudGta8xEVWfYR2EGTh91neViOarSU6XZsG8Gqj4sXfe5u8VBxc1cOny+LIR1
	vt9hnfBJQMINWKCx1IOrFvgAnII5dfoAMfvX8oLXtpI/XMXJeZQgPntClO8wyHjNum7I
	atITA++AXzZ4pq3MdjrSHx/jB7m/tlRlfqvk48UbNEwH0v51sRCaNvJESrX1vvE7Mlr3
	guargiaMJpedwG/RQgeyrEyGxHYYlpJcUvf7BuvMJtdIHY4OFJCi1zrRXc7yZsEwXDn+
	lTN6gM+/aQxE3L5YI1WJlrUZ9DQbYOCEwQmHm+mgJXWHWmpyA6C+racQuX2zOmpvtvWL
	LiHg==
X-Gm-Message-State: AEkoouuw0XQgyrP9uCu5dKd6zJ0LMad3lcAwD763pi0CncB1TjxIkoioVPISH+ZDTaXa2w==
X-Received: by 10.55.160.129 with SMTP id j123mr47906855qke.184.1471439905386; 
	Wed, 17 Aug 2016 06:18:25 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	r187sm14680639qkc.49.2016.08.17.06.18.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 17 Aug 2016 06:18:24 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Aug 2016 10:17:41 -0300
Message-Id: <1471439868-10118-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python][PATCH 1/8] python-progress, python3-progress: Add recipe for version 1.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Aug 2016 13:18:26 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-progress.inc     | 9 +++++++++
 meta-python/recipes-devtools/python/python-progress_1.2.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-progress_1.2.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-progress.inc
 create mode 100644 meta-python/recipes-devtools/python/python-progress_1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-progress_1.2.bb

diff --git a/meta-python/recipes-devtools/python/python-progress.inc b/meta-python/recipes-devtools/python/python-progress.inc
new file mode 100644
index 0000000..80d0a58
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-progress.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Easy progress reporting for Python"
+HOMEPAGE = "http://github.com/verigak/progress/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aef5566ac4fede9815eccf124c281317"
+
+SRC_URI[md5sum] = "c1dbf49a41e80408d3874d976ba894cc"
+SRC_URI[sha256sum] = "5b6a50f9ac76820f619d7789b5354881c8c10060a64047e415868d8f503cc2eb"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-progress_1.2.bb b/meta-python/recipes-devtools/python/python-progress_1.2.bb
new file mode 100644
index 0000000..8060862
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-progress_1.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-progress.inc
diff --git a/meta-python/recipes-devtools/python/python3-progress_1.2.bb b/meta-python/recipes-devtools/python/python3-progress_1.2.bb
new file mode 100644
index 0000000..45e2642
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-progress_1.2.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-progress.inc
-- 
2.1.4


