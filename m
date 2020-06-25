Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6716.1593076111840340683
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 02:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1joNry-0005y7-4P; Thu, 25 Jun 2020 12:08:30 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/12] python3-pandas: Upgrade 1.0.3 -> 1.0.5
Date: Thu, 25 Jun 2020 12:07:15 +0300
Message-Id: <20200625090719.16068-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200625090719.16068-1-leon.anavi@konsulko.com>
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.5:

- Fix regression in read_parquet() when reading from file-like
  objects.
- Fix regression in reading from public S3 buckets.
- Fixed regression in replace() raising an AssertionError when
  replacing values in an extension dtype with values of a
  different dtype

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
index 099e035e1..d8db4cef3 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "a3ea90326c5b55944d369bef87740a72"
-SRC_URI[sha256sum] = "32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586"
+SRC_URI[md5sum] = "5183db713194e6fbc96c45f30a0d1311"
+SRC_URI[sha256sum] = "69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8"
 
 inherit pypi setuptools3
 
-- 
2.17.1

