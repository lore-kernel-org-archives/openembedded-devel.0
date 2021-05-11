Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.1892.1620751948418177333
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 09:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60228 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lgVcP-0007jj-QC; Tue, 11 May 2021 19:52:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-cerberus: Upgrade 1.3.3 -> 1.3.4
Date: Tue, 11 May 2021 19:52:14 +0300
Message-Id: <20210511165217.18433-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210511165217.18433-1-leon.anavi@konsulko.com>
References: <20210511165217.18433-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.4:

- Reverts the unsatisfying fix for KeyError during import when
  running with python optimisation level of 2
- instead a RuntimeError is thrown when Python is running with
  optimization level 2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cerberus_1.3.3.bb => python3-cerberus_1.3.4.bb}  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cerberus_1.3.3.bb => python3-cerberus_1.3.4.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
rename to meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
index fa0bbb0aad..95934c6e42 100644
--- a/meta-python/recipes-devtools/python/python3-cerberus_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cerberus_1.3.4.bb
@@ -4,8 +4,10 @@ SECTION = "devel/python"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=48f8e9432d0dac5e0e7a18211a0bacdb"
 
+RDEPENDS_${PN} += "python3-setuptools"
+
 # The PyPI package uses a capital letter so we have to specify this explicitly
 PYPI_PACKAGE = "Cerberus"
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "eec10585c33044fb7c69650bc5b68018dac0443753337e2b07684ee0f3c83329"
+SRC_URI[sha256sum] = "d1b21b3954b2498d9a79edf16b3170a3ac1021df88d197dc2ce5928ba519237c"
-- 
2.17.1

