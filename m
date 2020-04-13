Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2349.1586807359323753831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Apr 2020 12:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=55876 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jO551-0000VV-6o; Mon, 13 Apr 2020 22:49:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python2][PATCH 3/3] python-docker: move from meta-virtualization
Date: Mon, 13 Apr 2020 22:49:09 +0300
Message-Id: <1586807349-28557-3-git-send-email-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com>
References: <1586807349-28557-1-git-send-email-leon.anavi@konsulko.com>
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

Support for Python 2 has been dropped in meta-virtualization. Move
python-docker recipes to meta-python2 for backward compatibility
of legacy projects. Dependencies python-docker-pycreds and
python-websocket-client should be also present in meta-python2.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 recipes-devtools/python/python-docker_4.1.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 recipes-devtools/python/python-docker_4.1.0.bb

diff --git a/recipes-devtools/python/python-docker_4.1.0.bb b/recipes-devtools/python/python-docker_4.1.0.bb
new file mode 100644
index 0000000..434e463
--- /dev/null
+++ b/recipes-devtools/python/python-docker_4.1.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A Python library for the Docker Engine API."
+HOMEPAGE = "https://github.com/docker/docker-py"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34f3846f940453127309b920eeb89660"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "e1e8dc73e3220fe9eec1faf80b0290de"
+SRC_URI[sha256sum] = "6e06c5e70ba4fad73e35f00c55a895a448398f3ada7faae072e2bb01348bafc1"
+
+RDEPENDS_${PN} += " \
+	python-misc \
+	python-six \
+	python-docker-pycreds \
+	python-requests \
+	python-websocket-client \
+	python-backports-ssl \
+"
-- 
2.7.4

