Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.488.1608674259004813445
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Dec 2020 13:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39252 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1krpev-0006qW-40; Tue, 22 Dec 2020 23:57:35 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-natsort: Upgrade 7.0.1 -> 7.1.0
Date: Tue, 22 Dec 2020 23:57:25 +0200
Message-Id: <20201222215727.25166-1-leon.anavi@konsulko.com>
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

Upgrade to release 7.1.0:

- os_sorted, os_sort_keygen, and os_sort_key to better support
  sorting like the file browser on the current operating system
- Support for Python 3.9
- Treat None like NaN internally to avoid TypeError
- No longer fail tests every time a new Python version is released
- Various typos, missing figures, and out-of-date information in
  the "How it works"
- Fix typo in CHANGELOG
- Updated "How it works" to account for Pandas updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-natsort_7.0.1.bb => python3-natsort_7.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_7.0.1.bb => python3-natsort_7.1.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb b/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
rename to meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
index e20cdf0fa3..c890ae2432 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_7.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_7.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6a96e5ad780a0eea866ecccec4463517"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "a633464dc3a22b305df0f27abcb3e83515898aa1fd0ed2f9726c3571a27258cf"
+SRC_URI[sha256sum] = "33f3f1003e2af4b4df20908fe62aa029999d136b966463746942efbfc821add3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

