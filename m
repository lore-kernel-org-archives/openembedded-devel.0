Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.24392.1605708149745625111
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 06:02:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38894 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kfO2T-0005MS-T4; Wed, 18 Nov 2020 16:02:26 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-gmqtt: Upgrade 0.6.7 -> 0.6.8
Date: Wed, 18 Nov 2020 16:02:16 +0200
Message-Id: <20201118140220.29364-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.6.8:

- Fix encode str to bytes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.7.bb => python3-gmqtt_0.6.8.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
index 70527e026c..6219d20093 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.7.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[md5sum] = "9e26fec7d5b64afab63d6d82faacc208"
-SRC_URI[sha256sum] = "86b3679de400b8068dfadf871ce063a7040ed5052d30cc323aed69430888b422"
+SRC_URI[md5sum] = "8745f3b576e5247310276f0ef5c32f65"
+SRC_URI[sha256sum] = "1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1"
 
 inherit pypi setuptools3
 
-- 
2.17.1

