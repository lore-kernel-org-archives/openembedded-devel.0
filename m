Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5632.1615883874568447310
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Mar 2021 01:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35240 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lM5D3-0006gf-Qa; Tue, 16 Mar 2021 10:37:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/6] python3-pulsectl: Upgrade 21.2.0 -> 21.3.4
Date: Tue, 16 Mar 2021 10:37:39 +0200
Message-Id: <20210316083744.17558-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.3.4:

- Add timeout= option for connect() method
- Expose "base_volume" (alsa volume level) attribute for
  sinks/sources
- There is now https://pypi.org/project/pulsectl-asyncio/ module

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pulsectl_21.2.0.bb => python3-pulsectl_21.3.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_21.2.0.bb => python3-pulsectl_21.3.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
index c99a5507f..a4455eeb1 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.3.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "282be9ad1a9add961f0bbafa8e19723ac397a2eec5e14fb8cd6c51ff29962715"
+SRC_URI[sha256sum] = "faa8b9336237565990298f20870e13dd1678a4586847ca5a7ff2abf10752f356"
 
 RDEPENDS_${PN} += "pulseaudio"
 
-- 
2.17.1

