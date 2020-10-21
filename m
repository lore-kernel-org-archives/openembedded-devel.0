Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8575.1603268739347760447
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 01:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38626 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kV9RA-0005B2-LH; Wed, 21 Oct 2020 11:25:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-pydicti: Upgrade 1.1.3 -> 1.1.4
Date: Wed, 21 Oct 2020 11:25:30 +0300
Message-Id: <20201021082530.10132-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021082530.10132-1-leon.anavi@konsulko.com>
References: <20201021082530.10132-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.4:

- use str.casefold() on python3
- make normalization function a parameter of build_dict, so that
  user-defined normalization functions can be passed

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pydicti_1.1.3.bb => python3-pydicti_1.1.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pydicti_1.1.3.bb => python3-pydicti_1.1.4.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb b/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
index bca0ba7378..29ad30e0f5 100644
--- a/meta-python/recipes-devtools/python/python3-pydicti_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pydicti_1.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/coldfix/pydicti"
 LICENSE = "WTFPL"
 LIC_FILES_CHKSUM = "file://COPYING;md5=389a9e29629d1f05e115f8f05c283df5"
 
-SRC_URI[md5sum] = "b02ed35da91e400f1f17a57ab02ba06b"
-SRC_URI[sha256sum] = "eea50576baa751a9b6b862f09f081c47d557e0298623ca8742851da72b00eec4"
+SRC_URI[md5sum] = "c8925e333a78766cb469c1626880bd35"
+SRC_URI[sha256sum] = "dcea4d1892fc68ca62aba835b1ed444a1eb48bd0cca0b4599efd45cbb6272b5c"
 
 inherit pypi setuptools3
-- 
2.17.1

