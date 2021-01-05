Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6813.1609859819521425468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Jan 2021 07:16:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41868 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kwo4m-0007qz-8O; Tue, 05 Jan 2021 17:16:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-psutil: Upgrade 5.7.3 -> 5.8.0
Date: Tue,  5 Jan 2021 17:16:30 +0200
Message-Id: <20210105151638.15700-2-leon.anavi@konsulko.com>
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

Upgrade to release 5.8.0:

- disk_partitions() exposes 2 extra fields: maxfile and maxpath,
  which are the maximum file name and path name length.
- [Windows] added support for PyPy 2.7.
- provide pre-compiled wheels for Linux and macOS.
- get rid of Travis and Cirrus CI services (they are no longer
  free). CI testing is now done by GitHub Actions on Linux, macOS
  and FreeBSD (yes). AppVeyor is still being used for Windows CI.
- [Linux] get rid of sensors_temperatures() duplicates.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-psutil_5.7.3.bb => python3-psutil_5.8.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.7.3.bb => python3-psutil_5.8.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb b/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
index 2f927d2da2..bd43b414d0 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.8.0.bb
@@ -2,8 +2,7 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[md5sum] = "b07a067e6a930608235f4e5d9b1f90f5"
-SRC_URI[sha256sum] = "af73f7bcebdc538eda9cc81d19db1db7bf26f103f91081d780bbacfcb620dee2"
+SRC_URI[sha256sum] = "0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6"
 
 inherit pypi setuptools3
 
-- 
2.17.1

