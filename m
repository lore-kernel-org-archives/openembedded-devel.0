Received: from jax4mhob15.registeredsite.com (jax4mhob15.registeredsite.com [64.69.218.103])
 by mx.groups.io with SMTP id smtpd.web12.2962.1616575292560509564
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 01:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: topic.nl, ip: 64.69.218.103, mailfrom: mike.looijmans@topic.nl)
Received: from mailpod.hostingplatform.com ([10.30.71.205])
	by jax4mhob15.registeredsite.com (8.14.4/8.14.4) with ESMTP id 12O8fUXm064652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 04:41:30 -0400
Received: (qmail 25789 invoked by uid 0); 24 Mar 2021 08:41:30 -0000
X-TCPREMOTEIP: 83.128.90.119
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO phenom.domain?not?set.invalid) (mike@milosoftware.com@83.128.90.119)
  by 0 with ESMTPA; 24 Mar 2021 08:41:29 -0000
From: "Mike Looijmans" <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Cc: richard.leitner@skidata.com, Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH][meta-java][master] openjdk-8: Workaround TOPDIR not getting expanded in configure.ac
Date: Wed, 24 Mar 2021 09:41:24 +0100
Message-Id: <20210324084124.2828-1-mike.looijmans@topic.nl>
X-Mailer: git-send-email 2.17.1

Somehow the TOPDIR environment doesn't get expanded in configure.ac. Suspecting
a clash with OE's internal TOPDIR variable, I tried replacing it with JDKTOPDIR
but that resulted in the same error.

| autoreconf: configure.ac: creating directory $TOPDIR/common/autoconf/build-aux
| autoreconf: error: cannot create $TOPDIR/common/autoconf/build-aux: No such file or directory

The workaround implemented here is to replace $TOPDIR in the file by its assigned
value ${S}. This makes the error go away and the native build succeed.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 recipes-core/openjdk/openjdk-8-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 70585a6..7d45585 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -28,6 +28,7 @@ SRC_URI = "\
 
 do_configure_prepend () {
     export TOPDIR=${S}
+    sed -i 's#\$TOPDIR#${S}#g' ${S}/common/autoconf/configure.ac
 }
 
 do_unpack_extract_submodules () {
-- 
2.17.1

