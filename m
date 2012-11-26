Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tcy2u-0003zs-KZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Nov 2012 13:44:20 +0100
Received: from mail-wi0-f197.google.com ([209.85.212.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 26 Nov 2012 04:29:52 -0800
Received: by mail-wi0-f197.google.com with SMTP id hm6so3520216wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 04:29:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=2xkTUZhDTffoNs/dr5DhQ7wEwjaK2xsBycZxGfuPKq4=;
	b=kXvdsu8f4ABX9Z1aMbecjXPDZ8B6xj3PnX33j/26ojo0Q+mR4WzXC+iUKLFVssZ3JP
	tJuwA6ikJVOObKL75Yr9ZCfq512fdYNMtQgNoBH7QGrKBpHi1qnNQe5lTja+fEL7DWAS
	vC1ke7CgpaF0ZfxQfMi5M9nk+mjsnUf/e2NjsnhfontIijb0SVzk+yWDLC7XUeLtHMgP
	M+kIdbiIFr4g7yngNvMrUPKO0FEua5jzWox8kAGPawP6kbEhB1s037DJacz07m6ALj92
	AzBV7waj1PlbwVyOCo+iw0Z7D0L574YcInyCdnTv3WY9rXzueKjlCgmIKtakmbTzcl8A
	AWgg==
Received: by 10.216.204.32 with SMTP id g32mr4181823weo.79.1353932989986;
	Mon, 26 Nov 2012 04:29:49 -0800 (PST)
Received: by 10.216.204.32 with SMTP id g32mr4181819weo.79.1353932989803;
	Mon, 26 Nov 2012 04:29:49 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fh10sm23573570wib.3.2012.11.26.04.29.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 04:29:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Nov 2012 12:28:18 +0000
Message-Id: <1353932899-16796-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkF5/gipBR1yJHcRmGEfRQRAyBywuK7aD3YgkZHdjobAA0tea8G0KyVG5419uEkpGRHxSyQiXO7mrO9znHJOV53PryAa9OugnCe+twS7LdzB2xqflXArhyM3P/n2Uvzn6njclD1WbVw0WKOsJfPxu5174IAwatACZwx1T/TKSOu4bYJMVzDwSA7KPqPTYP5vfRwSi/F
Subject: [PATCH 1/2] meta-oe: add python-mako, a templating library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 12:44:20 -0000

---
 .../python/python-mako-native_0.7.2.bb              |    6 ++++++
 .../recipes-devtools/python/python-mako_0.7.2.bb    |   19 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
 create mode 100644 meta-oe/recipes-devtools/python/python-mako_0.7.2.bb

diff --git a/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
new file mode 100644
index 0000000..0d4c1e4
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-mako-native_0.7.2.bb
@@ -0,0 +1,6 @@
+require python-mako_${PV}.bb
+inherit native pythonnative
+
+DEPENDS = "python-native"
+RDEPENDS_${PN} = ""
+PR = "r0"
diff --git a/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
new file mode 100644
index 0000000..9113666
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-mako_0.7.2.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Templating library for Python"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da8dd26ed9751ee0cfdf9df1a16bbb54"
+
+PR = "r0"
+
+SRC_URI = "http://www.makotemplates.org/downloads/Mako-${PV}.tar.gz"
+SRC_URI[md5sum] = "e3c0a677aa4216da9e89ef8fa76cbafb"
+SRC_URI[sha256sum] = "fe8698e845035586bd711a6748e4e40a208a58de276b9138026164700494b68f"
+
+S = "${WORKDIR}/Mako-${PV}"
+
+inherit distutils
+
+RDEPENDS_${PN} = "python-threading \
+                  python-netclient \
+                  python-html \
+                 "
-- 
1.7.10



