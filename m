Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.190981.1598260507974674653
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:15:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37652 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kA8ZG-0005wO-NL; Mon, 24 Aug 2020 12:15:07 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-langtable: Upgrade 0.0.51 -> 0.0.52
Date: Mon, 24 Aug 2020 12:14:54 +0300
Message-Id: <20200824091457.3360-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824091457.3360-1-leon.anavi@konsulko.com>
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.52:

- add list_common_keyboards() to public api

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-langtable_0.0.51.bb => python3-langtable_0.0.52.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.51.bb => python3-langtable_0.0.52.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
index 8340382d1..e6ccd7b54 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.51.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.52.bb
@@ -6,8 +6,8 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "5d28198fa933dac5c037108d8f5cf3bb"
-SRC_URI[sha256sum] = "8d4615cc0bb0fa49faa05b55ff49b1f41122b8092ca18a5d10f1e1699d6d7b3c"
+SRC_URI[md5sum] = "240a62b84ed29f6530ceae60609f7eff"
+SRC_URI[sha256sum] = "a2c499704c91c0a23e5db92e80ad1d45e51466b82ffaee478e5bb781460b3db5"
 
 inherit pypi setuptools3 python3native
 
-- 
2.17.1

