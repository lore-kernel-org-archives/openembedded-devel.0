Return-Path: <andrei@gherzan.ro>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id E77B360119
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Jul 2016 10:29:08 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f89so4864885qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jul 2016 03:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gherzan-ro.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hePoqfgyds1UwqcOD+amqds0w+lGGLu42V+mWKGg4jg=;
	b=zhj+nYu9E1t7Zyym4VDR8eLTdLsVEfWVdozRrAbox8D7jLwpZJPeY9v2SiYycdhn3v
	O3bbnsrIZ7ImKNYVlV2ZH6ur5wsFVrGZZZQbHJRMIJMvV5MuEe8B5JlCegd1YKC1ZqOZ
	LHJh8KBGvesXD/PTeQuyywN6gOs9nVd1F60TqrvajEPArVZkIhg7P90OwrQ+z9XxwWuG
	u5e2yiAj+6+oLskjOBCjZLlKWc5up/e/lt4RzWLRprfNDvXwYEVqd7xn9Gt8RUJ21RBd
	/XltjWddwMw1oP5b+z7gI/8pXnRxSXeTTOkaXBUN5OL15dHNOzTJOqb/fAf5+sDM/REE
	dOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hePoqfgyds1UwqcOD+amqds0w+lGGLu42V+mWKGg4jg=;
	b=MwN92vGI5JIBwLs4zNTOoiDBu5TJsmuBhaGUa3r9nPQjldCw+MOdEIC+eSJh3Z5h7K
	+vgfHEm1Wshhj7kxR6BP8FvEXjDMBWvsCRq4hVZ+w22zX4TUo06uPucklyLr0H6gVhOG
	ysCeCOh567EBCN0JeuOXgrJvfR2ru8n7PisicgckbQYvTWxQmIqmLCvt4psaj0eA3hG4
	itfqBQzzfAxIjXKCihL+ylIp3n5SFFF0R8AefR4S0Bh6mS1N9SZqqLh0PMyN/MHmxoGQ
	bEezL2tt725zm07rWKy01Vn/N9+2xSGfe4uI1zHx10jzQZrQxOwty4vIwcNDxyEvkXAH
	h6Hg==
X-Gm-Message-State: ALyK8tJ3QG7rFUkh1vpfK+4zgEJ0xpKb1VWgYQzD9QY/yD/WWapOwXdtq1OUeLYhusYMKQ==
X-Received: by 10.194.117.35 with SMTP id kb3mr5179106wjb.136.1467973748942;
	Fri, 08 Jul 2016 03:29:08 -0700 (PDT)
Received: from resin.home (host86-179-71-94.range86-179.btcentralplus.com.
	[86.179.71.94])
	by smtp.gmail.com with ESMTPSA id ck1sm26638wjc.1.2016.07.08.03.29.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jul 2016 03:29:07 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
X-Google-Original-From: Andrei Gherzan <andrei@resin.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jul 2016 11:29:04 +0100
Message-Id: <20160708102904.10675-1-andrei@resin.io>
X-Mailer: git-send-email 2.9.0
Cc: Andrei Gherzan <andrei@resin.io>
Subject: [meta-python][PATCH 1/1] python-imaging: Add patch to fix host sysroot fails
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
X-List-Received-Date: Fri, 08 Jul 2016 10:29:09 -0000

Signed-off-by: Andrei Gherzan <andrei@resin.io>
---
 .../python/python-imaging/remove-host-libdir.patch | 25 ++++++++++++++++++++++
 .../python/python-imaging_1.1.7.bb                 |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch

diff --git a/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
new file mode 100644
index 0000000..028a51a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-imaging/remove-host-libdir.patch
@@ -0,0 +1,25 @@
+Avoid getting host sysroot paths in the library paths to fix issue like:
+
+| /home/andrei/work/yocto/build-rpi-master/tmp/sysroots/x86_64-linux/usr/lib/libz.so: file not recognized: File format not recognized
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+
+Index: Imaging-1.1.7/setup.py
+===================================================================
+--- Imaging-1.1.7.orig/setup.py
++++ Imaging-1.1.7/setup.py
+@@ -155,11 +155,6 @@ class pil_build_ext(build_ext):
+ 
+         # FIXME: check /opt/stuff directories here?
+ 
+-        prefix = sysconfig.get_config_var("prefix")
+-        if prefix:
+-            add_directory(library_dirs, os.path.join(prefix, "lib"))
+-            add_directory(include_dirs, os.path.join(prefix, "include"))
+-
+         #
+         # locate tkinter libraries
+ 
diff --git a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
index a678328..d2f1a8c 100644
--- a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -9,7 +9,8 @@ PR = "r5"
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
            file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
            file://allow.to.disable.some.features.patch \
-           file://fix-freetype-includes.patch"
+           file://fix-freetype-includes.patch \
+           file://remove-host-libdir.patch"
 
 SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
 SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
-- 
2.9.0


