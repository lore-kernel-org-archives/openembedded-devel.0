Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1PB52N-0007TL-7U
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Oct 2010 14:23:28 +0200
Received: by ewy2 with SMTP id 2so199843ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=xR7/m1bcIaKg3kDPZLeZLU6PcIz8nY+906VBjoftI8M=;
	b=il1NsZUZWZ798PNtz9ImTnMxoTjauOHOmQ850rDWAknsv2uF/sOH/YIxEoBZY7iv8Q
	+c7/+PTa+P08wNlWG0YtB1dYamRGHVOd+Tpd7RG4LwwY9lDHss5Hrh0strG18Y8D2kZQ
	k8xU9j7pOgIQgzrxm9985ZgnoMV/04mJvehXo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=iF80M9gSEwzJVM5HXoi8JkxzU9OV+vXyKR00SB3sFwRsoiZPR1GG1tKQGIeW4wTzyK
	qoj0XEe2/WSR50uxLKGqO3qAlgybH5Q7R+7U9k3WajuiAitFSkeDdah0Hyve4ZwN4G3v
	AVpY/M42Ec2eHbgsuaAxTIOg378ils62/4OJI=
Received: by 10.213.14.19 with SMTP id e19mr8181240eba.14.1288182160708;
	Wed, 27 Oct 2010 05:22:40 -0700 (PDT)
Received: from localhost.localdomain (147.84-49-231.nextgentel.com
	[84.49.231.147])
	by mx.google.com with ESMTPS id x54sm9633593eeh.5.2010.10.27.05.22.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Oct 2010 05:22:40 -0700 (PDT)
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Oct 2010 14:22:59 +0200
Message-Id: <1288182179-22284-1-git-send-email-tasskjapp@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Subject: [PATCH] New recipe: Python bindings for libconfig.
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
X-List-Received-Date: Wed, 27 Oct 2010 12:23:28 -0000


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
 .../files/0001-rename-boost-python-library.patch   |   25 ++++++++++++++++++++
 recipes/python/python-libconfig_git.bb             |   18 ++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/files/0001-rename-boost-python-library.patch
 create mode 100644 recipes/python/python-libconfig_git.bb

diff --git a/recipes/python/files/0001-rename-boost-python-library.patch b/recipes/python/files/0001-rename-boost-python-library.patch
new file mode 100644
index 0000000..2817370
--- /dev/null
+++ b/recipes/python/files/0001-rename-boost-python-library.patch
@@ -0,0 +1,25 @@
+From 263ea3af06761d00acfeec52cb582a0b0381d361 Mon Sep 17 00:00:00 2001
+From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
+Date: Wed, 27 Oct 2010 11:05:18 +0200
+Subject: [PATCH] use boost_python_mt instead of boost_python
+
+---
+ setup.py |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 5066fc2..ec8c1b7 100644
+--- a/setup.py
++++ b/setup.py
+@@ -19,7 +19,7 @@ setup(
+         Extension(
+             "pylibconfig",
+             ["src/pylibconfig.cc"],
+-            libraries=["boost_python", "config++"]
++            libraries=["boost_python-mt", "config++"]
+             #include_dirs=includes,
+             #extra_link_args=lflags
+                  )
+-- 
+1.7.1
+
diff --git a/recipes/python/python-libconfig_git.bb b/recipes/python/python-libconfig_git.bb
new file mode 100644
index 0000000..b2a2a0e
--- /dev/null
+++ b/recipes/python/python-libconfig_git.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Python bindings for libconfig"
+SECTION = "devel/python"
+LICENSE = "BSD"
+DEPENDS = "boost libconfig"
+SRCNAME = "pylibconfig"
+
+SRC_URI = "git://github.com/cnangel/python-libconfig.git;protocol=git \
+           file://0001-rename-boost-python-library.patch "
+
+inherit setuptools
+
+S = "${WORKDIR}/git"
+
+SRCREV = "b29f9e99e163a1a9adce"
+PR ="r01"
+PV = "${PR}+gitr${SRCREV}"
+
+
-- 
1.7.1



