Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.18236.1596201786497346892
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V04-000741-Pj; Fri, 31 Jul 2020 16:23:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/15] python3-xlsxwriter: Upgrade 1.2.9 -> 1.3.0
Date: Fri, 31 Jul 2020 16:22:26 +0300
Message-Id: <20200731132230.20031-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.0:

- Added support for custom chart :ref:`custom data labels
  <chart_series_option_custom_data_labels>`.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.2.9.bb => python3-xlsxwriter_1.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.2.9.bb => python3-xlsxwriter_1.3.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
index 114f48214..3b4e89d04 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.2.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "20f8b7df7f1705fa2f7ac3f84789d2ca"
-SRC_URI[sha256sum] = "828b3285fc95105f5b1946a6a015b31cf388bd5378fdc6604e4d1b7839df2e77"
+SRC_URI[md5sum] = "80ac0ccf43435739c4afa5e0bfff8580"
+SRC_URI[sha256sum] = "3015f707cf237d277cf1b2d7805f409f0387e32bc52f3c76db9f85098980e828"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

