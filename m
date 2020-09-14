Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.57254.1600074274244010864
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPY-0007z1-Qi; Mon, 14 Sep 2020 12:04:33 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-isort: Upgrade 5.5.0 -> 5.5.2
Date: Mon, 14 Sep 2020 12:04:18 +0300
Message-Id: <20200914090419.19171-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
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

Upgrade to release 5.5.2:

- Fixed: --diff option is ignored when input is from stdin.
- Fixed: Ensure indented import sections with import heading and
  a preceding comment don't cause import sorting loops.
- Fixed: isort error when float to top on almost empty file.
- Fixed: noqa comment moved to where flake8 cant see it.
- Fixed: .svn missing from default ignore list.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-isort_5.5.0.bb => python3-isort_5.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.0.bb => python3-isort_5.5.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
index ee13d76e5..0d0415786 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "9560df531409e67ac8796e98ffcb6124"
-SRC_URI[sha256sum] = "0906e0e7092e060c05de709ad172e1ec1b26aa27fdd4e8093f257890cd881d18"
+SRC_URI[md5sum] = "844c49ad1bf16a957b490c27b3b9844f"
+SRC_URI[sha256sum] = "171c5f365791073426b5ed3a156c2081a47f88c329161fd28228ff2da4c97ddb"
 
 inherit pypi setuptools3
 
-- 
2.17.1

