Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.470.1593451168850183455
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 10:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39772 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpxRH-0000w7-Ik; Mon, 29 Jun 2020 20:19:28 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-lz4: Upgrade 3.0.2 -> 3.1.0
Date: Mon, 29 Jun 2020 20:18:53 +0300
Message-Id: <20200629171853.18608-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629171853.18608-1-leon.anavi@konsulko.com>
References: <20200629171853.18608-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=0.0
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

Upgrade to 3.1.0:

- Adds block size record support to the stream bindings
- Fixups to the tests to reduce execution time
- A few small fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-lz4_3.0.2.bb => python3-lz4_3.1.0.bb}     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_3.0.2.bb => python3-lz4_3.1.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb b/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
rename to meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
index e39ca8f3b..06bf63159 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_3.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_3.1.0.bb
@@ -7,7 +7,9 @@ DEPENDS += " \
     ${PYTHON_PN}-setuptools-scm-native \
     ${PYTHON_PN}-pkgconfig-native \
 "
-SRC_URI[sha256sum] = "9c9f6a8b71c18c24bd83537a4d616f0301623a5e98db7c7ca956d608e1bcd4c7"
+
+SRC_URI[md5sum] = "1bf913acec3cb63893f522c222c8e3b1"
+SRC_URI[sha256sum] = "debe75513db3eb9e5cdcd82a329ff38374b6316ab65b848b571e0404746c1e05"
 
 inherit pypi setuptools3
 
-- 
2.17.1

