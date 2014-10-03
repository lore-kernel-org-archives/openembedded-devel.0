Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8DBA9715B5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 09:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C393618175
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 11:21:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BOx02VSssrqc
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 11:21:53 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 9DF0318165
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 11:21:53 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 811B9105B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 11:21:53 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 6E907FBB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Oct 2014 11:21:53 +0200 (CEST)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by seth.se.axis.com (Postfix) with ESMTP id 6C8973E1C4;
	Fri,  3 Oct 2014 11:21:53 +0200 (CEST)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id 98DA08009B6; Fri,  3 Oct 2014 11:21:12 +0200 (CEST)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Oct 2014 11:21:11 +0200
Message-Id: <1412328071-1149-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>, Olof Johansson <olofjn@axis.com>
Subject: [meta-oe][PATCH] libssh2: add recipe file
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
X-List-Received-Date: Fri, 03 Oct 2014 09:21:59 -0000

A separate commit on curl adds a PACKAGECONFIG option within the
curl recipe in OE-Core to use libssh2 in curl, the user can enable
libssh2 via conf/local.conf or custom distro configuration, this will
pull in libssh2, which is not used by default.

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb

diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb b/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
new file mode 100644
index 0000000..b537663
--- /dev/null
+++ b/meta-oe/recipes-support/libssh2/libssh2_1.4.3.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A client-side C library implementing the SSH2 protocol"
+HOMEPAGE = "http://www.libssh2.org/"
+SECTION = "libs"
+
+DEPENDS = "zlib openssl"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d00afe44f336a79a2ca7e1681ce14509"
+
+SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz"
+SRC_URI[md5sum] = "071004c60c5d6f90354ad1b701013a0b"
+SRC_URI[sha256sum] = "eac6f85f9df9db2e6386906a6227eb2cd7b3245739561cad7d6dc1d5d021b96d"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF += "--with-openssl \
+                --with-libz \
+                "
-- 
1.9.1


