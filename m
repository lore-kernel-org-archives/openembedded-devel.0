Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsUs2-00037h-BX
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 10:17:02 +0200
Received: by wibhm2 with SMTP id hm2so1167819wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 01:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=x19XgTbTLgzdl1Mq/h591iuW06yOLKV1d4qlKJsqDyU=;
	b=xTzF1oJdqm8xL3OP1N8sj5XGq38bjd1f7TaTTddjz1lsBNjCbCE/vPiLoK5i4cdyKc
	NDz7jbAmZv3ou7JjhdAeFPP8+WfPusKtkS69YTMXfVJYOT9IgmxzR3wrKvFqtYVJrNPU
	JATeMemJARsuget2y4/BHvUM/L4+aOMW9TNQ7wjn/EE8N55gdSw2U/VlkdKjXpsX78W6
	jLPZh5j13QpQ1k1sUZQ91PToKabdTBiS5awYILFCU2rWYQWGutmsBOL4PytUaMmilo+M
	QLhlC4uhkmC8hzvwQzbFgGavmzCbBWFWvnO8iRpLdlhvUUwqaAU2IOaEGIoz5rrQRkoK
	dMuQ==
Received: by 10.180.93.68 with SMTP id cs4mr32166587wib.14.1342857938347;
	Sat, 21 Jul 2012 01:05:38 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm4147131wib.0.2012.07.21.01.05.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 01:05:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Jul 2012 10:05:07 +0200
Message-Id: <a27cd747e1e87482d4968348fd9edd64c8c80925.1342857860.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342857860.git.Martin.Jansa@gmail.com>
References: <cover.1342857860.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][PATCH 3/3] systemd: cleanup /var/run on boot and create /var/run/utmp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jul 2012 08:17:02 -0000

* Angstrom uses /var/run cleanup because:
  Some apps (e.g. avahi-daemon) to clean up their old-style pid files and fail
  to start every other boot. Se we let systemd clean it on boot.
  Which seems general enough, so lets move var-run.conf from base-files.bbappend
  to systemd recipe.

* /var/run/utmp was created by volatiles before, but without sysvinit installed
  systemd-update-utmp-runlevel.service fails to start without this file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/systemd/systemd/var-run.conf      |    4 ++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    5 ++++-
 2 files changed, 8 insertions(+), 1 deletions(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/var-run.conf

diff --git a/meta-systemd/recipes-core/systemd/systemd/var-run.conf b/meta-systemd/recipes-core/systemd/systemd/var-run.conf
new file mode 100644
index 0000000..c2c18e2
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/var-run.conf
@@ -0,0 +1,4 @@
+# empty /var/run
+R	/var/run/*	-	-	-	-	-
+# systemd-update-utmp-runlevel.service fails to start without this
+f /var/run/utmp 0644 root root - -
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 9cbdd76..3868438 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r2"
+PR = "r3"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -29,6 +29,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://gtk-doc.make \
            file://touchscreen.rules \
            file://modprobe.rules \
+           file://var-run.conf \
           "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
@@ -82,6 +83,8 @@ do_install() {
 	touch ${D}${sysconfdir}/machine-id
 
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
+
+	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
 }
 
 python populate_packages_prepend (){
-- 
1.7.8.6



