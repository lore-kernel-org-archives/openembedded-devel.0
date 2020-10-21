Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.10209.1603278978230204784
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6K-0007Sd-Cq; Wed, 21 Oct 2020 14:16:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-bitarray: Upgrade 1.5.3 -> 1.6.0
Date: Wed, 21 Oct 2020 14:16:06 +0300
Message-Id: <20201021111609.28237-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.0:

- add `decodetree` object, for speeding up consecutive calls
  to `.decode()` and `.iterdecode()`, in particular when dealing
  with large prefix codes, see #103
- add optional parameter to `.tolist()` which changes the items in
  the returned list to integers (0 or 1), as opposed to Booleans
- remove deprecated `bitdiff()`, which has been deprecated since
  version 1.2.0, use `bitarray.util.count_xor()` instead
- drop Python 2.6 support

License-Update: Update license file, license remains the same.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_1.5.3.bb => python3-bitarray_1.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.3.bb => python3-bitarray_1.6.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
index e36a17027f..b085cf7c09 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.6.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[md5sum] = "7cfa242b99351646fab0d76b05aab747"
-SRC_URI[sha256sum] = "567631fc922b1c2c528c376795f18dcc0604d18702e0b8b50e8e35f0474214a5"
+SRC_URI[md5sum] = "08ddac722b139c1544087c4953a6335b"
+SRC_URI[sha256sum] = "ba157ddebddc723fe021fc80595b3c70924d69ee58286b62bfca21da48edfc9d"
 
 inherit setuptools3 pypi
 
-- 
2.17.1

