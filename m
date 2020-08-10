Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.46133.1597070615487508514
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=59248 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k591N-0008Tw-Pr; Mon, 10 Aug 2020 17:43:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/7] python3-xlsxwriter: Upgrade 1.3.0 -> 1.3.2
Date: Mon, 10 Aug 2020 17:43:14 +0300
Message-Id: <20200810144318.17106-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200810144318.17106-1-leon.anavi@konsulko.com>
References: <20200810144318.17106-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.3.2:

* Added Border, Fill, Pattern and Gradient formatting to chart
  data labels and chart custom data labels.
* Fix for issue where array formulas weren't included in the
  output file for certain ranges/conditions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-xlsxwriter_1.3.0.bb => python3-xlsxwriter_1.3.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.3.0.bb => python3-xlsxwriter_1.3.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
index 3b4e89d04..76f5d1622 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.3.2.bb
@@ -8,7 +8,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "XlsxWriter"
 
-SRC_URI[md5sum] = "80ac0ccf43435739c4afa5e0bfff8580"
-SRC_URI[sha256sum] = "3015f707cf237d277cf1b2d7805f409f0387e32bc52f3c76db9f85098980e828"
+SRC_URI[md5sum] = "78fccd0e056f3c1c474e13eec54ce30d"
+SRC_URI[sha256sum] = "3ba4655713c8c84b428b529c8e353ac028626ec57f348094da4f66fdc573b0fb"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

