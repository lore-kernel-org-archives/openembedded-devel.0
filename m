Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.1719.1592424781617032965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2020 13:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34286 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jleQc-0003o3-3j; Wed, 17 Jun 2020 23:12:59 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] sip3: Upgrade 4.19.19 -> 4.19.23
Date: Wed, 17 Jun 2020 23:12:47 +0300
Message-Id: <20200617201247.14206-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200617201247.14206-1-leon.anavi@konsulko.com>
References: <20200617201247.14206-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.19.23:

- Added some missing quotes to configure.py
- Fixed a race condition when calling the PyQt5-specific meta-call
  helper.
- Fixed the wrapping of methods that return a Py_Ssize_t.
- The code generator now distinguishes between the copy/assignment
  helper and the array helper when determining which helpers can
  be generated.
- Fixed the code generation when making a copy of C++ object on
  the stack to the heap when the class has no suitable ctor.
- Check there is a public copy ctor when we can't using an
  assigment operator as a workaround.
- Preserve any current exception in the implementation of the
  wrapper dealloc functions.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/sip/{sip3_4.19.19.bb => sip3_4.19.23.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/sip/{sip3_4.19.19.bb => sip3_4.19.23.bb} (92%)

diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
similarity index 92%
rename from meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
rename to meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
index e6a4653b5..320755b84 100644
--- a/meta-oe/recipes-devtools/sip/sip3_4.19.19.bb
+++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 
 SRC_URI = "https://www.riverbankcomputing.com/static/Downloads/sip/${PV}/sip-${PV}.tar.gz \
 "
-SRC_URI[md5sum] = "98111479309dc472410f26080d6d4a88"
-SRC_URI[sha256sum] = "5436b61a78f48c7e8078e93a6b59453ad33780f80c644e5f3af39f94be1ede44"
+SRC_URI[md5sum] = "70adc0c9734e2d9dcd241d3f931dfc74"
+SRC_URI[sha256sum] = "22ca9bcec5388114e40d4aafd7ccd0c4fe072297b628d0c5cdfa2f010c0bc7e7"
 
 inherit python3-dir python3native
 
-- 
2.17.1

