Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAhX-0001Zf-KQ
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:51:39 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2044586fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=70JaUffZ1GhXu1Gs1tbgbFaNRemwWAAGbLmkeEBwhxI=;
	b=R2u7M81gxNR7mshoQlV2xujS1kQYXPWzOVJ0TQxjUsCtCzupgYdSPx8wON7Dkim7wH
	pEL4Ydx6ELpQ1wsW5TavxfH0yXBEyCQ+KX9jSm0gNkvnv9G10gBXoWvRXjYXcOz6yzws
	Br75Nb/xEO6BSNDK5PcD5lcjgy1U16ZMlHwD8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=Jtc3fNFOWc2kUvvWZTqt0m9bTiOON++KKQlgNu5tf8g+obuxH4vjsXLMK3mB+Mv/ML
	9UZ0kJ85D65tEMzIRr6IS/e7v7uzGnkpjja1/5cIl2kVqGEDudAeFvIhNbKgUXPVPuUo
	q52jb1zCv2qbwCpGnTmujjR+/G5lBV/HDCEJI=
Received: by 10.181.50.1 with SMTP id c1mr1741542bkk.3.1226237364598;
	Sun, 09 Nov 2008 05:29:24 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.22
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:23 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:15 +0300
Message-Id: <1226237296-11012-15-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-14-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-10-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-11-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-12-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-13-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-14-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] tasks: fix building with current libtool
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
X-List-Received-Date: Sun, 09 Nov 2008 13:51:39 -0000

current libtool requires AC_PROG_LIBTOOL in configure.ac
Include it to make libtool/autoconf happy.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/pimlico/tasks-0.13/libtool.diff |   10 ++++++++++
 packages/pimlico/tasks_0.13.bb           |    2 +-
 2 files changed, 11 insertions(+), 1 deletions(-)
 create mode 100644 packages/pimlico/tasks-0.13/libtool.diff

diff --git a/packages/pimlico/tasks-0.13/libtool.diff b/packages/pimlico/tasks-0.13/libtool.diff
new file mode 100644
index 0000000..f2cd6d2
--- /dev/null
+++ b/packages/pimlico/tasks-0.13/libtool.diff
@@ -0,0 +1,10 @@
+--- configure.ac.orig	2008-10-30 03:57:29.038510760 +0300
++++ configure.ac	2008-10-30 03:55:28.066512503 +0300
+@@ -3,6 +3,7 @@
+ AC_CONFIG_SRCDIR(libkoto/koto-task-store.c)
+ AC_CONFIG_HEADERS([libkoto/config.h])
+ AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
++AC_PROG_LIBTOOL
+
+ AM_DISABLE_STATIC
+ AC_PROG_CPP
diff --git a/packages/pimlico/tasks_0.13.bb b/packages/pimlico/tasks_0.13.bb
index ff8da56..37d01d9 100644
--- a/packages/pimlico/tasks_0.13.bb
+++ b/packages/pimlico/tasks_0.13.bb
@@ -1,4 +1,4 @@
 require tasks.inc
 
 SRC_URI = "http://pimlico-project.org/sources/${PN}/${PN}-${PV}.tar.gz \
-        file://tasks-owl.diff;patch=1;pnum=0"
+        file://tasks-owl.diff;patch=1;pnum=0 file://libtool.diff;patch=1;pnum=0"
-- 
1.5.6.5



