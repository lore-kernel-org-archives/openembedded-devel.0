Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6472.1602660785706165427
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36146 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSbHT-00067Q-EZ; Wed, 14 Oct 2020 10:33:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-xlsxwriter: Upgrade 1.3.6 -> 1.3.7
Date: Wed, 14 Oct 2020 10:32:54 +0300
Message-Id: <20201014073256.9605-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014073256.9605-1-leon.anavi@konsulko.com>
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.7:

- Fixed issue where custom chart data labels didn't inherit the
  position of the data labels in the series.
- Added text alignment for textboxes. The existing options allowed
  the text area to be aligned but didn't offer control over the
  text within that area.
- Added Python 3.9 to the test matrix.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.3.6.bb => python3-xlsxwriter_1.3.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.6.bb => python3-xlsxwriter_1.3.7.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
index f3314037f2..a8f013c580 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.6.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.7.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "378642a3754fb233e418e3869cf051bb"
-SRC_URI[sha256sum] = "b89002dea57bb3d4c8207f3e28ef8244bfd9e936b85d74e7dd1f97e11bb70313"
+SRC_URI[md5sum] = "8c0595292fae76297eac03ae76507b7b"
+SRC_URI[sha256sum] = "9b1ade2d1ba5d9b40a6d1de1d55ded4394ab8002718092ae80a08532c2add2e6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

