Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <t.fromm@DResearch.de>) id 1P0VJL-0000m2-Dr
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 10:13:16 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 7DE47491282
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 10:13:03 +0200 (CEST)
Received: from localhost.localdomain ([10.32.10.1]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 28 Sep 2010 10:13:03 +0200
From: Thilo Fromm <t.fromm@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Sep 2010 10:12:44 +0200
Message-Id: <1285661564-1308-1-git-send-email-t.fromm@dresearch.de>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1285660172.4168.10.camel@mattotaupa>
References: <1285660172.4168.10.camel@mattotaupa>
In-Reply-To: <1285660172.4168.10.camel@mattotaupa>
References: <1285660172.4168.10.camel@mattotaupa>
X-OriginalArrivalTime: 28 Sep 2010 08:13:03.0298 (UTC)
	FILETIME=[F8FB8A20:01CB5EE4]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: t.fromm@DResearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [v2] wvstreams-4.6: Remove dbus support because it breaks the build
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
X-List-Received-Date: Tue, 28 Sep 2010 08:13:16 -0000

From: t.fromm <t.fromm@ba11ecae-741b-462f-8724-1218f99f5906>

If wvstreams is configured with DBus support enabled (by not providing
--without-dbus) the the build fails at link time as libdbus cannot be
found:

| ./CXX -c dbus/wvdbusconn
| ./CXX -c dbus/wvdbusmarshal
| ./CXX -c dbus/wvdbusmsg
| ./CXX -c dbus/wvdbusserver
| linking libwvdbus.so...
| arm-angstrom-linux-gnueabi-g++: /libdbus-1.a: No such file or directory
| make: *** [libwvdbus.so] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: /SCRATCH/maniac/oe-merge-test/OE/tmp.6/work/armv5te-angstrom-linux-gnueabi/wvstreams-4.6-r0/temp/log.do_compile.6422
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/wvstreams_4.6.bb do_compile failed
ERROR: Task 2024 (/home/maniac/work/HYP/oe/3way_merge/recipes/wvstreams/wvstreams_4.6.bb, do_compile) failed

The root cause for this behaviour is in wvstreams' configure.ac; the
weird dbus detection and library path handling breaks successive builds.

This patch, however, does not fix the configure.ac file but disables
DBus support for wvstreams at configure time. This at least fixes the
broken build.

Signed-off-by: Thilo Fromm <t.fromm@dresearch.de>
---
 recipes/wvstreams/wvstreams_4.6.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstreams_4.6.bb
index 91abc7d..688a80f 100644
--- a/recipes/wvstreams/wvstreams_4.6.bb
+++ b/recipes/wvstreams/wvstreams_4.6.bb
@@ -3,6 +3,8 @@ LICENSE = "LGPL"
 DESCRIPTION = "WvStreams is a network programming library in C++"
 DEPENDS = "zlib openssl (>= 0.9.8)"
 
+PR = "r2"
+
 SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
 	"
 
@@ -10,7 +12,8 @@ inherit autotools pkgconfig
 
 LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
 
-EXTRA_OECONF = " --without-tcl --without-qt --without-pam"
+# dbus detection currently broken in configure.ac; remember to add "dbus (>= 1.2.14)" to DEPENDS  when fixed
+EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-dbus"
 
 PACKAGES_prepend = "libuniconf libuniconf-dbg "
 PACKAGES_prepend = "uniconfd uniconfd-dbg "
-- 
1.7.0.4



