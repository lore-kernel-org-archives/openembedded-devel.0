Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.145847.1598053518394045688
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gih-0003AI-Pc; Sat, 22 Aug 2020 02:45:16 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/11] python3-yamlloader: Add recipe
Date: Sat, 22 Aug 2020 02:44:56 +0300
Message-Id: <20200821234504.719-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821234504.719-1-leon.anavi@konsulko.com>
References: <20200821234504.719-1-leon.anavi@konsulko.com>
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

Add recipe for yamlloader, an ordered YAML loader and dumper
for PyYAML. Changelog for 0.5.5:

- As of Python version 3.7, the insertion order in dict is
  preserved by design. This is accounted for by allowing to dump
  and load to/from ordinary dictionaries in the same way as you
  do for OrderedDicts

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-yamlloader_0.5.5.bb              | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb b/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
new file mode 100644
index 000000000..dbf84d413
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_0.5.5.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Ordered YAML loader and dumper for PyYAML."
+HOMEPAGE = "https://github.com/Phynix/yamlloader"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
+
+SRC_URI[md5sum] = "2e0750ace81235f750c072833d79c4c3"
+SRC_URI[sha256sum] = "dcab5f16b39bb03d10dda4cd4f30c943675ec4c7771807fc67e7f1bb319bf4c8"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target += "\
+    ${PYTHON_PN}-pyyaml \
+"
-- 
2.17.1

