Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.30501.1611161591730971012
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 08:53:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54830 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2GjG-0007OW-2q; Wed, 20 Jan 2021 18:53:10 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-alembic: Upgrade 1.4.3 -> 1.5.1
Date: Wed, 20 Jan 2021 18:53:00 +0200
Message-Id: <20210120165300.8588-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120165300.8588-1-leon.anavi@konsulko.com>
References: <20210120165300.8588-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.1:

- Fixed installation issue where the "templates" directory was not
  being installed, preventing commands like "list_templates" and
  "init" from working.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-alembic_1.4.3.bb => python3-alembic_1.5.1.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.4.3.bb => python3-alembic_1.5.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
index 0e7f629d4..f07be042f 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.5.1.bb
@@ -1,11 +1,10 @@
 DESCRIPTION = "A database migration tool for SQLAlchemy"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bd64aba1b968c2bfbc2b525a181ce85c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c4ece55266dcdd02ce165b1ee0e490bb"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "6051576d8e25e3d4a9fd818d79531bad"
-SRC_URI[sha256sum] = "5334f32314fb2a56d86b4c4dd1ae34b08c03cae4cb888bc699942104d66bc245"
+SRC_URI[sha256sum] = "52d1d48109f17959982779e3c4b5cdeca701e449897bacb75bab173bd6ba984e"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.17.1

