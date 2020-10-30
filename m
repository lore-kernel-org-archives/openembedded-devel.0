Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.13152.1604063331703124296
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2020 06:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59628 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kYU9C-0005mn-3W; Fri, 30 Oct 2020 15:08:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-langtable: Upgrade 0.0.53 -> 0.0.54
Date: Fri, 30 Oct 2020 15:08:40 +0200
Message-Id: <20201030130840.9169-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201030130840.9169-1-leon.anavi@konsulko.com>
References: <20201030130840.9169-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.0.54:

- Add list_common_languages derived from gnome-control-center

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-langtable_0.0.53.bb => python3-langtable_0.0.54.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.53.bb => python3-langtable_0.0.54.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
index 27b690f1a0..b9b4069fdc 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.53.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.54.bb
@@ -6,8 +6,8 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[md5sum] = "d8f99adfb184f9def22539310f97ce80"
-SRC_URI[sha256sum] = "fb17fd4d8e491c79159f81aa06ebacb18673fce59dac96f4e9d2d2db27a2e374"
+SRC_URI[md5sum] = "bf2db4302dbed534ff322612f5f5a16e"
+SRC_URI[sha256sum] = "2a6298267586fcade84ce977736fc35102ef95d68975bc90ceaa06117d42d5a6"
 
 inherit pypi setuptools3 python3native
 
-- 
2.17.1

