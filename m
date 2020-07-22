Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.15995.1595414962511952149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2020 03:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55352 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jyCJM-0001ZT-Fx; Wed, 22 Jul 2020 13:49:21 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-coverage: Upgrade 5.1 -> 5.2
Date: Wed, 22 Jul 2020 13:49:05 +0300
Message-Id: <20200722104905.15499-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200722104905.15499-1-leon.anavi@konsulko.com>
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.2:

- The HTML report has been redesigned by Vince Salvino. There is
  now a dark mode, the code text is larger, and system sans serif
  fonts are used, in addition to other small changes.
- The coverage report and coverage html commands now accept a
  --precision option to control the number of decimal points
  displayed. Thanks, Teake Nutma.
- The coverage report and coverage html commands now accept a
  --no-skip-covered option to negate --skip-covered.
  Thanks, Anthony Sottile.
- The --skip-empty option is now available for the XML report.
- The coverage report command now accepts a --sort option to
  specify how to sort the results. Thanks, Jerin Peter George.
- If coverage fails due to the coverage total not reaching the
  --fail-under value, it will now print a message making the
  condition clear. Thanks, Naveen Yadav.
- TOML configuration files with non-ASCII characters would cause
  errors on Windows. This is now fixed.
- The output of --debug=trace now includes information about how
  the --source option is being interpreted, and the module names
  being considered.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_5.1.bb => python3-coverage_5.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.1.bb => python3-coverage_5.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.2.bb
index 7265d2c97..72558e10c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[md5sum] = "506e30fb011158abe5ce92f39866b271"
-SRC_URI[sha256sum] = "f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052"
+SRC_URI[md5sum] = "bfe80a336636160a3916467f55842bc5"
+SRC_URI[sha256sum] = "1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404"
 
 inherit pypi setuptools3
 
-- 
2.17.1

