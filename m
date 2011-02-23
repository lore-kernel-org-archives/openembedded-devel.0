Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PsETC-0000sC-Oy
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 14:09:31 +0100
Received: by mail-gw0-f50.google.com with SMTP id a20so1107689gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 05:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=1/d2fzww/tSM6f/qHa3eHvyIHBEhtfs66OMo17U8rjw=;
	b=WkL25ae6bl2e4cVSenlUmZLlgzfG4r+J4mGR3RYfK6GtMGLq+MsQrcfsKcH9ErMCy8
	9MgfE3XkfACuIVU0GxgNfoXykztygTyglRudCRx4XZ3p/PCUslq7Nf0suxVE+8FAaGl9
	AW7P3h11RFredpvYmuWHbvbF/Gs7/J8nZHr3Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=E0xllrb2J34YQS8W78jKk3DREgcGQG4vJP6YlhNHAV4Dmh5rFoSGnqvGnab4rrdjlM
	3HJa/iVo9wVncrLi6sZb5RI8TqeCIH4oJDC4TSf2RjmdVwvDyXaETfk6Z6ZMy02eDxIF
	pAF23ndk26pk10u81kAHLSCt4Sbopv/V4rEkA=
Received: by 10.236.95.17 with SMTP id o17mr7242338yhf.35.1298466493231;
	Wed, 23 Feb 2011 05:08:13 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n10sm2276929yhb.38.2011.02.23.05.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Feb 2011 05:08:12 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 13:07:20 +0000
Message-Id: <1298466445-16486-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
References: <1298466445-16486-1-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-2-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-3-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-4-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-5-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-6-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-7-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-8-git-send-email-otavio@ossystems.com.br>
	<1298466445-16486-9-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 09/14] contrib/openembedded-essential (debian): rename to be version agnostic
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
X-List-Received-Date: Wed, 23 Feb 2011 13:09:31 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../openembedded-essential-1.4/debian/changelog    |   34 --------------------
 .../openembedded-essential-1.4/debian/compat       |    1 -
 .../openembedded-essential-1.4/debian/control      |   17 ----------
 .../openembedded-essential-1.4/debian/copyright    |   12 -------
 .../debian/openembedded-essential-1.4/debian/rules |   21 ------------
 .../debian/openembedded-essential-1.4/ubuntu.patch |   22 -------------
 .../debian/openembedded-essential/debian/changelog |   34 ++++++++++++++++++++
 .../debian/openembedded-essential/debian/compat    |    1 +
 .../debian/openembedded-essential/debian/control   |   17 ++++++++++
 .../debian/openembedded-essential/debian/copyright |   12 +++++++
 .../debian/openembedded-essential/debian/rules     |   21 ++++++++++++
 .../debian/openembedded-essential/ubuntu.patch     |   22 +++++++++++++
 12 files changed, 107 insertions(+), 107 deletions(-)
 delete mode 100644 contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog
 delete mode 100644 contrib/distro-packages/debian/openembedded-essential-1.4/debian/compat
 delete mode 100644 contrib/distro-packages/debian/openembedded-essential-1.4/debian/control
 delete mode 100644 contrib/distro-packages/debian/openembedded-essential-1.4/debian/copyright
 delete mode 100755 contrib/distro-packages/debian/openembedded-essential-1.4/debian/rules
 delete mode 100644 contrib/distro-packages/debian/openembedded-essential-1.4/ubuntu.patch
 create mode 100644 contrib/distro-packages/debian/openembedded-essential/debian/changelog
 create mode 100644 contrib/distro-packages/debian/openembedded-essential/debian/compat
 create mode 100644 contrib/distro-packages/debian/openembedded-essential/debian/control
 create mode 100644 contrib/distro-packages/debian/openembedded-essential/debian/copyright
 create mode 100755 contrib/distro-packages/debian/openembedded-essential/debian/rules
 create mode 100644 contrib/distro-packages/debian/openembedded-essential/ubuntu.patch

diff --git a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog b/contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog
deleted file mode 100644
index 8485f3e..0000000
--- a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog
+++ /dev/null
@@ -1,34 +0,0 @@
-openembedded-essential (1.4) unstable; urgency=low
-
-  * remove gfortran from dependency after a5c7b007eaa675cc904f5285291d2f8a597efc84 caused controversy.
-    Ultimately it was decided that OE should not depend on gfortran and that another solution ought
-    to be found.  The gfortran check in sanity.bbclass was dropped in 63c7ad87655c2781ad8b9c81af430596f48a24a6
-  * add bc and python-pysqlite2 for rpm
-
- -- Rolf Leggewie <oe-devel@rolf.leggewie.biz>  Mon, 19 Jan 2008 14:25:00 +0100
-
-openembedded-essential (1.3) unstable; urgency=low
-
-  * add gfortran as dependency to complement a5c7b007eaa675cc904f5285291d2f8a597efc84
-
- -- Rolf Leggewie <oe-devel@rolf.leggewie.biz>  Mon, 7 Jan 2008 20:25:00 +0100
-
-openembedded-essential (1.2) unstable; urgency=low
-
-  * fixed packaging to make lintian happy
-  * switched to native numbering
-
- -- Marcin Juszkiewicz <hrw@openembedded.org>  Wed,  8 Nov 2006 11:17:42 +0100
-
-openembedded-essential (1.1) unstable; urgency=low
-
-  * added gawk
-
- -- Marcin Juszkiewicz <hrw@openembedded.org>  Wed,  8 Nov 2006 11:17:42 +0100
-
-openembedded-essential (1.0-1) unstable; urgency=low
-
-  * Initial release
-
- -- Marcin Juszkiewicz <hrw@openembedded.org>  Tue, 17 Oct 2006 12:05:35 +0200
-
diff --git a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/compat b/contrib/distro-packages/debian/openembedded-essential-1.4/debian/compat
deleted file mode 100644
index 7ed6ff8..0000000
--- a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/compat
+++ /dev/null
@@ -1 +0,0 @@
-5
diff --git a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/control b/contrib/distro-packages/debian/openembedded-essential-1.4/debian/control
deleted file mode 100644
index 9f1e095..0000000
--- a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/control
+++ /dev/null
@@ -1,17 +0,0 @@
-Source: openembedded-essential
-Section: devel
-Priority: optional
-Maintainer: Marcin Juszkiewicz <hrw@openembedded.org>
-Build-Depends: debhelper (>= 5)
-Standards-Version: 3.7.3
-
-Package: openembedded-essential
-Architecture: all
-Depends: python (>= 2.3), ccache, build-essential, quilt, bison, wget, cvs, subversion, git-core, monotone, coreutils, unzip, texi2html, texinfo, libsdl1.2-dev, docbook-utils, gawk, bc, python-pysqlite2, help2man
-Description: Metapackage to install all needed packages to start using OpenEmbedded
- OpenEmbedded is a full-featured development environment allowing users to
- target a wide variety of devices. Supporting multiple build, release paths and
- configurations, OpenEmbedded extends the capabilities of your build and
- release engineers. OpenEmbedded uses compilation and configuration caching at
- most levels to increase developer productivity.
- This metapackage depends on all software required by OpenEmbedded.
diff --git a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/copyright b/contrib/distro-packages/debian/openembedded-essential-1.4/debian/copyright
deleted file mode 100644
index 9e4905f..0000000
--- a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/copyright
+++ /dev/null
@@ -1,12 +0,0 @@
-This package was debianized by Marcin Juszkiewicz <hrw@hrw.one.pl> on
-Tue, 17 Oct 2006 12:05:35 +0200.
-
-Upstream Author: Marcin Juszkiewicz <hrw@hrw.one.pl>
-
-Copyright: 
-2006 Marcin Juszkiewicz <hrw@hrw.one.pl>
-
-License: GPLv2
-
-The Debian packaging is (C) 2006, Marcin Juszkiewicz <hrw@hrw.one.pl> and
-is licensed under the GPLv2, see `/usr/share/common-licenses/GPL-2'.
diff --git a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/rules b/contrib/distro-packages/debian/openembedded-essential-1.4/debian/rules
deleted file mode 100755
index 22ac384..0000000
--- a/contrib/distro-packages/debian/openembedded-essential-1.4/debian/rules
+++ /dev/null
@@ -1,21 +0,0 @@
-#!/usr/bin/make -f
-
-build:
-binary-arch:
-
-clean:
-	dh_clean
-
-binary-indep:
-	dh_testdir
-	dh_testroot
-	dh_installchangelogs 
-	dh_compress
-	dh_fixperms
-	dh_installdeb
-	dh_gencontrol
-	dh_md5sums
-	dh_builddeb
-
-binary: binary-indep
-.PHONY: build clean binary-indep binary binary-arch
diff --git a/contrib/distro-packages/debian/openembedded-essential-1.4/ubuntu.patch b/contrib/distro-packages/debian/openembedded-essential-1.4/ubuntu.patch
deleted file mode 100644
index 80863d5..0000000
--- a/contrib/distro-packages/debian/openembedded-essential-1.4/ubuntu.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-#
-# old_revision [63896b37ec0e055133c2e295f7c89e4677091511]
-#
-# patch "contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog"
-#  from [b1e7c5d0ed3dddbab736f23b57df2386b6937e4d]
-#    to [bb02f8caa6f5eaa903b4d65150392583072c7bea]
-#
-============================================================
---- contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog  
-b1e7c5d0ed3dddbab736f23b57df2386b6937e4d
-+++ contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog  
-bb02f8caa6f5eaa903b4d65150392583072c7bea
-@@ -1,3 +1,9 @@
-+openembedded-essential (1.4ubuntu1) gutsy; urgency=low
-+
-+  * prepare ubuntu package
-+
-+ -- Rolf Leggewie <oe-devel@rolf.leggewie.biz>  Thu, 24 Jan 2008 13:49:26 +0100
-+
- openembedded-essential (1.4) unstable; urgency=low
- 
-   * remove gfortran from dependency after a5c7b007eaa675cc904f5285291d2f8a597efc84 caused controversy.
diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/changelog b/contrib/distro-packages/debian/openembedded-essential/debian/changelog
new file mode 100644
index 0000000..8485f3e
--- /dev/null
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/changelog
@@ -0,0 +1,34 @@
+openembedded-essential (1.4) unstable; urgency=low
+
+  * remove gfortran from dependency after a5c7b007eaa675cc904f5285291d2f8a597efc84 caused controversy.
+    Ultimately it was decided that OE should not depend on gfortran and that another solution ought
+    to be found.  The gfortran check in sanity.bbclass was dropped in 63c7ad87655c2781ad8b9c81af430596f48a24a6
+  * add bc and python-pysqlite2 for rpm
+
+ -- Rolf Leggewie <oe-devel@rolf.leggewie.biz>  Mon, 19 Jan 2008 14:25:00 +0100
+
+openembedded-essential (1.3) unstable; urgency=low
+
+  * add gfortran as dependency to complement a5c7b007eaa675cc904f5285291d2f8a597efc84
+
+ -- Rolf Leggewie <oe-devel@rolf.leggewie.biz>  Mon, 7 Jan 2008 20:25:00 +0100
+
+openembedded-essential (1.2) unstable; urgency=low
+
+  * fixed packaging to make lintian happy
+  * switched to native numbering
+
+ -- Marcin Juszkiewicz <hrw@openembedded.org>  Wed,  8 Nov 2006 11:17:42 +0100
+
+openembedded-essential (1.1) unstable; urgency=low
+
+  * added gawk
+
+ -- Marcin Juszkiewicz <hrw@openembedded.org>  Wed,  8 Nov 2006 11:17:42 +0100
+
+openembedded-essential (1.0-1) unstable; urgency=low
+
+  * Initial release
+
+ -- Marcin Juszkiewicz <hrw@openembedded.org>  Tue, 17 Oct 2006 12:05:35 +0200
+
diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/compat b/contrib/distro-packages/debian/openembedded-essential/debian/compat
new file mode 100644
index 0000000..7ed6ff8
--- /dev/null
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/compat
@@ -0,0 +1 @@
+5
diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/control b/contrib/distro-packages/debian/openembedded-essential/debian/control
new file mode 100644
index 0000000..9f1e095
--- /dev/null
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/control
@@ -0,0 +1,17 @@
+Source: openembedded-essential
+Section: devel
+Priority: optional
+Maintainer: Marcin Juszkiewicz <hrw@openembedded.org>
+Build-Depends: debhelper (>= 5)
+Standards-Version: 3.7.3
+
+Package: openembedded-essential
+Architecture: all
+Depends: python (>= 2.3), ccache, build-essential, quilt, bison, wget, cvs, subversion, git-core, monotone, coreutils, unzip, texi2html, texinfo, libsdl1.2-dev, docbook-utils, gawk, bc, python-pysqlite2, help2man
+Description: Metapackage to install all needed packages to start using OpenEmbedded
+ OpenEmbedded is a full-featured development environment allowing users to
+ target a wide variety of devices. Supporting multiple build, release paths and
+ configurations, OpenEmbedded extends the capabilities of your build and
+ release engineers. OpenEmbedded uses compilation and configuration caching at
+ most levels to increase developer productivity.
+ This metapackage depends on all software required by OpenEmbedded.
diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/copyright b/contrib/distro-packages/debian/openembedded-essential/debian/copyright
new file mode 100644
index 0000000..9e4905f
--- /dev/null
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/copyright
@@ -0,0 +1,12 @@
+This package was debianized by Marcin Juszkiewicz <hrw@hrw.one.pl> on
+Tue, 17 Oct 2006 12:05:35 +0200.
+
+Upstream Author: Marcin Juszkiewicz <hrw@hrw.one.pl>
+
+Copyright: 
+2006 Marcin Juszkiewicz <hrw@hrw.one.pl>
+
+License: GPLv2
+
+The Debian packaging is (C) 2006, Marcin Juszkiewicz <hrw@hrw.one.pl> and
+is licensed under the GPLv2, see `/usr/share/common-licenses/GPL-2'.
diff --git a/contrib/distro-packages/debian/openembedded-essential/debian/rules b/contrib/distro-packages/debian/openembedded-essential/debian/rules
new file mode 100755
index 0000000..22ac384
--- /dev/null
+++ b/contrib/distro-packages/debian/openembedded-essential/debian/rules
@@ -0,0 +1,21 @@
+#!/usr/bin/make -f
+
+build:
+binary-arch:
+
+clean:
+	dh_clean
+
+binary-indep:
+	dh_testdir
+	dh_testroot
+	dh_installchangelogs 
+	dh_compress
+	dh_fixperms
+	dh_installdeb
+	dh_gencontrol
+	dh_md5sums
+	dh_builddeb
+
+binary: binary-indep
+.PHONY: build clean binary-indep binary binary-arch
diff --git a/contrib/distro-packages/debian/openembedded-essential/ubuntu.patch b/contrib/distro-packages/debian/openembedded-essential/ubuntu.patch
new file mode 100644
index 0000000..80863d5
--- /dev/null
+++ b/contrib/distro-packages/debian/openembedded-essential/ubuntu.patch
@@ -0,0 +1,22 @@
+#
+# old_revision [63896b37ec0e055133c2e295f7c89e4677091511]
+#
+# patch "contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog"
+#  from [b1e7c5d0ed3dddbab736f23b57df2386b6937e4d]
+#    to [bb02f8caa6f5eaa903b4d65150392583072c7bea]
+#
+============================================================
+--- contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog  
+b1e7c5d0ed3dddbab736f23b57df2386b6937e4d
++++ contrib/distro-packages/debian/openembedded-essential-1.4/debian/changelog  
+bb02f8caa6f5eaa903b4d65150392583072c7bea
+@@ -1,3 +1,9 @@
++openembedded-essential (1.4ubuntu1) gutsy; urgency=low
++
++  * prepare ubuntu package
++
++ -- Rolf Leggewie <oe-devel@rolf.leggewie.biz>  Thu, 24 Jan 2008 13:49:26 +0100
++
+ openembedded-essential (1.4) unstable; urgency=low
+ 
+   * remove gfortran from dependency after a5c7b007eaa675cc904f5285291d2f8a597efc84 caused controversy.
-- 
1.7.2.3



