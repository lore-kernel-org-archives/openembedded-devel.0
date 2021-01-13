Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.8615.1610547997725845227
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 06:26:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=48560 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kzh6Z-0000Li-84; Wed, 13 Jan 2021 16:26:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-msgpack: Upgrade 1.0.0 -> 1.0.2
Date: Wed, 13 Jan 2021 16:26:19 +0200
Message-Id: <20210113142626.27599-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113142626.27599-1-leon.anavi@konsulko.com>
References: <20210113142626.27599-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.2:

- Fix overflow in unpacking timestamp to datetime
- Format markdown
- Update readme

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-msgpack_1.0.0.bb => python3-msgpack_1.0.2.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-msgpack_1.0.0.bb => python3-msgpack_1.0.2.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb b/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
index d744738a2..989a7ae3f 100644
--- a/meta-python/recipes-devtools/python/python3-msgpack_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-msgpack_1.0.2.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
 PYPI_PACKAGE = "msgpack"
 inherit pypi setuptools3 ptest
 
-SRC_URI[md5sum] = "c35ee8f991dad3969884e9585e56ebba"
-SRC_URI[sha256sum] = "9534d5cc480d4aff720233411a1f765be90885750b07df772380b34c10ecb5c0"
+SRC_URI[sha256sum] = "fae04496f5bc150eefad4e9571d1a76c55d021325dcd484ce45065ebbdd00984"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-io \
-- 
2.17.1

