Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6F7DD71A31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:05 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c17so20256326wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=18iIB+y8nErqvvLSYcGcuGWJIsUzfv85Dy7E8e11fa8=;
	b=Q81JfOjZ5LpKg0ihSv2FFOTTlrAwCH/89MGzu8Q7gwYDSg2/joeyJnVoZFZH9bR0t0
	Oy0E8+BxrLLXkFZ0/fgd4W7ZOaha3BwcGRvD50Fylc+gKl9vOnAJRZ/j8/4bD/lvig2o
	5OcVoDWYcRBpiXMdBUOA/NaUfp9tw7z9au1O0yKoqHh/bR2iyLGqEPiEdtuQ5pOqKhMm
	QWd7XOGlkCtoYnocVcFVSMBBkVyXzPXHhx+mqS5jfgDNFT4nVZ/EqandWBoWkB9XNUDY
	Ee3E7Tuq4ktPjDTn1RQBwDbx5LLxbwWkakf/Jw31zGhJCTTsJUyi3KaHX1Y+m5szAgHC
	ecfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=18iIB+y8nErqvvLSYcGcuGWJIsUzfv85Dy7E8e11fa8=;
	b=M88gcHMtcmAOFQ2u5Fs+FtB75h/EGazY+SAVDF173Bdqj486M+5OOGZFg9TPFKkk5L
	xTxQ+rdzzEC2PsVN/vj3H+1ayutcEGG+KyEqzcTEdCBhor73rGbeU+DWf5BrrzrHrVyU
	72sY2dWevmFiyakAb5tL0AY8Y23BTBXwECdQoy90K8ePSg3SYrhv+21sxtNwvDQ7kWZ/
	jnqMNubKyEQeNHAPxtVpQUEHJZto+Hc092kd+j+Ozxw1Ng3Z6OpFQY/mxnHBvJlKW+aM
	ZXBpCbyEaQe0zCU92W+DpaxHmd5gzs1ff+GJLWjSHqWd5EKxln2esvRxmxIq/21d2NZJ
	57zw==
X-Gm-Message-State: ABUngvf0KKB5sI0gsy5m9I9JiUvXtkDdPpI7Fj2p8aaklMJkjEfEZWDcgqqgIjev9ENstQ==
X-Received: by 10.28.199.6 with SMTP id x6mr358826wmf.116.1477951865998;
	Mon, 31 Oct 2016 15:11:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:37 +0100
Message-Id: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 01/13] python-distutils-extra: initial add 2.39
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

add version for python2 and python3

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/python/python-distutils-extra.bb  |  9 +++++++++
 meta-oe/recipes-devtools/python/python-distutils-extra.inc | 13 +++++++++++++
 meta-oe/recipes-devtools/python/python3-distutils-extra.bb | 11 +++++++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-distutils-extra.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-distutils-extra.inc
 create mode 100644 meta-oe/recipes-devtools/python/python3-distutils-extra.bb

diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.bb b/meta-oe/recipes-devtools/python/python-distutils-extra.bb
new file mode 100644
index 0000000..56dd33d
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-distutils-extra.bb
@@ -0,0 +1,9 @@
+require python-distutils-extra.inc
+
+inherit setuptools
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${libdir}/${PYTHON_DIR}/site-packages"
+
+RDEPENDS_${PN} = "\
+    python-distutils \
+"
diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.inc b/meta-oe/recipes-devtools/python/python-distutils-extra.inc
new file mode 100644
index 0000000..4d87d77
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-distutils-extra.inc
@@ -0,0 +1,13 @@
+SUMMARY = "python-distutils extension"
+DESCRITION = "python-distutils extension integrating gettext support, themed icons and scrollkeeper based documentation"
+HOMEPAGE = "https://launchpad.net/python-distutils-extra"
+SECTION = "devel/python"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4325afd396febcb659c36b49533135d4"
+
+PV = "2.39"
+SRC_URI = "https://launchpad.net/python-distutils-extra/trunk/${PV}/+download/python-distutils-extra-${PV}.tar.gz"
+SRC_URI[md5sum] = "16e06db0ef73a35b4bff4b9eed5699b5"
+SRC_URI[sha256sum] = "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085bf37f3997ae8063af"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
new file mode 100644
index 0000000..af242b8
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-distutils-extra.bb
@@ -0,0 +1,11 @@
+require python-distutils-extra.inc
+
+inherit setuptools3
+
+S = "${WORKDIR}/python-distutils-extra-${PV}"
+
+DISTUTILS_INSTALL_ARGS += "--install-lib=${libdir}/${PYTHON_DIR}/site-packages"
+
+RDEPENDS_${PN} = "\
+    python3-setuptools \
+"
-- 
2.5.5


