Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.50715.1612265206227662692
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 03:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41580 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6tpU-0007Xh-0h; Tue, 02 Feb 2021 13:26:44 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pywbemtools: Upgrade 0.8.0 -> 0.8.1
Date: Tue,  2 Feb 2021 13:26:36 +0200
Message-Id: <20210202112636.30651-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210202112636.30651-1-leon.anavi@konsulko.com>
References: <20210202112636.30651-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.8.1:

- Fixed a ValueError on Windows that was raised when the
  connections file was not on the home drive.
- Limit click package to < 8.0 because of a) incompatibility with
  python 2.7, b) incompatibility between click 8.0 and clicl-repl.
- Limit mock package to lt 4.0.3 to avoid issue issue that causes
  test failure.
- Increased minimum pywbem version from 1.1.1 to 1.1.3 to pick
  up fixes.
- Migrated from Travis and Appveyor to GitHub Actions. This required
  several changes in package dependencies for development.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pywbemtools_0.8.0.bb => python3-pywbemtools_0.8.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.8.0.bb => python3-pywbemtools_0.8.1.bb} (87%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
similarity index 87%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
index 03caec539..c5cabdb13 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.8.1.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "e41ef654a0af0461d6c164752963fdfb"
-SRC_URI[sha256sum] = "b869bb217613cdfee1e97e8afc28fe3f9bf3b88f8fc99e588d03c4be0922c319"
+SRC_URI[sha256sum] = "3cbee091f0a4917394814d7e639ab9fe13ad0859e47288deabf2b09a4382c4ae"
 
 inherit pypi setuptools3
 
-- 
2.17.1

