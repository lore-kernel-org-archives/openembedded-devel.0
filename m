Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 988737F8F4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2019 19:01:29 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 11so17963159wmk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 11:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JwHxSi8ZbeID28wPekOBBsGK5dOPx1YSDzk/a9Ba2gg=;
	b=W8xVlikvugck424HMb88fUHX3m+yvWTDLu1eaOykx11GhAvjYcNI4mcZFdxEJhHa+e
	ykmt6uNXeNSjEUQp1deeOodAGndBckoZ1v3bPsXGdl3BvrrBvQoUkNXsaHUdlIQmSYsf
	ZxcgBx7/5F1Bv5h/2j6gF9XneRKKeprCjHoOPG3s3eXvNMdvyRst7F2aE1PtcqLV9sW6
	BBH/F/7dNrqK6Ge0tRVmyoXntO8IoxtgY/+HznDJn0I3e7+jqeuCZZaMm3tppS9GCcN1
	i2pKKzHGrhA58mPv6nm5EBmxYbZ48wyrIi7MqWBucBN68t2hQxENsniWI0fLgd0xdP3e
	qnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JwHxSi8ZbeID28wPekOBBsGK5dOPx1YSDzk/a9Ba2gg=;
	b=Gb/NUkzpn2MauvKsaQVRwvLwKT4wvI93RnvEKGNcGd3QyyUdKb+jgILq21zDo1Oq/h
	+zmcEDBLYR1nUIAJPg6fzfp4/Fdw+hmWz6ldZDTuYZmOOQaVmTMlSoDY/cb1nGh1/Vk/
	Q0ewvH3Ykcd67oVejaxKriCs2FNkOLrOvltA6jMkGY3SFflW0vdiXWUMuJ9LTKIEvSwS
	/nb6HuJ+NgSkm97kWGYJnYuL8d73mkF0gd+wq6FOt48CgV17IdiugMcpi0y+FyPYlJ3R
	h25f9kzok7oEsH7zadze/3RF5P806ZwXy8pf9xYFwmOL6ZXiLnoBNzt8A8Y3UyJ8W/x4
	CStA==
X-Gm-Message-State: APjAAAWM+lBRPIqhvw1D+M4EcORCNKQ7Lc/DuMMEhF9ifwssqPjgISA/
	XLf35pv8wvCjQC9zdTV9onRhpIvu
X-Google-Smtp-Source: APXvYqySiy/gTABv8amN81rOy2SGISBnVJiLeLkRcOflFfJwVJJbRLZpx4gIRdDP4RKzSZzqo/QXEQ==
X-Received: by 2002:a1c:5415:: with SMTP id i21mr560030wmb.120.1572894089539; 
	Mon, 04 Nov 2019 11:01:29 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C365CAC9282E0012A3C.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c36:5cac:9282:e001:2a3c])
	by smtp.gmail.com with ESMTPSA id
	u21sm21916069wmu.27.2019.11.04.11.01.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 11:01:26 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Nov 2019 20:01:13 +0100
Message-Id: <20191104190114.5076-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104190114.5076-1-schnitzeltony@gmail.com>
References: <20191104190114.5076-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] mm-common: do really build with meson
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
X-List-Received-Date: Mon, 04 Nov 2019 19:01:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* to activate meson 'GNOMEBASEBUILDCLASS = "meson"' must be set before 'inherit
  gnomebase'
* add a patch to fix meson build

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ot-ask-for-python-installation-versi.patch | 41 +++++++++++++++++++
 .../recipes-core/mm-common/mm-common_1.0.0.bb |  5 ++-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch

diff --git a/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch b/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
new file mode 100644
index 000000000..6031eaa78
--- /dev/null
+++ b/meta-oe/recipes-core/mm-common/mm-common/0001-meson.build-do-not-ask-for-python-installation-versi.patch
@@ -0,0 +1,41 @@
+From af4069263487399be82ee53d48b1edda7f8e594e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 4 Nov 2019 19:19:47 +0100
+Subject: [PATCH] meson.build: do not ask for python installation / version
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Even by adding python3-setuptools-native the following error is not fixed so
+just ask for python3 executable.
+
+| meson.build:9:0: ERROR: <ExternalProgram 'python3' -> ['<...>/recipe-sysroot-native/usr/bin/python3-native/python3']> is not a valid python or it is missing setuptools
+
+Upstream-Status:  Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 3255328..7a6094c 100644
+--- a/meson.build
++++ b/meson.build
+@@ -6,12 +6,7 @@ project('mm-common',
+   license: 'GPLv2+'
+ )
+ 
+-python3 = import('python').find_installation('python3')
+-python_version = python3.language_version()
+-python_version_req = '>= 3.5'
+-if not python_version.version_compare(python_version_req)
+-  error('Requires Python @0@, found @1@.'.format(python_version_req, python_version))
+-endif
++python3 = import('python3').find_python()
+ 
+ # Use these instead of meson.source_root() and meson.build_root().
+ # source_root() and build_root() are not useful, if this is a subproject.
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
index 0b9e58917..c7d1f2b73 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.0.bb
@@ -2,11 +2,12 @@ SUMMARY = "Common GNOME build files for C++ bindings"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase
 
 SRC_URI[archive.md5sum] = "9087b8612d75cbc1fad0c99e15c2a718"
 SRC_URI[archive.sha256sum] = "b97d9b041e5952486cab620b44ab09f6013a478f43b6699ae899b8a4da189cd4"
-
-GNOMEBASEBUILDCLASS = "meson"
+SRC_URI += "file://0001-meson.build-do-not-ask-for-python-installation-versi.patch"
 
 BBCLASSEXTEND = "native"
-- 
2.21.0


