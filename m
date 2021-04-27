Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.5952.1619514965774580434
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Apr 2021 02:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56792 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lbJp3-0008Bm-L6; Tue, 27 Apr 2021 12:16:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-astroid: Upgrade 2.5.3 -> 2.5.6
Date: Tue, 27 Apr 2021 12:15:55 +0300
Message-Id: <20210427091557.17899-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.6:

- Fix retro-compatibility issues with old version of pylint

License-Update: Remove outdated COPYING and use LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.5.3.bb => python3-astroid_2.5.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.5.3.bb => python3-astroid_2.5.6.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb b/meta-python/recipes-devtools/python/python3-astroid_2.5.6.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.5.6.bb
index f1d9c66af7..62c54a46b9 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.5.6.bb
@@ -2,9 +2,9 @@ SUMMARY = "An abstract syntax tree for Python with inference support."
 HOMEPAGE = "https://pypi.python.org/pypi/astroid"
 SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "ad63b8552c70939568966811a088ef0bc880f99a24a00834abd0e3681b514f91"
+SRC_URI[sha256sum] = "8a398dfce302c13f14bab13e2b14fe385d32b73f4e4853b9bdfb64598baa1975"
 
 inherit pypi setuptools3
 
-- 
2.17.1

