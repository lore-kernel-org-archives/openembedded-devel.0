Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.12082.1596463541036081321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40282 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k2b5v-00024S-8x; Mon, 03 Aug 2020 17:05:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-yarl: Upgrade 1.4.2 -> 1.5.1
Date: Mon,  3 Aug 2020 17:05:15 +0300
Message-Id: <20200803140520.23250-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200803140520.23250-1-leon.anavi@konsulko.com>
References: <20200803140520.23250-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.5.1:

- Fix including relocated internal yarl._quoting_c C-extension
  into published PyPI dists.
- Convert host to lowercase on URL building. #386
- Allow using mod operator (%) for updating query string (an alias
  for update_query() method).
- Allow use of sequences such as list and tuple in the values of a
  mapping such as dict to represent that a key has many values:

  url = URL("http://example.com")
  assert url.with_query({"a": [1, 2]}) == URL("http://example.com/?a=1&a=2")

- Support URL.build() with scheme and path (creates a relative
  URL).
- Cache slow IDNA encode/decode calls.
- Add @final / Final type hints.
- Support URL authority/raw_authority properties and authority
  argument of URL.build() method.
- Hide the library implementation details, make the exposed public
  list very clean.
- Fix tests with newer Python (3.7.6, 3.8.1 and 3.9.0+).
- Fix a bug where query component, passed in a form of mapping or
  sequence, is unquoted in unexpected way.
- Hide Query and QueryVariable type aliases in __init__.pyi, now
  they are prefixed with underscore.
- Keep ipv6 brackets after updating port/user/password.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.4.2.bb => python3-yarl_1.5.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.4.2.bb => python3-yarl_1.5.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
index 15d92065d..40f0e4db0 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.5.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
 
-SRC_URI[md5sum] = "08ba0d6e18f460b44d9e5459f3d217ba"
-SRC_URI[sha256sum] = "58cd9c469eced558cd81aa3f484b2924e8897049e06889e8ff2510435b7ef74b"
+SRC_URI[md5sum] = "a9b20bf0b8a6962e1101b28908a67bf8"
+SRC_URI[sha256sum] = "c22c75b5f394f3d47105045ea551e08a3e804dc7e01b37800ca35b58f856c3d6"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

