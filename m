Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PVgGR-0005u6-FY
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Dec 2010 09:11:07 +0100
Received: by fxm17 with SMTP id 17so5963426fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=rPj/8v3K/eVXhUf7c+hpFAb7ytaSdShwfkIwxZUgJOg=;
	b=sRN5avMEz1/5MbA/VSYoJ5kg/kHfCse76pvNjX77Sd+mPyl1mFujf59fvayyrX/aP9
	4gB65RbTXJj7nuNNcIYils8lvxqhvhIu/s48KGsSnhKY/YO6iXX0hw/11DaEuTYBqJfq
	VNpbU9ViTmU4RJIVuGh1BvvSACvQZc1KpNmSQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RvGYbONWuaE/nQTzVY6CMZYHEaszED5m1P0q/djtZUjaiVINcCNYOyZevuaAYWU/fB
	jsJ+Ja75H24OW3DWOVVZ9j3KeQYuuHexpmjJCqST1UIiJqqvcBJ6e/NE15/ZCZGF3UV3
	bs3y5kPHqn9erFxGbW996ioo0cC57eJ8b9Aaw=
Received: by 10.223.83.4 with SMTP id d4mr3955552fal.59.1293091857088;
	Thu, 23 Dec 2010 00:10:57 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a25sm1931457fak.44.2010.12.23.00.10.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Dec 2010 00:10:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Dec 2010 09:10:50 +0100
Message-Id: <1293091850-26441-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] dbus: upgrade 1.4.0 to 1.4.1 and make it new default CVE-2010-4352
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
X-List-Received-Date: Thu, 23 Dec 2010 08:11:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/preferred-shr-versions.inc |    2 --
 recipes/dbus/dbus_1.4.0.bb                     |   18 ------------------
 recipes/dbus/dbus_1.4.1.bb                     |   15 +++++++++++++++
 3 files changed, 15 insertions(+), 20 deletions(-)
 delete mode 100644 recipes/dbus/dbus_1.4.0.bb
 create mode 100644 recipes/dbus/dbus_1.4.1.bb

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 1c336b3..6a96798 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -1,7 +1,5 @@
 # Upgraded
 # use newer version then preferred by default
-PREFERRED_VERSION_dbus = "1.4.0"
-PREFERRED_VERSION_dbus-native = "1.4.0"
 PREFERRED_VERSION_libmikmod = "3.2.0-beta2"
 PREFERRED_VERSION_strace = "4.5.15"
 PREFERRED_VERSION_emacs-x11 = "23.1"
diff --git a/recipes/dbus/dbus_1.4.0.bb b/recipes/dbus/dbus_1.4.0.bb
deleted file mode 100644
index 2c4943b..0000000
--- a/recipes/dbus/dbus_1.4.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-include dbus.inc
-PR = "${INC_PR}.0"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI = "\
-  http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
-  \
-  file://tmpdir.patch \
-  file://add-configurable-reply-timeouts.patch \
-  file://dbus-1.init \
-"            
-
-# This needs more testing before pushing as default dbus
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI[md5sum] = "f59618b18d2fb2bd1fce9e1c5a2a3282"
-SRC_URI[sha256sum] = "c96d2f86d40e158e2bf405925a0a42cce0533a8466098e2f2238aa1614926652"
diff --git a/recipes/dbus/dbus_1.4.1.bb b/recipes/dbus/dbus_1.4.1.bb
new file mode 100644
index 0000000..5dec10e
--- /dev/null
+++ b/recipes/dbus/dbus_1.4.1.bb
@@ -0,0 +1,15 @@
+include dbus.inc
+PR = "${INC_PR}.0"
+
+BBCLASSEXTEND = "native"
+
+SRC_URI = "\
+  http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
+  \
+  file://tmpdir.patch \
+  file://add-configurable-reply-timeouts.patch \
+  file://dbus-1.init \
+"            
+
+SRC_URI[md5sum] = "99cb057700c0455fb68f8d57902f77ac"
+SRC_URI[sha256sum] = "caa1a0ded2d0f2e95c1d4ec7e3c8bd44834928c5b0ed41a7189963f3593983bd"
-- 
1.7.3.4



