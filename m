Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyeiU-000077-5J
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 10:00:38 +0200
Received: by eaad12 with SMTP id d12so1115575eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7kYAsTb/TQe/BxKB4q8vW2ahIbg+ed6hOzYTBBzbD+A=;
	b=QgwNmAmICcgMrHT0LErl4URzHM0DyEl2BfscEFFX5Faca4Vv6YwE0uG/Jmxn6DGCG3
	+auqbU7/BmRwY3Fu6fmFa65JklTO/ionuGa9Jh2Jbd9a6SRzKv0EOB+CBYCb3y3wGaIT
	vYWg4HvCVttkRqkFRJOuqvaaSUJaLqCQ6S5S81EFxHaXqKUScKzzCRQjnxUQnAigrAQK
	q2M6FzUQXzv3U8o2iuiWahMGScRePGFdf7MqvekcJ4Xa6CBiGNkW33q0iMYb3WCieE5Q
	QoCsa4e2kEHLNRP1toJXVxzQmqI+GUVxp+uiPH50pFv67ai6ECYnt8Xe5zQG9yvPhX1e
	brKg==
Received: by 10.14.211.196 with SMTP id w44mr16372132eeo.19.1344325732637;
	Tue, 07 Aug 2012 00:48:52 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a41sm39637780eep.7.2012.08.07.00.48.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:48:51 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:48:44 +0200
Message-Id: <1344325724-21149-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQmPU2L2unaDKKlvg9sVUFdDqlGnYFTe/dH4nORX6FfsUvAOG2gtBz7s0FxiGqnAd1VODfVZ
Cc: Martin Jansa <martin.jansa@gmail.com>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [for-denzil][meta-oe][PATCH] systemd: cleanup /var/run on boot and create /var/run/utmp
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
X-List-Received-Date: Tue, 07 Aug 2012 08:00:38 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* Angstrom uses /var/run cleanup because:
  Some apps (e.g. avahi-daemon) to clean up their old-style pid files and fail
  to start every other boot. Se we let systemd clean it on boot.
  Which seems general enough, so lets move var-run.conf from base-files.bbappend
  to systemd recipe.

* /var/run/utmp was created by volatiles before, but without sysvinit installed
  systemd-update-utmp-runlevel.service fails to start without this file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-core/systemd/systemd/var-run.conf |    4 ++++
 meta-oe/recipes-core/systemd/systemd_git.bb       |    5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/systemd/systemd/var-run.conf

diff --git a/meta-oe/recipes-core/systemd/systemd/var-run.conf b/meta-oe/recipes-core/systemd/systemd/var-run.conf
new file mode 100644
index 0000000..c2c18e2
--- /dev/null
+++ b/meta-oe/recipes-core/systemd/systemd/var-run.conf
@@ -0,0 +1,4 @@
+# empty /var/run
+R	/var/run/*	-	-	-	-	-
+# systemd-update-utmp-runlevel.service fails to start without this
+f /var/run/utmp 0644 root root - -
diff --git a/meta-oe/recipes-core/systemd/systemd_git.bb b/meta-oe/recipes-core/systemd/systemd_git.bb
index f4ca72a..b9c8a19 100644
--- a/meta-oe/recipes-core/systemd/systemd_git.bb
+++ b/meta-oe/recipes-core/systemd/systemd_git.bb
@@ -14,7 +14,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r27"
+PR = "r28"
 
 inherit useradd pkgconfig autotools vala perlnative
 
@@ -22,6 +22,7 @@ SRCREV = "3eff4208ffecedd778fec260f0d4b18e94dab443"
 
 SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            ${UCLIBCPATCHES} \
+           file://var-run.conf \
           "
 UCLIBCPATCHES = ""
 UCLIBCPATCHES_libc-uclibc = "file://paper-over-mkostemp.patch \
@@ -68,6 +69,8 @@ do_install() {
 	# create machine-id
 	# 20:12 < mezcalero> koen: you have three options: a) run systemd-machine-id-setup at install time, b) have / read-only and an empty file there (for stateless) and c) boot with / writable
 	touch ${D}${sysconfdir}/machine-id
+
+	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
 }
 
 python populate_packages_prepend (){
-- 
1.7.10



