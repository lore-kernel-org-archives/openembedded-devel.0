Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id EF0197D7A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 04:32:56 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id w23so589402ply.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 21:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bKNerrIkrgPEVCo5RypGjIFWcP/07yx470QNA+nkYUo=;
	b=GpJY80HGzB5NpmyFeRA0TGVxREt47/SnMMSZz9eWgrAxQhB1zYg5x1ycYGa+l1zYuf
	Os/+twHUhicaUqFa+lLvnqtZr9BPU8dVkT3lY2tQ2n7wSlmKnYozhps3TGnwAZrs5Eoo
	H09cXOFMJfzdqcwoWh2pHA+9TcKCsBQTRP7kHVKP910YJ2cXy4+r8PMTXpvP2zx6zl2R
	WhcTq6faOrSPHsyW3s5BHd4FRT+KxFSYi2UuPqIzOCg29cuJsij8T85NhC5mfd9dvCsy
	u0uXht1+SiiTGH9d3RD063tFSbaCskS4xuxUA8CF4Qwsw17oRVz2x1ELaLlLaMm+pe+n
	uJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=bKNerrIkrgPEVCo5RypGjIFWcP/07yx470QNA+nkYUo=;
	b=jglpPDpTISBpbI2326Wy/3lVIf4plJVqkIeUxEVe/JfLLhWUQxJuKaUgJdLqCOq8g4
	yi17m/oCqwDGaHR0UHSJPQ3ulQBF/UHId4dJZhRUvlwnon9R6Zi0U5Cnz6mn6T/KVbt9
	xMtIJtvueyq7jMqT3X4gZ6M8IH8eZstQvLN6JtxjtKnDM/ChtOFgRznh12pCkS5hpWeB
	jQZ3gozyV0PHrc4NiaNZKDmPsA2BHFLAOO6lY11ga1ntWyCRNbExl9HHglG0b7fF4DbB
	hU+9PB9qUUjW0VkOQcLyioe8g0170hrL0yjJxfju54HSSk8QwC8nLZGMkqVJdi3yyXcZ
	WExg==
X-Gm-Message-State: APjAAAWtCWeBZiF8zpPMrxW29tU2grBg+pjmLIOMfxBSpn+HclkxjY8Z
	7JVB8B2pCEn35yso9nv9/WL5YaDZVEU=
X-Google-Smtp-Source: APXvYqwkOEKKEs4oSpJT+eEK/vgMU+oMpmziyOv2Zu12NDlsMIRzvZtKyrhMFgX0VMgtuI3j0RgTXg==
X-Received: by 2002:a17:902:2907:: with SMTP id
	g7mr6984937plb.238.1554870776873; 
	Tue, 09 Apr 2019 21:32:56 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	f5sm33716890pgo.75.2019.04.09.21.32.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 21:32:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Apr 2019 21:32:44 -0700
Message-Id: <20190410043244.12131-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] ledmon: control hard disk led for RAID arrays
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
X-List-Received-Date: Wed, 10 Apr 2019 04:32:57 -0000
Content-Transfer-Encoding: 8bit

From: Liwei Song <liwei.song@windriver.com>

Enable LED support for Intel Virtual RAID On CPU.
Fix build with musl

Signed-off-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ad-of-on_exit-for-musl-compatibility.patch | 53 +++++++++++++++++++
 ...include-sys-select.h-and-sys-types.h.patch | 43 +++++++++++++++
 meta-oe/recipes-bsp/ledmon/ledmon_git.bb      | 34 ++++++++++++
 3 files changed, 130 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
 create mode 100644 meta-oe/recipes-bsp/ledmon/ledmon_git.bb

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch
new file mode 100644
index 0000000000..de5ce9fc83
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch
@@ -0,0 +1,53 @@
+From 8aba09b743b4e89ef581a679943ce39a5c7fd4a5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Apr 2019 21:25:21 -0700
+Subject: [PATCH 1/2] use atexit insead of on_exit for musl compatibility
+
+musl does not support on_exit which is used in clean up.
+Instead use atexit with is supported by musl and glibc.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ledctl.c | 2 +-
+ src/ledmon.c | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/ledctl.c b/src/ledctl.c
+index 2aa1abc..2c97dcf 100644
+--- a/src/ledctl.c
++++ b/src/ledctl.c
+@@ -689,7 +689,7 @@ int main(int argc, char *argv[])
+ 	status = _init_ledctl_conf();
+ 	if (status != STATUS_SUCCESS)
+ 		return status;
+-	if (on_exit(_ledctl_fini, progname))
++	if (atexit(_ledctl_fini))
+ 		exit(STATUS_ONEXIT_ERROR);
+ 	if (_cmdline_parse(argc, argv))
+ 		exit(STATUS_CMDLINE_ERROR);
+diff --git a/src/ledmon.c b/src/ledmon.c
+index 0ea2583..2333c7c 100644
+--- a/src/ledmon.c
++++ b/src/ledmon.c
+@@ -860,7 +860,7 @@ int main(int argc, char *argv[])
+ 	set_invocation_name(argv[0]);
+ 	openlog(progname, LOG_PID | LOG_PERROR, LOG_DAEMON);
+ 
+-	if (on_exit(_ledmon_status, &terminate))
++	if (atexit(_ledmon_status))
+ 		return STATUS_ONEXIT_ERROR;
+ 
+ 	if (_cmdline_parse_non_daemonise(argc, argv) != STATUS_SUCCESS)
+@@ -930,7 +930,7 @@ int main(int argc, char *argv[])
+ 	}
+ 	_ledmon_setup_signals();
+ 
+-	if (on_exit(_ledmon_fini, progname))
++	if (atexit(_ledmon_fini))
+ 		exit(STATUS_ONEXIT_ERROR);
+ 	list_init(&ledmon_block_list, (item_free_t)block_device_fini);
+ 	sysfs_init();
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch b/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
new file mode 100644
index 0000000000..75bf2b4f5e
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon/0002-include-sys-select.h-and-sys-types.h.patch
@@ -0,0 +1,43 @@
+From 2ee8796db5019341b774bcb4f7d0944d89e1845b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 9 Apr 2019 21:26:55 -0700
+Subject: [PATCH 2/2] include sys/select.h and sys/types.h
+
+sys/select.h is needed to provide fd_set definition
+sys/types.h is needed for ssize_t
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/dellssd.c | 1 +
+ src/utils.h   | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/dellssd.c b/src/dellssd.c
+index 7b8d431..e97fe45 100644
+--- a/src/dellssd.c
++++ b/src/dellssd.c
+@@ -27,6 +27,7 @@
+ #include <unistd.h>
+ 
+ #include <sys/ioctl.h>
++#include <sys/select.h>
+ #include <linux/ipmi.h>
+ 
+ #if _HAVE_DMALLOC_H
+diff --git a/src/utils.h b/src/utils.h
+index 720447a..c106529 100644
+--- a/src/utils.h
++++ b/src/utils.h
+@@ -21,6 +21,7 @@
+ #define _UTILS_H_INCLUDED_
+ 
+ #include <getopt.h>
++#include <sys/types.h>
+ #include "config_file.h"
+ #include "stdlib.h"
+ #include "stdint.h"
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_git.bb b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
new file mode 100644
index 0000000000..4376ad3941
--- /dev/null
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_git.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Intel(R) Enclosure LED Utilities"
+
+DESCRIPTION = "The utilities are designed primarily to be used on storage servers \
+ utilizing MD devices (aka Linux Software RAID) for RAID arrays.\
+"
+HOMEPAGE = "https://github.com/intel/ledmon"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+"
+
+DEPENDS = "sg3-utils udev"
+
+inherit systemd
+
+SYSTEMD_SERVICE_${PN} = "ledmon.service"
+
+SRC_URI = "git://github.com/intel/ledmon;branch=master \
+           file://0001-use-atexit-insead-of-on_exit-for-musl-compatibility.patch \
+           file://0002-include-sys-select.h-and-sys-types.h.patch \
+          "
+
+SRCREV = "ad1304ca1363d727425a1f23703c523e21feae4f"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+S = "${WORKDIR}/git"
+EXTRA_OEMAKE = "CC='${CC}' LDFLAGS='${LDFLAGS}' CFLAGS='${CFLAGS}'"
+
+do_install_append() {
+	install -d ${D}/${systemd_unitdir}/system
+	oe_runmake  DESTDIR=${D}  install
+	oe_runmake  DESTDIR=${D}${systemd_unitdir}/system  install-systemd
+}
-- 
2.21.0


