Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id E54DE7F9B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 13:03:20 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id i3so8818840qvv.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 05:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=XTVqLLe4tPH4iiPV+SQ2zuvAKH1CsMNb/DW28wKTiLg=;
	b=jHnT2MX17ypV93uQ6V3L2yRtbBM0E1/6QCHEWkjQOholUWBWJ5A9VQvMYJU8dC5A2D
	lvX4kgpAXnZINcLQWbpB/SnVaVjipcl0tj9CDwXyqFviKdzJ6wpUo9NJAJGOIsPCJ3Me
	n11l5jQmNgK3fbuMQjE3dctm/KpGJOqqeWmfQyEv1jgLQz7ZoGAKfqIrKF8/fwE5GvVL
	pvhfbiIYcuIQxtw0vDCV58Y2vhDOr2pieP3LjecgV3POwgW7xksGVvpqAasx6RIpU4I5
	DD1Bcc3qEeTj3QiczsFkH7Asz2lUMO8dLH1sFTVewz27iOI0wW+4wrdyBP2PPhtFE3IG
	kqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=XTVqLLe4tPH4iiPV+SQ2zuvAKH1CsMNb/DW28wKTiLg=;
	b=NldkRiDd+cfsZ1y6JlO14xi8TKvgcLheaRPWNYedIiBX9fcK9dmN+LTDxH755eeXB0
	cHeM4kqRc7R7crLPPBiHvJQJ43G1YFSZz6OckJLZjCYGaznG3PzFN0XMFs/3/ngcEJAB
	Yl7Cjyv2TzTf//BtFYspEaD0ecA0jZWFPRrvjEei54EV0HMmnrMJ1JEhMa6K3hVl9CkZ
	rEWn28baBRpv6ilp5LmDkgDkhPdvYJ0IQhQk8tjVgQjj4yNl5MrvS5g5w+/XW/bnDuep
	sC+DY9kh5vDnkuKQLaS1kjiXVGPii+xsgGd0XqqziPjDSwb4TWOczs9xZVSzF1LbdLWX
	Lhjw==
X-Gm-Message-State: APjAAAXLaTQuqOfRP8vwaA1ctjQzHE302HbdXSf+SroiKBzhIl+wE4ib
	liv1eEYOHtuQEgK84QdyxM+cVT1fo0fw4Q==
X-Google-Smtp-Source: APXvYqxyxDul4VqN3Z3YtXhOSguBu4yjkVirg5RAF5GrXp7iMG23efD4JMcoIa3uljWEYayg5DVKcA==
X-Received: by 2002:a0c:fe81:: with SMTP id d1mr4549382qvs.7.1574859801402;
	Wed, 27 Nov 2019 05:03:21 -0800 (PST)
Received: from centrium.lab.ossystems ([189.103.49.163])
	by smtp.gmail.com with ESMTPSA id
	y91sm7735101qtd.28.2019.11.27.05.03.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 05:03:20 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 10:03:05 -0300
Message-Id: <20191127130305.22666-3-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127130305.22666-1-fabio.berton@ossystems.com.br>
References: <20191127130305.22666-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-oe][PATCH 3/3] emlog: Add recipe
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
X-List-Received-Date: Wed, 27 Nov 2019 13:03:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-oe/recipes-core/emlog/emlog.inc          |  13 ++
 .../emlog/emlog/Drop-use-of-error-h.patch     | 113 ++++++++++++++++++
 meta-oe/recipes-core/emlog/emlog/emlog.initd  |  25 ++++
 meta-oe/recipes-core/emlog/emlog_git.bb       |  22 ++++
 .../emlog/kernel-module-emlog_git.bb          |  12 ++
 5 files changed, 185 insertions(+)
 create mode 100644 meta-oe/recipes-core/emlog/emlog.inc
 create mode 100644 meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
 create mode 100644 meta-oe/recipes-core/emlog/emlog/emlog.initd
 create mode 100644 meta-oe/recipes-core/emlog/emlog_git.bb
 create mode 100644 meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
new file mode 100644
index 000000000..9a0f9ba92
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "emlog is a Linux kernel module that makes it easy to access the \
+most recent (and only the most recent) output from a process"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "git://github.com/nicupavel/emlog.git;protocol=http"
+SRCREV = "aee53e8dee862f35291242ba41b0ca88010f6c71"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE += " \
+    CFLAGS='${TARGET_CFLAGS}' \
+"
diff --git a/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch b/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
new file mode 100644
index 000000000..6bfc44cb8
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/emlog/Drop-use-of-error-h.patch
@@ -0,0 +1,113 @@
+From 41de28a92297f4cb0c5a8d7356cde9190176947b Mon Sep 17 00:00:00 2001
+From: Fabio Berton <fabio.berton@ossystems.com.br>
+Date: Thu, 14 Mar 2019 19:54:27 -0300
+Subject: [PATCH] Drop use of error.h
+Organization: O.S. Systems Software LTDA.
+
+The error.h does not work with musl and this project being embedded
+friendly it makes sense to avoid glibc-specific code.
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
+---
+ mkemlog.c | 29 ++++++++++++++---------------
+ 1 file changed, 14 insertions(+), 15 deletions(-)
+
+diff --git a/mkemlog.c b/mkemlog.c
+index e3354ed..7bcdfce 100644
+--- a/mkemlog.c
++++ b/mkemlog.c
+@@ -21,7 +21,6 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <stdlib.h>
+-#include <error.h>
+ #include <errno.h>
+
+ #define EMLOG_DEVICE "/dev/emlog"
+@@ -40,16 +39,16 @@ int main(int argc, char** argv) {
+     FILE *max_size_file = NULL;
+     uid_t uid = -1;
+     if (argc < 2 || argc > 5) {
+-        error(1 ,0, USAGE);
++        fprintf(stderr, USAGE);
+     }
+     file = argv[1];
+
+     max_size_file = fopen("/sys/module/emlog/parameters/emlog_max_size", "r");
+     if (max_size_file == NULL)
+-        error(1, errno, "Emlog module not loaded\n");
++        fprintf(stderr, "Emlog module not loaded\n");
+     rc = fscanf(max_size_file, "%d", &emlog_max_size);
+     if (rc != 1)
+-        error(1, errno, "Unable to get emlog max size\n");
++        fprintf(stderr, "Unable to get emlog max size\n");
+     fclose(max_size_file);
+     max_size_file = NULL;
+     if (argc > 2 ) {
+@@ -57,13 +56,13 @@ int main(int argc, char** argv) {
+         number = argv[2];
+         size_of_buffer = strtol(number, &end_of_number, 10);
+         if (errno) {
+-            error(1, errno, "Invalid size provided\n" USAGE);
++            fprintf(stderr, "Invalid size provided\n" USAGE);
+         }
+         if (end_of_number == number) {
+-            error(1, 0, "Invalid size provided\n" USAGE);
++            fprintf(stderr, "Invalid size provided\n" USAGE);
+         }
+         if (size_of_buffer < 1 || size_of_buffer > emlog_max_size) {
+-            error(1, 0, "Invalid size provided must be a value between 1 and %d\n" USAGE, emlog_max_size);
++            fprintf(stderr, "Invalid size provided must be a value between 1 and %d\n" USAGE, emlog_max_size);
+         }
+     }
+     if (argc > 3 ) {
+@@ -71,10 +70,10 @@ int main(int argc, char** argv) {
+         number = argv[3];
+         mode = strtol(number, &end_of_number, 8);
+         if (errno) {
+-            error(1, errno, "Invalid mode provided\n" USAGE);
++            fprintf(stderr, "Invalid mode provided\n" USAGE);
+         }
+         if (end_of_number == number || S_IFMT & mode) {
+-            error(1, 0, "Invalid mode provided\n" USAGE);
++            fprintf(stderr, "Invalid mode provided\n" USAGE);
+         }
+     }
+     if (argc > 4 ) {
+@@ -82,27 +81,27 @@ int main(int argc, char** argv) {
+         number = argv[4];
+         uid = strtol(number, &end_of_number, 10);
+         if (errno) {
+-            error(1, errno, "Invalid uid provided\n" USAGE);
++            fprintf(stderr, "Invalid uid provided\n" USAGE);
+         }
+         if (end_of_number == number) {
+-            error(1, 0, "Invalid uid provided\n" USAGE);
++            fprintf(stderr, "Invalid uid provided\n" USAGE);
+         }
+     }
+     rc = stat(EMLOG_DEVICE, &emlog_stat);
+     if (rc == -1) {
+-        error(1, errno, "stat: " EMLOG_DEVICE);
++        fprintf(stderr, "stat: " EMLOG_DEVICE);
+     }
+     if (!S_ISCHR(emlog_stat.st_mode)) {
+-        error(1, 0, EMLOG_DEVICE " is not a valid emlog device\n");
++        fprintf(stderr, EMLOG_DEVICE " is not a valid emlog device\n");
+     }
+     rc = mknod(file, mode | S_IFCHR, makedev(major(emlog_stat.st_rdev),size_of_buffer));
+     if (rc == -1) {
+-        error(1, errno, "mknod: %s", file);
++        fprintf(stderr, "mknod: %s", file);
+     }
+     if (uid != -1) {
+         rc = chown(file, uid, -1);
+         if (rc == -1) {
+-            error(1, errno, "chown: %s", file);
++            fprintf(stderr, "chown: %s", file);
+         }
+     }
+     printf("Log device %s created with buffer size of %d KiB\n", file, size_of_buffer);
+--
+2.20.1
diff --git a/meta-oe/recipes-core/emlog/emlog/emlog.initd b/meta-oe/recipes-core/emlog/emlog/emlog.initd
new file mode 100644
index 000000000..361cf8029
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/emlog/emlog.initd
@@ -0,0 +1,25 @@
+#!/bin/sh
+PATH=/sbin:/usr/sbin:/bin:/usr/bin
+
+[ -r /etc/default/emlog ] && . /etc/default/emlog
+
+do_start() {
+    :
+}
+
+do_stop() {
+    nbcat /dev/emlog > /data/emlog
+}
+
+case "$1" in
+    start)
+	    do_start || exit $?
+	    ;;
+    stop)
+	    do_stop || exit $?
+	    ;;
+    *)
+	    echo "Usage: $0 {stop}" >&2
+	    exit 3
+	    ;;
+esac
diff --git a/meta-oe/recipes-core/emlog/emlog_git.bb b/meta-oe/recipes-core/emlog/emlog_git.bb
new file mode 100644
index 000000000..63d12477b
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/emlog_git.bb
@@ -0,0 +1,22 @@
+require ${BPN}.inc
+
+SRC_URI += "file://${BPN}.initd"
+
+SRC_URI_append_libc-musl = " file://Drop-use-of-error-h.patch"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "${BPN}"
+
+do_compile() {
+    oe_runmake nbcat
+    oe_runmake mkemlog
+}
+
+do_install() {
+   install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/${BPN}
+   install -Dm 0755 ${S}/nbcat ${D}${bindir}/nbcat
+   install -Dm 0755 ${S}/mkemlog ${D}${bindir}/mkemlog
+}
+
+RDEPENDS_${PN} += "kernel-module-emlog"
diff --git a/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb b/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb
new file mode 100644
index 000000000..51f7226eb
--- /dev/null
+++ b/meta-oe/recipes-core/emlog/kernel-module-emlog_git.bb
@@ -0,0 +1,12 @@
+require emlog.inc
+
+inherit module
+
+EXTRA_OEMAKE += " \
+    KDIR=${STAGING_KERNEL_DIR} \
+    KVER=${KERNEL_VERSION} \
+"
+
+do_compile() {
+    oe_runmake modules
+}
-- 
2.20.1


