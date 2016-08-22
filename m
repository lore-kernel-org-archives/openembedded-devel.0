Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id D398975C60
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 19:03:39 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r128so8984312qkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=N2st/TTAACEZLA0jXiIeYFl5S5r62clsFeY2231/gy4=;
	b=YZb9jQd92PZQ8JU1Yl6oV4XdRwxLb4zeE4Te8O/5P4P1zWpjNQD7caWQFCuhyz8O8A
	QmIRO//cXbklzmLCe5HXOhy59c/qzSKPcK/+UbXFzFUapV4UH9OVjr9/OLKbeIY4K1TU
	3eG6u3i03kEfhBhaAyG4DVLJvHK/fCZkXcJZUGwDxzqsn9Pk8L4oE4T3s1ZOltPU85oJ
	L5hWdyGImEWo1iph6On5y4WFNfPG4q3yGUqDTQCM8N7i5ga6KqNzKoEsMgVe+cZz+TU/
	tIkPKRhCmCJ7FYpIvvaad1Ch2Kc/CWZxwpI8BoW/cqtQEOiqjqQ/8DovOGu6eK6Se1Zh
	Xr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=N2st/TTAACEZLA0jXiIeYFl5S5r62clsFeY2231/gy4=;
	b=J69bt6QDWEcEpVQxARoiVoQFbmzCB7EMjGFCf37yjHRj/H6Y6/75xMsjF6jJEqod94
	mND6CvbDXi28fjo+IspYdt+I+G4fAMPtkjU+VUhFYN9LQu07ykXOTu1TrOHAgmpkJvPz
	+9nTTY7HE4ZAL8968HDQmL6Q8U6V30McpO8BLQiAb6ucUJEgBwQHEXfUgGFmmNtNJKDu
	qOqKXrANXWBhKY7ubzNacQeX7QcmH6aYwgCD1Oy9+oYOMNCm9/XaSvi8QCqyU+JyKad4
	fuVVS2TaszazYT+LSdWRVIReV6cn887ma/TR7RIY7+jPfv6iIYz9Vrf+jzSf+/Zb8mN5
	G7jQ==
X-Gm-Message-State: AEkoousfXKBs3EHkTkb6a8O9ISamj9dbwYncON+cHa+rXoiSRNBErtP2RfbaMvWYameR0Q==
X-Received: by 10.55.12.4 with SMTP id 4mr25349881qkm.214.1471892620599;
	Mon, 22 Aug 2016 12:03:40 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	g29sm10452469qtg.12.2016.08.22.12.03.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Aug 2016 12:03:39 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Aug 2016 16:01:31 -0300
Message-Id: <1471892491-6177-17-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1471892491-6177-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 17/17] python-prompt-toolkit, python3-prompt-toolkit: Add recipe for version 1.0.6
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
X-List-Received-Date: Mon, 22 Aug 2016 19:03:40 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../recipes-devtools/python/python-prompt-toolkit.inc | 19 +++++++++++++++++++
 .../python/python-prompt-toolkit_1.0.6.bb             |  2 ++
 .../python/python3-prompt-toolkit_1.0.6.bb            |  9 +++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-prompt-toolkit.inc
 create mode 100644 meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.6.bb

diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit.inc b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
new file mode 100644
index 0000000..ac860b7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Library for building powerful interactive command lines in Python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
+
+SRC_URI[md5sum] = "9e0be24993b13b204e04ffd20b2873d2"
+SRC_URI[sha256sum] = "fa8f0c3668afbc85abbb4601ebc8db1db9d5009c8a833feea107fc63f1e7ef22"
+
+PYPI_PACKAGE = "prompt_toolkit"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-subprocess \
+    ${PYTHON_PN}-terminal \
+    ${PYTHON_PN}-threading \
+    ${PYTHON_PN}-wcwidth \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.6.bb b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.6.bb
new file mode 100644
index 0000000..76e8410
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-prompt-toolkit_1.0.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-prompt-toolkit.inc
diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.6.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.6.bb
new file mode 100644
index 0000000..d8f6389
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_1.0.6.bb
@@ -0,0 +1,9 @@
+inherit pypi setuptools3
+require python-prompt-toolkit.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-enum \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-textutils \
+"
-- 
2.1.4


