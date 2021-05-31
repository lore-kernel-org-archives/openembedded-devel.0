Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.46788.1622481242614008313
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 10:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37512 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lnlUC-00054C-KZ; Mon, 31 May 2021 20:14:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-ntplib: Upgrade 0.3.4 -> 0.4.0
Date: Mon, 31 May 2021 20:13:46 +0300
Message-Id: <20210531171350.11059-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 0.4.0:

- flake8 conformance
￼- Add ROA Reference ID

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-ntplib_0.3.4.bb => python3-ntplib_0.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ntplib_0.3.4.bb => python3-ntplib_0.4.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb b/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
rename to meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
index ae4c10f38..9477a7606 100644
--- a/meta-python/recipes-devtools/python/python3-ntplib_0.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-ntplib_0.4.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ntplib.py;beginline=1;endline=23;md5=afa07338a9595257e94c205c3e72224d"
 
 SRC_URI = "git://github.com/cf-natali/ntplib.git"
-SRCREV ?= "aea7925c26152024ca8cf207e77f403f8127727a"
+SRCREV ?= "b9c11c5906bc802a20a2dab390e57c50be558808"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

