Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.100.1616173997223466658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:13:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37638 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lNIgU-0002xc-EB; Fri, 19 Mar 2021 19:13:14 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-cassandra-driver: Upgrade 3.24.0 -> 3.25.0
Date: Fri, 19 Mar 2021 19:13:03 +0200
Message-Id: <20210319171304.28090-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210319171304.28090-1-leon.anavi@konsulko.com>
References: <20210319171304.28090-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.25.0:

- Ensure the driver can connect when invalid peer hosts are in
  system.peers
- Implement protocol v5 checksumming
- Fix the default cqlengine connection mechanism to work with
  Astra
- Asyncore race condition cause logging exception on shutdown
- Update list of reserved keywords
- Drop Python 3.4 support
- Update security documentation and examples to use PROTOCOL_TLS

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...dra-driver_3.24.0.bb => python3-cassandra-driver_3.25.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cassandra-driver_3.24.0.bb => python3-cassandra-driver_3.25.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
rename to meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
index 562829028..a1941bf3c 100644
--- a/meta-python/recipes-devtools/python/python3-cassandra-driver_3.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb
@@ -8,8 +8,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
 SRCNAME = "cassandra-driver"
 
-SRC_URI[md5sum] = "c31bc29989d8b0c7524a38b0e38c8bfb"
-SRC_URI[sha256sum] = "83ec8d9a5827ee44bb1c0601a63696a8a9086beaf0151c8255556299246081bd"
+SRC_URI[sha256sum] = "8ad7d7c090eb1cac6110b3bfc1fd2d334ac62f415aac09350ebb8d241b7aa7ee"
 
 DISTUTILS_BUILD_ARGS += " \
     --no-libev \
-- 
2.17.1

