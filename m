Return-Path: <philip.balister@gmail.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8D552772B8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 18:45:50 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id y9so145396537qgd.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 10:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=WrPZbgnZCNCXBqnkWxnJ2mpO/wdmmlNEIBjdlJICKjU=;
	b=NCkC+KPO75tdaO/JKc61r7ljzYJSoZO7uNzowyE5+XqgiRdQomtrynLTCIV9a5wktr
	2++yjGcWsISEU3Km4qoFRz3wPFyea6ylNYz/tQ3YMTLCPrFnHZ6KDwzeAVhaoKREBuDz
	V6wu9O2MKx5GLd6oWLPF2sBOJgtnDMHjk3xYaVWod4klUGZ/0j2gZixjKz0H2Fmt7r/W
	aNWvKanbFwLlTcIzCIu76kBv7vm3kz8YNRBwdQz1EEJj65dl6kGS5gf8d6Lyeng1W0Z/
	tCz1XXVvInq+GbThemQg3xaWYRW2a7Kt6NCrLRhT/+DJQsjYARKfCcI0TD+IrSRq9QHO
	wCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=WrPZbgnZCNCXBqnkWxnJ2mpO/wdmmlNEIBjdlJICKjU=;
	b=h86c1bvmfMBXngP/gydvmEwLAZyVZt1bp2F9hYNaxZKy5vO+ijiIohTByvg0Z3MTU2
	dzRNrWpEedqulk45EeFCHQ09U5GVROROGD5EklbUI/HiKMUEanvKcEEDk92c2V9YNGiV
	ktarEQLDewEStH2feP+dztmNeWlLfc9KdzkOry8F5jvnuftkQGl/L0mE1M2LCs8M2Rom
	FUm4trdVF009tTh456VDkMJOQCeagGQD8PmAJOoh7J6RMtjf5cgeJux0OzPxjTfN7AFY
	qx5t9EpqCQxrAXFY1xwPf78q4PcLjplDQRDsM+UkLNxQE+OCtN90GCT2vNG+DSieBMJU
	NKpw==
X-Gm-Message-State: AG10YOR77MdZYqc98IsA7lm2vIwyiDzHNduAYa/D6rLNOinYEnbYunPjkLw5/RpAc/3MRQ==
X-Received: by 10.140.129.79 with SMTP id 76mr45856701qhb.28.1456253150666;
	Tue, 23 Feb 2016 10:45:50 -0800 (PST)
Received: from thuvia.localdomain (pool-71-171-13-83.nwrknj.east.verizon.net.
	[71.171.13.83])
	by smtp.gmail.com with ESMTPSA id 60sm8966368qgg.19.2016.02.23.10.45.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Feb 2016 10:45:49 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 13:45:32 -0500
Message-Id: <1456253132-14263-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-oe][PATCH] log4cpp: Fix build system path in pkgconfig file QA failure.
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
X-List-Received-Date: Tue, 23 Feb 2016 18:45:51 -0000

 * Must remove path from pc.in and stop configure.in from regenerating the file.
 * Also included some changes requested in earlier review that arrived late.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/log4cpp/files/fix-pc.patch | 20 ++++++++++++++++++++
 meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb   |  8 +++++---
 2 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/log4cpp/files/fix-pc.patch

diff --git a/meta-oe/recipes-support/log4cpp/files/fix-pc.patch b/meta-oe/recipes-support/log4cpp/files/fix-pc.patch
new file mode 100644
index 0000000..b8fb42e
--- /dev/null
+++ b/meta-oe/recipes-support/log4cpp/files/fix-pc.patch
@@ -0,0 +1,20 @@
+diff -Nurd ./log4cpp.orig/configure.in ./log4cpp/configure.in
+--- ./log4cpp.orig/configure.in	2009-09-07 16:57:46.000000000 -0400
++++ ./log4cpp/configure.in	2016-02-23 12:57:11.567240018 -0500
+@@ -130,7 +130,6 @@
+ # ----------------------------------------------------------------------------
+ 
+ AC_CONFIG_LIBCONFIG_IN([log4cpp])
+-AC_CONFIG_PKGCONFIG_IN([log4cpp], [C++ library for flexible logging, modeled after Log4j])
+ 
+ AC_CONFIG_FILES([
+ Makefile
+diff -Nurd ./log4cpp.orig/log4cpp.pc.in ./log4cpp/log4cpp.pc.in
+--- ./log4cpp.orig/log4cpp.pc.in	2004-01-27 05:24:25.000000000 -0500
++++ ./log4cpp/log4cpp.pc.in	2016-02-22 15:06:55.769327491 -0500
+@@ -7,4 +7,4 @@
+ Description: C++ library for flexible logging, modeled after Log4j
+ Version: @VERSION@
+ Libs: -L${libdir} @log4cpp_libs@
+-Cflags: -I${includedir} @log4cpp_cflags@
++Cflags: -I${includedir}
diff --git a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
index a543044..c7bf288 100644
--- a/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
+++ b/meta-oe/recipes-support/log4cpp/log4cpp_1.1.1.bb
@@ -6,9 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 SRC_URI[md5sum] = "1e173df8ee97205f412ff84aa93b8fbe"
 SRC_URI[sha256sum] = "35abf332630a6809c969276b1d60b90c81a95daf24c86cfd7866ffef72f9bed0"
 
-SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz"
+SRC_URI = "http://downloads.sourceforge.net/${BPN}/${BP}.tar.gz \
+           file://fix-pc.patch;striplevel=2 \
+          "
 
-S="${WORKDIR}/${BPN}"
+S = "${WORKDIR}/${BPN}"
 
 inherit autotools pkgconfig
 
@@ -17,5 +19,5 @@ EXTRA_OECONF = "\
     --enable-dot=no \
     --enable-html-docs=no \
     --enable-latex-docs=no \
-    LDFLAGS=-lpthread \
+    LDFLAGS=-pthread \
 "
-- 
2.5.0


