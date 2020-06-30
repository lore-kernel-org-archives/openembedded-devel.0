Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.2021.1593537122714378070
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJnc-0004sv-VL; Tue, 30 Jun 2020 20:12:01 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-configargparse: Upgrade 0.15.1 -> 1.2.3
Date: Tue, 30 Jun 2020 20:11:14 +0300
Message-Id: <20200630171119.25540-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200630171119.25540-1-leon.anavi@konsulko.com>
References: <20200630171119.25540-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2.3:

- Fix bug in accepts_list_and_has_nargs section.
- Allow use of nargs with action=append
- Add support for python's Configparser config file format

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...nfigargparse_0.15.1.bb => python3-configargparse_1.2.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_0.15.1.bb => python3-configargparse_1.2.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
index 0797898a9..54841c243 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.2.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[md5sum] = "aba15b7973b7a70bea86fd69289f8fe3"
-SRC_URI[sha256sum] = "baaf0fd2c1c108d007f402dab5481ac5f12d77d034825bf5a27f8224757bd0ac"
+SRC_URI[md5sum] = "8978866babc7ff0994f691ebe48b5aba"
+SRC_URI[sha256sum] = "edd17be986d5c1ba2e307150b8e5f5107aba125f3574dddd02c85d5cdcfd37dc"
 
 PYPI_PACKAGE = "ConfigArgParse"
 
-- 
2.17.1

