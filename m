Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.18115.1596201780815098851
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1Uzy-000741-DN; Fri, 31 Jul 2020 16:22:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/15] python3-gmqtt: Upgarde 0.6.5 -> 0.6.7
Date: Fri, 31 Jul 2020 16:22:18 +0300
Message-Id: <20200731132230.20031-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.7:

- Handle incoming topic alias in proper way
- Fix python3.8 warning and improve disconnect process

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.6.5.bb => python3-gmqtt_0.6.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.5.bb => python3-gmqtt_0.6.7.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
index 379c7679c..2bf9d0753 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[md5sum] = "9388ec09b6536c4e68c5ac5c31de3dc9"
-SRC_URI[sha256sum] = "c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60"
+SRC_URI[md5sum] = "9e26fec7d5b64afab63d6d82faacc208"
+SRC_URI[sha256sum] = "86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422"
 
 inherit pypi setuptools3
 
-- 
2.17.1

