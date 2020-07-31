Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.18250.1596201788105159182
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2020 06:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47376 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k1V05-000741-T3; Fri, 31 Jul 2020 16:23:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 13/15] python3-pandas: Upgrade 1.0.5 -> 1.1.0
Date: Fri, 31 Jul 2020 16:22:28 +0300
Message-Id: <20200731132230.20031-13-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200731132230.20031-1-leon.anavi@konsulko.com>
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.2
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

Upgrade to release 1.1.0. This is a minor release which includes
some new features, bug fixes, and performance improvements.
For more details have a look at:
https://pandas.pydata.org/pandas-docs/version/1.1.0/whatsnew/v1.1.0.html

License-Update: Updated years. The license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.0.5.bb => python3-pandas_1.1.0.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.0.5.bb => python3-pandas_1.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
index d8db4cef3..f100677ca 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
@@ -4,10 +4,10 @@ high-performance, easy-to-use data structures and data analysis tools for \
 the Python programming language."
 HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c2a8f987b2ce77c368c6b3e1b5b10774"
 
-SRC_URI[md5sum] = "5183db713194e6fbc96c45f30a0d1311"
-SRC_URI[sha256sum] = "69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8"
+SRC_URI[md5sum] = "512da48424b85bf198002bdbdf38af5a"
+SRC_URI[sha256sum] = "b39508562ad0bb3f384b0db24da7d68a2608b9ddc85b1d931ccaaa92d5e45273"
 
 inherit pypi setuptools3
 
-- 
2.17.1

