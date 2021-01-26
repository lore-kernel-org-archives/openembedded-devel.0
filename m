Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11741.1611665420538212398
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37874 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4NnW-0007hT-37; Tue, 26 Jan 2021 14:50:19 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-aenum: Upgrade 2.2.6 -> 3.0.0
Date: Tue, 26 Jan 2021 14:50:02 +0200
Message-Id: <20210126125003.27620-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210126125003.27620-1-leon.anavi@konsulko.com>
References: <20210126125003.27620-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.0:

- Flags only list single bit names, multi-bit are aliases
- error checking to go with that
- getattr magic is off for AutoValue
- Member creation has been redone to match Python 3.10's methods.
  This also allows all supported Pythons (2.7, 3.3+) to use the
  __set_name__ and __init_subclass__ protocols (more robustly
  than in aenum 2.2.5)
- enum_property() has been renamed to property() (old name still
  available, but deprecated)
- bin() replacement shows negative integers in twos-complement

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_2.2.6.bb => python3-aenum_3.0.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_2.2.6.bb => python3-aenum_3.0.0.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb b/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
index 061770a93..cb8462d24 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[md5sum] = "52ec17f5efdfa13952657fe954cd6d99"
-SRC_URI[sha256sum] = "260225470b49429f5893a195a8b99c73a8d182be42bf90c37c93e7b20e44eaae"
+SRC_URI[sha256sum] = "17cd8cfed1ee4b617198c9fabbabd70ebd8f01e54ac29cd6c3a92df14bd86656"
 
 inherit pypi setuptools3
 
-- 
2.17.1

