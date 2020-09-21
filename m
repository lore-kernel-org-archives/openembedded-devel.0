Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.42616.1600695858058258354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKM74-0004UL-Bc; Mon, 21 Sep 2020 16:44:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-h2: Upgrade 3.2.0 -> 4.0.0
Date: Mon, 21 Sep 2020 16:44:01 +0300
Message-Id: <20200921134405.676-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 4.0.0:

- Support for Python 2.7 has been removed.
- Support for Python 3.4 has been removed.
- Support for Python 3.5 has been removed.
- Support for PyPy (Python 2.7 compatible) has been removed.
- Support for Python 3.8 has been added.
- Receiving DATA before HEADERS now raises a ProtocolError.

License-Update: Update copyright year to 2020.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python-h2/{python3-h2_3.2.0.bb => python3-h2_4.0.0.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_3.2.0.bb => python3-h2_4.0.0.bb} (51%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
similarity index 51%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
index bdc110fb6d..ff1d20a89e 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_4.0.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "HTTP/2 State-Machine based protocol implementation"
 HOMEPAGE = "https://github.com/python-hyper/hyper-h2"
 LICENSE = "MIT"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=aa3b9b4395563dd427be5f022ec321c1"
 
-SRC_URI[md5sum] = "197a99c09f344a0dd987fab9801dc8d0"
-SRC_URI[sha256sum] = "875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14"
+SRC_URI[md5sum] = "d086f6a9746a5f4eeb63bb3d0a482e1f"
+SRC_URI[sha256sum] = "bb7ac7099dd67a857ed52c815a6192b6b1f5ba6b516237fc24a085341340593d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

