Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13399.1614269162342156836
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Feb 2021 08:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54856 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFJ9J-0004JR-HP; Thu, 25 Feb 2021 18:06:01 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-pulsectl: Upgrade 20.5.1 -> 21.2.0
Date: Thu, 25 Feb 2021 18:05:41 +0200
Message-Id: <20210225160544.8994-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225160544.8994-1-leon.anavi@konsulko.com>
References: <20210225160544.8994-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.2.0:

- Link pulsectl-asyncio as an alternative for async code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pulsectl_20.5.1.bb => python3-pulsectl_21.2.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_20.5.1.bb => python3-pulsectl_21.2.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb b/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
index df0c8e578b..c99a5507ff 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_20.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_21.2.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[md5sum] = "8de84a0f4005ecad96d2c55a6d7c3a10"
-SRC_URI[sha256sum] = "39b0a0e7974a7d6468d826a838822f78b00ac9c3803f0d7bfa9b1cad08ee22db"
+SRC_URI[sha256sum] = "282be9ad1a9add961f0bbafa8e19723ac397a2eec5e14fb8cd6c51ff29962715"
 
 RDEPENDS_${PN} += "pulseaudio"
 
-- 
2.17.1

