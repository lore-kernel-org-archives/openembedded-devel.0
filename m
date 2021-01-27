Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9567.1611762951815000003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:55:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49388 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4nAd-0001GX-1W; Wed, 27 Jan 2021 17:55:51 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyzmq: Upgrade 21.0.1 -> 21.0.2
Date: Wed, 27 Jan 2021 17:55:38 +0200
Message-Id: <20210127155538.12229-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127155538.12229-1-leon.anavi@konsulko.com>
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
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

Upgrade to release 21.0.2:

- Fix wheels on macOS older than 10.15 (sets
  MACOSX_DEPLOYMENT_TARGET to 10.9, matching wheel ABI tag).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pyzmq_21.0.1.bb => python3-pyzmq_21.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_21.0.1.bb => python3-pyzmq_21.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
index d6b741460..8bde98247 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_21.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_21.0.2.bb
@@ -8,7 +8,7 @@ DEPENDS = "zeromq"
 FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
 
 SRC_URI += "file://club-rpath-out.patch"
-SRC_URI[sha256sum] = "c3a630dd7716e8e127d43b22598e256a2d11a847b8cc3310350528960037fa06"
+SRC_URI[sha256sum] = "098c13c6198913c2a0690235fa74d2e49161755f66b663beaec89651554cc79c"
 
 inherit pypi pkgconfig setuptools3
 
-- 
2.17.1

