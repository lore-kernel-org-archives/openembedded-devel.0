Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OpRy5-0001rs-1J
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 22:25:45 +0200
Received: by mail-pz0-f47.google.com with SMTP id 2so1637571pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=MjkBTAGH5cVTe9KDLwUZADP0RyuSf8I/QuolSrDjDgw=;
	b=SqWKfL4NcjqmENhmA/XLEH4iYXbPSIVaXUtA0dXF3VfNRDA6SgCCmGp1EwVYaYy19/
	mp1wsKzx3/92gr1ZI8LHW4gD/90GZhoCMWxc3F18dQDlkywlRDMMTs6SHfYT0PFQlUFL
	oikwGw251TZIt77bdv5vBlN1Cq2Ry70blvG28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=X1DkYp3PZhg66Jni3QsyzdXigF5bVj5CTtsycnnT5SzTzlBAzmKPDcuSSNrRwrBD+D
	UPtCpgJ3rvzCuHR/6fq0NP/+DY5FSDf/Ue7dAW/QaDgYcQchaTTW/hnbkdb6O1f5W5Nb
	VB2F8BJNIjOCY7wCdTpXUBDQdhlNRNmgVtWYQ=
Received: by 10.142.223.14 with SMTP id v14mr2672500wfg.238.1283027108906;
	Sat, 28 Aug 2010 13:25:08 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id n2sm6649371wfl.13.2010.08.28.13.25.07
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 28 Aug 2010 13:25:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Aug 2010 13:24:33 -0700
Message-Id: <1283027073-12308-24-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
References: <1283027073-12308-1-git-send-email-raj.khem@gmail.com>
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 23/23] recipes/tasks: Do not RDEPENDS on unavailable packages.
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
X-List-Received-Date: Sat, 28 Aug 2010 20:25:51 -0000

* Some packages are renamed so RDEPEND on those instead.
* Some packages are removed so remove then from RDEPENDS too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/tasks/task-mamona-base.bb              |    5 +++--
 recipes/tasks/task-mamona-python.bb            |   10 +---------
 recipes/tasks/task-mamona-systemtap.bb         |    1 -
 recipes/tasks/task-mamona-wm.bb                |    1 -
 recipes/tasks/task-openmoko-base.bb            |    2 +-
 recipes/tasks/task-openmoko-python-devel.bb    |    1 -
 recipes/tasks/task-opie-apps.bb                |    2 +-
 recipes/tasks/task-python-sharprom_20060425.bb |   18 +++++++++---------
 8 files changed, 15 insertions(+), 25 deletions(-)

diff --git a/recipes/tasks/task-mamona-base.bb b/recipes/tasks/task-mamona-base.bb
index fa56e24..a909595 100644
--- a/recipes/tasks/task-mamona-base.bb
+++ b/recipes/tasks/task-mamona-base.bb
@@ -9,14 +9,15 @@ RDEPENDS_${PN} = "\
   apt \
   base-files \
   base-passwd \
-  bash | bash-noemu \
+  bash \
+  bash-noemu \
   busybox \
   bzip2 \
   coreutils \
   dpkg \
   e2fsprogs \
   e2fsprogs-badblocks \
-  e2fsprogs-uuidgen \
+  util-linux-ng \
   file \
   gawk \
   gawk-common \
diff --git a/recipes/tasks/task-mamona-python.bb b/recipes/tasks/task-mamona-python.bb
index 4503627..8b19643 100644
--- a/recipes/tasks/task-mamona-python.bb
+++ b/recipes/tasks/task-mamona-python.bb
@@ -18,15 +18,12 @@ RDEPENDS_${PN} = "\
     python-gmpy	\
     python-gnosis \
     python-gst \
-    python-hmm \
     python-imaging \
     python-imdbpy \
     python-inotify \
     python-irclib \
-    python-itools \
     python-logilab-common \
     python-libgmail \
-    python-lightmediascanner \
     python-lxml	\
     python-mad \
     python-numarray	\
@@ -48,7 +45,6 @@ RDEPENDS_${PN} = "\
     python-pylint \
     python-pyqt	\
     python-pyraf \
-    python-pyreverse \
     python-pyrex \
     python-pyro \
     python-pyserial \
@@ -63,17 +59,13 @@ RDEPENDS_${PN} = "\
     python-simplejson \
     python-sip \
     python-sgmlop \
-    python-snmplib \
     python-soappy \
     python-spydi \
-    python-spyro \
     python-sqlalchemy \
     python-sqlobject \
     python-tlslite \
-    python-urwid \
-    python-vmaps \
+    python-twisted \
     python-vorbis \
     python-webpy \
     task-python-efl \
-    twisted \
 "
diff --git a/recipes/tasks/task-mamona-systemtap.bb b/recipes/tasks/task-mamona-systemtap.bb
index 84182d6..72a3622 100644
--- a/recipes/tasks/task-mamona-systemtap.bb
+++ b/recipes/tasks/task-mamona-systemtap.bb
@@ -6,6 +6,5 @@ PACKAGES = "${PN}"
 
 RDEPENDS_${PN} = "\
     libcap \
-    systemtap \
     task-mamona-sdk \
 "
diff --git a/recipes/tasks/task-mamona-wm.bb b/recipes/tasks/task-mamona-wm.bb
index 49d3a6a..e2ac612 100644
--- a/recipes/tasks/task-mamona-wm.bb
+++ b/recipes/tasks/task-mamona-wm.bb
@@ -12,6 +12,5 @@ RDEPENDS_${PN} = "\
     libmamona-im-gtk \
     pango-module-basic-x \
     pango-module-basic-fc \
-    aterm \
     midori \
 "
diff --git a/recipes/tasks/task-openmoko-base.bb b/recipes/tasks/task-openmoko-base.bb
index b7b7b58..3c46c56 100644
--- a/recipes/tasks/task-openmoko-base.bb
+++ b/recipes/tasks/task-openmoko-base.bb
@@ -11,7 +11,7 @@ inherit task
 DESCRIPTION_task-openmoko-base = "Openmoko: Top Panel, Application Launcher, Application Manager"
 RDEPENDS_task-openmoko-base = "\
   matchbox-panel-2 \
-  matchbox-panel-2-applets \
+#  matchbox-panel-2-applets \
 #  matchbox-keyboard-inputmethod \
 #  matchbox-keyboard-im \
 #  matchbox-keyboard-applet \
diff --git a/recipes/tasks/task-openmoko-python-devel.bb b/recipes/tasks/task-openmoko-python-devel.bb
index a493183..7b375c0 100644
--- a/recipes/tasks/task-openmoko-python-devel.bb
+++ b/recipes/tasks/task-openmoko-python-devel.bb
@@ -8,5 +8,4 @@ inherit task
 RDEPENDS_task-openmoko-python-devel = "\
   task-python-efl \
   python-pygtk \
-  python-lightmediascanner \
 "
diff --git a/recipes/tasks/task-opie-apps.bb b/recipes/tasks/task-opie-apps.bb
index 2f9cc27..f791c21 100644
--- a/recipes/tasks/task-opie-apps.bb
+++ b/recipes/tasks/task-opie-apps.bb
@@ -8,7 +8,7 @@ PACKAGES = "task-opie-apps task-opie-extra-apps"
 
 RDEPENDS_task-opie-apps = "opie-advancedfm opie-bartender opie-calculator \
                   opie-checkbook opie-clock \
-                  opie-console opie-dagger opie-embeddedkonsole \
+                  opie-console opie-embeddedkonsole \
                   opie-euroconv opie-eye opie-ftp opie-gutenbrowser \
                   opie-helpbrowser opie-irc opie-keypebble opie-odict \
                   opie-oxygen opie-rdesktop opie-reader opie-remote \
diff --git a/recipes/tasks/task-python-sharprom_20060425.bb b/recipes/tasks/task-python-sharprom_20060425.bb
index 16038ad..15776ea 100644
--- a/recipes/tasks/task-python-sharprom_20060425.bb
+++ b/recipes/tasks/task-python-sharprom_20060425.bb
@@ -8,13 +8,20 @@ NONWORKING = "\
 		python-crypto		\
 		python-gammu		\
 		python-gmpy		\
+		python-hmm		\
+		python-itools		\
 		python-pybluez		\
+		python-pyreverse	\
 		python-pysqlite		\
 		python-pygtk		\
 		python-pyqwt		\
+		python-snmplib		\
 		python-sgmlop		\
+		python-spyro		\
 		python-sword            \
-		python-vorbis"
+		python-urwid		\
+		python-vorbis		\
+		python-vmaps"
 
 RDEPENDS_${PN} = "\
 		python-ao 		\
@@ -23,9 +30,7 @@ RDEPENDS_${PN} = "\
 		python-fnorb		\
 		python-fpconst		\
 		python-gnosis		\
-		python-hmm		\
 		python-irclib		\
-		python-itools		\
 		python-libgmail		\
 		python-logilab-common	\
 		python-lxml		\
@@ -45,7 +50,6 @@ RDEPENDS_${PN} = "\
 		python-pylint		\
 		python-pyqt		\
 		python-pyraf		\
-		python-pyreverse	\
 		python-pyro		\
 		python-pyserial		\
 		python-pyvisa		\
@@ -55,17 +59,13 @@ RDEPENDS_${PN} = "\
 		python-scapy		\
 		python-scons		\
 		python-sip		\
-		python-snmplib		\
 		python-soappy		\
 		python-spydi		\
-		python-spyro		\
 		python-tlslite		\
-		python-urwid		\
-		python-vmaps		\
+		python-twisted		\
 		python-webpy		\
 		moin			\
 		plone			\
-		twisted			\
 		zope"
 
 #fixme add python-egenix-mx-base if brought in from nonworking
-- 
1.7.1



