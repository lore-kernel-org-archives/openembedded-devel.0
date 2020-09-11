Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
 by mx.groups.io with SMTP id smtpd.web11.5095.1599819691985015125
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2020 03:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@skidata.com header.s=selector1 header.b=dNNpGLCf;
 spf=pass (domain: skidata.com, ip: 91.230.2.91, mailfrom: prvs=516bca272=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1599819692; x=1631355692;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=I5VCJV9nZE2yYZg9Z+PFS8jAHfvJE0V/TFuZapunM3I=;
  b=dNNpGLCfCJpMv7rkFmQd/aZFSh7Kxu5ZnisrOrYU9A3XoRT5sG0g8vJn
   +ySb5IXHi9QVQoh/ZL2+BYLxSkbeByZYDaAAW81wqy3FoLLD1cs4pntfa
   4gPxhskRk9rOj4dlXlxZyNx/wpNUKtt2pv7QLEmXlSNouH+6sIPg/osJm
   BUwvp2wJmnGUoy/75JO4Uz1l2ERJtwp5Hi9tx6qMA/iPjdeEnZufeCKzu
   fkWnMptV/phjwE9ec+fDQ0Pu5isZ1iU1ZRsdlRp+uwpC/yHfACGy7j+WC
   +sO4oMj0JCQfZnxetzLPXrcLSZHcaUw+WFt4mzzdf4ib1QTWLnNv1rPYj
   Q==;
IronPort-SDR: 2ZL+z/SHVojvZcqY/QBswxCh9pruZJi46GyHqzvySOluNXZoq7nTNCx2u5+Wwb3Q1WNww0pd+f
 yGSR8TGRBKhSVCeph3Uq2ljNy9ONuA1Bn37FjnIflXCrADgXsTg5tYhh6AA80xWLRmKVRyrRrb
 9gFqfrO8qtpeVyR9WOJd2uxt5U4HLM6AyZB6DRyGaKQTdcDAgteZ7T02SM+E+cYsxMKhNa7u+4
 OMZYVQWumesPv16NvotOweMlErGgql9Pe3GthLbW+S/dpY9wTsvLbOdlyrhuTDjBQUlcX03s/t
 r4s=
X-IronPort-AV: E=Sophos;i="5.76,414,1592863200"; 
   d="scan'208";a="2665878"
From: "Richard Leitner" <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Richard Leitner <richard.leitner@skidata.com>
Subject: [meta-java][PATCH 1/3] openjdk-8: add ALTERNATIVE for "keytool"
Date: Fri, 11 Sep 2020 12:21:14 +0200
Message-ID: <20200911102116.597001-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

As we have ALTERNATIVEs for java and javac we should also provide one
for the keytool.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8_265.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-8_265.bb b/recipes-core/openjdk/openjdk-8_265.bb
index bc6ce51..f9049e5 100644
--- a/recipes-core/openjdk/openjdk-8_265.bb
+++ b/recipes-core/openjdk/openjdk-8_265.bb
@@ -53,9 +53,12 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "java javac"
+ALTERNATIVE_${PN} = "java javac keytool"
 ALTERNATIVE_LINK_NAME[java] = "${bindir}/java"
 ALTERNATIVE_TARGET[java] = "${JDK_HOME}/bin/java"
 
 ALTERNATIVE_LINK_NAME[javac] = "${bindir}/javac"
 ALTERNATIVE_TARGET[javac] = "${JDK_HOME}/bin/javac"
+
+ALTERNATIVE_LINK_NAME[keytool] = "${bindir}/keytool"
+ALTERNATIVE_TARGET[keytool] = "${JDK_HOME}/bin/keytool"
-- 
2.26.2

