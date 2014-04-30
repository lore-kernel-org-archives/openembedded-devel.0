Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id DCC526084B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 08:09:54 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so8678790wiv.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 01:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8fggzLjvd3Posu2Ae5/t7YAJYMMLyH6j1r2zj1/OHhA=;
	b=gHI641G5BZ7bNhyVjjiG2w2hKXGZSYC8mg6KmVNn8XfzncaGWnZP+gBqSXpqClix+i
	3SEOSla6Sx8vTfOHXaCDM/C5Y8w3cPZoKC8IvwAvBbnBsSsJ122K7nXjEjJJ88NOmXeb
	hQtJSx1BReCMMQSeTVG31diFEsESoo4WCUh2E+ZNjWxfki5tYSjxBCEB9CsIXWS7/stH
	eoiKvsMzwlr6Tj8LZdcQS775PJlOcEY6mtWVMxWCcdU14kU2mTUbb6xVF2QA6XqJwG6M
	9HW1cyWyLCuIXlyqTHFtV7x4n4bqJg+JNtzSyhjTbeUWj+n/EQT4SeZrmH3jlkLZXLRK
	KIqw==
X-Gm-Message-State: ALoCoQnWcZzZwnsK/DnIUXzYQ5n4eki6ecef/x2rWM0etC3qt1ZwX7eeO7/jdPfuhm4On8kiB6wP
X-Received: by 10.194.88.230 with SMTP id bj6mr11591wjb.85.1398845394863;
	Wed, 30 Apr 2014 01:09:54 -0700 (PDT)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id bq12sm738752wib.0.2014.04.30.01.09.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 01:09:54 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Apr 2014 10:09:52 +0200
Message-Id: <1398845392-22825-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.9.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-networking][PATCH] netperf: fix S!=B issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Apr 2014 08:09:58 -0000

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-networking/recipes-support/netperf/netperf_2.6.0.bb | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
index 45760ad..7124b02 100644
--- a/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
+++ b/meta-networking/recipes-support/netperf/netperf_2.6.0.bb
@@ -30,7 +30,7 @@ CFLAGS_append = "${@base_contains('DISTRO_FEATURES', 'largefile', \
 # autotools.bbclass attends to include m4 files with path depth <= 2 by
 # "find ${S} -maxdepth 2 -name \*.m4", so move m4 files from m4/m4.
 do_configure_prepend() {
-    test -d m4/m4 && mv -f m4/m4 m4-files
+    test -d ${S}/m4/m4 && mv -f ${S}/m4/m4 ${S}/m4-files
 }
 
 do_install() {
@@ -43,18 +43,18 @@ do_install() {
 
     # man
     install -d ${D}${mandir}/man1/
-    install -m 0644 doc/netserver.man ${D}${mandir}/man1/netserver.1
-    install -m 0644 doc/netperf.man ${D}${mandir}/man1/netperf.1
+    install -m 0644 ${S}/doc/netserver.man ${D}${mandir}/man1/netserver.1
+    install -m 0644 ${S}/doc/netperf.man ${D}${mandir}/man1/netperf.1
 
     # move scripts to examples directory
     install -d ${D}${docdir}/netperf/examples
-    install -m 0644 doc/examples/*_script ${D}${docdir}/netperf/examples/
+    install -m 0644 ${S}/doc/examples/*_script ${D}${docdir}/netperf/examples/
 
     # docs ..
-    install -m 0644 COPYING ${D}${docdir}/netperf
-    install -m 0644 Release_Notes ${D}${docdir}/netperf
-    install -m 0644 README ${D}${docdir}/netperf
-    install -m 0644 doc/netperf_old.ps ${D}${docdir}/netperf
+    install -m 0644 ${S}/COPYING ${D}${docdir}/netperf
+    install -m 0644 ${S}/Release_Notes ${D}${docdir}/netperf
+    install -m 0644 ${S}/README ${D}${docdir}/netperf
+    install -m 0644 ${S}/doc/netperf_old.ps ${D}${docdir}/netperf
 }
 
 INITSCRIPT_NAME="netperf"
-- 
1.9.0


