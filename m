Received: from sysmocom.de ([78.46.147.233] helo=mail.sysmocom.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1TCZRR-0008Ez-PI
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Sep 2012 19:12:33 +0200
Received: from sangmingze-mail.local (91-66-230-199-dynip.superkabel.de
	[91.66.230.199])
	by mail.sysmocom.de (Postfix) with ESMTPSA id CA9EF2543428;
	Fri, 14 Sep 2012 17:03:27 +0000 (UTC)
Received: from localhost.lan ([127.0.0.1] helo=sanmingze.lan)
	by sangmingze-mail.local with esmtp (Exim 4.80)
	(envelope-from <holger+oe@freyther.de>)
	id 1TCZF8-0001J6-3r; Fri, 14 Sep 2012 18:59:50 +0200
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Sep 2012 18:59:33 +0200
Message-Id: <1347641974-4993-1-git-send-email-holger+oe@freyther.de>
X-Mailer: git-send-email 1.7.10.4
Cc: Holger Hans Peter Freyther <zecke@selfish.org>
Subject: [PATCH] meta-systemd: Introduce a create-volatile to create tmp directories
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
X-List-Received-Date: Fri, 14 Sep 2012 17:12:33 -0000

From: Holger Hans Peter Freyther <zecke@selfish.org>

The base-files create symlinks from /var/{log,tmp,lock,cache,run} to
the /var/volatile. The directories are created by sysv initscripts.
Use the systemd-tmpfiles to create the directories. One needs to be
careful with the naming of the file as systemd first collects all
*.conf files, sorts them by name and is parsing them then. Make sure
the new file is parsed before the systemd.conf.
---
 .../systemd/systemd/create-volatile.conf           |   11 +++++++++++
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-systemd/recipes-core/systemd/systemd/create-volatile.conf

diff --git a/meta-systemd/recipes-core/systemd/systemd/create-volatile.conf b/meta-systemd/recipes-core/systemd/systemd/create-volatile.conf
new file mode 100644
index 0000000..afcf8c3
--- /dev/null
+++ b/meta-systemd/recipes-core/systemd/systemd/create-volatile.conf
@@ -0,0 +1,11 @@
+# This goes hand-in-hand with the base-files of OE-Core. The file must
+# be sorted before 'systemd.conf' becuase this attempts to create a file
+# inside /var/log.
+
+
+d   /var/volatile/cache -   -   -   -
+d   /var/volatile/log   -   -   -   -
+d   /var/volatile/lock  -   -   -   -
+d   /var/volatile/run   -   -   -   -
+d   /var/volatile/tmp   -   -   -   -
+
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 09bc635..2b245c0 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -19,7 +19,7 @@ inherit gitpkgv
 PKGV = "v${GITPKGVTAG}"
 
 PV = "git"
-PR = "r6"
+PR = "r7"
 
 inherit useradd pkgconfig autotools perlnative
 
@@ -31,6 +31,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;protocol=git \
            file://touchscreen.rules \
            file://modprobe.rules \
            file://var-run.conf \
+           file://create-volatile.conf \
            ${UCLIBCPATCHES} \
           "
 UCLIBCPATCHES = ""
@@ -97,6 +98,7 @@ do_install() {
 	install -m 0644 ${WORKDIR}/*.rules ${D}${sysconfdir}/udev/rules.d/
 
 	install -m 0644 ${WORKDIR}/var-run.conf ${D}${sysconfdir}/tmpfiles.d/
+	install -m 0644 ${WORKDIR}/create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
 }
 
 python populate_packages_prepend (){
-- 
1.7.9.5



