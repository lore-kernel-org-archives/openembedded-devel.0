Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.13837.1591191764787789130
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jun 2020 06:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47258 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jgTfH-00009o-Ir; Wed, 03 Jun 2020 16:42:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-engineio: Upgrade 3.12.1 -> 3.13.0
Date: Wed,  3 Jun 2020 16:42:31 +0300
Message-Id: <20200603134232.22336-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200603134232.22336-1-leon.anavi@konsulko.com>
References: <20200603134232.22336-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.13.0 and consolidate inc and bb files into
a single bb file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-engineio_3.12.1.bb      | 2 --
 .../{python-engineio.inc => python3-engineio_3.13.0.bb}     | 6 +++---
 2 files changed, 3 insertions(+), 5 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
 rename meta-python/recipes-devtools/python/{python-engineio.inc => python3-engineio_3.13.0.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb b/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
deleted file mode 100644
index 028d1104a..000000000
--- a/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
+++ /dev/null
@@ -1,2 +0,0 @@
-inherit setuptools3
-require python-engineio.inc
diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python-engineio.inc
rename to meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
index 965f42014..51f853390 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python3-engineio_3.13.0.bb
@@ -5,9 +5,9 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=42d0a9e728978f0eeb759c3be91536b8"
 
-inherit pypi
+inherit pypi setuptools3
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "e6ea8b3f2f32eeeb02014c46092f2adb"
-SRC_URI[sha256sum] = "2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916"
+SRC_URI[md5sum] = "822b5dba0308dde6b8cbfd022daae0e4"
+SRC_URI[sha256sum] = "2da5e1e5565e170a17169d1a76eb6a099cc96f0a25a5b1e0f9785f151485daea"
-- 
2.17.1

