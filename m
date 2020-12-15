Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.12894.1608043733712806881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 06:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.212
Received: from localhost.localdomain (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8C9911C0017;
	Tue, 15 Dec 2020 14:48:51 +0000 (UTC)
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
Subject: [PATCH] ltp: fix rpc build error
Date: Tue, 15 Dec 2020 15:48:50 +0100
Message-Id: <20201215144850.23152-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.17.1

Add support to tirpc tests build.
Export incdir and libdir to have the right path.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta/recipes-extended/ltp/ltp_20200930.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20200930.bb b/meta/recipes-extended/ltp/ltp_20200930.bb
index 7acf15b360..9b17d68f67 100644
--- a/meta/recipes-extended/ltp/ltp_20200930.bb
+++ b/meta/recipes-extended/ltp/ltp_20200930.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "\
     file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 "
 
-DEPENDS = "attr libaio libcap acl openssl zip-native"
+DEPENDS = "attr libaio libcap acl openssl zip-native libtirpc"
 DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
@@ -44,12 +44,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 export prefix = "/opt/${PN}"
 export exec_prefix = "/opt/${PN}"
+export libdir = "/usr/lib"
+export incdir = "/usr/include"
 
 PACKAGECONFIG[numa] = "--with-numa, --without-numa, numactl,"
 EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
 EXTRA_OECONF = " --with-realtime-testsuite --with-open-posix-testsuite "
-# ltp network/rpc test cases ftbfs when libtirpc is found
-EXTRA_OECONF += " --without-tirpc "
 
 do_install(){
     install -d ${D}${prefix}/
-- 
2.17.1

