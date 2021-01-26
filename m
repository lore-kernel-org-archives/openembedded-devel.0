Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.11556.1611665419589612852
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 04:50:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37874 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4NnU-0007hT-3t; Tue, 26 Jan 2021 14:50:17 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-coverage: Upgrade 5.3.1 -> 5.4
Date: Tue, 26 Jan 2021 14:50:00 +0200
Message-Id: <20210126125003.27620-2-leon.anavi@konsulko.com>
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

Upgrade to release 5.4:

- The text report produced by coverage report now always outputs
  a TOTAL line, even if only one Python file is reported. This
  makes regex parsing of the output easier.
- The skip_covered and skip_empty settings in the configuration
  file can now be specified in the [html] section, so that text
  reports and HTML reports can use separate settings. The HTML
  report will still use the [report] settings if there isn't a
  value in the [html] section.
- Combining files on Windows across drives how works properly.
- Fix an obscure warning from deep in the _decimal module.
- Update to support Python 3.10 alphas in progress, including
  PEP 626: Precise line numbers for debugging and other tools.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_5.3.1.bb => python3-coverage_5.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.3.1.bb => python3-coverage_5.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.4.bb
index 14d29a247..4ea9b6a19 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "38f16b1317b8dd82df67ed5daa5f5e7c959e46579840d77a67a4ceb9cef0a50b"
+SRC_URI[sha256sum] = "6d2e262e5e8da6fa56e774fb8e2643417351427604c2b177f8e8c5f75fc928ca"
 
 inherit pypi setuptools3
 
-- 
2.17.1

