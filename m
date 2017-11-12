Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA50782CC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:14:26 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id l69so10608688qkl.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:14:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vi+R8HRcHt+1NLm7KfHwKZaQUCds+EzrC8Va4Zr0C8Q=;
	b=YMpE87qjm2T9hh/GqO4hFbPswF7XT6Rozux073tCbFjzH7mcm1LGM277zgdqcT5oee
	wPI+9haJA8BBI61b/mKP7igFFsEFy6FitH2lwD9VvyUB8+I2NA8dz3cb0y+x9UnoYw4G
	hUIlJfUp2TFvik6NA7eT9JZfGekS+60SdV20NDNAOB4X3A41wNjdGTpegTy01m3CIWiQ
	z17RAB5yhqznew5feEWSA9VzgDxwnaXbxOrgf+OZHkH2OR+fMPjHGmdsvYyD94SHk3CE
	QGhmpmfsMD9eeFV9e1fdJIfcjIMjZgOXODi+qTTMgdudfV4YZDBpAJrdUOFe4CV8RW2O
	E0gA==
X-Gm-Message-State: AJaThX4wa4MNPgHjo4lq+iWV44VudNaLpqN7JGUFJQLnff5nY9sJgl7O
	XRz8EoT2ucGrxPGy3SNybNpyG58N
X-Google-Smtp-Source: AGs4zMbvAizNzOuAOycuKHu5FB6Lm65CiD5Hvfl6eU1b+pKapzt2m00VFvCtxWdCHnVw0OE20XSX7A==
X-Received: by 10.55.192.90 with SMTP id o87mr8801083qki.15.1510506867302;
	Sun, 12 Nov 2017 09:14:27 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id m4sm2421217qtc.58.2017.11.12.09.14.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:14:26 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:14:17 -0500
Message-Id: <1510506857-3598-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-jsonpointer: update to version 1.14
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
X-List-Received-Date: Sun, 12 Nov 2017 17:14:26 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-jsonpointer_1.12.bb        | 11 -----------
 .../recipes-devtools/python/python-jsonpointer_1.14.bb        | 11 +++++++++++
 2 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb
 create mode 100644 meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb

diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb
deleted file mode 100644
index f5c1aa8..0000000
--- a/meta-python/recipes-devtools/python/python-jsonpointer_1.12.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Resolve JSON Pointers in Python"
-HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=32b15c843b7a329130f4e266a281ebb3"
-
-inherit pypi setuptools
-
-SRC_URI[md5sum] = "eaaad79e983d58ecbee5b4a326723777"
-SRC_URI[sha256sum] = "819b6dd4fd0a18ac219e02a0117f24b2d31296b0c475c33862cfa9a1616d62c3"
-
-RDEPENDS_${PN} += "python-re python-json"
diff --git a/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb b/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
new file mode 100644
index 0000000..96b71e3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-jsonpointer_1.14.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Resolve JSON Pointers in Python"
+HOMEPAGE = "https://github.com/stefankoegl/python-json-pointer"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
+
+inherit pypi setuptools
+
+SRC_URI[md5sum] = "190aeb8afcb0efddfe831a4e533e163b"
+SRC_URI[sha256sum] = "c681af823545c731b7b38aedd5d4eee4c5eff87bc0f25e0ff25444a4189eac4d"
+
+RDEPENDS_${PN} += "python-re python-json"
-- 
2.7.4


