Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.3190.1592560024118796381
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jun 2020 02:47:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53780 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jmDqV-0001eB-Uj; Fri, 19 Jun 2020 13:02:13 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-toml: Upgrade 0.10.0 -> 0.10.1
Date: Fri, 19 Jun 2020 12:46:37 +0300
Message-Id: <20200619094638.7116-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200619094638.7116-1-leon.anavi@konsulko.com>
References: <20200619094638.7116-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.10.1:

- Removed test for unexpected EOF while parsing string
- Raise an exception if EOF is reached and a string is
  unterminated
- Allow loading from bytes paths.
- Fix the issue where the parser fails on time attr with no space
  after =
- Fix trailing whitespace in break
- Handle arrays of multiline strings
- Fix bad syntax handling
- Improve professionalism of error message.
- Extend TomlNumpyEncoder to numpy integer types.
- Fix loading values when a line has " }" after a boolean.

The copyright notices were updated and the md5 checksum has
changed. The license remains MIT.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-toml_0.10.0.bb => python3-toml_0.10.1.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-toml_0.10.0.bb => python3-toml_0.10.1.bb} (54%)

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
similarity index 54%
rename from meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
rename to meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
index b72753b80..00f38c6c3 100644
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
@@ -2,10 +2,10 @@ SUMMARY = "Python Library for Tom's Obvious, Minimal Language"
 HOMEPAGE = "https://github.com/uiri/toml"
 LICENSE = "MIT"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6d6012eea477117abf51c31262a152f8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
 
-SRC_URI[md5sum] = "63fffbe2d632865ec29cd69bfdf36682"
-SRC_URI[sha256sum] = "229f81c57791a41d65e399fc06bf0848bab550a9dfd5ed66df18ce5f05e73d5c"
+SRC_URI[md5sum] = "743131c431419fe42f854cff02ad3abe"
+SRC_URI[sha256sum] = "926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

