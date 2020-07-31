Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18241.1596201780964384420
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1Uzz-000741-7e; Fri, 31 Jul 2020 16:22:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/15] python3-pyroute2: Upgrade 0.5.12 -> 0.5.13
Date: Fri, 31 Jul 2020 16:22:19 +0300
Message-Id: <20200731132230.20031-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.13:

- netns: allow to pass custom libc reference
- generic: att L2TP support
- iproute: link_lookup() optimization
- ndb: basic cluster support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyroute2_0.5.12.bb => python3-pyroute2_0.5.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.12.bb => python3-pyroute2_0.5.13.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
index 440f8993c..4fb401957 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
@@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
 
-SRC_URI[md5sum] = "4370e9a5875486a1223705ea9b001eff"
-SRC_URI[sha256sum] = "0157801c5496177856c3296b590065e691b041a3adde6fb8ffad2a8d05013ed3"
+SRC_URI[md5sum] = "6c72ffa7147bbfa1610942e5734c8c87"
+SRC_URI[sha256sum] = "518365f3313e73b0f024b9fa7a580b29bfa2fe2c5230be0bc69c068bbf6637e9"
 
 inherit setuptools3 pypi ptest
 
-- 
2.17.1

