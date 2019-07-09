Return-Path: <windel.bouwman@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60DBD7C346
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Jul 2019 08:21:23 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r12so16909440edo.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jul 2019 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Q009raE1rxRUAOG+NobC/7+h1r6q/sANby3Oy+7eQaQ=;
	b=oawFS6wYkN6wnm+VAwMl035HYRAD93fyHilNHOvzYK3dUIu5fWR2ArkdliOOtlYx5m
	qmSciqZCOqopiWgqXWWWSG2cETJ+BDGIX7PJp2qoGowl0k/CFpOHf3NDsBGLluhM9DUO
	0M4tXoPjvIgKHRKBsxIk7LJcGzTvaj+UWH8thQruLGchE4e9Clx9KvMiqKCJV2HTvGZP
	+VUavEJhqeUD1SDt+NWSG1W2twgowq/qA9/A4lW7ExZalW+w1++d3RRzrETHZ1x864pp
	H3TIK+ZyLILljhXajGs9411U7l91FcGbn5P8qXdhPP3PHkKWmJTEKw/csjT62Redb391
	5Qiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Q009raE1rxRUAOG+NobC/7+h1r6q/sANby3Oy+7eQaQ=;
	b=b5Rv7ey69RITja1MKjHwlsUVw/o3WL5HeYS03nSMauAn9LGOCKRnlkyUWOYNsa5VFH
	I1pivgOAb3aLT8MxcDGUTB2526CeqBWkGD+GwyOaMtyqeN1fzRxeQRXs2gawa+rWmp+1
	CeWje1vrp+skGC7313qq8JJHCihKGz9MxLlotEzba15fovCvCGS+1eszXYkVjCyiQ5Sv
	aRfvj/DIjZQbrEFxy4nX7kIuVNjhlEpIRM39MvOmLaZpZKtGGZFdsDZYmROvJsS0MZvw
	R7g4VrbbWHVuyTCnozzaRaHDO9P7vW3UaBvmFbK3loHWZv+7A+9SYghJwCK8fVlkjLUV
	Cm3Q==
X-Gm-Message-State: APjAAAXG5yKVGkpvSH/3QlRqII+rAYZze4uHH6tvIYnI46tdh+cIOFoN
	WqE2DsxNHr1L26JKWslOv08LBE/b
X-Google-Smtp-Source: APXvYqxrHm2LM/yX0DXmmGRw4BaAVpUy0dh4Ue1yvc3w04UGuDeW4xRgoFZ9OSO7KbGG94BnyH53ow==
X-Received: by 2002:a17:906:7541:: with SMTP id
	a1mr19950485ejn.50.1562660483870; 
	Tue, 09 Jul 2019 01:21:23 -0700 (PDT)
Received: from PC771.demcon.guest ([87.215.69.65])
	by smtp.gmail.com with ESMTPSA id
	m31sm6370062edd.42.2019.07.09.01.21.22
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 01:21:23 -0700 (PDT)
From: Windel Bouwman <windel.bouwman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Jul 2019 10:20:35 +0200
Message-Id: <20190709082035.14898-1-windel.bouwman@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python-humanfriendly: Add recipe for the humanfriendly package.
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
X-List-Received-Date: Tue, 09 Jul 2019 08:21:23 -0000

Signed-off-by: Windel Bouwman <windel.bouwman@gmail.com>
---
 .../python/python-humanfriendly.inc           | 25 +++++++++++++++++++
 .../python/python-humanfriendly_4.18.bb       |  2 ++
 .../python/python3-humanfriendly_4.18.bb      |  2 ++
 3 files changed, 29 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-humanfriendly.inc
 create mode 100644 meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb

diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc b/meta-python/recipes-devtools/python/python-humanfriendly.inc
new file mode 100644
index 000000000..94f7f8b81
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-humanfriendly.inc
@@ -0,0 +1,25 @@
+DESCRIPTION = "Human friendly output for text interfaces using Python"
+HOMEPAGE = "https://humanfriendly.readthedocs.io/"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
+
+PYPI_PACKAGE = "humanfriendly"
+
+SRC_URI[md5sum] = "9573f9f37a5454d8205cfd1b9b8db9d2"
+SRC_URI[sha256sum] = "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
+
+inherit pypi
+
+RDEPENDS_${PN}_class-target += " \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-math \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
new file mode 100644
index 000000000..2ca5fe36f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-humanfriendly_4.18.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-humanfriendly.inc
diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
new file mode 100644
index 000000000..2ca5fe36f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-humanfriendly.inc
-- 
2.17.1


