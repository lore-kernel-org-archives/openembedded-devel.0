Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.10220.1603278981803094361
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 04:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40598 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVC6N-0007Sd-W3; Wed, 21 Oct 2020 14:16:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-typeguard: Upgrade 2.9.1 -> 2.10.0
Date: Wed, 21 Oct 2020 14:16:09 +0300
Message-Id: <20201021111609.28237-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201021111609.28237-1-leon.anavi@konsulko.com>
References: <20201021111609.28237-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.10.0:

- Added support for Python 3.9
- Added support for nested Literal
- Added support for TypedDict inheritance (with some caveats; see
  the user guide on that for details)
- An appropriate TypeError is now raised when encountering an
  illegal Literal value
- Fixed checking NoReturn on Python < 3.8 when typing_extensions
  was not installed
- Fixed import hook matching unwanted modules
- Install the pytest plugin earlier in the test run to support
  more use cases

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-typeguard_2.9.1.bb => python3-typeguard_2.10.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.9.1.bb => python3-typeguard_2.10.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
index 3786ccb855..bd92216776 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.10.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[md5sum] = "411df8eefd76ffa014328a46342bdf38"
-SRC_URI[sha256sum] = "529ef3d88189cc457f4340388028412f71be8091c2c943465146d4170fb67288"
+SRC_URI[md5sum] = "cc43e0eb1dea7e409a74c7f1effc4544"
+SRC_URI[sha256sum] = "d830132dcd544d3f8a2a842ea739eaa0d7c099fcebb9dcdf3802f4c9929d8191"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

