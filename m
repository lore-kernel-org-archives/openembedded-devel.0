Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.50714.1612265204522597740
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Feb 2021 03:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41580 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l6tpR-0007Xh-BQ; Tue, 02 Feb 2021 13:26:41 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-meh: Upgrade 0.49 -> 0.50
Date: Tue,  2 Feb 2021 13:26:32 +0200
Message-Id: <20210202112636.30651-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.50:

- dump: Use exception's type and value when calculating hash

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python-meh/{python3-meh_0.49.bb => python3-meh_0.50.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.49.bb => python3-meh_0.50.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
index 7fba21f7d..64a24ade3 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.49.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.50.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master \
 "
-SRCREV = "50c09e5c4c76757099d686c316b4bf42f72db71b"
+SRCREV = "11980776c5ad757401ea1d12fd1f331d96428105"
 
 FILES_${PN} += "${datadir}/*"
 
-- 
2.17.1

