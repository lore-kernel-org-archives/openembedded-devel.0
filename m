Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.435.1615566391258449638
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36668 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lKkcM-0007yZ-1F; Fri, 12 Mar 2021 18:26:30 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-prompt-toolkit: Upgrade 3.0.16 -> 3.0.17
Date: Fri, 12 Mar 2021 18:26:00 +0200
Message-Id: <20210312162600.8335-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210312162600.8335-1-leon.anavi@konsulko.com>
References: <20210312162600.8335-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.17:

- Accept `style` parameter in `print_container` utility.
- On Windows, handle Control-Delete.
- Avoid leaking file descriptors in SSH server.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.16.bb => python3-prompt-toolkit_3.0.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.16.bb => python3-prompt-toolkit_3.0.17.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
index 2a377d6e6..699e6028b 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.17.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "0fa02fa80363844a4ab4b8d6891f62dd0645ba672723130423ca4037b80c1974"
+SRC_URI[sha256sum] = "9397a7162cf45449147ad6042fa37983a081b8a73363a5253dd4072666333137"
 
 inherit pypi setuptools3
 
-- 
2.17.1

