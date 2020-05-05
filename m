Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2628.1588657409124908752
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 May 2020 22:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: enedino.org, ip: 13.77.154.182, mailfrom: alejandro@enedino.org)
Received: from ALSAMON-X.corp.microsoft.com (unknown [131.107.159.250])
	by linux.microsoft.com (Postfix) with ESMTPSA id 9576220B717B
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 May 2020 22:43:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9576220B717B
From: "Alejandro Hernandez" <alejandro@enedino.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imapfilter: introduce imapfilter recipe providing a mailbox filter through the IMAP protocol
Date: Mon,  4 May 2020 22:43:15 -0700
Message-Id: <20200505054315.7596-1-alejandro@enedino.org>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alejandro Hernandez Samaniego <alejandro@enedino.org>
---
 .../imapfilter/imapfilter_2.6.16.bb             | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb

diff --git a/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb b/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
new file mode 100644
index 000000000..7d4e12dfb
--- /dev/null
+++ b/meta-oe/recipes-support/imapfilter/imapfilter_2.6.16.bb
@@ -0,0 +1,17 @@
+SUMMARY = "IMAPFilter is a mail filtering utility that processes mailboxes based on IMAP queries"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ccca8573ead8e965c130b6b2946a36ab"
+
+SRC_URI = "https://codeload.github.com/lefcha/${BPN}/tar.gz/v${PV};downloadfilename=v${PV}.tar.gz"
+SRC_URI[sha256sum] = "90af9bc9875e03fb5a09a3233287b74dd817867cb18ec9ff52fead615755563e"
+
+DEPENDS= "openssl lua libpcre"
+
+EXTRA_OEMAKE_append = " PREFIX=${prefix}"
+
+do_install(){
+    oe_runmake DESTDIR=${D} install
+
+    # No need for manuals at this point, MANDIR is hardcoded to depend on prefix
+    rm -rf ${D}${prefix}/man
+}
-- 
2.17.1

