Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.9618.1621002230042384034
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 07:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38054 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhYjC-0005Cr-CI; Fri, 14 May 2021 17:23:47 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/7] python3-alembic: Upgrade 1.5.8 -> 1.6.2
Date: Fri, 14 May 2021 17:23:35 +0300
Message-Id: <20210514142341.22666-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.2:

- Fixed a bug where paths defined in post-write hook options would
  be wrongly escaped in non posix environment (Windows)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.5.8.bb => python3-alembic_1.6.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.5.8.bb => python3-alembic_1.6.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.5.8.bb b/meta-python/recipes-devtools/python/python3-alembic_1.6.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-alembic_1.5.8.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.6.2.bb
index fdf0d36b50..1daf209201 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.5.8.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.6.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e27fd67732c97a1c370c33169ef4578cf96436fa0e7dcfaeeef4a917d0737d56"
+SRC_URI[sha256sum] = "fb9a39a7c68e55490be962fb5f70463d384d340e6563d6e3911447778e3b4576"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

