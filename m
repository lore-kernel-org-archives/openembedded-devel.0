Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10424.1591794950869304767
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 06:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40010 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jj0a5-0005hT-OK; Wed, 10 Jun 2020 16:15:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-meld3: Upgrade 1.0.2 -> 2.0.1
Date: Wed, 10 Jun 2020 16:15:31 +0300
Message-Id: <20200610131536.31426-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200610131536.31426-1-leon.anavi@konsulko.com>
References: <20200610131536.31426-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.0.1:

* No further development of the meld3 package is planned.
* Fixed a DeprecationWarning on Python 3.8.
* Removed support for older Python versions.
* Added Python 3.7 classifier to setup.py.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-meld3_1.0.2.bb => python3-meld3_2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-meld3_1.0.2.bb => python3-meld3_2.0.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
rename to meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
index b3e68c1a9..1223ae953 100644
--- a/meta-python/recipes-devtools/python/python3-meld3_1.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-meld3_2.0.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/supervisor/meld3"
 LICENSE = "BSD-4-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9e7581cef5645475fcefebdc15ed7abf"
 
-SRC_URI[md5sum] = "3ccc78cd79cffd63a751ad7684c02c91"
-SRC_URI[sha256sum] = "f7b754a0fde7a4429b2ebe49409db240b5699385a572501bb0d5627d299f9558"
+SRC_URI[md5sum] = "1add16caefc9e6b82ef4f40532cb4918"
+SRC_URI[sha256sum] = "3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775"
 
 inherit pypi setuptools3
-- 
2.17.1

