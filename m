Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id AA08C783F7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 15:28:37 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id r39so24542089qtr.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 07:28:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qAK39LRtz50VivimWSUJiiOJIvNtQjTQr9J9+INMwq0=;
	b=g70yBIV8krEakAGKTRRMUJn7ubUgO2rh3TWBZgMytwmvkmmJbY+FHWOa5pvDw+dhEP
	ZqrPj24UjbOuGfIjDFnaQ7mtBTIvVaTwW9uWnMNs9kgtRqHSjagPjdaZclXilZGnXzmZ
	jHc7QC/uhBEWA3SQFO1GskPJU9SNX0649UJhxD4UCajAjfm+dEJ3/K5vRbk5tO2ockya
	0Kad5wElx7OYBXAb4Yg70ISMb7hcjbLk6ZP1jeS/797QxfI2h8ZkhwGxU2L69xrWMpRa
	RM8gB5/3xVCvAkb0/hRQmtHvJWQ2+G93v9n84LK1OofZkVFg6VjeyQWfPkswNJ0HJfXL
	cvpA==
X-Gm-Message-State: AKGB3mJaaoFh3up6af2R8MWyJfWyCn1ZsKV0KnqMdcc/LzlGvLew86TJ
	IqucolaV34UVBjKY1eMmxPPKniQA
X-Google-Smtp-Source: ACJfBot8sWIJpKNS3dLsxXlNXCEUepfT0v5bj4F7bm0JUl8Sv3608KIwUuIfFs42AkSSzVLkzo7hPg==
X-Received: by 10.200.4.130 with SMTP id s2mr5483150qtg.170.1513697318388;
	Tue, 19 Dec 2017 07:28:38 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	s27sm9949073qtj.42.2017.12.19.07.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 07:28:38 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 10:28:31 -0500
Message-Id: <1513697311-7253-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-simplejson: update to version 3.13.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 15:28:37 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-simplejson.inc        | 4 ++--
 meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb | 7 +++++++
 3 files changed, 11 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb

diff --git a/meta-python/recipes-devtools/python/python-simplejson.inc b/meta-python/recipes-devtools/python/python-simplejson.inc
index 50524f3..95df3f3 100644
--- a/meta-python/recipes-devtools/python/python-simplejson.inc
+++ b/meta-python/recipes-devtools/python/python-simplejson.inc
@@ -4,8 +4,8 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[md5sum] = "048548acae58984b3e939b3bcf182c8e"
-SRC_URI[sha256sum] = "df5e38f5e0a24abe0e02276aa5c3f8504150047a51c0b6b848b8153e6e6d395e"
+SRC_URI[md5sum] = "870bf6257465ce2ee8cad14e2394f7eb"
+SRC_URI[sha256sum] = "4c4ecf20e054716cc1e5a81cadc44d3f4027108d8dd0861d8b1e3bd7a32d4f0a"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
new file mode 100644
index 0000000..e33edfe
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-simplejson_3.13.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-simplejson.inc
diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
new file mode 100644
index 0000000..d44bc15
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.13.2.bb
@@ -0,0 +1,7 @@
+inherit setuptools3
+require python-simplejson.inc
+
+# Requires _pydecimal which is in misc
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+"
-- 
2.7.4


