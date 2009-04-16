Received: from [80.81.242.146] (helo=amethyst.openembedded.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen@amethyst.openembedded.net>) id 1LuPyE-0000TC-RM
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Apr 2009 13:44:42 +0200
Received: by amethyst.openembedded.net (Postfix, from userid 1002)
	id 3C2F0189362; Thu, 16 Apr 2009 13:41:06 +0200 (CEST)
From: Koen Kooi <k.kooi@student.utwente.nl>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Apr 2009 13:41:06 +0200
Message-Id: <1239882066-23128-1-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.5.6.5
X-SA-Exim-Connect-IP: 80.81.242.146
X-SA-Exim-Mail-From: koen@amethyst.openembedded.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: [STABLE][PATCH] obexftp: update to 0.23
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
X-List-Received-Date: Thu, 16 Apr 2009 11:45:23 -0000

From: Koen Kooi <koen@openembedded.org>


Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 conf/checksums.ini              |    4 ++++
 recipes/obexftp/obexftp_0.23.bb |   27 +++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/obexftp/obexftp_0.23.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 5a4619d..60a8672 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -17170,6 +17170,10 @@ sha256=09687012d5e016277fa638f22b8c784aea6803056c70d14614e3b75158aae877
 md5=d167cfdea244e3a5f973a7b16864419c
 sha256=09687012d5e016277fa638f22b8c784aea6803056c70d14614e3b75158aae877
 
+[http://downloads.sourceforge.net/openobex/obexftp-0.23.tar.bz2]
+md5=f20762061b68bc921e80be4aebc349eb
+sha256=44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36
+
 [http://www.caside.lancs.ac.uk/bt/obexpush.tar.gz]
 md5=edb66ba97fe6c84b6160c670c4bcdea8
 sha256=341c6865aa392b6cf056e1bd9cda53d2f31a942460087ad22d6f6dc91bb0bd0e
diff --git a/recipes/obexftp/obexftp_0.23.bb b/recipes/obexftp/obexftp_0.23.bb
new file mode 100644
index 0000000..d3924f6
--- /dev/null
+++ b/recipes/obexftp/obexftp_0.23.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "OBEX Ftp Client based on openobex."
+SECTION = "console/network"
+HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
+LICENSE = "GPL"
+DEPENDS = "openobex bluez4 libusb-compat virtual/libiconv"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/openobex/obexftp-${PV}.tar.bz2 \
+	  "
+
+inherit autotools_stage
+AUTOTOOLS_STAGE_PKGCONFIG = "1"
+
+EXTRA_OECONF += "--enable-bluetooth \
+		 --disable-swig \
+		 --disable-perl \
+		 --disable-python \
+		 --disable-tcl \
+		 --disable-ruby \
+		 --disable-builddocs \
+		 --disable-rpath \
+		"
+
+PARALLEL_MAKE = ""
+
+LEAD_SONAME = "libobexftp.so"
+
+
-- 
1.5.6.5



