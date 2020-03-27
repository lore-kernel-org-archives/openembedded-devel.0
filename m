Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.130.1585349379218400078
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2020 15:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=aEYN6ZgJ;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id C930B60044;
	Fri, 27 Mar 2020 23:49:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1585349377;
	bh=45Lg0HvZdv12iaiiovpDRiOmeZCmg2Or+2yvUVzjCtk=;
	h=From:To:Cc:Subject:Date:From;
	b=aEYN6ZgJEVoLIQ+OAcSyGKhL0f4gf+I8UmfbpFDbmNEkOCRXj8+Km8KCDEePHfgvI
	 lf92BODBFzEB5Zg12TTxOAog6ibHuGQlR22pgwX+9G4ZbR9G7ktCF6lQEXg3ZAgH/8
	 lTyxs+qv/VYWPF8t18pEqQESqTdFA4htPa9tJe+kgF3BUPwb4t8lxnqyVZOHLLWTqx
	 aSUeDFSinbxFO+yXLJ1O/qjgbcNwtenn4ldvrvVZpKdH7zOp6+Dnwv3BBqK5z8cTsK
	 hnV2lCDpQYtIinMOSlaEB24xq3Yik9lc82YE2Gffqslhq+JepFXIPesyLHtvK9cXls
	 /vbmyiaUAHcIg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH] python-engineio: upgrade 3.11.2 -> 3.12.1
Date: Fri, 27 Mar 2020 23:49:35 +0100
Message-Id: <1585349375-5319-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4

See full changelog https://github.com/miguelgrinberg/python-engineio/blob/master/CHANGES.md

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-python/recipes-devtools/python/python-engineio.inc               | 4 ++--
 .../python/{python3-engineio_3.11.2.bb => python3-engineio_3.12.1.bb} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-engineio_3.11.2.bb => python3-engineio_3.12.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-engineio.inc b/meta-python/recipes-devtools/python/python-engineio.inc
index 9c067c9..965f420 100644
--- a/meta-python/recipes-devtools/python/python-engineio.inc
+++ b/meta-python/recipes-devtools/python/python-engineio.inc
@@ -9,5 +9,5 @@ inherit pypi
 
 PYPI_PACKAGE = "python-engineio"
 
-SRC_URI[md5sum] = "13345452be25c3b63d041f8f89e662d1"
-SRC_URI[sha256sum] = "47ae4a9b3b4f2e8a68929f37a518338838e119f24c9a9121af92c49f8bea55c3"
+SRC_URI[md5sum] = "e6ea8b3f2f32eeeb02014c46092f2adb"
+SRC_URI[sha256sum] = "2481732d93646998f7372ef0ecf003af7817b82720b881db173c3d50b4887916"
diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.11.2.bb b/meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-engineio_3.11.2.bb
rename to meta-python/recipes-devtools/python/python3-engineio_3.12.1.bb
-- 
2.7.4

