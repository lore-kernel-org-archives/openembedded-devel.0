Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.20640.1598540065512777555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 07:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58882 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBJID-00019B-K6; Thu, 27 Aug 2020 17:54:22 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-ntplib: Upgrade 0.3.3 -> 0.3.4
Date: Thu, 27 Aug 2020 17:54:09 +0300
Message-Id: <20200827145409.29077-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.4:
- Use setuptools
- update URL

Use source from the GitHub repository instead of pypi because
appropriate archive for this release is not available at pypi.org.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ntplib_0.3.3.bb => python3-ntplib_0.3.4.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ntplib_0.3.3.bb => python3-ntplib_0.3.4.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
rename to meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
index ce2618b81..ae4c10f38 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
@@ -3,12 +3,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d"
 
-SRCNAME = "ntplib"
-SRC_URI[md5sum] = "c7cc8e9b09f40c84819859d70b7784ca"
-SRC_URI[sha256sum] = "c4621b64d50be9461d9bd9a71ba0b4af06fbbf818bbd483752d95c1a4e273ede"
+SRC_URI = "git://github.com/cf-natali/ntplib.git"
+SRCREV ?= "aea7925c26152024ca8cf207e77f403f8127727a"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+S = "${WORKDIR}/git"
 
-inherit setuptools3 python3native pypi
+inherit setuptools3 python3native
 
 RDEPENDS_${PN} += "${PYTHON_PN}-datetime ${PYTHON_PN}-io"
-- 
2.17.1

