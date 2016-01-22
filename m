Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C000777058
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 123so468980wmz.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=RTYDj9Jpx54RWdkMTlhY0BVz8Cu9V6Z1X6q12jhvnXI=;
	b=h2spiykM3KS1kCKpGk+ZbLSBl7xiwlGd5HfiGr2qshd7nxOGKpFjnWEAEYN8YgO/gl
	U5hdSZl6+fVOSmol5JqSnbqho8E6WInPnadvL2qiuXcFzoNNbZz3eCvAmdipH7PTmic2
	h0pyrGnTC4Ahczt5dwfiGOuZQsY6H+0IfgrIVei1/KI3OgNcCyzFQ0bZi+RlFyn04eqD
	ENh7e3itrPQjtttpCbR344+Q0Mckal1L8Z+laFF+7iDb6P0d0iCZD1Ep1L+OsoC6IDM8
	kzS1RBoIk3ROuCKwWdWwLDjoE5EeQypqR1tFdqFLMG1EwcdgE6VlvmT0Wc1G4Dl7GzXz
	qmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=RTYDj9Jpx54RWdkMTlhY0BVz8Cu9V6Z1X6q12jhvnXI=;
	b=CLKsa1Cj9mRPr4jTMa2J9BPL3ChFxbVENBocgwmbu6szbEZCT1M8lYsCrQbcJfYgn0
	N+fVYqxKVUQ0N3UdSzhSPRf8uOSMvg8aBQriMmf1xY+/WFyBUxIltx9Dv42DwDlqGeX4
	IWDD2mN+lZVbAdoxlhm/86Zpsj7gtlOVo6BfcBefZ9xq5dX3h+QGYW6hKSBwHjqI9/1R
	osR4Y+97vp2VBx5eDHNyUi4Lk6ZtnWMLuuZlLKcHMRfqHc499/qqX/i/CbpUPrY3lZ+B
	Air7POHB6sb/au43Z1ZCj4mjVghTXdHvRZTwkzJGbGqx1U7lL3HhVw5m5IUVQ3uVkCA6
	8Qlw==
X-Gm-Message-State: AG10YOT3DQ6a+HXCSbMX/olb0U2Qv1hzTkPcD4pl25rCYOo+2yaKLfkler4fh4tRRhVndQ==
X-Received: by 10.28.211.136 with SMTP id k130mr6275651wmg.84.1453505456339;
	Fri, 22 Jan 2016 15:30:56 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:55 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:14 +0100
Message-Id: <f50d3ca198658656a7d08782eddac546d8b1786a.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 12/21] python(3)-pymisp: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:56 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-pymisp.inc     | 14 ++++++++++++++
 meta-python/recipes-devtools/python/python-pymisp_2.2.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-pymisp_2.2.bb |  2 ++
 3 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pymisp.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pymisp_2.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymisp_2.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pymisp.inc b/meta-python/recipes-devtools/python/python-pymisp.inc
new file mode 100644
index 0000000..ca543f0
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymisp.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "Python API for MISP"
+HOMEPAGE = "https://github.com/MISP/PyMISP"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
+SRCREV = "a7fc1ceb20d455ccfa2ba7af229048330e22b173"
+PR = "r0"
+
+SRC_URI = "git://github.com/MISP/PyMISP.git;branch=master"
+
+SRCNAME = "pymisp"
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += " ${PYTHON_PN}-requests"
diff --git a/meta-python/recipes-devtools/python/python-pymisp_2.2.bb b/meta-python/recipes-devtools/python/python-pymisp_2.2.bb
new file mode 100644
index 0000000..a0b655f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymisp_2.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-pymisp.inc
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.2.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.2.bb
new file mode 100644
index 0000000..e41acd6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.2.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-pymisp.inc
-- 
1.9.1


