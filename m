Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB9D78049
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:08:50 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id d5so6963470pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 19:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5UtqLvisJZsrSgsXxAdoaCD4GNVoFWb1WF5HKqe0pq4=;
	b=e3aqVTX0gpvtTwFfciaKZD1ZSJhy+pI32mDPbuQCmK7o/JPUnN66pB48mSqttU9b60
	LNECS/doUH6sD3CEwTwbaJR42vm7L0yzrw/gPCuPX2MpIj++IPi+YwQcllpitsn1N2k8
	AdqV5XWqvl3FpB7byRVrXrs97drYoLa9yf1Ef6ar58IdZ6mNCYtKdX7M5UIu9e7ZnRln
	cGKQZk5g+WRb11MbcgSgBr/P8krwCTpOMSrC5u4l+BDF08TF/7bpNgQad3paVB1NOdTm
	1G7tmYXplluB8foJh9ZWF9an5oyeSi4WCDKHjg2b/xdFnbu5lYZc7/Qsla0aDbdZKLGm
	blYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5UtqLvisJZsrSgsXxAdoaCD4GNVoFWb1WF5HKqe0pq4=;
	b=SYE/4sofMK9dy1wlWsRkVOZRSvTn4GNTNWRcuh1dpVbsq3y0Wq7Gy7YET/Vaus+Uvx
	f5bEGYfclyvGzrAev6GgfiBTxDlsP4RdTRtVffou9wgD89XphVw4jSVlMUiiBzxasoH4
	2Ybftgn2JmDNnhVqPnlDRzUBIGSaLJwE/YjvOEeBgoAXbgcoZv54QdoaZTu7Es5Oig+Y
	x2iB3fxVTRVtHchfAvhjuAAPrVs8wUG44DePoGAm+iLdprNIuTdmB0NCKvOUTM4XTmtW
	gqFHbwzObRtcaxk71/Uv9TawhjpCuF8UfHhW+cWwYlfDFv7BpcUDnYwraB8l78xo/1Bb
	IywQ==
X-Gm-Message-State: AKS2vOwokY+XyrZzS9NYrdbbeDIuMnxWJasDnewJzp0g2AYNqGn3yuoo
	I0KG0Ftz7hHBc/yt
X-Received: by 10.84.254.78 with SMTP id a14mr8735186pln.69.1498615731165;
	Tue, 27 Jun 2017 19:08:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id b8sm1003591pfd.65.2017.06.27.19.08.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 19:08:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Jun 2017 19:08:14 -0700
Message-Id: <20170628020819.17047-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170628020819.17047-1-raj.khem@gmail.com>
References: <20170628020819.17047-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/13] netkit-telnet: Fix build with hardening
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
X-List-Received-Date: Wed, 28 Jun 2017 02:08:50 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-telnet-telnetd-Fix-print-format-strings.patch | 66 ++++++++++++++++++++++
 .../netkit-telnet/netkit-telnet_0.17.bb            | 11 ++--
 2 files changed, 72 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch

diff --git a/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
new file mode 100644
index 000000000..f2f1b12e2
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-telnet/files/0001-telnet-telnetd-Fix-print-format-strings.patch
@@ -0,0 +1,66 @@
+From 7a3095d1e9b7c73f9dca56250f433bcfc7cb660e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Jun 2017 10:15:34 -0700
+Subject: [PATCH] telnet/telnetd: Fix print format strings
+
+Fixes build with hardening flags
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ telnet/utilities.cc | 6 +++---
+ telnetd/utility.c   | 6 +++---
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/telnet/utilities.cc b/telnet/utilities.cc
+index 66839ab..36f0731 100644
+--- a/telnet/utilities.cc
++++ b/telnet/utilities.cc
+@@ -583,17 +583,17 @@ void printsub(int direction, unsigned char *pointer, int length) {
+ 			case ENV_VAR:
+ 			    if (pointer[1] == TELQUAL_SEND)
+ 				goto def_case;
+-			    fprintf(NetTrace, "\" VAR " + noquote);
++			    fprintf(NetTrace, "%s", "\" VAR " + noquote);
+ 			    noquote = 2;
+ 			    break;
+ 
+ 			case ENV_VALUE:
+-			    fprintf(NetTrace, "\" VALUE " + noquote);
++			    fprintf(NetTrace, "%s", "\" VALUE " + noquote);
+ 			    noquote = 2;
+ 			    break;
+ 
+ 			case ENV_ESC:
+-			    fprintf(NetTrace, "\" ESC " + noquote);
++			    fprintf(NetTrace, "%s", "\" ESC " + noquote);
+ 			    noquote = 2;
+ 			    break;
+ 
+diff --git a/telnetd/utility.c b/telnetd/utility.c
+index 29b7da1..75314cb 100644
+--- a/telnetd/utility.c
++++ b/telnetd/utility.c
+@@ -909,17 +909,17 @@ printsub(char direction, unsigned char *pointer, int length)
+ 			case ENV_VAR:
+ 			    if (pointer[1] == TELQUAL_SEND)
+ 				goto def_case;
+-			    netoprintf("\" VAR " + noquote);
++			    netoprintf("%s", "\" VAR " + noquote);
+ 			    noquote = 2;
+ 			    break;
+ 
+ 			case ENV_VALUE:
+-			    netoprintf("\" VALUE " + noquote);
++			    netoprintf("%s", "\" VALUE " + noquote);
+ 			    noquote = 2;
+ 			    break;
+ 
+ 			case ENV_ESC:
+-			    netoprintf("\" ESC " + noquote);
++			    netoprintf("%s", "\" ESC " + noquote);
+ 			    noquote = 2;
+ 			    break;
+ 
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 9438adc0f..54a58c8a1 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -5,11 +5,12 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://telnet/telnet.cc;beginline=2;endline=3;md5=780868e7b566313e70cb701560ca95ef"
 
 SRC_URI = "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/${BP}.tar.gz \
-    file://To-aviod-buffer-overflow-in-telnet.patch \
-    file://Warning-fix-in-the-step-of-install.patch \
-    file://telnet-xinetd \
-    file://cross-compile.patch \
-"
+           file://To-aviod-buffer-overflow-in-telnet.patch \
+           file://Warning-fix-in-the-step-of-install.patch \
+           file://telnet-xinetd \
+           file://cross-compile.patch \
+           file://0001-telnet-telnetd-Fix-print-format-strings.patch \
+           "
 
 EXTRA_OEMAKE = "INSTALLROOT=${D} SBINDIR=${sbindir} DAEMONMODE=755 \
     MANMODE=644 MANDIR=${mandir}"
-- 
2.13.2


