Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5857A76C9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so476779wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Z2xl8cNRnjBiXrcN28DOploosJcxLSG35+MsRM1I7yM=;
	b=uu1NhZ5QisGy2PQ4m5E6JulGMJR/axIad2hj2BqrpnbFZadVVmthFExC+6DrA3xicN
	UaUK9XCxyxKTIHUtNJw5UHpiuD3Ny5I3cib3ovKILGh8PRa9/70efp7ijkdlvyyXK1Xa
	lPv/CBKtKwWGx2bLw227+KZPZ+CRZhmapLbTrknlAPA37l1UguWKllmDDQfxaCgjuhBW
	ys+5BTOiC/+jIqeSF/n/Y3o/OM7vOMkM9nsxLuoTeO7OFtQ4qffvl+rk4P0MHVSx/hMM
	tRYJjiCVTcy1VmX5dt5CydL4hO4XF/3Umqn6s1vQV5x1EIniWkdlqasD5RVkpTfepcKb
	+LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Z2xl8cNRnjBiXrcN28DOploosJcxLSG35+MsRM1I7yM=;
	b=aXagkxL93plqy1VM70ChdSAXLfHBtfkMEslhmEX9v88M6y/EljAgsdLHk9le3siVhi
	yVmt1wJv9YrdJn8dVhNpjVqM78ZjUfaLii/d9kVUckiAQESrWWsw3Y7L/ZUo8UPxxwfN
	dsOdBJpo5d1eGK+rZC0mOY748shpmwwYYJluOoEHwBtCsVL/IBMmVJfaaVy27rLwncU1
	NJ28IMshd0d8z7xC2dAC3wSxL/v8qpOrJ2ALvofX0Rw7OSsdQjVQxy4oxbfdthyCe+wK
	/mClJThOXg8h3e+PGGboST6hQkfov5lAG0dTausVBj7f5f3mx69n3aWMBd5c4ZrYxuQZ
	159A==
X-Gm-Message-State: AG10YOQh4mCUCjbp2ITTVKfyoLVGII6rVfmseNWrqHID8iEr5M+5fJ/rEg1XanN5xdJnoA==
X-Received: by 10.28.212.9 with SMTP id l9mr6289647wmg.75.1453505446406;
	Fri, 22 Jan 2016 15:30:46 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:45 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:04 +0100
Message-Id: <86a754e3297c3df38808928d033f5ad1b9a1cd72.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 02/21] python(3)-feedformatter: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:47 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-feedformatter.inc  | 11 +++++++++++
 .../recipes-devtools/python/python-feedformatter_0.4.bb       |  2 ++
 .../recipes-devtools/python/python3-feedformatter_0.4.bb      |  2 ++
 3 files changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-feedformatter.inc
 create mode 100644 meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb

diff --git a/meta-python/recipes-devtools/python/python-feedformatter.inc b/meta-python/recipes-devtools/python/python-feedformatter.inc
new file mode 100644
index 0000000..1a02a4f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-feedformatter.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "A Python library for generating news feeds in RSS and Atom formats"
+HOMEPAGE = "http://code.google.com/p/feedformatter/"
+SECTION = "devel/python"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=258e3f39e2383fbd011035d04311008d"
+SRCREV = "7391193c83e10420b5a2d8ef846d23fc368c6d85"
+PR = "r0"
+
+SRC_URI = "git://github.com/marianoguerra/feedformatter.git"
+
+S = "${WORKDIR}/git"
diff --git a/meta-python/recipes-devtools/python/python-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
new file mode 100644
index 0000000..175f944
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-feedformatter_0.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-feedformatter.inc
diff --git a/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
new file mode 100644
index 0000000..95a5405
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-feedformatter_0.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-feedformatter.inc
-- 
1.9.1


