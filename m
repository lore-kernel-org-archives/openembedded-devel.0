Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.19128.1617009640128817890
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4b-0002Gp-Se; Mon, 29 Mar 2021 12:20:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-openpyxl: Upgrade 3.0.6 -> 3.0.7
Date: Mon, 29 Mar 2021 12:20:24 +0300
Message-Id: <20210329092024.11922-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329092024.11922-1-leon.anavi@konsulko.com>
References: <20210329092024.11922-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.7:

- Problems with zero time values
- Not possible to correctly convert excel dates to timedelta
- Exception raised when merging cells which do not have borders
  all the way round.
- Python 2 print statement in the tutorial

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-openpyxl_3.0.6.bb => python3-openpyxl_3.0.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-openpyxl_3.0.6.bb => python3-openpyxl_3.0.7.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.7.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
rename to meta-python/recipes-devtools/python/python3-openpyxl_3.0.7.bb
index d4781eeff..b32632119 100644
--- a/meta-python/recipes-devtools/python/python3-openpyxl_3.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-openpyxl_3.0.7.bb
@@ -9,6 +9,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b229112b46e158b910a5d1b270b212c42773d39cab24e8db527f775b82afc041"
+SRC_URI[sha256sum] = "6456a3b472e1ef0facb1129f3c6ef00713cebf62e736cd7a75bcc3247432f251"
 
 RDEPENDS_${PN} += "${PYTHON_PN}-compression ${PYTHON_PN}-io ${PYTHON_PN}-pprint ${PYTHON_PN}-shell ${PYTHON_PN}-jdcal ${PYTHON_PN}-et-xmlfile"
-- 
2.17.1

