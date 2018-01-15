Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id F23FF71A72
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:17:07 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id 143so326808wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KkorLrOIT315Wv6PUwIbjk7o86my2DJN7CLvHPtk35Q=;
	b=kOfKBMxXWvQ1x+NNtW0cVH7PSzeo6N6qxiVzr4PYA8+Gx93Z21PSR38Vqx4Zt6kEFs
	3wsHh1YbuZzrOPnH6L845zevsXwq/3yFb2UEb5C6WJlpha/ppI+Ui81p+Lobg66vbBOg
	7EsxJdgZpdyM0m9gMyOrX1bJMe4RwLhftxsybJZfjXdvUc40e8ACb/PftilcNfRt4b4k
	Sxmr75lOIxLtvxd51J3Gzc42fdKf1gk/h//gLalNV1ePmKgVSPHjH8xTuJVDqAPijX2h
	8h+j+JNsPy83UecfLfkF40slWhD6a18iLDMVRPnAK+1BUChrZXMLVOEMcVO3e3ZyOYtH
	5GeA==
X-Gm-Message-State: AKwxyteeIH7gYekNszGTnG114tILyyiUROxMuDjZpUzNbokE5VtRhKU8
	kSDFomWDAYxYTCjPRqJacpaGUZs6
X-Google-Smtp-Source: ACJfBovTI2IQXYBFNyvQg8qdRYQsZoPAglzSom8BAt9nrNlIlDgnwDXdmaL7re8kxhejPLQiCxQ3MQ==
X-Received: by 10.80.178.69 with SMTP id o63mr27760491edd.295.1516007828604;
	Mon, 15 Jan 2018 01:17:08 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id 15sm780937eds.54.2018.01.15.01.17.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:17:07 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:17:02 +0000
Message-Id: <20180115091707.1539-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/6] python-javaobj-py3: add initial recipe for version 0.2.3
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
X-List-Received-Date: Mon, 15 Jan 2018 09:17:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 .../recipes-devtools/python/python-javaobj-py3.inc        | 15 +++++++++++++++
 .../recipes-devtools/python/python-javaobj-py3_0.2.3.bb   |  2 ++
 .../recipes-devtools/python/python3-javaobj-py3_0.2.3.bb  |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-javaobj-py3.inc
 create mode 100644 meta-python/recipes-devtools/python/python-javaobj-py3_0.2.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.3.bb

diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3.inc b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
new file mode 100644
index 000000000..8fa3e15f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-javaobj-py3.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Module for serializing and de-serializing Java objects."
+DESCRIPTION = "python-javaobj is a python library that provides functions\
+ for reading and writing (writing is WIP currently) Java objects serialized\
+ or will be deserialized by ObjectOutputStream. This form of object\
+ representation is a standard data interchange format in Java world."
+HOMEPAGE = "https://github.com/tcalmant/python-javaobj"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://javaobj.py;beginline=21;endline=33;md5=8b504419ce78f8133b21b4d4a89ef7e9"
+
+SRC_URI[md5sum] = "1e3f02b5c4c0853d653b7b8590d9ed2b"
+SRC_URI[sha256sum] = "1dea6be0848c58013d92d8249ef6bc8688bbff7f13c78e02dbf08a449b4c0885"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-javaobj-py3_0.2.3.bb b/meta-python/recipes-devtools/python/python-javaobj-py3_0.2.3.bb
new file mode 100644
index 000000000..ed34740e8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-javaobj-py3_0.2.3.bb
@@ -0,0 +1,2 @@
+require python-javaobj-py3.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.3.bb b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.3.bb
new file mode 100644
index 000000000..0ec23ba99
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-javaobj-py3_0.2.3.bb
@@ -0,0 +1,2 @@
+require python-javaobj-py3.inc
+inherit setuptools3
-- 
2.15.1


