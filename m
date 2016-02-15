Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f66.google.com (mail-qg0-f66.google.com
	[209.85.192.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9356E60053
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:51:28 +0000 (UTC)
Received: by mail-qg0-f66.google.com with SMTP id y89so10561969qge.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 05:51:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=u7Taa4q9Wh504z6845BTpjyjkgN66pMRmpfgGdzB5kA=;
	b=Ex8Em4M2iU3a2cSgKPupK95cUMJLY3gydOUAKrhcSAdJ7Q6HUALHqhX7Jq74Yqf6t4
	InJ4zG6VutNXvojUoi3pgJGNFp8Csm4Lmv3tjqpJxIreNUeXbakiqZ4DuNJ1XM/+Oq2h
	7RrEZ1T/695UPBKQogr8XvAHuKcL1ezZjLKpZNIiU15IsnrP0bI2P5ntk9Qj8zHaClQl
	Tosn3FJ6RjecEuITBtdWTbFHaYJDHDrgZuFkRAGPNTSUz/73ZzM0tHTe++KHJxrzqexp
	FZfzU8qSPKvEJLRWHZ4EMgkJo5TFETY6hyv3Y3A/UfoRaU+Xv9DwGhhiaHlgrTKDHv6I
	poYw==
X-Gm-Message-State: AG10YOSarFOVm+IzVBY//+mMcbxWWJHVQDigqwKywRfASp8izT5puWPVYhsHTWwhR7iw+Q==
X-Received: by 10.140.99.72 with SMTP id p66mr13599388qge.16.1455544288993;
	Mon, 15 Feb 2016 05:51:28 -0800 (PST)
Received: from localhost ([187.23.153.138]) by smtp.gmail.com with ESMTPSA id
	j67sm11033027qgj.35.2016.02.15.05.51.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 05:51:27 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 15 Feb 2016 11:51:21 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Feb 2016 11:51:19 -0200
Message-Id: <1455544280-18166-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH 1/2] dt: Add 18.32 recipe
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
X-List-Received-Date: Mon, 15 Feb 2016 13:51:30 -0000

This includes the version 18.32; this release has been taken from the
Fedora package repository at:

    http://pkgs.fedoraproject.org/git/rpms/dt.git

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...op-using-relative-path-for-scsilib.c-link.patch | 29 +++++++++++++
 .../dt/dt/dt-default-source-define.patch           | 18 ++++++++
 meta-oe/recipes-devtools/dt/dt/dt-manpage.patch    | 22 ++++++++++
 .../dt/dt/dt-wformat-security.patch                | 48 ++++++++++++++++++++++
 meta-oe/recipes-devtools/dt/dt_18.32.bb            | 45 ++++++++++++++++++++
 5 files changed, 162 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dt/dt/Stop-using-relative-path-for-scsilib.c-link.patch
 create mode 100644 meta-oe/recipes-devtools/dt/dt/dt-default-source-define.patch
 create mode 100644 meta-oe/recipes-devtools/dt/dt/dt-manpage.patch
 create mode 100644 meta-oe/recipes-devtools/dt/dt/dt-wformat-security.patch
 create mode 100644 meta-oe/recipes-devtools/dt/dt_18.32.bb

diff --git a/meta-oe/recipes-devtools/dt/dt/Stop-using-relative-path-for-scsilib.c-link.patch b/meta-oe/recipes-devtools/dt/dt/Stop-using-relative-path-for-scsilib.c-link.patch
new file mode 100644
index 0000000..ccb9a02
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt/Stop-using-relative-path-for-scsilib.c-link.patch
@@ -0,0 +1,29 @@
+From 4cf7e16fe9b773e2e7763d4b773854eefe2aa9ab Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Tue, 12 Jan 2016 09:59:55 -0200
+Subject: [PATCH] Stop using relative path for scsilib.c link
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Makefile.linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.linux b/Makefile.linux
+index 78333ff..e210564 100644
+--- a/Makefile.linux
++++ b/Makefile.linux
+@@ -129,7 +129,7 @@ scsilib.c:
+ 	    echo "Please specify OS={aix,linux,hpux,solaris,windows}"; \
+ 	    exit 1; \
+ 	fi; \
+-	ln -sf ../scsilib-$(OS).c scsilib.c
++	ln -sf scsilib-$(OS).c scsilib.c
+ 
+ print:;
+ 		@$(PRINTER) $(PRINTFLAGS) $(ALL_CFILES)
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-devtools/dt/dt/dt-default-source-define.patch b/meta-oe/recipes-devtools/dt/dt/dt-default-source-define.patch
new file mode 100644
index 0000000..87016ed
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt/dt-default-source-define.patch
@@ -0,0 +1,18 @@
+Patch from http://pkgs.fedoraproject.org/git/rpms/dt.git
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff -rupN dt.v18.32.old/common.h dt.v18.32/common.h
+--- dt.v18.32.old/common.h	2013-03-01 23:52:30.000000000 +0100
++++ dt.v18.32/common.h	2014-09-24 17:41:40.777604710 +0200
+@@ -127,7 +127,7 @@ typedef volatile slarge_t	v_slarge;
+ 
+ #endif /* defined(_WIN64) */
+ 
+-#elif defined(__GNUC__) && defined(_BSD_SOURCE) || defined(SCO) || defined(__QNXNTO__) || defined(SOLARIS) || defined(HP_UX) || defined(AIX) || defined(_NT_SOURCE) 
++#elif defined(__GNUC__) && defined(_BSD_SOURCE) || defined (_DEFAULT_SOURCE) ||  defined(SCO) || defined(__QNXNTO__) || defined(SOLARIS) || defined(HP_UX) || defined(AIX) || defined(_NT_SOURCE) 
+ 
+ #define QuadIsLongLong
+ typedef unsigned long long int	large_t;
diff --git a/meta-oe/recipes-devtools/dt/dt/dt-manpage.patch b/meta-oe/recipes-devtools/dt/dt/dt-manpage.patch
new file mode 100644
index 0000000..3b29f00
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt/dt-manpage.patch
@@ -0,0 +1,22 @@
+Patch from http://pkgs.fedoraproject.org/git/rpms/dt.git
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff --git a/Documentation/dt.man b/Documentation/dt.man
+index af32831..d4960cf 100644
+--- a/Documentation/dt.man
++++ b/Documentation/dt.man
+@@ -299,7 +299,7 @@ Log File Format Keywords:
+ .TP
+ %iodir
+ The I/O direction.
+-.tP
++.TP
+ %iotype
+ The I/O type.
+ .TP
+--
+1.7.8.5
+
diff --git a/meta-oe/recipes-devtools/dt/dt/dt-wformat-security.patch b/meta-oe/recipes-devtools/dt/dt/dt-wformat-security.patch
new file mode 100644
index 0000000..b6780c1
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt/dt-wformat-security.patch
@@ -0,0 +1,48 @@
+Patch from http://pkgs.fedoraproject.org/git/rpms/dt.git
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+diff -rupN dt.v18.32.old/dt.c dt.v18.32/dt.c
+--- dt.v18.32.old/dt.c	2014-08-18 14:45:53.242351115 +0200
++++ dt.v18.32/dt.c	2014-08-18 15:11:36.367719880 +0200
+@@ -4378,7 +4378,7 @@ report_error(
+ 	    (void)sprintf(dip->di_msg_buffer, "(%d): '%s', errno = %d - %s\n",
+ 			  dip->di_process_id, error_info, errno, emsg);
+ 	}
+-	syslog(LOG_ERR, dip->di_msg_buffer);
++	syslog(LOG_ERR, "%s", dip->di_msg_buffer);
+     }
+ #endif /* defined(SYSLOG) */
+ 
+diff -rupN dt.v18.32.old/dtutil.c dt.v18.32/dtutil.c
+--- dt.v18.32.old/dtutil.c	2014-08-18 14:45:53.354350779 +0200
++++ dt.v18.32/dtutil.c	2014-08-18 15:13:53.835307311 +0200
+@@ -5180,7 +5180,7 @@ ReportDeviceInfo (
+ 	    bp += Sprintf(bp,
+ 			  "(%d) Device name: %s\n",
+ 			   dip->di_process_id, dip->di_dname);
+-	    syslog(LOG_ERR, dip->di_msg_buffer);
++	    syslog(LOG_ERR, "%s", dip->di_msg_buffer);
+ 	    bp = dip->di_msg_buffer;
+ # if defined(SCSI)
+ 	    if (dip->di_serial_number) {
+@@ -5193,7 +5193,7 @@ ReportDeviceInfo (
+ 			      dip->di_process_id, dip->di_device_id);
+ 	    }
+ # endif /* defined(SCSI) */
+-	    syslog(LOG_ERR, dip->di_msg_buffer);
++	    syslog(LOG_ERR, "%s", dip->di_msg_buffer);
+ 	    bp = dip->di_msg_buffer;
+ 	    bp += Sprintf(bp,
+ 		  "(%d) Relative block number where the error occurred is " LUF ","
+@@ -5203,7 +5203,7 @@ ReportDeviceInfo (
+   	    } else {
+                 bp += Sprintf(bp, "\n");
+             }
+-	    syslog(LOG_ERR, dip->di_msg_buffer);
++	    syslog(LOG_ERR, "%s", dip->di_msg_buffer);
+ 	}
+ #endif /* defined(SYSLOG) */
+ 
diff --git a/meta-oe/recipes-devtools/dt/dt_18.32.bb b/meta-oe/recipes-devtools/dt/dt_18.32.bb
new file mode 100644
index 0000000..f79139c
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt_18.32.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Generic data test program"
+DESCRIPTION = "The Data Test Program (dt) is a generic data test program used to verify proper \
+operation of peripherals, file systems, device drivers, or any data stream supported by the \
+operating system."
+HOMEPAGE = "http://www.scsifaq.org/RMiller_Tools/dt.html"
+
+SECTION = "console/tests"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=be8bb25bbcfaa0725710d188e5152668"
+
+# Source URI taken from Fedora RPM spec file at:
+#  http://pkgs.fedoraproject.org/git/rpms/dt.git
+SRC_URI = "http://dl.dropboxusercontent.com/u/32363629/Datatest/dt-source-v${PV}.tar.gz \
+           file://dt-default-source-define.patch \
+           file://dt-manpage.patch \
+           file://dt-wformat-security.patch \
+           file://Stop-using-relative-path-for-scsilib.c-link.patch \
+"
+
+SRC_URI[md5sum] = "3054aeaaba047a1dbe90c2132a382ee2"
+SRC_URI[sha256sum] = "10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6"
+
+S = "${WORKDIR}/dt.v${PV}"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+EXTRA_OEMAKE += "-f Makefile.linux \
+                 OS=linux \
+                 CFLAGS="-I.. -DAIO -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DTHREADS -DSCSI""
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    install -Dm755 dt ${D}${sbindir}/dt
+    install -Dm644 Documentation/dt.man ${D}${mandir}/man8/dt.8
+
+    install -d ${D}${datadir}/dt/
+    install -d ${D}${docdir}/dt/html/
+    install -m755 Scripts/dt? ${D}${datadir}/dt/
+    install -m644 data/pattern_* ${D}${datadir}/dt/
+    install -m644 html/* ${D}${docdir}/dt/html/
+}
-- 
2.7.1


