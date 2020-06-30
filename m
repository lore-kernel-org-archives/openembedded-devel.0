Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.1947.1593537088825509720
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJn4-0004sv-Iy; Tue, 30 Jun 2020 20:11:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-cassandra-driver: Upgrade 3.14.0 -> 3.24.0
Date: Tue, 30 Jun 2020 20:11:13 +0300
Message-Id: <20200630171119.25540-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 3.24.0:

Features
- Make geomet an optional dependency at runtime (PYTHON-1237)
- Add use_default_tempdir cloud config options (PYTHON-1245)
- Tcp flow control for libevreactor (PYTHON-1248)

Bug Fixes
- Unable to connect to a cloud cluster using Ubuntu 20.04
  (PYTHON-1238)
- PlainTextAuthProvider fails with unicode chars and Python3
  (PYTHON-1241)
- [GRAPH] Graph execution profiles consistency level are not set
  to LOCAL_QUORUM with a cloud cluster (PYTHON-1240)
- [GRAPH] Can't write data in a Boolean field using the Fluent API
  (PYTHON-1239)
- [GRAPH] Fix elementMap() result deserialization (PYTHON-1233)

Others
- Bump geomet dependency version to 0.2 (PYTHON-1243)
- Bump gremlinpython dependency version to 3.4.6 (PYTHON-1212)
- Improve fluent graph documentation for core graphs (PYTHON-1244)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ra-driver_3.14.0.bb => python3-cassandra-driver_3.24.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.14.0.bb => python3-cassandra-driver_3.24.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
index 768e557b9..562829028 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "c5bed026bf48c821424c1f6296193908"
-SRC_URI[sha256sum] = "b65218e2582277f5b77d1436e420db8616f63e3437a9e839cdcd7172d760e861"
+SRC_URI[md5sum] = "c31bc29989d8b0c7524a38b0e38c8bfb"
+SRC_URI[sha256sum] = "83ec8d9a5827ee44bb1c0601a63696a8a9086beaf0151c8255556299246081bd"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
-- 
2.17.1

