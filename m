Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.11229.1614093748963417583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Feb 2021 07:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56178 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lEZW4-00022z-R0; Tue, 23 Feb 2021 17:22:25 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-prompt-toolkit: Upgrade 3.0.14 -> 3.0.16
Date: Tue, 23 Feb 2021 17:22:10 +0200
Message-Id: <20210223152219.32129-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.16:

- Added ScrollablePane: a scrollable layout container.
  This allows applications to build a layout, larger than the
  terminal, with a vertical scroll bar. The vertical scrolling
  will be done automatically when certain widgets receive the
  focus.
- Added DeduplicateCompleter and ConditionalCompleter.
- Added deduplicate argument to merge_completers.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.14.bb => python3-prompt-toolkit_3.0.16.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.14.bb => python3-prompt-toolkit_3.0.16.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
index e5ad069d3c..2a377d6e64 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.14.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.16.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "7e966747c18ececaec785699626b771c1ba8344c8d31759a1915d6b12fad6525"
+SRC_URI[sha256sum] = "0fa02fa80363844a4ab4b8d6891f62dd0645ba672723130423ca4037b80c1974"
 
 inherit pypi setuptools3
 
-- 
2.17.1

