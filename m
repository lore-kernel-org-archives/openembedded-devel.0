Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6442.1602660787108612448
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:33:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36146 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSbHV-00067Q-FT; Wed, 14 Oct 2020 10:33:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-graphviz: Upgrade 0.14.1 -> 0.14.2
Date: Wed, 14 Oct 2020 10:32:56 +0300
Message-Id: <20201014073256.9605-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014073256.9605-1-leon.anavi@konsulko.com>
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
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

Upgrde to release 0.14.2:

- Adapt graphviz.version() to support the Graphviz Release version
  entry format introduced with 2.44.2 (version() is needed to run
  the tests).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-graphviz_0.14.1.bb => python3-graphviz_0.14.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-graphviz_0.14.1.bb => python3-graphviz_0.14.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb b/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
rename to meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
index f26a1efcec..0de4c8f407 100644
--- a/meta-python/recipes-devtools/python/python3-graphviz_0.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-graphviz_0.14.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://graphviz.readthedocs.io/en/stable/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f7831c564aeff14e68aa4ff7a93dc89f"
 
-SRC_URI[md5sum] = "436cb0f41f6a949f916357ca037e205a"
-SRC_URI[sha256sum] = "f5aad52a652c06825dcc5ee018d920fca26aef339386866094597fb3f2f222ce"
+SRC_URI[md5sum] = "7123efabb68270f579525df74bf8b0c9"
+SRC_URI[sha256sum] = "92b7637ece63c77e3d39221ae1f4df98e9256cb449e9860c598335b34496d195"
 
 inherit pypi setuptools3
 
-- 
2.17.1

