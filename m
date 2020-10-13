Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7600.1602579565934555120
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9U-0002BF-1C; Tue, 13 Oct 2020 11:59:25 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-croniter: Upgrade 0.3.34 -> 0.3.35
Date: Tue, 13 Oct 2020 11:59:11 +0300
Message-Id: <20201013085914.31580-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201013085914.31580-1-leon.anavi@konsulko.com>
References: <20201013085914.31580-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.35:

- Handle L in ranges.
- Add a new initializaton paramter max_years_between_matches to
  support finding the next/previous date beyond the default 1 year
  window, if so desired. Updated README to include additional
  notes and example of this usage.
- The croniter_range() function was updated to automatically
  determines the appropriate max_years_between_matches value, this
  preventing handling of the CroniterBadDateError exception.
- Updated exception handling classes: CroniterBadDateError now
  only applies during date finding operations (next/prev), and all
  parsing errors can now be caught using CroniterBadCronError. The
  CroniterNotAlphaError exception is now a subclass of
  CroniterBadCronError. A breif description of each exception
  class was added as an inline docstring.
- Updated iterable interfaces to replace the CroniterBadDateError
  with StopIteration if (and only if) the max_years_between_matches
  argument is provided. The rationale here is that if the user has
  specified the max tollernace between matches, then there's no need
  to further inform them of no additional matches. Just stop the
  iteration. This also keeps backwards compatibility.
- Minor docs update.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-croniter_0.3.34.bb => python3-croniter_0.3.35.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_0.3.34.bb => python3-croniter_0.3.35.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb b/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
rename to meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
index 123d176137..388885c158 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_0.3.34.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_0.3.35.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
-SRC_URI[md5sum] = "adfeeb0032ab7aeccba908fa2eb09c33"
-SRC_URI[sha256sum] = "7186b9b464f45cf3d3c83a18bc2344cc101d7b9fd35a05f2878437b14967e964"
+SRC_URI[md5sum] = "8bb1443b90123f96ad64d7fae26df342"
+SRC_URI[sha256sum] = "b9075573d9d18fdc4c67ad6741c4bfa4b446b1b1d7f03279757244c8a75abedf"
 
 inherit pypi setuptools3
 
-- 
2.17.1

