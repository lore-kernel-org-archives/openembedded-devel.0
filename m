Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18230.1596201782812047581
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V00-000741-Pc; Fri, 31 Jul 2020 16:23:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/15] python3-pid: Upgrade 3.0.3 -> 3.0.4
Date: Fri, 31 Jul 2020 16:22:21 +0300
Message-Id: <20200731132230.20031-6-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.4:

- Use APPDATA and HOME locations on Windows

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pid_3.0.3.bb => python3-pid_3.0.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pid_3.0.3.bb => python3-pid_3.0.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
index 170c99b93..7a307a6dd 100644
--- a/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/trbs/pid/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
 
-SRC_URI[md5sum] = "5c011ebebbdfd529f6e85d2e0396dae8"
-SRC_URI[sha256sum] = "925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d"
+SRC_URI[md5sum] = "af607e6e2a51129e3fef516b7994c85b"
+SRC_URI[sha256sum] = "0e33670e83f6a33ebb0822e43a609c3247178d4a375ff50a4689e266d853eb66"
 
 inherit pypi setuptools3
 
-- 
2.17.1

