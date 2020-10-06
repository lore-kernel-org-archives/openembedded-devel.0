Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.10309.1601975140970853117
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Oct 2020 02:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59138 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPiuh-0007g5-99; Tue, 06 Oct 2020 12:05:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pandas: Upgrade 1.1.2 -> 1.1.3
Date: Tue,  6 Oct 2020 12:05:26 +0300
Message-Id: <20201006090526.24310-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006090526.24310-1-leon.anavi@konsulko.com>
References: <20201006090526.24310-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.1.3. This is a minor bug-fix release. It
includes some regression fixes and bug fixes. Details are
available at:
https://github.com/pandas-dev/pandas/releases/tag/v1.1.3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.1.2.bb => python3-pandas_1.1.3.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.2.bb => python3-pandas_1.1.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
index 1eade9884d..da1ffd0b6d 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.3.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[md5sum] = "b4ce7c64f549ed48b47877fc64281031"
-SRC_URI[sha256sum] = "b64ffd87a2cfd31b40acd4b92cb72ea9a52a48165aec4c140e78fd69c45d1444"
+SRC_URI[md5sum] = "f10372d83a1c55cae217e8c05bf9bc5d"
+SRC_URI[sha256sum] = "babbeda2f83b0686c9ad38d93b10516e68cdcd5771007eb80a763e98aaf44613"
 
 inherit pypi setuptools3
 
-- 
2.17.1

