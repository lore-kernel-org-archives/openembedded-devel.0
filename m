Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 41CDA60EB6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 12:17:09 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so498706eek.33
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2013 05:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U188MIwo7e6faRx3ekh+kXwSqYutByv4S9xUGpmsJDc=;
	b=ewcfPiYRS8BUlVxr5uZPUHZKLT/76tfiKx2ZYfUwjvi/SbosXYH1TjeN9g4Prqi9+z
	dv4CgzTprsVxzk2QPD6H1EoPNMW6ONNRoS8NY3yLck1aMbOZK54zkG7eWmw07uTLdlal
	H9KbXWAkJQ01aj5BJO8ViDFNFYfANdSE/8DvhCHNGXvZKuTShdUweyjy20jTVrvxWUtU
	4X3G4ij4taPAX0mT77RYdf45oO8MH8Pb3wZyPA25JnSBZNniilv4T2DnBS3v//T4sm+l
	uLvKKXbzGolCNj9xmWWi6/88YUioKKn7+Qsax4czeuYIdErO0UG41bG5MBw3WgJ9lJ/2
	+uDg==
X-Received: by 10.14.4.1 with SMTP id 1mr828853eei.21.1380197829966;
	Thu, 26 Sep 2013 05:17:09 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm3378249eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 26 Sep 2013 05:17:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Sep 2013 14:17:13 +0200
Message-Id: <1380197833-19970-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] krb5: Upgrade to 1.11.3
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
X-List-Received-Date: Thu, 26 Sep 2013 12:17:11 -0000

* 1.11 is often failing with:
  | common.o: file not recognized: File truncated
  | collect2: ld returned 1 exit status
  | make[2]: *** [t_export_name] Error 1
  when higher parallelism is used
  1.11.2 and newer have fix for that:
  http://krbdev.mit.edu/rt/Ticket/Display.html?id=7587
* LIC_FILES_CHKSUM is only from year update
  < Copyright (C) 1985-2012 by the Massachusetts Institute of Technology.
  ---
  > Copyright (C) 1985-2013 by the Massachusetts Institute of Technology.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../krb5/{krb5_1.11.bb => krb5_1.11.3.bb}                     | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.11.bb => krb5_1.11.3.bb} (78%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
similarity index 78%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
index a68e85d..820a135 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.3.bb
@@ -2,16 +2,15 @@ DESCRIPTION = "A network authentication protocol"
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=e8fad1d174de32f8da0ddc56b67b6941"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=1d9c8180d79838c02eb5eb1a3b184eb9"
 DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
 inherit autotools binconfig perlnative
 
-PR = "r2"
-
-SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar"
-SRC_URI[md5sum] = "1a13c53899806c4da99a798a04d25545"
-SRC_URI[sha256sum] = "fe37fb93b398db98a1b23f814673ea2ae4b90138f85e1a4027ef639456a78651"
+SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${SHRT_VER}/${P}-signed.tar"
+SRC_URI[md5sum] = "56f0ae274b285320b8a597cb89442449"
+SRC_URI[sha256sum] = "9abd94bb94a70996da0f8d90408957154bb543271b097e86c63eb33e5f5751b5"
 
 S = "${WORKDIR}/${P}/src/"
 
-- 
1.8.3.2


