Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id 892247FCB1
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 20:50:15 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x6so14728807pfo.10
	for <openembedded-devel@openembedded.org>;
	Sun, 19 Jan 2020 12:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yeqLARLxAolKjbXnpzsOJu5zWS788ggtxZjhZl1eLXM=;
	b=BOC5GHXL9KKny6DtpZUJyy0Ca/uW83lS0KzJtL6THKi41ppexC7Z76IHToDh8GT+n1
	eB9iBSVv3GDzo3IdGV4RiEUoko2Cp7vekHcboJBs/sZOMowI2v1zzL7dYne5xXZXgg3j
	tQvSv89D7LxH4snX06VnWKRrtmzpiWOOlO/5PjnhrFdcflKhztN29HWszyPG3/7RkLty
	CTX9m22FgCZJ5h2PazwHRdLjApH0eRlqvnUJWoLvLxaAwIAsiFSUBtx21hQ7SJQJwOAF
	IPE5NkMGv3W05XEtKNzHztcRMWwDefcOSald5BharJ2qVPTO/99cZ6wXV89dZlaAfotZ
	tvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yeqLARLxAolKjbXnpzsOJu5zWS788ggtxZjhZl1eLXM=;
	b=kK/EGZiszWYIlGTOJjiWCHt7IiKa4EpZ+q3JG+W5J1w5KR0FNlu3Dwxv9ZPqlGdO5U
	5b8qCaxpcRf3YPAwfPzea9LYdwZk/kIMkkZy4Wi+jaF+zrh8n9StCcM2UZhFTiLJhkh9
	fALuhguTQj4bgTls+x4lWSsPmFJgZZJcirBdSgdybAywLyYL4CDGpIHsrNOrOef9j950
	n8U/nVda4s9VNzROq1Dnu+ZEfNdp4VSnYGVtTQNmD4u9v5tZToI8vtV+RYmHIoUFSbmL
	DGi2MmdkZly7nDaigtQ+PSJYhZxIzGZnfyfBM9ARwAVILtlRLN4rvvV9mpZqUr79tx4E
	G76w==
X-Gm-Message-State: APjAAAXKXdTlDWx8sUPr5nG3UK9tVP/q6BhT0ZsfJCA5wxDxgverrJJI
	1wZjk7IX2HcRW1JgDCfKx4yWx7eS
X-Google-Smtp-Source: APXvYqxGgkKbPRy5LcORvT7oRVmIJ4fxqoduMiCiYR1M4JbnjdC8nO9yuNYk0NeWapzIwNuSze7vMw==
X-Received: by 2002:aa7:8ad9:: with SMTP id b25mr13971136pfd.70.1579467016579; 
	Sun, 19 Jan 2020 12:50:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	k9sm14701403pjo.19.2020.01.19.12.50.15
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 12:50:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun, 19 Jan 2020 12:50:06 -0800
Message-Id: <81e186f6141a6e8f4ab3185b00b9f1392bb89ca1.1579466920.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579466920.git.akuster808@gmail.com>
References: <cover.1579466920.git.akuster808@gmail.com>
Subject: [zeus 8/8] adduser: set default shell with /sbin/nologin
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
X-List-Received-Date: Sun, 19 Jan 2020 20:50:15 -0000

From: Kai Kang <kai.kang@windriver.com>

Shell nologin whether provided by shadow or util-linux is installed to
/sbin/nologin in oe-core. But the default shell of adduser is
/usr/sbin/nologin and will fail to create a new user.

Set the default shell with /sbin/nologin to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d49c0eba5bcd64a0dd1f2e389453f94d7efc988f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-perl/adduser/adduser_3.118.bb     |  1 +
 ...-set-default-shell-with-sbin-nologin.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch

diff --git a/meta-perl/recipes-perl/adduser/adduser_3.118.bb b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
index e695c58948..80cf142869 100644
--- a/meta-perl/recipes-perl/adduser/adduser_3.118.bb
+++ b/meta-perl/recipes-perl/adduser/adduser_3.118.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=caed49ab166f22ef31bf1127f558d0ef
 
 SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/adduser/${PV}/${BPN}_${PV}.tar.xz \
            file://adduser-add-M-option-for-useradd.patch \
+           file://0001-adduser-set-default-shell-with-sbin-nologin.patch \
 "
 
 SRC_URI[md5sum] = "44ba2475ebdaafc9613236bdda321c97"
diff --git a/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch b/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
new file mode 100644
index 0000000000..91cc6bcba8
--- /dev/null
+++ b/meta-perl/recipes-perl/adduser/files/0001-adduser-set-default-shell-with-sbin-nologin.patch
@@ -0,0 +1,34 @@
+From 75e949bf80bf5e3e5bd8f81b258095e662b705c4 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Thu, 9 Jan 2020 13:51:28 +0800
+Subject: [PATCH] adduser: set default shell with /sbin/nologin
+
+Shell nologin whether provided by shadow or util-linux is installed to
+/sbin/nologin in oe-core. But the default shell of adduser is
+/usr/sbin/nologin and will fail to create a new user.
+
+Set the default shell with /sbin/nologin to fix the issue.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ adduser | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/adduser b/adduser
+index 0f24cc9..ab554d0 100755
+--- a/adduser
++++ b/adduser
+@@ -431,7 +431,7 @@ if ($action eq "addsysuser") {
+     printf gtx("Adding new user `%s' (UID %d) with group `%s' ...\n"),$new_name,$new_uid,$ingroup_name
+ 	if $verbose;
+     $home_dir = $special_home || &homedir($new_name, $ingroup_name);
+-    $shell = $special_shell || '/usr/sbin/nologin';
++    $shell = $special_shell || '/sbin/nologin';
+     $undouser = $new_name;
+     my $useradd = &which('useradd');
+     &systemcall($useradd, '-d', $home_dir, '-g', $ingroup_name, '-s',
+-- 
+2.17.1
+
-- 
2.17.1


