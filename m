Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RIH7A-0006ag-SH
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Oct 2011 11:46:40 +0200
Received: by wwf10 with SMTP id 10so7127460wwf.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Oct 2011 02:40:44 -0700 (PDT)
Received: by 10.227.42.196 with SMTP id t4mr577431wbe.29.1319449243171;
	Mon, 24 Oct 2011 02:40:43 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fr4sm9298477wbb.0.2011.10.24.02.40.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 02:40:42 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Oct 2011 11:40:28 +0200
Message-Id: <1319449234-12080-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
References: <1319449234-12080-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/8] libmicrohttpd 0.4.6: import from OE classic
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
X-List-Received-Date: Mon, 24 Oct 2011 09:46:41 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../libmicrohttpd/libmicrohttpd_0.4.6.bb           |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb

diff --git a/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
new file mode 100644
index 0000000..0fb9b4e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmicrohttpd/libmicrohttpd_0.4.6.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application."
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
+
+DEPENDS = "libgcrypt curl"
+
+SRC_URI = "ftp://ftp.nluug.nl/pub/gnu/libmicrohttpd//libmicrohttpd-${PV}.tar.gz"
+SRC_URI[md5sum] = "61698da6aa04744ea076c327f66fc05a"
+SRC_URI[sha256sum] = "0cb09e26678d1531a4fd40a748abff5142bfdad3ae11cfe3bb7ad7317a99e371"
+
+inherit autotools lib_package
+
+do_compile_append() {
+	sed -i s:-L${STAGING_LIBDIR}::g libmicrohttpd.pc
+}
-- 
1.6.6.1



