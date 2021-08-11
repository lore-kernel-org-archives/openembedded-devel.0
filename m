Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5269.1628673345175152214
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 02:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDkKl-0001XG-Uk; Wed, 11 Aug 2021 12:15:42 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-google-api-core: Upgrade 1.30.0 -> 1.31.1
Date: Wed, 11 Aug 2021 12:15:26 +0300
Message-Id: <20210811091530.26594-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.31.1:

- add 'requests.exceptions.ChunkedEncodingError' to retryable
  exceptions
- add Samples section to CONTRIBUTING.rst
- add ServiceUnavailable exception to polling retries
- undprecate entity factory helpers

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...gle-api-core_1.30.0.bb => python3-google-api-core_1.31.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_1.30.0.bb => python3-google-api-core_1.31.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_1.31.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_1.31.1.bb
index 2ded8c66bb..fe0aebb527 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_1.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_1.31.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "0724d354d394b3d763bc10dfee05807813c5210f0bd9b8e2ddf6b6925603411c"
+SRC_URI[sha256sum] = "108cf94336aed7e614eafc53933ef02adf63b9f0fd87e8f8212acaa09eaca456"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.17.1

