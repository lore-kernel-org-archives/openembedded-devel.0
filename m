Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.19130.1617009637255413795
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4X-0002Gp-Kf; Mon, 29 Mar 2021 12:20:35 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-coverage: Upgrade 5.4 -> 5.5
Date: Mon, 29 Mar 2021 12:20:20 +0300
Message-Id: <20210329092024.11922-3-leon.anavi@konsulko.com>
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

Upgrade to release 5.5:

- coverage combine has a new option, --keep to keep the original
  data files after combining them. The default is still to delete
  the files after they have been combined.
- When reporting missing branches in coverage report, branches
  aren't reported that jump to missing lines. This adds to the
  long-standing behavior of not reporting branches from missing
  lines. Now branches are only reported if both the source and
  destination lines are executed.
- Minor improvements to the HTML report:
  The state of the line visibility selector buttons is saved in
  local storage so you don't have to fiddle with them so often.
  It has a little more room for line numbers so that 4-digit
  numbers work well.
- Improved the error message when combining line and branch data,
  so that users will be more likely to understand what's happening.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-coverage_5.4.bb => python3-coverage_5.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.4.bb => python3-coverage_5.5.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.4.bb b/meta-python/recipes-devtools/python/python3-coverage_5.5.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-coverage_5.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.5.bb
index 4ea9b6a19..c780a63ae 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "6d2e262e5e8da6fa56e774fb8e2643417351427604c2b177f8e8c5f75fc928ca"
+SRC_URI[sha256sum] = "ebe78fe9a0e874362175b02371bdfbee64d8edc42a044253ddf4ee7d3c15212c"
 
 inherit pypi setuptools3
 
-- 
2.17.1

