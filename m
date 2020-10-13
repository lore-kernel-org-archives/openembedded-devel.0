Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.7581.1602579568297416705
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 01:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSG9W-0002BF-Lt; Tue, 13 Oct 2020 11:59:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-yarl: Upgrade 1.6.0 -> 1.6.2
Date: Tue, 13 Oct 2020 11:59:14 +0300
Message-Id: <20201013085914.31580-7-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.2:

- Provide generated .c files in TarBall distribution.
- Provide wheels for aarch64, i686, ppc64le, s390x architectures
  on Linux as well as x86_64.
- Provide wheels for Python 3.9.
- human_repr() now always produces valid representation equivalent
  to the original URL (if the original URL is valid).
- Fixed requoting a single percent followed by a percent-encoded
  character in the Cython implementation.
- Fix ValueError when decoding % which is not followed by two
  hexadecimal digits.
- Fix decoding % followed by a space and hexadecimal digit.
- Fix annotation of with_query()/update_query() methods for
  key=[val1, val2] case.
- Drop Python 3.5 support; Python 3.6 is the minimal supported
  Python version.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-yarl_1.6.0.bb => python3-yarl_1.6.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.6.0.bb => python3-yarl_1.6.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb b/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
index 543acc51ba..dbb5d23bd2 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.6.2.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b334fc90d45983db318f54fd5bf6c90b"
 
-SRC_URI[md5sum] = "802bb27ebdb260fbbaecbcc8168d6f28"
-SRC_URI[sha256sum] = "61d3ea3c175fe45f1498af868879c6ffeb989d4143ac542163c45538ba5ec21b"
+SRC_URI[md5sum] = "65c3346f694e37f45045f4e29a60d280"
+SRC_URI[sha256sum] = "c45b49b59a5724869899798e1bbd447ac486215269511d3b76b4c235a1b766b6"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.17.1

