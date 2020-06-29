Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16989.1593432774420500770
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jun 2020 05:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33196 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jpsea-0001kP-J1; Mon, 29 Jun 2020 15:12:53 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-watchdog: Upgrade 0.10.2 -> 0.10.3
Date: Mon, 29 Jun 2020 15:12:33 +0300
Message-Id: <20200629121233.27026-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200629121233.27026-1-leon.anavi@konsulko.com>
References: <20200629121233.27026-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.10.3:

- Ensure ObservedWatch.path is a string
- [inotify] Allow to monitor single file
- [inotify] Prevent raising an exception when a file in a
  monitored folder has no permissions

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-watchdog_0.10.2.bb => python3-watchdog_0.10.3.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_0.10.2.bb => python3-watchdog_0.10.3.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb b/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
index 93a1c192f..2108cbb93 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_0.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_0.10.3.bb
@@ -4,7 +4,8 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "c560efb643faed5ef28784b2245cf8874f939569717a4a12826a173ac644456b"
+SRC_URI[md5sum] = "9a5c9134e943b534b9f8b51d78338cf8"
+SRC_URI[sha256sum] = "4214e1379d128b0588021880ccaf40317ee156d4603ac388b9adcf29165e0c04"
 
 inherit pypi setuptools3
 
-- 
2.17.1

