Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA649C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:46:19 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.23156.1747917969137697588
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 May 2025 05:46:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=VX0lwy3z;
 spf=pass (domain: baylibre.com, ip: 209.85.222.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5b2472969so841078685a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 05:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747917967; x=1748522767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hry6sYgRKjnuuTJJFegA5JZ+IlNB60ezflpnXI3W7Ng=;
        b=VX0lwy3zflXdc6idzyah2AmfbzuFpoSuuXgiQ9Mjp4sZrEQgL1Pr/c0Ur2cQtnstF+
         wxZeNjm7B6fjAbSIiq2/UYJPBX8EsytXuG0nAmTKb44JLQk1nmB9QKqcfBUfXZGwtEo6
         Ca+lg3/jbRBp1u3bhaW/vTrHRFHEZ8uA927Lb94EHqOYa1roYq6GJhrtPo2YQgIl4kuV
         yPGjnMRWZlwUmTs53i1Ujw9mN7N9r9rTNIUfQ0FriSmhZPOcgBkgBfCZjNZtXhOlZDpY
         FZ/46WxNvAiwruDMjgcbXx4HjkpkQiaCrwP7oYD4f7gjxMJLGLiD/GmuDeQPuyvc9jcs
         oacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747917967; x=1748522767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hry6sYgRKjnuuTJJFegA5JZ+IlNB60ezflpnXI3W7Ng=;
        b=pntjaIXZcPgcYGPetvacW5yAqE3uFtQrpBJ2fZ4+cZPZhq866jjzxRThmw542z4qI3
         iQikH+e6hvDhR1v/U6B/tYQBN5SnERiuCDVSqinuZfmUY1df3A++98Y1ybT7pGd9xi1/
         YKSd+0vwKlmenOqVUzbY55kjfDXK7g9Oz3/k9jT/yE+Y+vprs8lS/SGgIWfSCtGt3FYi
         GXF6NhQ1rb9Y8LQDpq9jrOhJOCsPfIY2dw3Oi0L8Tkcuq/VHh9slqmXQ+uJCHMhmLiNt
         bwp0hG6j8PrLTsuIJJby9QPlLfqPY9nevcPnhOhWGeHZxF0Uqr7pb4WpvFn2CIr2k9si
         zyQg==
X-Gm-Message-State: AOJu0Yx3xPLCnIVl0umesKonZ5VraBn7N6aUR1nHQDsO/K19lkoc+Qpt
	VOD9r+e605T5UXMhpiQwnZ448+C3uSHCLZOC7WEw94P9vB/1hR3AQTmMPwujbTkrnQHe10FTmeq
	3abNRTBo=
X-Gm-Gg: ASbGncttTd5wB45+PnsJauv6XWPvvoOR/jRVD6JYWLfcIHDunFRFxDg+EH2/oO4eBJ9
	eF9KJDkGiuMuuYLDW7kDNtqTqMGJ4lBzj/9WIzJ20PK++mm+xatBTZfmjc80XAnHZppjqvHDOCH
	avaHHYy+nZj9SA6jshUmP98QzTUuL2dNYQ9Ax3l1gTPuMGxYp4tEOtUOWQe6wrJk6lwhtTdR5QM
	7TgDzKMwq1jKYm1CvtXa98cv5b8yGM6VvVLCo+oWchteXnawW5G7z5KN/XC/sw3iKCbsbkg6I/P
	Tnl9pszxIzDm5uhDeie12WJ8IJLR66Wh+DgTRIdhlY1IAZ4YtDGeNTiQO2elO4urulsOVtZRofH
	Dmct+YPJqxPc=
X-Google-Smtp-Source: AGHT+IHNJS1kQixtX8RCETq7RS6Mvuv2DaKhffXtC8iX5IlbuRqxUcHLaOdswufzhU2QOVlwjYllHg==
X-Received: by 2002:ad4:4ee1:0:b0:6ec:edf9:4658 with SMTP id 6a1803df08f44-6f8b0844130mr415143416d6.18.1747917967148;
        Thu, 22 May 2025 05:46:07 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b097b993sm98890826d6.110.2025.05.22.05.46.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 05:46:06 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-pychromecast: fix build with setuptools 80.x
Date: Thu, 22 May 2025 08:46:05 -0400
Message-Id: <20250522124605.754023-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 May 2025 12:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117591

Backport two patches to fix the pyproject.toml versions around
setuptools. Once the next version of pychromecast is out, these should
be removable.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...s-requirement-from-79.0-65.6-to-65.6.patch | 42 +++++++++++++++++++
 ...s-requirement-from-80.0-65.6-to-65.6.patch | 42 +++++++++++++++++++
 .../python/python3-pychromecast_14.0.7.bb     |  7 +++-
 3 files changed, 90 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch
new file mode 100644
index 0000000000..b0d4a88c8e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch
@@ -0,0 +1,42 @@
+From ef27075e087e139921b99729a4ec7683e42c5c4a Mon Sep 17 00:00:00 2001
+From: "dependabot[bot]" <49699333+dependabot[bot]@users.noreply.github.com>
+Date: Mon, 21 Apr 2025 16:34:55 +0200
+Subject: [PATCH] Update setuptools requirement from <79.0,>=65.6 to
+ >=65.6,<80.0 (#1056)
+
+Upstream-Status: Backport [https://github.com/home-assistant-libs/pychromecast/commit/ef27075e087e139921b99729a4ec7683e42c5c4a]
+
+Updates the requirements on [setuptools](https://github.com/pypa/setuptools) to permit the latest version.
+- [Release notes](https://github.com/pypa/setuptools/releases)
+- [Changelog](https://github.com/pypa/setuptools/blob/main/NEWS.rst)
+- [Commits](https://github.com/pypa/setuptools/compare/v65.6.0...v79.0.0)
+
+---
+updated-dependencies:
+- dependency-name: setuptools
+  dependency-version: 79.0.0
+  dependency-type: direct:production
+...
+
+Signed-off-by: dependabot[bot] <support@github.com>
+Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 34f5dc0..88d67fe 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=65.6,<79.0", "wheel>=0.37.1,<0.46.0"]
++requires = ["setuptools>=65.6,<80.0", "wheel>=0.37.1,<0.46.0"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch
new file mode 100644
index 0000000000..8630c1632d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pychromecast/0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch
@@ -0,0 +1,42 @@
+From 7017a1db10a21ed97b79800e31a2f7c70abbffc3 Mon Sep 17 00:00:00 2001
+From: "dependabot[bot]" <49699333+dependabot[bot]@users.noreply.github.com>
+Date: Mon, 28 Apr 2025 16:43:13 +0200
+Subject: [PATCH] Update setuptools requirement from <80.0,>=65.6 to
+ >=65.6,<81.0 (#1060)
+
+Upstream-Status: Backport [https://github.com/home-assistant-libs/pychromecast/commit/7017a1db10a21ed97b79800e31a2f7c70abbffc3]
+
+Updates the requirements on [setuptools](https://github.com/pypa/setuptools) to permit the latest version.
+- [Release notes](https://github.com/pypa/setuptools/releases)
+- [Changelog](https://github.com/pypa/setuptools/blob/main/NEWS.rst)
+- [Commits](https://github.com/pypa/setuptools/compare/v65.6.0...v80.0.0)
+
+---
+updated-dependencies:
+- dependency-name: setuptools
+  dependency-version: 80.0.0
+  dependency-type: direct:production
+...
+
+Signed-off-by: dependabot[bot] <support@github.com>
+Co-authored-by: dependabot[bot] <49699333+dependabot[bot]@users.noreply.github.com>
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 88d67fe..d5a518c 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,5 +1,5 @@
+ [build-system]
+-requires = ["setuptools>=65.6,<80.0", "wheel>=0.37.1,<0.46.0"]
++requires = ["setuptools>=65.6,<81.0", "wheel>=0.37.1,<0.46.0"]
+ build-backend = "setuptools.build_meta"
+ 
+ [project]
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
index 7bae0721db..260f6395b7 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.7.bb
@@ -3,7 +3,12 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI += "file://0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch"
+SRC_URI += "\
+            file://0001-Update-setuptools-requirement-from-78.0-65.6-to-65.6.patch \
+            file://0001-Update-setuptools-requirement-from-79.0-65.6-to-65.6.patch \
+            file://0001-Update-setuptools-requirement-from-80.0-65.6-to-65.6.patch \
+"
+
 SRC_URI[sha256sum] = "7abbae80a2c9e05b93b1a7b8b4d771bbc764d88fd5e56a566f46ac1bd3f93848"
 
 inherit pypi python_setuptools_build_meta
-- 
2.39.5


