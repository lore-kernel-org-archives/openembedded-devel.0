Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0A8B96B2BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2013 14:54:19 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d49so5077789eek.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2013 06:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/bPYWQkpam47qr3c3FVKzkZdWyv/daqsXGZDeAqHDYU=;
	b=SLv5SNobLvTqaqKlYkZ9wHGV+rfAT/OuTNC+rrlS+nAfstOc30snPsd+0Td3NTo8Y5
	RP2MA+88sI8RQs9+eOrGsgkjcps3usHV/0EgB/nLhPFK0demyksRLVQOkiHCNiNPo67X
	bzj++mkGTx4j7Cn7MG8jaT+zXEJ6Fu+ekabL9rQKDprkT0qo9Qa1TqY9t0jttSlyJLtE
	qr7R2xOf7p39kvQdlOn9CMJFDoOAcW3jw+gq3jfzzDoYJgDPB3HipP0N0yd92hHiRjei
	GDXPW8uv9G73reohDMLigJeys6udFhtHR2yMrk3rQQyLNn7Ycfz/ekjg9k/Fb7FatnS4
	JQcg==
X-Received: by 10.14.221.1 with SMTP id q1mr81662eep.116.1388415260529;
	Mon, 30 Dec 2013 06:54:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	z42sm109375249eeo.17.2013.12.30.06.54.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Dec 2013 06:54:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Dec 2013 15:54:19 +0100
Message-Id: <1388415259-6360-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
Subject: [meta-oe][PATCH] mariadb-native: fix dependencies
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
X-List-Received-Date: Mon, 30 Dec 2013 14:54:20 -0000

* unlike BBCLASSEXTENDed native support, dependencies in mariadb-native don't get
  automatic -native suffix, so mariadb-native was depending on target ncurses and zlib.
* move the dependency from .inc and apply it with right suffix

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb | 1 +
 meta-oe/recipes-support/mysql/mariadb_5.1.67.bb        | 2 +-
 meta-oe/recipes-support/mysql/mariadb_5.1.67.inc       | 2 --
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
index e8382e2..15605d0 100644
--- a/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb-native_5.1.67.bb
@@ -2,6 +2,7 @@ require mariadb_${PV}.inc
 inherit native
 
 PROVIDES += "mysql5-native"
+DEPENDS = "ncurses-native zlib-native"
 
 RDEPENDS_${PN} = ""
 PACKAGES = ""
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
index fc499d4..3b15c00 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.bb
@@ -1,6 +1,6 @@
 require ${PN}_${PV}.inc
 
-DEPENDS += "mariadb-native"
+DEPENDS += "mariadb-native ncurses-native zlib-native"
 
 PROVIDES += "mysql5"
 
diff --git a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
index e66f215..7cedd9e 100644
--- a/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
+++ b/meta-oe/recipes-support/mysql/mariadb_5.1.67.inc
@@ -4,8 +4,6 @@ SECTION = "libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "ncurses zlib"
-
 SRC_URI = "http://mirrors.coreix.net/mariadb/mariadb-${PV}/kvm-tarbake-jaunty-x86/mariadb-${PV}.tar.gz \
            file://configure.in.patch \
            file://plug.in.patch \
-- 
1.8.4.3


