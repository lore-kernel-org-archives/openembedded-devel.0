Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 167E1773B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 06:07:29 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id b1so14988752pgc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2DsV9E+NRQazpwFDoTKfAf1q9Q46BroOW4LgF7AK2cU=;
	b=WgxnAJTdm5SYKLkrhptMaf8lmLBBom18dVYUvhNvIJYUgGdYRiTUgCGEzP761mbufA
	lFVwH+SdKRSntmrQmZhLdmIuulLp9itQERJ8Dj1Agy5NuFJ00z7544anR8CPp/XfdNNy
	+H5mIKwVOKmmKPyBh+WXS4qmV4/A/CkXrUzsHiVKlji41LKUGocNPMZjmaEGb/xXVcXE
	VVSgg+G3MZu92DG2rFxwckzzA45VsZQf8SHcuUvnymy4VedGj+Lz5rGuHms/auaq/ERt
	Ls/pcrUkZeCF2haCpa8JNQ/GR16ojq7QuQiPDNBNzanfft+K8SskQKpSQkDE1tOh9JY2
	qBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2DsV9E+NRQazpwFDoTKfAf1q9Q46BroOW4LgF7AK2cU=;
	b=PDGnmcHS9Vj1daIpyCOQqj4VvUIDGq/W+qRMOmTmAS4gevZOXHIBF3P91cf9hdJqkz
	Ud+x3KoEi+U+MevALAOT/3T5PbWVTVuQj4e9FlMXj/go3tKvs7PqQA+zUlicVEZDRg3W
	noDdamWHSJ/DLFkxLwCdTpYSUUnd8LkTE7IevuPu637v76OfmqHZ30oA6A30lTtSMyRc
	iv87akZdnsAYX0Uu4sRcnDIwn7uVxhoa53Nh3wAU4CSNmVjZPwGy0A8dqfXzDquK1Ygw
	JIaewYXQUbs6prv8Hsp6eVnIJHO+2/HwANRAXYBF5xKsJgNg4WOjDvXwuunso+5w3K7D
	n6lg==
X-Gm-Message-State: AIkVDXIf7xeM+eZM0u9ZD2vyz2nH5RVVHpw1IpyZ0+SL/GLD64ZhPH6djsF9rOoC29vRmQ==
X-Received: by 10.99.104.68 with SMTP id d65mr5009549pgc.52.1482300451201;
	Tue, 20 Dec 2016 22:07:31 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y6sm43633558pge.16.2016.12.20.22.07.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 22:07:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2016 22:07:24 -0800
Message-Id: <20161221060724.20817-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH V4] yajl_1.0.12: Add recipe for yajl1
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
X-List-Received-Date: Wed, 21 Dec 2016 06:07:31 -0000

yajl1 and yajl2 are not ABI compatible, therefore
add a recipe for latest release of yajl1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb

diff --git a/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
new file mode 100644
index 000000000..8ced7b84f
--- /dev/null
+++ b/meta-oe/recipes-devtools/yajl/yajl_1.0.12.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Yet Another JSON Library."
+
+DESCRIPTION = "YAJL is a small event-driven (SAX-style) JSON parser \
+written in ANSI C, and a small validating JSON generator."
+
+HOMEPAGE = "http://lloyd.github.com/yajl/"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=da2e9aa80962d54e7c726f232a2bd1e8"
+
+# Use 1.0.12 tag
+SRCREV = "17b1790fb9c8abbb3c0f7e083864a6a014191d56"
+SRC_URI = "git://github.com/lloyd/yajl;nobranch=1"
+
+inherit cmake lib_package
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
-- 
2.11.0


