Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6575.1593076104165489558
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNro-0005y7-P9; Thu, 25 Jun 2020 12:08:23 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 05/12] python3-pyexpect: Upgrade 1.0.19 -> 1.0.20
Date: Thu, 25 Jun 2020 12:07:12 +0300
Message-Id: <20200625090719.16068-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.20:

- Support expectations on types that return different types than
  bool on comparison.
- Better documentation intro using the feedback I got for my talk
  at berlin.python.pizza
- Fix upload command and add some todos

LIC_FILES_CHKSUM changed due to the recent modifications of
README.md. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-pyexpect_1.0.19.bb => python3-pyexpect_1.0.20.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.19.bb => python3-pyexpect_1.0.20.bb} (52%)

diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
similarity index 52%
rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
index ea3c018af..e09fec01d 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.19.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "Minimal but very flexible implementation of the expect pattern"
 SECTION = "devel/python"
 HOMEPAGE = " https://bitbucket.org/dwt/pyexpect"
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://README.md;md5=500b884e9dcd5f677a53cbbee8ace939"
+LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "dc744289858001925c75d21e26f1260f"
-SRC_URI[sha256sum] = "bff4654b113dac6c2231e486e11dcb23281ddc0742a5404467303fe7638829ef"
+SRC_URI[md5sum] = "7ebc843f015b54d849ac7632eda74e9b"
+SRC_URI[sha256sum] = "acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76"
-- 
2.17.1

