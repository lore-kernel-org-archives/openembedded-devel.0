Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2663F7327E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 14:02:54 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id y89so82424847qge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Feb 2016 06:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=UmB5XvumUXzyKOr8jasftJ03Bdu7HI5JAVnbpytQ+Pg=;
	b=gIHWjCKOTn4/Qwtg46TMwYgwWSaTMgcn5QJIqAyGP3Aiew7PBnAeUShfRxH3jdmYlE
	nHL/hqTrcZmdrPI2XQrN5oimZiChGnTLuQ7Ko+SyvZzRxRjnn1979dLtWa4suJ/a85KE
	PO4QG3+qiABvSSOe8XOfttKB3RlvCf4SBOdOVD3hybOYfn7lJrTQ6pRl4qn09vmx4ix/
	QqbeJH9VOkA85eozxEj1eCneZhsLFxf/S9L9u3frxcDWHbhk11rR6b/Ik1i8vTr5Mwtx
	NUjaUGdD4j1BCTBEy+zka/dJHkjqLekPUVZ32bXLkb5deJ0mqTZ9v5GqjZlsi/4airJA
	B5MQ==
X-Gm-Message-State: AG10YOQfXK512gQd4NbA7eK4AgFl3TXA7T3BmklQOdjGsBDO81bL1haPrBkgJqmtKtDGdQ==
X-Received: by 10.140.85.133 with SMTP id n5mr23404067qgd.32.1455976975293;
	Sat, 20 Feb 2016 06:02:55 -0800 (PST)
Received: from localhost ([177.127.4.90])
	by smtp.gmail.com with ESMTPSA id y99sm3004069qge.3.2016.02.20.06.02.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Feb 2016 06:02:53 -0800 (PST)
Received: by localhost (sSMTP sendmail emulation);
	Sat, 20 Feb 2016 12:02:48 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Sat, 20 Feb 2016 12:02:45 -0200
Message-Id: <1455976966-32140-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.7.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe PATCH v2 1/2] dt: Add 18.32 recipe
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
X-List-Received-Date: Sat, 20 Feb 2016 14:02:55 -0000

This includes the version 18.32; this release has been taken from the
Fedora package repository at:

    http://pkgs.fedoraproject.org/git/rpms/dt.git

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Drop manpage patch (had new line issues and is not worth it)
- Fix missing shell dependency (tcsh)

 ...op-using-relative-path-for-scsilib.c-link.patch | 29 +++++++
 .../recipes-devtools/dt/dt/Use-tcsh-shell.patch    | 92 ++++++++++++++++++++++
 .../dt/dt/dt-default-source-define.patch           | 18 +++++
 .../dt/dt/dt-wformat-security.patch                | 48 +++++++++++
 meta-oe/recipes-devtools/dt/dt_18.32.bb            | 47 +++++++++++
 5 files changed, 234 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/dt/dt/Stop-using-relative-path-for-scsilib.c-link.patch
 create mode 100644 meta-oe/recipes-devtools/dt/dt/Use-tcsh-shell.patch
 create mode 100644 meta-oe/recipes-devtools/dt/dt/dt-default-source-define.patch
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
diff --git a/meta-oe/recipes-devtools/dt/dt/Use-tcsh-shell.patch b/meta-oe/recipes-devtools/dt/dt/Use-tcsh-shell.patch
new file mode 100644
index 0000000..0c00fdf
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt/Use-tcsh-shell.patch
@@ -0,0 +1,92 @@
+From e3c6eb8776f659eb9e6eeccf90d785eff18ecf74 Mon Sep 17 00:00:00 2001
+From: Otavio Salvador <otavio@ossystems.com.br>
+Date: Mon, 15 Feb 2016 18:00:05 -0200
+Subject: [PATCH] Use 'tcsh' shell
+Organization: O.S. Systems Software LTDA.
+
+Upstream-Status: Pending
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+---
+ Scripts/dta | 2 +-
+ Scripts/dtc | 2 +-
+ Scripts/dtf | 2 +-
+ Scripts/dtr | 2 +-
+ Scripts/dts | 2 +-
+ Scripts/dtt | 2 +-
+ Scripts/dtw | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/Scripts/dta b/Scripts/dta
+index ebc7072..4f90247 100755
+--- a/Scripts/dta
++++ b/Scripts/dta
+@@ -1,4 +1,4 @@
+-#!/bin/csh
++#!/bin/tcsh
+ #
+ #	Script file to test asynchronous communication lines.
+ #
+diff --git a/Scripts/dtc b/Scripts/dtc
+index da69c2e..89d48c2 100755
+--- a/Scripts/dtc
++++ b/Scripts/dtc
+@@ -1,4 +1,4 @@
+-#!/bin/csh
++#!/bin/tcsh
+ #	%Z%%M% %I% %E%
+ #
+ #	Date:	August 7, 1990
+diff --git a/Scripts/dtf b/Scripts/dtf
+index 9f8cd87..321d261 100755
+--- a/Scripts/dtf
++++ b/Scripts/dtf
+@@ -1,4 +1,4 @@
+-#! /bin/csh
++#! /bin/tcsh
+ #
+ #	Script file to gather floppy disk performance data.
+ #
+diff --git a/Scripts/dtr b/Scripts/dtr
+index ddb7947..1ff5a0b 100755
+--- a/Scripts/dtr
++++ b/Scripts/dtr
+@@ -1,4 +1,4 @@
+-#!/bin/csh
++#!/bin/tcsh
+ #	%Z%%M% %I% %E%
+ #
+ #	Date:	August 21, 1990
+diff --git a/Scripts/dts b/Scripts/dts
+index 6b8a167..42d2312 100755
+--- a/Scripts/dts
++++ b/Scripts/dts
+@@ -1,4 +1,4 @@
+-#!/bin/csh
++#!/bin/tcsh
+ #	%Z%%M% %I% %E%
+ #
+ #	Date:	August 7, 1990
+diff --git a/Scripts/dtt b/Scripts/dtt
+index 36cc6bd..df19d2f 100755
+--- a/Scripts/dtt
++++ b/Scripts/dtt
+@@ -1,4 +1,4 @@
+-#! /bin/csh
++#! /bin/tcsh
+ #	%Z%%M% %I% %E%
+ #
+ #	Date:	August 7, 1990
+diff --git a/Scripts/dtw b/Scripts/dtw
+index 8a4ac39..c58e304 100755
+--- a/Scripts/dtw
++++ b/Scripts/dtw
+@@ -1,4 +1,4 @@
+-#!/bin/csh
++#!/bin/tcsh
+ #	%Z%%M% %I% %E%
+ #
+ #	Date:	August 21, 1990
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
index 0000000..9688d02
--- /dev/null
+++ b/meta-oe/recipes-devtools/dt/dt_18.32.bb
@@ -0,0 +1,47 @@
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
+           file://dt-wformat-security.patch \
+           file://Stop-using-relative-path-for-scsilib.c-link.patch \
+           file://Use-tcsh-shell.patch \
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
+
+RDEPENDS_${PN} += "tcsh"
-- 
2.7.1


