Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0ADF060B0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 00:37:59 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 59so4674994otp.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 16:38:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sguf1wZfj2qt/7cnUncLVVTf5pkH6wiF1dnQnXNS8Uw=;
	b=JLTgHuS/eR7yX9/3A9Xfj7fboF7msnJZs5Gi/IxRqN4XBNmkeJUQOLlF+JCPpFtzCL
	AHevwgdgzaeDhC43+Va8TjDLdwC71q+vIO3LQHa21U43qwxab7WgxtHyrBo6H+jNCxin
	rJfD2jPXYqlwQsh1bqqEd0VDQAo6aGotlnPT5DesAdVH0BzdgvlKLT1bzOzm1sUoA500
	2IHGNoknMs3MgG7V9qW7r50CLdgNqKMsc/ES5ueeyeB2RMAQQgsKzuGHK4zFGkQ5vx4s
	Z3Hi471RKfTVGGiEFbnyS/gChter7TzVETXXWQtL5Th9UNkdo8HTud2rgLECVkrOD7k4
	34IA==
X-Gm-Message-State: APjAAAXyetRxVrLP5JfAqx5C7PKBquRRnBo0tLwhHWiWblAqnJVrW7Do
	UZy8VHhcUW+BEISOnQ2aEgRfPU47gdE=
X-Google-Smtp-Source: APXvYqxzFYJzxI3NPJNIY9Xi6yPmh0+OPr5kb0JIF3CX/YbQja2WikSGbT4Q3Z2zgwIhbP//dUrwTA==
X-Received: by 2002:a9d:3c6:: with SMTP id f64mr8697408otf.334.1581295080329; 
	Sun, 09 Feb 2020 16:38:00 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id a1sm3918127oti.2.2020.02.09.16.37.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 16:37:59 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 19:37:48 -0500
Message-Id: <20200210003748.12437-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
Subject: [meta-python][PATCH] python3-attr: consolidate inc and bb files into a single bb file
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
X-List-Received-Date: Mon, 10 Feb 2020 00:38:00 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attr.inc   |  9 ---------
 .../recipes-devtools/python/python3-attr_0.3.1.bb     | 11 +++++++++--
 2 files changed, 9 insertions(+), 11 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-attr.inc

diff --git a/meta-python/recipes-devtools/python/python-attr.inc b/meta-python/recipes-devtools/python/python-attr.inc
deleted file mode 100644
index 1d93dd7156..0000000000
--- a/meta-python/recipes-devtools/python/python-attr.inc
+++ /dev/null
@@ -1,9 +0,0 @@
-DESCRIPTION = "Simple decorator to set attributes of target function or class in a DRY way"
-HOMEPAGE = "https://github.com/denis-ryzhkov/attr"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=59805a0285f4d2b6abdedae73db4f5c1"
-
-SRC_URI[md5sum] = "68b9a503991241fb2df28488686b0e1e"
-SRC_URI[sha256sum] = "9091548058d17f132596e61fa7518e504f76b9a4c61ca7d86e1f96dbf7d4775d"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb b/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
index e80648c8c3..22c5218c70 100644
--- a/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-attr_0.3.1.bb
@@ -1,2 +1,9 @@
-inherit setuptools3
-require python-attr.inc
+DESCRIPTION = "Simple decorator to set attributes of target function or class in a DRY way"
+HOMEPAGE = "https://github.com/denis-ryzhkov/attr"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=59805a0285f4d2b6abdedae73db4f5c1"
+
+SRC_URI[md5sum] = "68b9a503991241fb2df28488686b0e1e"
+SRC_URI[sha256sum] = "9091548058d17f132596e61fa7518e504f76b9a4c61ca7d86e1f96dbf7d4775d"
+
+inherit pypi setuptools3
-- 
2.17.1


