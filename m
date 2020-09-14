Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.60145.1600089352864399390
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKl-0000ED-92; Mon, 14 Sep 2020 16:15:52 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 06/10] python3-pyroute2: Upgrade 0.5.13 -> 0.5.14
Date: Mon, 14 Sep 2020 16:15:32 +0300
Message-Id: <20200914131536.6072-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 0.5.14:

- iproute: ip neigh get
- iproute: link_lookup fix
- nftables: missing hooks
- netns: bug fix

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyroute2_0.5.13.bb => python3-pyroute2_0.5.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.13.bb => python3-pyroute2_0.5.14.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
index 4fb401957..84397b65b 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "6c72ffa7147bbfa1610942e5734c8c87"
-SRC_URI[sha256sum] = "518365f3313e73b0f024b9fa7a580b29bfa2fe2c5230be0bc69c068bbf6637e9"
+SRC_URI[md5sum] = "6bde3624a6f22bdfb630bb54243a0d1d"
+SRC_URI[sha256sum] = "774c5ecf05fe40f0f601a7ab33c19ca0b24f00bf4a094e58deaa5333b7ca49b5"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

