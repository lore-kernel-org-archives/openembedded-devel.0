Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9203.1594826706717423019
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2020 08:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33072 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jvjHM-0006eC-T7; Wed, 15 Jul 2020 18:25:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-psutil: Upgrade 5.7.0 -> 5.7.2
Date: Wed, 15 Jul 2020 18:24:47 +0300
Message-Id: <20200715152450.29018-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200715152450.29018-1-leon.anavi@konsulko.com>
References: <20200715152450.29018-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.7.2:

- wheels for 2.7 were inadvertently deleted.
- parallel tests on UNIX (make test-parallel). They're twice as
  fast!
- "make build/install" is now run in parallel and it's about 15%
  faster on UNIX.
- Process.wait() on POSIX returns an enum, showing the negative
  signal which was used to terminate the process.
- Process.wait() return value is cached so that the exit code can
  be retrieved on then next call.
- memory leak tests are now stable.
- Linux: cpu_freq() parsing should use spaces instead of tabs on
  ia64.
- Linux: Process.rlimit() does not handle long long type properly.
- fix signature of callback function for getloadavg().

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-psutil_5.7.0.bb => python3-psutil_5.7.2.bb}     | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-psutil_5.7.0.bb => python3-psutil_5.7.2.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb b/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
index 170819d59..d61d501e9 100644
--- a/meta-python/recipes-devtools/python/python3-psutil_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-psutil_5.7.2.bb
@@ -2,8 +2,9 @@ SUMMARY = "A cross-platform process and system utilities module for Python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 
-SRC_URI[md5sum] = "ed7b0f11ed214bcabbe76b7cf52f3ae3"
-SRC_URI[sha256sum] = "685ec16ca14d079455892f25bd124df26ff9137664af445563c1bd36629b5e0e"
+PYPI_SRC_URI = "https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1/psutil-${PV}.tar.gz"
+SRC_URI[md5sum] = "50bf39b4faa268ba1da8a9730bb38bb6"
+SRC_URI[sha256sum] = "90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb"
 
 inherit pypi setuptools3
 
-- 
2.17.1

