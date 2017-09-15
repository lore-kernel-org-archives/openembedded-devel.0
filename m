Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2B250771A3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 06:44:38 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h4so830977pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 23:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XiFV0NpOHl01EK+TXFtgny52by+IQVLU/kxZsxve6Nk=;
	b=m6/YpHU0au5zHrC4vhOghwCnxr+hxRyiCy1vD81BZOSlOG9u9uXHKML/JwyKg4zsfv
	u1U6BTWobgmA8nXJUxoz4wsiTvuK9J1Uqj0XR0z+FJ9bhNFtx4t/5krx40+eqjXReoPC
	UTHd/HV+zxKngy/KmTSPudJQ1l4JXZs2F8YMQCo8uKsKZAkj+Curf6PeY2/XMLsk0p3v
	LulsyXm0af9IwuuLiiMbwAk9liRpXg65Vv9SpvhSPqHvv1e+kHjLcETNCm1ge3ufxbMA
	L5PPdycBdYor5F/g7tgYSq4jpyngv4ec1S9g24gmgjoMBMO+j17R1T6xr75VW+yPXwvz
	GDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XiFV0NpOHl01EK+TXFtgny52by+IQVLU/kxZsxve6Nk=;
	b=glEQaaskvmxFyt5AT/X2AGjC1R/YM8XUEWh6L7/sLQmjj49bnBR5DOKHbGhDr8XNnj
	0f75eNl8Y5aDtznqVIcObCjIbomE1VIHCLQh1l/1tXcDvRi3BRbNwbOv41+7T/3mqA5N
	EwAsJs5v90UVGlzIk53S14mjLHOllw6WyrTZbmW/XIPkSbXgFGIxIgp0qHadViz3k148
	sg/vbG61Xs8gvIe2xQcOv0Qt9vIoQebRQ8zPlQRMEO4bK3WoxNfo1teadEHIqYZsxsWQ
	asOXes88XQExYmlv/TqT8Onxby+hKI/nGkuYveXCIWjnPPQsLNRhdNCGxkTFhAYl/qUA
	61ag==
X-Gm-Message-State: AHPjjUg0DezzqI8bW1pWDj8J8PX3qh7THEt3UEe82DShldkusxhWnVMQ
	A2QYt1MezzO6vsMj
X-Google-Smtp-Source: ADKCNb6T7naxQRL+pqA8ol9WMZYAmwf0EGzGG3sEQ8jrk0uc+BMS4Dchp0M1xJ8xTwfpVmAl/G1yFQ==
X-Received: by 10.84.235.4 with SMTP id o4mr26702593plk.357.1505457880025;
	Thu, 14 Sep 2017 23:44:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	r11sm642470pfg.180.2017.09.14.23.44.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 23:44:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 23:44:29 -0700
Message-Id: <20170915064430.35932-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170915064430.35932-1-raj.khem@gmail.com>
References: <20170915064430.35932-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] openhpi: Fix build with musl
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
X-List-Received-Date: Fri, 15 Sep 2017 06:44:39 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/0001-ipmidirect-Replace-__STRING.patch   | 31 ++++++++++++++
 ...ck-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch | 47 ++++++++++++++++++++++
 .../recipes-daemons/openhpi/openhpi_3.6.1.bb       | 11 ++---
 3 files changed, 84 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch
 create mode 100644 meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch

diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch b/meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch
new file mode 100644
index 000000000..4d56f6535
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/0001-ipmidirect-Replace-__STRING.patch
@@ -0,0 +1,31 @@
+From be40b3f11460cf495bbbef45692e7763afda0c2b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 17:56:31 -0700
+Subject: [PATCH] ipmidirect: Replace __STRING
+
+__STRING is not universally available e.g.
+musl does not define it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ plugins/ipmidirect/t/test.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/plugins/ipmidirect/t/test.h b/plugins/ipmidirect/t/test.h
+index 8d71381..978d5ff 100644
+--- a/plugins/ipmidirect/t/test.h
++++ b/plugins/ipmidirect/t/test.h
+@@ -22,7 +22,7 @@ TestFunction( const char *str, const char *file, int line, bool expr )
+ }
+ 
+ 
+-#define Test(expr) TestFunction( __STRING(expr), __FILE__, __LINE__, expr )
++#define Test(expr) TestFunction( #expr, __FILE__, __LINE__, expr )
+ 
+ 
+ static int
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch b/meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch
new file mode 100644
index 000000000..0f033ac85
--- /dev/null
+++ b/meta-networking/recipes-daemons/openhpi/files/0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch
@@ -0,0 +1,47 @@
+From be665d9513cca7e8b64c79ae424cf44ac166b052 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 17:07:58 -0700
+Subject: [PATCH] plugins: Check for PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
+ before use
+
+musl does not define PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
+so we can not assume that all Linux systems support PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
+its a glibc specific define so check for it being defined before using it
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ plugins/dynamic_simulator/thread.cpp | 2 +-
+ plugins/ipmidirect/thread.cpp        | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/plugins/dynamic_simulator/thread.cpp b/plugins/dynamic_simulator/thread.cpp
+index d663be0..9210fd7 100644
+--- a/plugins/dynamic_simulator/thread.cpp
++++ b/plugins/dynamic_simulator/thread.cpp
+@@ -229,7 +229,7 @@ cThread::Exit( void *rv )
+ /**
+  * Constructor
+  **/
+-#if ( defined(__sun) && defined(__SVR4) ) || defined(__FreeBSD__)
++#ifndef PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
+ cThreadLock::cThreadLock()
+ {
+   pthread_mutexattr_t attr;
+diff --git a/plugins/ipmidirect/thread.cpp b/plugins/ipmidirect/thread.cpp
+index 5c52557..48e83fa 100644
+--- a/plugins/ipmidirect/thread.cpp
++++ b/plugins/ipmidirect/thread.cpp
+@@ -167,7 +167,7 @@ cThread::Exit( void *rv )
+ //                  cThreadLock
+ //////////////////////////////////////////////////
+ 
+-#if ( defined(__sun) && defined(__SVR4) ) || defined(__FreeBSD__)
++#ifndef PTHREAD_RECURSIVE_MUTEX_INITIALIZER_NP
+ cThreadLock::cThreadLock()
+ {
+   pthread_mutexattr_t attr;
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
index 6375c2ee0..ecf71d70f 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.6.1.bb
@@ -23,6 +23,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e3c772a32386888ccb5ae1c0ba95f1a4"
 DEPENDS = "net-snmp libxml2 ncurses openssl glib-2.0 popt e2fsprogs autoconf-archive-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://openhpi.init \
+           file://openhpid.service \
+           file://run-ptest \
            file://openhpi-netsnmp-cross-compile.patch \
            file://openhpi-sysfs-cross-compile.patch \
            file://openhpi-libxml2-cross-compile.patch \
@@ -39,11 +42,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://c++11.patch \
            file://clang-c++11.patch \
            file://fix-narrowing-warning.patch \
-           \
-           file://openhpi.init \
-           file://openhpid.service \
-           file://run-ptest \
-"
+           file://0001-plugins-Check-for-PTHREAD_RECURSIVE_MUTEX_INITIALIZE.patch \
+           file://0001-ipmidirect-Replace-__STRING.patch \
+           "
 
 SRC_URI[md5sum] = "4718b16e0f749b5ad214a9b04f45dd23"
 SRC_URI[sha256sum] = "e0a810cb401c4bdcfc9551f2e6afd5a8ca4b411f5ee3bc60c19f82fd6e84a3dc"
-- 
2.14.1


