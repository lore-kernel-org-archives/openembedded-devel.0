Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.146438.1598053522741185351
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gim-0003AI-0V; Sat, 22 Aug 2020 02:45:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 08/11] python3-nocaselist: Add recipe
Date: Sat, 22 Aug 2020 02:45:01 +0300
Message-Id: <20200821234504.719-8-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821234504.719-1-leon.anavi@konsulko.com>
References: <20200821234504.719-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add recipe for nocaselist, a case-insensitive list for Python.
Changelog for 1.0.1:

- Fixed the incorrect behavior of the ‘+’ and ‘+=’ operators to
  now (correctly) treat the right hand operand as an iterable of
  items to be added, instead of (incorrectly) as a single item.
  For ‘+’, the right hand operand now must be a list, consistent
  with the built-in list class.
- Fixed the incorrect behavior of the * and *= operators to now
  validate that the number is an integer and raise TypeError
  otherwise, consistent with the built-in list class.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-nocaselist_1.0.1.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
new file mode 100644
index 000000000..9a6b24e75
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nocaselist_1.0.1.bb
@@ -0,0 +1,9 @@
+SUMMARY = "A case-insensitive list for Python"
+HOMEPAGE = "https://nocaselist.readthedocs.io/en/latest/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[md5sum] = "a2654766ee683906ba6c77ac1e89f556"
+SRC_URI[sha256sum] = "87dc37f97cf52f6e10e1e4a82f56359067462a713222b52976045bf227a40eda"
+
+inherit pypi setuptools3
-- 
2.17.1

