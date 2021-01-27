Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.9688.1611762950564412106
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49388 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4nAa-0001GX-Vc; Wed, 27 Jan 2021 17:55:50 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pako: Upgrade 0.2.3 -> 0.3.0
Date: Wed, 27 Jan 2021 17:55:36 +0200
Message-Id: <20210127155538.12229-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127155538.12229-1-leon.anavi@konsulko.com>
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.3.0 which adds support for the following
package managers:

- DNF (as used by RPM based distributions)
- RPM-ostree (as used by Fedora CoreOS and RHEL CoreOS)
- Pacman (as used by Arch based distributions)
- Yum (as used by some RPM based distributions)
- Zypper (as used by OpenSUSE based distributions)
- APK (as used by Alpine Linux and postmarketOS)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pako_0.2.3.bb => python3-pako_0.3.0.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pako_0.2.3.bb => python3-pako_0.3.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb b/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
rename to meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
index 21c48fca6..3eacd0bdd 100644
--- a/meta-python/recipes-devtools/python/python3-pako_0.2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pako_0.3.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/MycroftAI/pako"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "8eb7077075091c50e4b8a9f939607277"
-SRC_URI[sha256sum] = "6be55fd8c5a2a6f02974f37438c1c47a3d9e764ce81c9d0a1a8c9a1815a59778"
+SRC_URI[sha256sum] = "eabd1c121d6701069d1a10132f197ee2b5f4e75a3d68a93b07f69214ab0ff9c7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

