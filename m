Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2239.1596702138694694000
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 01:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36688 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k3bAF-0003lA-Uk; Thu, 06 Aug 2020 11:22:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] xxhash: Upgrade 0.7.4 -> 0.8.0
Date: Thu,  6 Aug 2020 11:22:07 +0300
Message-Id: <20200806082207.19463-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.0 for stable XXH3:

- api : stabilize XXH3
- cli: xxhsum can produce BSD-style lines, with command --tag
- cli : xxhsum can parse and check BSD-style lines, using
  command --check
- cli : xxhsum - accepts console input
- cli : xxhsum accepts -- separator
- cli : fix : print correct default algo for symlinked helpers
- install: improved pkgconfig script, allowing custom install
  locations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../xxhash/{xxhash_0.7.4.bb => xxhash_0.8.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/xxhash/{xxhash_0.7.4.bb => xxhash_0.8.0.bb} (79%)

diff --git a/meta-oe/recipes-support/xxhash/xxhash_0.7.4.bb b/meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb
similarity index 79%
rename from meta-oe/recipes-support/xxhash/xxhash_0.7.4.bb
rename to meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb
index 6e74e49bf..e437d4d15 100644
--- a/meta-oe/recipes-support/xxhash/xxhash_0.7.4.bb
+++ b/meta-oe/recipes-support/xxhash/xxhash_0.8.0.bb
@@ -5,10 +5,10 @@ HOMEPAGE = "http://www.xxhash.com/"
 LICENSE = "BSD-2-Clause & GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b335320506abb0505437e39295e799cb"
 
-SRC_URI = "git://github.com/Cyan4973/xxHash.git"
+SRC_URI = "git://github.com/Cyan4973/xxHash.git;branch=release;protocol=git"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
-SRCREV = "173e50be0509c6fb6c1bb74d95049ef61d7fdced"
+SRCREV = "94e5f23e736f2bb67ebdf90727353e65344f9fc0"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

