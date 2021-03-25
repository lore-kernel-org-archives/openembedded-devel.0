Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7915.1616679294807420757
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8S-0007lW-Vc; Thu, 25 Mar 2021 15:34:54 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/11] python3-djangorestframework: Upgrade 3.12.2 -> 3.12.3
Date: Thu, 25 Mar 2021 15:34:36 +0200
Message-Id: <20210325133436.18328-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.12.3:

- Properly handle ATOMIC_REQUESTS when multiple database
  configurations are used.
- Bypass COUNT query when LimitOffsetPagination is configured but
  pagination params are not included on the request.
- Respect allow_null=True on DecimalField.
- Allow title cased "Yes"/"No" values with BooleanField.
- Add PageNumberPagination.get_page_number() method for overriding
  behavior.
- Fixed rendering of timedelta values in OpenAPI schemas, when
  present as default, min, or max fields.
- Render JSONFields with indentation in browsable API forms.
- Remove unnecessary database query in admin Token views.
- Raise validation errors when bools are passed to
  PrimaryKeyRelatedField fields, instead of casting to ints.
- Don't include model properties as automatically generated
  ordering fields with OrderingFilter.
- Use deque instead of list for tracking throttling .history.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mework_3.12.2.bb => python3-djangorestframework_3.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.12.2.bb => python3-djangorestframework_3.12.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.3.bb
index 6742b87b2..a75d3f18c 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.3.bb
@@ -5,8 +5,8 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[md5sum] = "e70d58ee2f83f11d4efe33162bb8af3b"
-SRC_URI[sha256sum] = "0898182b4737a7b584a2c73735d89816343369f259fea932d90dc78e35d8ac33"
+SRC_URI[sha256sum] = "2fbbd5c28a1aaa1ad0b721b29e916797fc9aba9f9b3e7619da11c674880fc7aa"
+
 PYPI_PACKAGE = "djangorestframework"
 
 inherit pypi setuptools3
-- 
2.17.1

