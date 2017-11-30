Return-Path: <bill.randle@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1FFF17851A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Nov 2017 05:48:12 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id f6so3632588pln.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Nov 2017 21:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=I3PPdIiLROM3u7bIwCR0H18opNSJOxy0wXj/P4gMQ1E=;
	b=C9enqDIap0ItyOM2hW9UJifamL6txtDbtwRhO+rDxa9R3iwnESK+8rR281fbTVVBxt
	ohXt1xQE3u2/AcwNOQr+TQX39dFIWcosEJ620S804kCkx8SxygZ8qH9McXyz+GqfvTuA
	6HHfL1khg+ZSahoKZCazRutw89PRWkRvJaC9iZcva2WdkBiqQsCWIsP39fDgAnG8ZZ8K
	BZCU8QUVn6cYVnWp2fqCEHq1iFclxXnzAVp+gmxW0hjJ2Ri7ProZ9ycRtdE7KfcrM/I5
	KIwd9Dp0QSBSqoR/xvYgDyTOJta7OtkjMHoGIajU71ma9K2ICwx1Ed/RaBGKzbF2QG/S
	xHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=I3PPdIiLROM3u7bIwCR0H18opNSJOxy0wXj/P4gMQ1E=;
	b=YRX/Dt+wyQY/0oi1gSciTvzTJUqpD4O07Ea1JbkHu1fTEaDTu4MVReo84snSRIHjrb
	JSVVnD8OMRqFDqjINpEG3ldZpf3wSJ/+dLzdQQTsbEd1GnmVqBrvsJMAqRcz3GgX6Ii+
	Vn9smPakj6JrLOLyp4YtkHWCF5271sAwV+W0CQd0N2dOjd9dDLM4Gp18wenlfa8e72dS
	JkBKBp29AdELhcueXa8SkLOG8IoazePjVbG1tBQh4jEL9tSUomDLxHOTn/OxnzufsCdI
	ezNVUPdaI/972Ul+C2Jdc5q52qz3Le+GfAoKukusBlfWEJlYLP8wHwIgJvhd3uMU6Rom
	/OOA==
X-Gm-Message-State: AJaThX5BHOav62gJP9ZXHkrh7sFLc29Vz8HZKsVmNNBngnvlTib7gy3o
	LkqhYIAayu8bB3lgm3mnF0Rbiw==
X-Google-Smtp-Source: AGs4zMakRzLD5mFs2IWWnbPEW51R0G9EkH1zlbWhbO3twm0uJzPamCKH6aXFSIdOzgtRTSsW7aqjVQ==
X-Received: by 10.84.129.97 with SMTP id 88mr1420703plb.230.1512020893772;
	Wed, 29 Nov 2017 21:48:13 -0800 (PST)
Received: from neosoft.neocat.org (184-100-239-238.ptld.qwest.net.
	[184.100.239.238]) by smtp.gmail.com with ESMTPSA id
	s68sm6387336pfj.81.2017.11.29.21.48.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Nov 2017 21:48:13 -0800 (PST)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Nov 2017 21:47:06 -0800
Message-Id: <1512020828-4040-8-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
References: <1512020828-4040-1-git-send-email-bill.randle@gmail.com>
Cc: ticotim@gmail.com
Subject: [meta-python][PATCH 07/12] python-flask-wtf: move core of recipe to a .inc file
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
X-List-Received-Date: Thu, 30 Nov 2017 05:48:13 -0000

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 .../recipes-devtools/python/python-flask-wtf.inc        | 15 +++++++++++++++
 .../recipes-devtools/python/python-flask-wtf_0.12.bb    | 17 +----------------
 2 files changed, 16 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-flask-wtf.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-wtf.inc b/meta-python/recipes-devtools/python/python-flask-wtf.inc
new file mode 100644
index 0000000..e42f7c1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-flask-wtf.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Simple integration of Flask and WTForms."
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
+
+SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
+SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
+
+SRC_URI += " file://import-simplejson-as-json.patch"
+
+PYPI_PACKAGE = "Flask-WTF"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-wtforms \
+    ${PYTHON_PN}-simplejson \
+"
diff --git a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
index 79afaf6..dbf091b 100644
--- a/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
+++ b/meta-python/recipes-devtools/python/python-flask-wtf_0.12.bb
@@ -1,17 +1,2 @@
-DESCRIPTION = "Simple integration of Flask and WTForms."
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=507e8635f25a06dc4f041a3a1b3359b3"
-
-SRC_URI[md5sum] = "c53a74e8ba481bf53405fd5efdf0339e"
-SRC_URI[sha256sum] = "bd99316c97ed1d1cb90b8f0c242c86420a891a6a2058f20717e424bf5b0bb80e"
-
-SRC_URI += " file://import-simplejson-as-json.patch"
-
-PYPI_PACKAGE = "Flask-WTF"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} = "\
-    python-wtforms \
-    python-simplejson \
-"
+require python-flask-wtf.inc
-- 
2.7.4


