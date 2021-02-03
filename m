Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11080.1612366711396393931
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Feb 2021 07:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l7KEg-0007tX-1I; Wed, 03 Feb 2021 17:38:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-tqdm: Upgrade 4.51.0 -> 4.56.0
Date: Wed,  3 Feb 2021 17:38:21 +0200
Message-Id: <20210203153822.25077-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210203153822.25077-1-leon.anavi@konsulko.com>
References: <20210203153822.25077-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.56.0:

- add tqdm.tk
- add tqdm.rich
- minor formatting improvements for tqdm.gui
- fix display() inheritance/override
- add tests
- add documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-tqdm_4.51.0.bb => python3-tqdm_4.56.0.bb}       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.51.0.bb => python3-tqdm_4.56.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
index e4510ad44..d4baf6f22 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.51.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.56.0.bb
@@ -5,9 +5,10 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=7ea57584e3f8bbde2ae3e1537551de25"
 
-SRC_URI[md5sum] = "b188c2dc7802c19b262971e566c265ce"
-SRC_URI[sha256sum] = "ef54779f1c09f346b2b5a8e5c61f96fbcb639929e640e59f8cf810794f406432"
+SRC_URI[sha256sum] = "fe3d08dd00a526850568d542ff9de9bbc2a09a791da3c334f3213d8d0bbbca65"
 
 inherit pypi setuptools3
 
+DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

