Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3805.1622064796100972353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 14:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=46114 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lm19K-0000vH-OK; Thu, 27 May 2021 00:33:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-bidict: Add recipe
Date: Thu, 27 May 2021 00:32:47 +0300
Message-Id: <20210526213248.10348-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210526213248.10348-1-leon.anavi@konsulko.com>
References: <20210526213248.10348-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-1.0
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

Add bidict, the bidirectional mapping library for Python.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-bidict_0.21.2.bb  | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb b/meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb
new file mode 100644
index 000000000..237bd2a63
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-bidict_0.21.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "The bidirectional mapping library for Python."
+DESCRIPTION = "The bidirectional mapping library for Python."
+HOMEPAGE = "https://bidict.readthedocs.io/"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9741c346eef56131163e13b9db1241b3"
+
+SRC_URI[sha256sum] = "4fa46f7ff96dc244abfc437383d987404ae861df797e2fd5b190e233c302be09"
+
+inherit pypi setuptools3
+
+DEPENDS += "python3-setuptools-scm-native"
-- 
2.17.1

