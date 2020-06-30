Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.1973.1593537131245353739
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46852 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jqJnm-0004sv-LO; Tue, 30 Jun 2020 20:12:11 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-h2: Upgrade 3.1.1 -> 3.2.0
Date: Tue, 30 Jun 2020 20:11:19 +0300
Message-Id: <20200630171119.25540-7-leon.anavi@konsulko.com>
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

Upgrade to release 3.2.0:

- Receiving DATA frames on closed (or reset) streams now
  properly emit a WINDOW_UPDATE to keep the connection flow window
  topped up.
- h2.config.logger now uses a trace(...) function, in addition to
  debug(...). If you defined a custom logger object, you need to
  handle these new function calls.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python-h2/{python3-h2_3.1.1.bb => python3-h2_3.2.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-connectivity/python-h2/{python3-h2_3.1.1.bb => python3-h2_3.2.0.bb} (68%)

diff --git a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb b/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
similarity index 68%
rename from meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
rename to meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
index 5d9a65530..bdc110fb6 100644
--- a/meta-python/recipes-connectivity/python-h2/python3-h2_3.1.1.bb
+++ b/meta-python/recipes-connectivity/python-h2/python3-h2_3.2.0.bb
@@ -4,8 +4,8 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b6b2f6bbe76528af543242d606c14851"
 
-SRC_URI[md5sum] = "950b5a62a2a608dc4547a01edf99aa8f"
-SRC_URI[sha256sum] = "b8a32bd282594424c0ac55845377eea13fa54fe4a8db012f3a198ed923dc3ab4"
+SRC_URI[md5sum] = "197a99c09f344a0dd987fab9801dc8d0"
+SRC_URI[sha256sum] = "875f41ebd6f2c44781259005b157faed1a5031df3ae5aa7bcb4628a6c0782f14"
 
 inherit pypi setuptools3
 
-- 
2.17.1

