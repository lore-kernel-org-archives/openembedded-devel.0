Return-Path: <moritz.fischer@ettus.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1125677D1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 16:43:07 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id m17so31956804pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 09:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CfNHJ/wRojwX97cBDerhbhUqCCrUGelqyD78CQAQzns=;
	b=aLq6zg25Np3U4F6ytihVTFBsxp9ZEaLuI7QgG85k0A50LJm34L794ilRgWI+lPn1Xv
	5LRO8z67tOrWS5lzr9Q7LAKa6rPwPK49ur19N8Ir21HYyEpX5gzdZ6i+Z46luqfYgumC
	WoZZh3gVNaSW9A8cIWzDV5HbW73crkFcpGYnrj7szkyfGPTBGMtEE0+QKuGqXX/akarS
	LxLKNebBxW7FXupDBPdlYSERaggbo2wd0J2nLLb3V3InEochW5hVKqgveVChasACjHEt
	QeWEsPk3ccvR0Qjm0+IZ4V3B/4QWV2YrCYBY3uwUGmK+XeGvZHSBGwQtKcv3VJ9XMrY1
	hrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CfNHJ/wRojwX97cBDerhbhUqCCrUGelqyD78CQAQzns=;
	b=ZjqmSmJgIf4usRIFyBl6/Ct4DmV4xEoMloRVfPyV9eiJcwuGwkHmppk9YBodlgFh/O
	E8IVUwQk6paI1e2U1X2N9E7hjzg4SKqgqtO/C6JTWhsQJ5Z+cJF9nQTpFefWpbKtLUq5
	B2+ZV+lEMehuo56yPND5qDY0RepT0HzmWcmFAO8tqMhWXAaeyLOePLH0xOWucRZUkPPC
	lB7ASufxNokel8B2big1RrnZ8MZ/yHz3iUUjDY8Y0NcdRix1too9qFBRUPfpoF5cpqFg
	ovozev8E+JNj/6ySSXiqtQ0+mlkRtgtGQR7406Kyxcd8JTDOHxbhSy9i7bIHYFaHWhkb
	wSNQ==
X-Gm-Message-State: AODbwcColBp+NAdFdn6rlBqgL/U4qZEkpZdtED/WKYtITJrde8BQTXFq
	SU/RYMeJBHO5pbMzpaO38g==
X-Received: by 10.98.150.12 with SMTP id c12mr1842070pfe.201.1496335388995;
	Thu, 01 Jun 2017 09:43:08 -0700 (PDT)
Received: from tyrael.ni.corp.natinst.com
	(207-114-172-147.static.twtelecom.net. [207.114.172.147])
	by smtp.gmail.com with ESMTPSA id
	19sm30635779pfz.39.2017.06.01.09.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Jun 2017 09:43:07 -0700 (PDT)
From: Moritz Fischer <moritz.fischer@ettus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Jun 2017 09:42:48 -0700
Message-Id: <1496335374-25575-2-git-send-email-moritz.fischer@ettus.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
References: <1496335374-25575-1-git-send-email-moritz.fischer@ettus.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 2/8] python-greenlet: Add support for python3
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
X-List-Received-Date: Thu, 01 Jun 2017 16:43:08 -0000

Extend recipe to support python3 as well

Signed-off-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 meta-python/recipes-devtools/python/python-greenlet.inc      |  9 +++++++++
 .../recipes-devtools/python/python-greenlet_0.4.12.bb        | 12 ++----------
 .../recipes-devtools/python/python3-greenlet_0.4.12.bb       |  2 ++
 3 files changed, 13 insertions(+), 10 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-greenlet.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet_0.4.12.bb

diff --git a/meta-python/recipes-devtools/python/python-greenlet.inc b/meta-python/recipes-devtools/python/python-greenlet.inc
new file mode 100644
index 0000000..35820db
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-greenlet.inc
@@ -0,0 +1,9 @@
+SUMMARY = "Python lightweight in-process concurrent programming"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
+
+SRC_URI[md5sum] = "e8637647d58a26c4a1f51ca393e53c00"
+SRC_URI[sha256sum] = "e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
index 4fc2c1d..c14976e 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.12.bb
@@ -1,10 +1,2 @@
-SUMMARY = "Python lightweight in-process concurrent programming"
-LICENSE = "MIT & PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
-                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
-
-SRC_URI[md5sum] = "e8637647d58a26c4a1f51ca393e53c00"
-SRC_URI[sha256sum] = "e4c99c6010a5d153d481fdaf63b8a0782825c0721506d880403a3b9b82ae347e"
-
-inherit pypi distutils
-
+inherit distutils
+require python-greenlet.inc
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.12.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.12.bb
new file mode 100644
index 0000000..1aedf7f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.12.bb
@@ -0,0 +1,2 @@
+inherit distutils3
+require python-greenlet.inc
-- 
2.7.4


