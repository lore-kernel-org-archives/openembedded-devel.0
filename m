Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.41303.1602511237522009513
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2020 07:00:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39076 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kRyNQ-00026S-38; Mon, 12 Oct 2020 17:00:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pyperclip: Upgrade 1.8.0 -> 1.8.1
Date: Mon, 12 Oct 2020 17:00:22 +0300
Message-Id: <20201012140022.15761-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201012140022.15761-1-leon.anavi@konsulko.com>
References: <20201012140022.15761-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.1:

- Get rid of trailing whitespace.
- Updated supported python versions in the setup.py file
- Added the ability to copy text from the command line.
- Fix for WSL2 and Ubuntu LTS 20.04
- Made PyQt checks in tests more specific

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-pyperclip_1.8.0.bb => python3-pyperclip_1.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyperclip_1.8.0.bb => python3-pyperclip_1.8.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
rename to meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
index 8f331529a6..211580b37c 100644
--- a/meta-python/recipes-devtools/python/python3-pyperclip_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyperclip_1.8.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/asweigart/pyperclip"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=d7dd4b0d1f7153322a546e89b5a0a632"
 
-SRC_URI[md5sum] = "c2564a74b909b6fc32401afd619de83d"
-SRC_URI[sha256sum] = "b75b975160428d84608c26edba2dec146e7799566aea42c1fe1b32e72b6028f2"
+SRC_URI[md5sum] = "0ac879899da5c2af755a834245ca6a0f"
+SRC_URI[sha256sum] = "9abef1e79ce635eb62309ecae02dfb5a3eb952fa7d6dce09c1aef063f81424d3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

