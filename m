Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.1904.1610101707600953213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 02:28:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44762 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kxp0K-0000kU-4R; Fri, 08 Jan 2021 12:28:24 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-coloredlogs: Upgrade 14.0 -> 15.0
Date: Fri,  8 Jan 2021 12:28:11 +0200
Message-Id: <20210108102814.9560-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210108102814.9560-1-leon.anavi@konsulko.com>
References: <20210108102814.9560-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to release 15.0:

- Don’t enable system logging on MacOS and Windows anymore.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-coloredlogs_14.0.bb => python3-coloredlogs_15.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coloredlogs_14.0.bb => python3-coloredlogs_15.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
rename to meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
index 64f3008ee..daeda6b2e 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
@@ -4,8 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
 
-SRC_URI[md5sum] = "34cd8ef3f758b10c6f1482b2614a81f2"
-SRC_URI[sha256sum] = "a1fab193d2053aa6c0a97608c4342d031f1f93a3d1218432c59322441d31a505"
+SRC_URI[sha256sum] = "5e78691e2673a8e294499e1832bb13efcfb44a86b92e18109fa18951093218ab"
 
 inherit pypi setuptools3
 
-- 
2.17.1

