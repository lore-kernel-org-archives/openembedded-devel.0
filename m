Return-Path: <cheepeero@gmx.net>
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id EF7B76010E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 19:28:13 +0000 (UTC)
Received: from pink.cheepee.homedns.org ([78.96.83.205]) by mail.gmx.com
	(mrgmx102) with ESMTPA (Nemesis) id 0M6wWn-1VyabZ3lsT-00wnk6 for
	<openembedded-devel@lists.openembedded.org>;
	Sun, 18 Aug 2013 21:28:13 +0200
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2013 22:28:04 +0300
Message-Id: <1376854084-8959-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.8.1.5
X-Provags-ID: V03:K0:J5S19m7Gxlt8OXJkfmvhp1dQhEnKoFDulHAI/VKfrJy67V5UokX
	9KC5aA0ej1AZ+iHiQ6UXBFbKtOCoh1Vm8iOgsYd4If2CLHpBedX+yjQ1XofmsGSQUKOWrYV
	RYTe0a189UC7JtU7bz637S06ooV43h3QEiZxkk+G2WKJmjLyh86qiOhN3qkPOvou0LcbZy2
	Xo2AsKB1BxeDw2PR8NIYw==
Subject: [meta-oe][PATCH] libmicrohttpd: bump to version 0.9.27
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
X-List-Received-Date: Sun, 18 Aug 2013 19:28:14 -0000

---
 .../libmicrohttpd/libmicrohttpd_0.9.27.bb                | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb

diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
new file mode 100644
index 0000000..802ae40
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.9.27.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+
+DEPENDS = "libgcrypt curl"
+
+SRC_URI = "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz"
+SRC_URI[md5sum] = "a10496b7f1b495aaf6897584da52f51b"
+SRC_URI[sha256sum] = "d532edf64c3a9da472114c2d10fc94606e3b31f21b883ec2e796ab8478f7e9cb"
+
+
+inherit autotools lib_package
+
+do_compile_append() {
+	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
+}
-- 
1.8.1.5


