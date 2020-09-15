Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9302.1600160597402506538
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 02:03:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43802 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kI6rr-0007I7-7k; Tue, 15 Sep 2020 12:03:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/10] python3-attrs: Upgrade 20.1.0 -> 20.2.0
Date: Tue, 15 Sep 2020 12:02:57 +0300
Message-Id: <20200915090303.14367-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915090303.14367-1-leon.anavi@konsulko.com>
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
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

Upgrade to release 20.2.0:

- Backward-incompatible: attr.define(), attr.frozen(),
  attr.mutable(), and attr.field() remain provisional.
- attr.define() et al now correct detect __eq__ and __ne__.
- attr.define() et al's hybrid behavior now also works correctly
  when arguments are passed.
- It's possible to define custom __setattr__ methods on slotted
  classes again.
- In 20.1.0 we introduced the inherited attribute on the
  attr.Attribute class to differentiate attributes that have been
  inherited and those that have been defined directly on the
  class.It has shown to be problematic to involve that attribute
  when comparing instances of attr.Attribute though, because when
  sub-classing, attributes from base classes are suddenly not
  equal to themselves in a super class.
  Therefore the inherited attribute will now be ignored when
  hashing and comparing instances of attr.Attribute.
- zope.interface is now a "soft dependency" when running the test
  suite; if zope.interface is not installed when running the test
  suite, the interface-related tests will be automatically skipped.
- The ergonomics of creating frozen classes using
  @define(frozen=True) and sub-classing frozen classes has been
  improved: you don't have to set on_setattr=None anymore. #687

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-attrs_20.1.0.bb => python3-attrs_20.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-attrs_20.1.0.bb => python3-attrs_20.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb b/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
rename to meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
index 371f1f042..c2a5b9051 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_20.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "0ef97238856430dcf9228e07f316aefc17e8939fc8507e18c6501b761ef1a42a"
-SRC_URI[md5sum] = "ab7533fc91c5db3d5b65e66be907444e"
+SRC_URI[sha256sum] = "26b54ddbbb9ee1d34d5d3668dd37d6cf74990ab23c828c2888dccdceee395594"
+SRC_URI[md5sum] = "7be95e1b35e9385d71a0017a48217efc"
 
 inherit pypi setuptools3
 
-- 
2.17.1

