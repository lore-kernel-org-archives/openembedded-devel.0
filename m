Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.32917.1601898916712469930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 04:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44266 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPP5G-0004NT-V9; Mon, 05 Oct 2020 14:55:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-humanize: Upgrade 3.0.0 -> 3.0.1
Date: Mon,  5 Oct 2020 14:55:06 +0300
Message-Id: <20201005115507.11563-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005115507.11563-1-leon.anavi@konsulko.com>
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0.1:

- Fix some translation for id_ID

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.0.0.bb => python3-humanize_3.0.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.0.0.bb => python3-humanize_3.0.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
index 386fb1e136..92831bf135 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.0.1.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[md5sum] = "779b291ac40b73a0fd6006c0485c1794"
-SRC_URI[sha256sum] = "db08acbd8e31954f146467a213a112c4b80a5b8e319e06b76aa184a679bd8b48"
+SRC_URI[md5sum] = "53faa88dedddba1227f9c41d65440c54"
+SRC_URI[sha256sum] = "8ff8f292c9bf52bbefdc620410e7defd1c95e7eeb1a5cfc2859aaea4b1877ff5"
 
 inherit pypi setuptools3
 
-- 
2.17.1

