Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4775BC44506
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 06:33:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3185.1783578775387958582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 23:32:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kk/nf9M4;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso6932135ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 23:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783578775; x=1784183575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIxn2z7ilhoUfHY0JEd4VpINd3Xwh+JLax0K5dBNoes=;
        b=Kk/nf9M4e00dq26KmxweZV6eGDBe9lxKuW7NW3fmOTUw0OeX16QxuZx7yB7HQtP98Z
         VQ80jQF7p2bDaBA+mbbIZA6t97lgg9xYbbpY6Ma4oPIYnMYceY2DdOPqgiO4fLe9k+n+
         axvg41Sos5ynSmKH+sy5LIlg2/Bvku5cTZgStes1Gj+hM0Ap11N83j0hJRuim1n+zFxJ
         BYXQyDtxWyKT2zTOf4kBvoGnw6WshSV4urnSdvfLtfpj0FfPqyjjkQND6RQzGkv+si8e
         xUJRZD0YABTLxLemNTsY0hS2Q8kL7xJKAI83kVAEv9vVmi6p0ZZkxFyLgtSJHpN2+6rL
         863g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783578775; x=1784183575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIxn2z7ilhoUfHY0JEd4VpINd3Xwh+JLax0K5dBNoes=;
        b=H4VwL06ujL0VSQFNVNu/uiPpr+yHeuW6/5Q/kEbuOQ/7SiHOG9mID3/4+jOYq7hrEW
         +vcEtxeK5lNeH/HdNLtUZHDXMEyVqRKhTrT+UDNgMdLOt2/pHAYpHqv0AJvHJSBaUidV
         blLnhpT+rVL/mlYgLs3jm2NZD4ynSc14Sse7hYjykwoC/YxxBgQ8Xy1fkNlLWeiwAT4N
         QmeVpmalUzSMkRt0fCfKDzHlAA/8DJmIrV1UxVxwh+c6yrfFdT5/+5wsAev/yKTeBclB
         W8ruF9jlpVq5Uip+Inlc4vAqDEVybCT6GM6wKCa0aA4CMTp1LTeuYsMUC4mbfwPJ9Urb
         ESxg==
X-Gm-Message-State: AOJu0YyjroDskUc5TR4h3jwjUW9RY5iQHrp1fsduDjmxkbl7oDMIyrC5
	ZW+U9O/dJOk/1S0C+pyFestLgYedmYcFfMKD2oD5mDck00GAk8eR/YA0Azi4UFPXMg8=
X-Gm-Gg: AfdE7cm9Vb9JtMg5WOHTkyEWodpRX51z1WazE7i3KEGQZ/eJpqFU1sPhw8IGgFz5heY
	0fdCsh/+A2k+hQje+IZy+ARhZ28Nf+LwVyFCEtzHDx7Gae5FIsVwnS6QHpelTgyJPZJgA92YAZr
	M/P0xQU5nb5JqWsB1Aq0H8SOWPqi9yE5AVwR9fWwoQdWfLl50J0Ae/8ns81hQ4JbUkSlbU5c0cZ
	AyGyoDfuh6raOqugdTgehJA0+l2HnAw5TPbdrezip9iyUSZs9d5tA5k6qytaeClNiDqlxVPN6SB
	sqLgH5VJUTYwNZFHyzh4IPGK9VK9DQCVnsbzaaJyYTcmZrFc+XHa6Tjpxw9sJs1yVjSGcnsUSRf
	gGmFHrZqcBqhgEvcEGgyeRqCxD5emlRGryZi4j0lVoWpWFTCjJPO6ODm6mHaJkpbUcYdF2cnSEf
	Ygb6RHZFHOZATeqrmVteCFeu5XSZCUNkC++oVCulK7T5byRdHup7dLiKNuZaplvNfkJrq1y0PTF
	olc1GIYtLeYebg9yL0D7wGDM8qO73X0Uo0xwiBW0/2zgtNYcxZzdTZoy+hP6uN061p0wzqrOuT9
	1iUeFsqwJGrSP1hcaFhKTPjESF3r3A==
X-Received: by 2002:a17:902:ec8e:b0:2c9:97a8:8c19 with SMTP id d9443c01a7336-2ccea59ccddmr59848155ad.44.1783578774492;
        Wed, 08 Jul 2026 23:32:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd5bsm38413735ad.72.2026.07.08.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 23:32:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 1/4] python3-httptools: Relax setuptools upper bound in build requirements
Date: Wed,  8 Jul 2026 23:32:48 -0700
Message-ID: <20260709063251.3218170-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jul 2026 06:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128113

The upstream pyproject.toml caps setuptools at <=82.0.1, but OE builds
with --no-isolation against the native setuptools (now 83.0.0), so the
build fails with "Missing dependencies: setuptools<=82.0.1,>=80.9.0".
Drop the spurious upper bound.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ct.toml-relax-setuptools-upper-bound.patch | 27 +++++++++++++++++++
 .../python/python3-httptools_0.8.0.bb         |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch

diff --git a/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch b/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch
new file mode 100644
index 0000000000..16280d7074
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-httptools/0001-pyproject.toml-relax-setuptools-upper-bound.patch
@@ -0,0 +1,27 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 8 Jul 2026 00:00:00 +0000
+Subject: [PATCH] pyproject.toml: relax setuptools upper bound
+
+OE provides setuptools via DEPENDS and builds with --no-isolation, so the
+upstream upper cap on setuptools is spurious and breaks the build whenever
+oe-core ships a newer setuptools (currently 83.0.0).
+
+Upstream-Status: Inappropriate [oe-core specific setuptools version]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 1111111..2222222 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,6 +1,6 @@
+ [build-system]
+ build-backend = "setuptools.build_meta"
+-requires = ["setuptools>=80.9.0,<=82.0.1"]
++requires = ["setuptools>=80.9.0"]
+
+ [project]
+ name = "httptools"
diff --git a/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb b/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
index 96565a7885..7a4d567248 100644
--- a/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httptools_0.8.0.bb
@@ -5,4 +5,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0a2d82955bf3facdf04cb882655e840e"

 inherit pypi python_setuptools_build_meta ptest-python-pytest

+SRC_URI += "file://0001-pyproject.toml-relax-setuptools-upper-bound.patch"
 SRC_URI[sha256sum] = "6b2a32f18d97e16e90827d7a819ffa8dbd8cc245fc4e1fa9d1095b54ef4bd999"

