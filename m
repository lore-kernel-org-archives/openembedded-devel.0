Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18631.1600248102235099437
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 02:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35260 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kITdB-0000SY-RB; Wed, 16 Sep 2020 12:21:39 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-langtable: Upgrade 0.0.52 -> 0.0.53
Date: Wed, 16 Sep 2020 12:21:32 +0300
Message-Id: <20200916092133.11861-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.53:

- Capitalize the return values of language_name() and
  territory_name()
- Add more translations from CLDR
- Get translation changes from CLDR

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-langtable_0.0.52.bb => python3-langtable_0.0.53.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.52.bb => python3-langtable_0.0.53.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
index e6ccd7b54f..27b690f1a0 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
@@ -6,8 +6,8 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "240a62b84ed29f6530ceae60609f7eff"
-SRC_URI[sha256sum] = "a2c499704c91c0a23e5db92e80ad1d45e51466b82ffaee478e5bb781460b3db5"
+SRC_URI[md5sum] = "d8f99adfb184f9def22539310f97ce80"
+SRC_URI[sha256sum] = "fb17fd4d8e491c79159f81aa06ebacb18673fce59dac96f4e9d2d2db27a2e374"
 
 inherit pypi setuptools3 python3native
 
-- 
2.17.1

