Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2581.1605178604633576481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 02:56:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39606 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kdAHS-0006p6-Js; Thu, 12 Nov 2020 12:56:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-attrs: 20.2.0 -> 20.3.0
Date: Thu, 12 Nov 2020 12:56:18 +0200
Message-Id: <20201112105618.23773-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112105618.23773-1-leon.anavi@konsulko.com>
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.3.0:

- attr.define(), attr.frozen(), attr.mutable(), and attr.field()
  remain provisional.
- attr.s() now has a field_transformer hook that is called for all
  Attributes and returns a (modified or updated) list of Attribute
  instances. attr.asdict() has a value_serializer hook that can
  change the way values are converted. Both hooks are meant to
  help with data (de-)serialization workflows.
- kw_only=True now works on Python 2.
- raise from now works on frozen classes on PyPy.
- attr.asdict() and attr.astuple() now treat frozensets like sets
  with regards to the retain_collection_types argument.
- The type stubs for attr.s() and attr.make_class() are not
  missing the collect_by_mro argument anymore.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-attrs_20.2.0.bb => python3-attrs_20.3.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-attrs_20.2.0.bb => python3-attrs_20.3.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
index c2a5b90515..55cfda7180 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_20.3.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594"
-SRC_URI[md5sum] = "7be95e1b35e9385d71a0017a48217efc"
+SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
+SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
 
 inherit pypi setuptools3
 
-- 
2.17.1

