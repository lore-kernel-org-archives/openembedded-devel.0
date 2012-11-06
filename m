Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marc.ferland@gmail.com>) id 1TVmmi-0005y6-Bf
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Nov 2012 18:17:56 +0100
Received: by mail-qc0-f175.google.com with SMTP id j3so403746qcs.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Nov 2012 09:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=V6LQUo+iT+JvCvhn+OEcvtZNWrJ0IEhAHy4wPCwBVko=;
	b=Qt1ZTqomm9eUITOwlp6Dv02nNAF9DDgSyD9jrnJFPfnUmCGpA+cC9pg/ggP/UEpK/8
	sLcaLn1+uvMeYcfqKoXRP7YisuuypGhBZ8sufAekPYftSaVe+pJLY6XQckw3FdDqfwUN
	2yQboP/EaXGtaIoq30lGZBzBiyIfQi39PfFygHi2gyCf9i/dbzPG6Z0uM9R6U2iW7WXv
	miPdr40Cc7LQ6hhyfiOCB0ydOusCeB8rFieTzFlZJrTVUrsW0kBjzplmgQjDw4KQNEf8
	3XlgivyG0Lf2eUlTWhdpGXLVtxaoPT7HKdlLJDbfN4v/q6YZh1ZnJn6EsHQ3Y9Se/BeG
	t7Xg==
Received: by 10.49.63.97 with SMTP id f1mr2941626qes.4.1352221450929;
	Tue, 06 Nov 2012 09:04:10 -0800 (PST)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPS id pb2sm10848857qeb.0.2012.11.06.09.04.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Nov 2012 09:04:10 -0800 (PST)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 06 Nov 2012 12:04:32 -0500
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Nov 2012 12:04:32 -0500
Message-Id: <1352221472-13192-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][PATCH] rrdtool: Remove hard-coded include in configure.ac
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
X-List-Received-Date: Tue, 06 Nov 2012 17:17:56 -0000

Got an error building rrdtool because of hard-coded paths in the
configure.ac file. The extact error message was:

ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was '/home/marc/yoctomaster/build/crownbay/tmp/work/core2-poky-linux/rrdtool-1.4.7-r2/rrdtool-1.4.7'
---
 .../rrdtool/remove_hardcoded_xml_include.patch     |   11 +++++++++++
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb  |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch
new file mode 100644
index 0000000..321a842
--- /dev/null
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch
@@ -0,0 +1,11 @@
+--- a/configure.ac	2012-11-06 11:20:54.099021892 -0500
++++ b/configure.ac~	2012-11-06 11:19:57.255023857 -0500
+@@ -548,7 +548,7 @@
+ 
+ fi
+ EX_CHECK_ALL(glib-2.0,   glib_check_version,            glib.h,                 glib-2.0,    2.28.7, ftp://ftp.gtk.org/pub/glib/2.28/, "")
+-EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, /usr/include/libxml2)
++EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, "")
+ 
+ if test "$EX_CHECK_ALL_ERR" = "YES"; then
+   AC_MSG_ERROR([Please fix the library issues listed above and try again.])
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index 73141b4..465ef8a 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
            file://0001-rrdtool-eradicate-tcl-support.patch \
+           file://remove_hardcoded_xml_include.patch \
           "
 SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f"
 SRC_URI[sha256sum] = "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
-- 
1.7.5.4



