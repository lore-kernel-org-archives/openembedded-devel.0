Return-Path: <Adrian.Dudau@enea.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 19 Sep 2016 13:05:01 UTC
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.38])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2096011A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2016 13:05:01 +0000 (UTC)
Received: from 1blyAE-0005sV-TF by out11c.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1blyAE-0005t0-Tl
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2016 05:59:14 -0700
Received: by emcmailer; Mon, 19 Sep 2016 05:59:14 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11c.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1blyAE-0005sV-TF
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2016 05:59:14 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 14:59:13 +0200
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id B7F44441551;
	Mon, 19 Sep 2016 14:59:13 +0200 (CEST)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Sep 2016 14:59:13 +0200
Message-ID: <1474289953-39208-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [meta-networking][PATCH] openl2tp: Obey LDFLAGS in Makefile
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
X-List-Received-Date: Mon, 19 Sep 2016 13:05:05 -0000
Content-Type: text/plain

This avoids a "QA Issue: No GNU_HASH in the elf binary"

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 .../openl2tp/openl2tp/Makefile-obey-LDFLAGS.patch         | 15 +++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb            |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-obey-LDFLAGS.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-obey-LDFLAGS.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-obey-LDFLAGS.patch
new file mode 100644
index 0000000..811fadd
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/Makefile-obey-LDFLAGS.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Pending
+
+--- openl2tp-1.8/Makefile.orig	2016-09-16 14:54:18.554291976 +0200
++++ openl2tp-1.8/Makefile	2016-09-16 14:57:23.559090400 +0200
+@@ -157,8 +157,8 @@ ADD_CFLAGS=			-I. -Iusl -Icli -isystem i
+ 				-MMD -Wall -Wno-strict-aliasing \
+ 				$(ADD_CPPFLAGS) $(CPPFLAGS.dmalloc) \
+ 				-DSYS_LIBDIR=$(SYS_LIBDIR)
+-LDFLAGS.l2tpd=		-Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc
+-LDFLAGS.l2tpconfig=	-Lcli -lcli -lreadline $(LIBS.dmalloc) $(READLINE_LDFLAGS) -lc
++LDFLAGS.l2tpd=		-Wl,-E -L. -Lusl -lusl -ldl $(LIBS.dmalloc) -lc $(LDFLAGS)
++LDFLAGS.l2tpconfig=	-Lcli -lcli -lreadline $(LIBS.dmalloc) $(READLINE_LDFLAGS) -lc $(LDFLAGS)
+ 
+ OPT_CFLAGS?=		-O
+ 
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index d043b63..270472e 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -14,6 +14,7 @@ DEPENDS = "popt flex readline"
 SRC_URI = "http://ftp.jaist.ac.jp/pub/sourceforge/o/op/${PN}/${PN}/${PV}/${BP}.tar.gz \
            file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
            file://openl2tp-simplify-gcc-warning-hack.patch \
+           file://Makefile-obey-LDFLAGS.patch \
           "
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
-- 
1.9.1


