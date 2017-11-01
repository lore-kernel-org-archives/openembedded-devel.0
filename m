Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4B3546E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 16:14:21 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id j58so3310134qtj.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Nov 2017 09:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gmincQmYEaP98j2l7SlCR17Sl/cU0a0tVGzmWNSQz/w=;
	b=imcXEZN+qJhD9o/09z4PfqVvsJs4zXsJbQpymzHED5rSxeI7xKme8lQ+2f2v7LCigU
	pI9v3buEz30ul+Y+6tbOAPBUnlLveXkG8cd1Gt8FGNxeqdPHK+gWUevMbKoHRfFrFZRs
	TbSI1kdWPCwa/Uyci+KOhTlf0ed+e7ohyf5tJE8ETrAtnVTyAAIYOU+FwLzelhid/NS2
	d3XdUo78vO5f05YJfVWVPaAEK9sHpBTK8ERdF/K3oAQ5VkHc/90fU6kMptEzjfNeRSeG
	JAR9OLnc+O545lQLlymmI+oL9Zit/sXvEmUFIGUsjTb06bCK1c7Fkf2xv3Egd2K37ZsE
	FqjQ==
X-Gm-Message-State: AMCzsaXZmCrTYhXA8Mjv0QgJ/JpIpdyUa2dY4DoQxnrBUHj74gvpuMBG
	ET3GFpS7giO0KofGP3sgw54rtSb6
X-Google-Smtp-Source: ABhQp+TVDLIg1DzbNdAP8o23q/kllW2R3eX5EIGCyjFhCAudj3xfp+geLxbQILaQVanx/58M+/MBiQ==
X-Received: by 10.237.36.189 with SMTP id t58mr614632qtc.332.1509552862704;
	Wed, 01 Nov 2017 09:14:22 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	n131sm651001qke.48.2017.11.01.09.14.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Nov 2017 09:14:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Nov 2017 12:14:11 -0400
Message-Id: <1509552851-19539-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-attr: add initial recipe for version 0.2.0
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
X-List-Received-Date: Wed, 01 Nov 2017 16:14:22 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-attr.inc       | 9 +++++++++
 meta-python/recipes-devtools/python/python-attr_0.2.0.bb  | 2 ++
 meta-python/recipes-devtools/python/python3-attr_0.2.0.bb | 2 ++
 3 files changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-attr.inc
 create mode 100644 meta-python/recipes-devtools/python/python-attr_0.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-attr_0.2.0.bb

diff --git a/meta-python/recipes-devtools/python/python-attr.inc b/meta-python/recipes-devtools/python/python-attr.inc
new file mode 100644
index 0000000..8ebf9b9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-attr.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "Simple decorator to set attributes of target function or class in a DRY way"
+HOMEPAGE = "https://github.com/denis-ryzhkov/attr"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=598841c0e09b76883d9ff37a3b6100bf"
+
+SRC_URI[md5sum] = "de69ad11c8872a6dfdbdace7eb81efb4"
+SRC_URI[sha256sum] = "826135ffdd4d0b4bc8a580ce491c33fd90b55e169217539c34b7bfdbe2086ee3"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-attr_0.2.0.bb b/meta-python/recipes-devtools/python/python-attr_0.2.0.bb
new file mode 100644
index 0000000..979d6cb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-attr_0.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-attr.inc
diff --git a/meta-python/recipes-devtools/python/python3-attr_0.2.0.bb b/meta-python/recipes-devtools/python/python3-attr_0.2.0.bb
new file mode 100644
index 0000000..e80648c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-attr_0.2.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-attr.inc
-- 
2.7.4


