Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6713.1609859816500798588
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4s-0007qz-Gg; Tue, 05 Jan 2021 17:16:55 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 10/10] python3-pandas: Upgrade 1.1.4 -> 1.2.0
Date: Tue,  5 Jan 2021 17:16:38 +0200
Message-Id: <20210105151638.15700-10-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210105151638.15700-1-leon.anavi@konsulko.com>
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.0:

- Optionally disallow duplicate labels
- Passing arguments to fsspec backends
- Support for binary file handles in to_csv
- Support for short caption and table position in to_latex
- Change in default floating precision for read_csv and read_table
- Experimental nullable data types for float data
- Index/column name preservation when aggregating
- GroupBy supports EWM operations directly
- Various bug fixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.1.4.bb => python3-pandas_1.2.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.1.4.bb => python3-pandas_1.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb b/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
index 78730b46af..0cb631990c 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.2.0.bb
@@ -6,8 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[md5sum] = "594e6a429f297c77470e37d3510cccbb"
-SRC_URI[sha256sum] = "a979d0404b135c63954dea79e6246c45dd45371a88631cdbb4877d844e6de3b6"
+SRC_URI[sha256sum] = "e03386615b970b8b41da6a68afe717626741bb2431cec993640685614c0680e4"
 
 inherit pypi setuptools3
 
-- 
2.17.1

