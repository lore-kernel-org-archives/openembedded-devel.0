Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id A7FCA6AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 20:02:45 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id s5so1064250qkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=yWCaQX/AnVhj0059hYUv1mANBlVCXkcJwdqmjCHk3cA=;
	b=kcmrQhtn0b/SFKx9eRzTB29SWmm5yYab2epJaBK+ZxjBz+uar8AAKLOF0rpCZeOPSq
	L6rk05JDGTy01yKVdRHupR6woLUn/qG04vWIFzDLbTT2q1zkbYFZRcnS6t6NmANqVCyF
	KZXlLoIhD+Eq4SNKV5IKQqZEDGal5iJ7qS2EvSbRkXYhAZDNGwRiHp0QpFa0ERBjzZXI
	xTvP4Bpvy9HNB9z2rCBNi4VtoL+8qmpEomiVIceFATTZHcImtrQPiW0OCOYfFiMD1FmK
	aWwWaR6QK7mYPKa0wPxwLloHdTEUWjfpXGE4ePAl0LLe5J3EgAZgB+SBAR8QIQluAWL2
	3MxA==
X-Gm-Message-State: AD7BkJL3cguZCA4cLT54VjUYnMWZGtX0uORAaRf2kjgowIuGVuVBYaRUPSfI8+k52Nai7A==
X-Received: by 10.55.75.77 with SMTP id y74mr5987431qka.19.1458763365924;
	Wed, 23 Mar 2016 13:02:45 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	a102sm1752180qgf.21.2016.03.23.13.02.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 13:02:45 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Mar 2016 16:01:57 -0400
Message-Id: <1458763321-30761-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1458763321-30761-1-git-send-email-derek@asterius.io>
References: <1458763321-30761-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH 2/6] python-idna: update to release 2.1 and use common pypi
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
X-List-Received-Date: Wed, 23 Mar 2016 20:02:45 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-idna_2.1.bb     | 11 +++++++++++
 .../recipes-devtools/python/python-idna_git.bb     | 22 ----------------------
 2 files changed, 11 insertions(+), 22 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-idna_2.1.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-idna_git.bb

diff --git a/meta-python/recipes-devtools/python/python-idna_2.1.bb b/meta-python/recipes-devtools/python/python-idna_2.1.bb
new file mode 100644
index 0000000..90f47ae
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-idna_2.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Internationalised Domain Names in Applications"
+HOMEPAGE = "https://github.com/kjd/idna"
+LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=134bdad79491c37bdae32811572b4bc6"
+
+DEPENDS += "python-pip"
+
+SRC_URI[md5sum] = "f6473caa9c5e0cc1ad3fd5d04c3c114b"
+SRC_URI[sha256sum] = "ed36f281aebf3cd0797f163bb165d84c31507cedd15928b095b1675e2d04c676"
+
+inherit pypi setuptools
diff --git a/meta-python/recipes-devtools/python/python-idna_git.bb b/meta-python/recipes-devtools/python/python-idna_git.bb
deleted file mode 100644
index dcd9105..0000000
--- a/meta-python/recipes-devtools/python/python-idna_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "Internationalised Domain Names in Applications"
-HOMEPAGE = "https://github.com/kjd/idna"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c61e6ec7ab3da6b340d8d3a89c964ef2"
-
-PV = "2.0"
-SRCREV = "bb6e94c5b5525684d8ca010bf8ab42480c319e0a"
-
-SRCNAME = "idna"
-SRC_URI = "git://github.com/kjd/${SRCNAME}.git"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools
-
-DEPENDS += " \
-        python-pip \
-        "
-
-RDEPENDS_${PN} += " \
-        "
-- 
1.9.1


