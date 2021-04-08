Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.6748.1617882820925716941
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 04:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35416 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lUTE9-0002Qi-TA; Thu, 08 Apr 2021 14:53:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-croniter: Upgrade 1.0.10 -> 1.0.11
Date: Thu,  8 Apr 2021 14:53:28 +0300
Message-Id: <20210408115330.7708-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210408115330.7708-1-leon.anavi@konsulko.com>
References: <20210408115330.7708-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.0.11:

- fix bug: bad case:0 6 30 3 *
- Add support for L in the day_of_week component. This enable
  expressions like * * * * L4, which means last Thursday of the
  month.
- Create CroniterUnsupportedSyntaxError exception for situations
  where CRON syntax may be valid but some combinations of features
  is not supported. Currently, this is used when the day_of_week
  component has a combination of literal values and nth/last
  syntax at the same time.
  For example, 0 0 * * 1,L6 or 0 0 * * 15,sat#1 will both raise
  this exception because of mixing literal days of the week with
  nth-weekday or last-weekday syntax. This may impact existing
  cron expressions in prior releases, because 0 0 * * 15,sat#1
  was previously allowed but incorrectly handled.
- Update croniter_range() to allow an alternate croniter class to
  be used. Helpful when using a custom class derived from croniter.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-croniter_1.0.10.bb => python3-croniter_1.0.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.0.10.bb => python3-croniter_1.0.11.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb b/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
index 6cd87fea9..ca9bf71a5 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.0.11.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "364c48e393060295c3161588a6556d5c890b5c34299973c393adbe4488ca1ecb"
+SRC_URI[sha256sum] = "cd89bcbed4d79f56bbf2c9415c2bbbfd09fadc8a59dbae3898fbca5bab34103d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

