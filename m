Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12074.1603795221478381100
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2020 03:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kXMOp-0001vr-6q; Tue, 27 Oct 2020 12:40:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pyexpect: Upgrade 1.0.20 -> 1.0.21
Date: Tue, 27 Oct 2020 12:40:11 +0200
Message-Id: <20201027104013.11394-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.21:

- Ensure .includes() handles a generator correcly
- Also check python 3.8 and 3.9
- Ignore tox directory

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyexpect_1.0.20.bb => python3-pyexpect_1.0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyexpect_1.0.20.bb => python3-pyexpect_1.0.21.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
rename to meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
index e09fec01dd..1b80770d73 100644
--- a/meta-python/recipes-devtools/python/python3-pyexpect_1.0.20.bb
+++ b/meta-python/recipes-devtools/python/python3-pyexpect_1.0.21.bb
@@ -7,5 +7,5 @@ LIC_FILES_CHKSUM = "file://README.md;md5=a6aa1e7097aca5955f9a2e1c8b0ce158"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "7ebc843f015b54d849ac7632eda74e9b"
-SRC_URI[sha256sum] = "acaaa6f96de315dc99cac3da810156bf3829d1eb5c49180f00a4fdde82eabc76"
+SRC_URI[md5sum] = "c661939158d6a1acbcc2191bedc47751"
+SRC_URI[sha256sum] = "96e900d6af928a94c2a75b4935ddda44872c218121d0467c549ae19e7608a9a2"
-- 
2.17.1

