Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TqPKH-0006nr-Oz
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jan 2013 15:29:49 +0100
Received: by mail-ea0-f181.google.com with SMTP id k14so5956269eaa.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jan 2013 06:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=L/uyGxb4rSHRtsuXfU6NX2sNvuNyRqdwIgQQoULbvSs=;
	b=IcFx80ZE1zMadYxr02i/F/PQY5aJqHBqTcmDNJozfwylMm2kWQlSixkC8jdk9S0rl5
	y9EC1lZIhSHjW+NSujhYI+ATcZwCkKUSwbNcGOnyB8zVnOKuBYAgTccSkW6k8xnas9RZ
	2zenk7llnC75kIDMbR+t9mmqmdfj7IpNZDkSKY5TCB8KZZsgPE470JiIAUxcnjpLIOff
	I91cW17QaluZs46Pn3rZB6+YUNjEVaS96LvnN+kxo9ubN9hdyONV6FJ5kdOELu9/YA2C
	JUTWnA9v0mENOSxXiy30qsy0VY/Qf8OvC0jQgZ/GAJfGT9SH6veAZUltJAt3ki/MYuAm
	uy1A==
X-Received: by 10.14.221.5 with SMTP id q5mr125437565eep.33.1357136087657;
	Wed, 02 Jan 2013 06:14:47 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f49sm97795739eep.12.2013.01.02.06.14.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Jan 2013 06:14:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Jan 2013 15:14:47 +0100
Message-Id: <ea5953df69c35734e4859cb62e345f4767f5b89c.1357135909.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1357135909.git.Martin.Jansa@gmail.com>
References: <cover.1357135909.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 6/6] edbus2: fix segfaults in eve/enjoy
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
X-List-Received-Date: Wed, 02 Jan 2013 14:29:50 -0000

* edbus2 is using AC_TRY_RUN in edbus/m4/ac_valist.m4, it does not
  work for us cross-compiling, so let's define it directly
* without this change eve/enjoy segfaults:
  http://sourceforge.net/mailarchive/message.php?msg_id=30297875
* remove HAL from DESCRIPTION, it's from e_dbus

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/edbus2.inc    | 2 +-
 meta-efl/recipes-efl/efl/edbus2_svn.bb | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edbus2.inc b/meta-efl/recipes-efl/efl/edbus2.inc
index 00e2a28..9b41d8b 100644
--- a/meta-efl/recipes-efl/efl/edbus2.inc
+++ b/meta-efl/recipes-efl/efl/edbus2.inc
@@ -1,4 +1,4 @@
-DESCRIPTION = "DBus and HAL convenience wrappers for EFL"
+DESCRIPTION = "DBus convenience wrappers for EFL"
 DEPENDS = "dbus ecore eina"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4ed65f801204783f71fedafc082038d9"
diff --git a/meta-efl/recipes-efl/efl/edbus2_svn.bb b/meta-efl/recipes-efl/efl/edbus2_svn.bb
index 1461d46..7d58326 100644
--- a/meta-efl/recipes-efl/efl/edbus2_svn.bb
+++ b/meta-efl/recipes-efl/efl/edbus2_svn.bb
@@ -2,9 +2,11 @@ require ${BPN}.inc
 
 SRCREV = "${EFL_SRCREV}"
 PV = "1.7.99+svnr${SRCPV}"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 DEFAULT_PREFERENCE = "-1"
 
+CACHED_CONFIGUREVARS += "ac_cv_valistasarray=yes"
+
 SRC_URI = "\
   ${E_SVN}/trunk/IN-EFL;module=${SRCNAME};protocol=http;scmdata=keep \
 "
-- 
1.8.0.2



