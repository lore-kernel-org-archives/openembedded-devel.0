Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 337006FFD4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 11:52:21 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id j37so5840564qta.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 04:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H3gJY9ekpkLUxxayXAsYz+5MFnFzR4ouRjVtO1M8p78=;
	b=fX6/x5Q59OzzLEgpXfPgtthV5yjP1I0OcefKGtx60X0rPhSjMpUNWoTcV6SA4Zndv6
	SGMEszDro5hseXjd2I/7hU1ipMCgg2T2WdshOug8gY6ZXWjgeLhDwAefBKEwKZZlws55
	pN/9sC6Mxed19QdKJhJp3vpeOKhVwfyccHTrs3onls4ER2/4m7CWlC5Ov0X0pO65kZlA
	NJtlvsoc1iqAe7dKMIHr1ulp9/onhHlrjjKyT1N3v3gm97Az6POAxugXeTmoaYrkEZeh
	vLGEtlkCx0mDzrXrmXHj7Cco4a7lTANis3ef/jiNBClxAkJjFJVIPjw1WpH/i1khXjGE
	+x1w==
X-Gm-Message-State: ALyK8tJ8b2+ctM4Z27+Ak0U6B1bPBmoA4Jn/t7iNVM3n9OJJMMNnN34O8kYaSkdlKlJLZg==
X-Received: by 10.200.36.13 with SMTP id c13mr4430153qtc.45.1468756341658;
	Sun, 17 Jul 2016 04:52:21 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x20sm415502qtb.7.2016.07.17.04.52.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jul 2016 04:52:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jul 2016 07:52:00 -0400
Message-Id: <1468756321-27744-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH 1/2] python-click: add recipe for the python click package required by the new version of flask
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
X-List-Received-Date: Sun, 17 Jul 2016 11:52:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-click.inc    | 17 +++++++++++++++++
 meta-python/recipes-devtools/python/python-click_6.6.bb |  4 ++++
 .../recipes-devtools/python/python3-click_6.6.bb        |  2 ++
 3 files changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-click.inc
 create mode 100644 meta-python/recipes-devtools/python/python-click_6.6.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-click_6.6.bb

diff --git a/meta-python/recipes-devtools/python/python-click.inc b/meta-python/recipes-devtools/python/python-click.inc
new file mode 100644
index 0000000..f3d5b36
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-click.inc
@@ -0,0 +1,17 @@
+SUMMARY = "A simple wrapper around optparse for powerful command line utilities."
+DESCRIPTION = "\
+Click is a Python package for creating beautiful command line interfaces \
+in a composable way with as little code as necessary. It's the "Command \
+Line Interface Creation Kit". It's highly configurable but comes with \
+sensible defaults out of the box."
+HOMEPAGE = "http://click.pocoo.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=09e8b7869f94ba9e9a7b260d53c65dab"
+
+SRC_URI[md5sum] = "d0b09582123605220ad6977175f3e51d"
+SRC_URI[sha256sum] = "cc6a19da8ebff6e7074f731447ef7e112bd23adf3de5c597cf9989f2fd8defe9"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-threading \
+    "
diff --git a/meta-python/recipes-devtools/python/python-click_6.6.bb b/meta-python/recipes-devtools/python/python-click_6.6.bb
new file mode 100644
index 0000000..f63e27c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-click_6.6.bb
@@ -0,0 +1,4 @@
+inherit pypi setuptools
+require python-click.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-contextlib"
diff --git a/meta-python/recipes-devtools/python/python3-click_6.6.bb b/meta-python/recipes-devtools/python/python3-click_6.6.bb
new file mode 100644
index 0000000..1920644
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-click_6.6.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-click.inc
-- 
1.9.1


