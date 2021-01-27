Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.9687.1611762949184248963
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 07:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49388 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l4nAa-0001GX-31; Wed, 27 Jan 2021 17:55:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-portion: Add recipe
Date: Wed, 27 Jan 2021 17:55:35 +0200
Message-Id: <20210127155538.12229-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210127155538.12229-1-leon.anavi@konsulko.com>
References: <20210127155538.12229-1-leon.anavi@konsulko.com>
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

Portion is a Python library providing data structure and
operations for intervals. It replaces python-intervals.
Release 2.1.4 brings:

- Much faster get, copy and | operations for IntervalDict.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-portion_2.1.4.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-portion_2.1.4.bb

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
new file mode 100644
index 000000000..d08d3e725
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-portion_2.1.4.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Python data structure and operations for intervals"
+HOMEPAGE = "https://github.com/AlexandreDecan/portion"
+SECTION = "devel/python"
+
+LICENSE = "LGPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
+
+inherit pypi setuptools3
+
+SRC_URI[sha256sum] = "58b2792e6e9837a2d55a97d459b940c90fb08b5fba774f524e9359727c80e7b4"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

