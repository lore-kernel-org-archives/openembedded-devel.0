Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.146433.1598053519272831618
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 16:45:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55236 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k9Gii-0003AI-Js; Sat, 22 Aug 2020 02:45:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/11] python3-tabulate: Add recipe
Date: Sat, 22 Aug 2020 02:44:57 +0300
Message-Id: <20200821234504.719-4-leon.anavi@konsulko.com>
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

Add recipe for tabulate, a pretty-print tabular data. Changelog
for release 0.8.7:

- Bug fixes. New format: `pretty`. HTML escaping.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-tabulate_0.8.7.bb    | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb b/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
new file mode 100644
index 000000000..def35ff44
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tabulate_0.8.7.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Pretty-print tabular data"
+HOMEPAGE = "https://github.com/astanin/python-tabulate"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fad5a39bdfe452b13775adda41023ba7"
+
+SRC_URI[md5sum] = "a766c6eecfe3765821909c4ddf082b3b"
+SRC_URI[sha256sum] = "db2723a20d04bcda8522165c73eea7c300eda74e0ce852d9022e0159d7895007"
+
+inherit pypi setuptools3
-- 
2.17.1

