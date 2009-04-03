Received: from [80.246.246.162] (helo=office.altell.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LpgJZ-0001Op-GE
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Apr 2009 12:07:59 +0200
Received: from localhost.localdomain (unknown [192.168.1.115])
	by mail.altell.local (Postfix) with ESMTP id C17476831B;
	Fri,  3 Apr 2009 14:04:40 +0400 (MSD)
From: Roman I Khimov <khimov@altell.ru>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Apr 2009 14:04:40 +0400
Message-Id: <1238753080-8005-1-git-send-email-khimov@altell.ru>
X-Mailer: git-send-email 1.6.2.1
MIME-Version: 1.0
X-Altell-MailScanner: Found to be clean
X-Altell-MailScanner-From: khimov@altell.ru
X-SA-Exim-Connect-IP: 80.246.246.162
X-SA-Exim-Mail-From: khimov@altell.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ace: New recipe for ACE 5.6.8
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
X-List-Received-Date: Fri, 03 Apr 2009 10:08:00 -0000

---
 conf/checksums.ini       |    4 ++++
 recipes/ace/ace.inc      |   18 ++++++++++++++++++
 recipes/ace/ace_5.6.8.bb |    1 +
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ace/ace.inc
 create mode 100644 recipes/ace/ace_5.6.8.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 15fff1d..18ea297 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -58,6 +58,10 @@ sha256=7a960180e7873b1bdb522e76b0423b5c2c1b8efe1d30d7ca80c41eb97d822b2d
 md5=24b0e5bbfe21ea9c5a5c589bcc79c0f2
 sha256=ab877846c6caaff32efbf5be6fc5c63b7dec97a2e78c57c525da7705d2052bfc
 
+[ftp://download.dre.vanderbilt.edu/previous_versions/ACE-5.6.8.tar.bz2]
+md5=81c1ff761c3431cd12c81337aa80d558
+sha256=96b70582d931a7e83c3ca31b3bc7e23957391e16dee4ae6ddf938c9574d50b27
+
 [http://www.amd.com/files/connectivitysolutions/geode/geode_lx/AES_Linux_LX_02.01.0100.tar.gz]
 md5=12cb241a9037fffe31ba7c68a48ed614
 sha256=a6068b4aa0e2330eed6e4741bad3191dc9ca7d7326f7bfab578ac55e2b8b91a2
diff --git a/recipes/ace/ace.inc b/recipes/ace/ace.inc
new file mode 100644
index 0000000..a83eb65
--- /dev/null
+++ b/recipes/ace/ace.inc
@@ -0,0 +1,18 @@
+DESCRIPTION = "C++ network programming framework"
+SECTION = "net"
+LICENSE = "BSD + others"
+
+DEPENDS += "openssl gperf-native"
+
+SRC_URI = "ftp://download.dre.vanderbilt.edu/previous_versions/ACE-${PV}.tar.bz2"
+S = "${WORKDIR}/ACE_wrappers"
+B = "${WORKDIR}/build.${TARGET_SYS}"
+
+EXTRA_OECONF += "--disable-ace-tests --disable-gperf"
+LEAD_SONAME = "libACE-[0-9.]*.so"
+
+inherit autotools
+
+do_configure_prepend() {
+	export ace_cv_linux_event_poll=yes
+}
diff --git a/recipes/ace/ace_5.6.8.bb b/recipes/ace/ace_5.6.8.bb
new file mode 100644
index 0000000..345abe1
--- /dev/null
+++ b/recipes/ace/ace_5.6.8.bb
@@ -0,0 +1 @@
+require ace.inc
-- 
1.6.2.1


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.



