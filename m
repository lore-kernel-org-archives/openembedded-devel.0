Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8110.1600847935615576848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 00:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58518 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKzfv-0005D6-SY; Wed, 23 Sep 2020 10:58:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-zipp: Upgrade 3.1.0 -> 3.2.0
Date: Wed, 23 Sep 2020 10:58:28 +0300
Message-Id: <20200923075830.30859-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200923075830.30859-1-leon.anavi@konsulko.com>
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.0:

- Mutate the passed ZipFile object type instead of making a copy.
  Prevents issues when both the local copy and the caller's copy
  attempt to close the same file handle.
- Path._next now honors subclasses.
- Path.is_file() now returns False for non-existent names.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-zipp_3.1.0.bb => python3-zipp_3.2.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.1.0.bb => python3-zipp_3.2.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb b/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
index a29e2981f2..59d71500d5 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[md5sum] = "199da7385f080ec45da6c1942e2b5996"
-SRC_URI[sha256sum] = "c599e4d75c98f6798c509911d08a22e6c021d074469042177c8c86fb92eefd96"
+SRC_URI[md5sum] = "321a0dfa1080d58e5de0800a26565452"
+SRC_URI[sha256sum] = "b52f22895f4cfce194bc8172f3819ee8de7540aa6d873535a8668b730b8b411f"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
 
-- 
2.17.1

