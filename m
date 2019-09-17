Return-Path: <ricardo@foundries.io>
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id E9E347FD8E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 19:09:29 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id u40so5761755qth.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2019 12:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=foundries-io.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x4sk97rcL5s0KkgHbbngCJHLhuygGUt8LPy5bwsGy3U=;
	b=Eo5VAH8POkxITb/lV/vY3wLduS45ADbEWzpTPlQ62YWZUwlcPdx5ves/A8fLRo1PU5
	+lS+wnu/3NaTbV27w+H4Bmt082LX7ba4Dr7i0RpCWiYfWyvbCp4RgC8wxSlZ0LLCs5M6
	TbgCxWitydELD0q0CU1TSHxT76jjCCfHxqLL77hSkw/E10sLYdJwtShoktrxNVmLQvpb
	E5FRxldacBYPoYje3+4DZryc48MliSNysI1BZuKB4y7kJwnL4hXQPhuhZKvpGYQ84jM2
	tUBJ4CX/Hwsb/jXEgeHHCqvqSoi4bqSkKlE88GUn2fujF6QFpgkRsB8vDXELDzx3pymc
	y1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x4sk97rcL5s0KkgHbbngCJHLhuygGUt8LPy5bwsGy3U=;
	b=WK0Sf9XBkn3IRztoQg7LcYeFkRpn6ZuHfwJu1bDu64p11zjQkneDJUFfkSQyDnJ69E
	JJWmITBs2f7H4oZ+yswusdUay/4UHkeFxlFw/UIWGv67IwUrWyYr+xh0SxK9taIk9ZrB
	+8H7v+jlBF6zaTX6/38tpHeVG+fau76Xxm/QX9kZPAVKIWXjj7bhQjLnBxUWecscALlY
	5OUR6h7gB0pYiTj1HlL2k/8EDEUxZ+aEBYtC9QikaiFAke9PXArxzdDUI+4Iy0Cy7yXC
	AEHjlC6U+msuexlS4AEptC0kBUerViDtUdYw3AtyyCtr600/QDw2HM4rFBwy7CaTmPI9
	4MFA==
X-Gm-Message-State: APjAAAV3q3extdO+vlp8/qPH5CGfAzUlpsrrarGKHKbT4pnTYlvDu6hA
	bC74hu8SFKhJTPWFojzQ5IetaiUqSkIn
X-Google-Smtp-Source: APXvYqxE45hMVSaTYYpGAtmA/4sxllyfzRhIgxgSrQrcbUuo3aY3GjYzkaoWuVxeHizq8EGhaH/N3A==
X-Received: by 2002:ac8:1102:: with SMTP id c2mr369059qtj.340.1568747370127;
	Tue, 17 Sep 2019 12:09:30 -0700 (PDT)
Received: from localhost.localdomain ([2804:7f5:f380:260:55b5:ddaa:99f9:976f])
	by smtp.gmail.com with ESMTPSA id
	g10sm968095qkm.38.2019.09.17.12.09.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 12:09:29 -0700 (PDT)
From: Ricardo Salveti <ricardo@foundries.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:09:12 -0300
Message-Id: <20190917190913.13628-1-ricardo@foundries.io>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/2] python-pyrsistent: add recipe
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
X-List-Received-Date: Tue, 17 Sep 2019 19:09:30 -0000
Content-Transfer-Encoding: 8bit

Persistent/immutable/functional data structures for python, now required
by python-jsonschema.

Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 .../recipes-devtools/python/python-pyrsistent.inc   | 13 +++++++++++++
 .../python/python-pyrsistent_0.15.4.bb              |  2 ++
 .../python/python3-pyrsistent_0.15.4.bb             |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyrsistent.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyrsistent_0.15.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrsistent_0.15.4.bb

diff --git a/meta-python/recipes-devtools/python/python-pyrsistent.inc b/meta-python/recipes-devtools/python/python-pyrsistent.inc
new file mode 100644
index 000000000..2add037de
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyrsistent.inc
@@ -0,0 +1,13 @@
+SUMMARY = "Persistent/Immutable/Functional data structures for Python"
+HOMEPAGE = "https://github.com/tobgu/pyrsistent"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
+
+SRC_URI[md5sum] = "0298efae86e009e24136d39dc8b2d33e"
+SRC_URI[sha256sum] = "34b47fa169d6006b32e99d4b3c4031f155e6e68ebcc107d6454852e8e0ee6533"
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python-pyrsistent_0.15.4.bb b/meta-python/recipes-devtools/python/python-pyrsistent_0.15.4.bb
new file mode 100644
index 000000000..832eb8038
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyrsistent_0.15.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools
+require python-pyrsistent.inc
diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.4.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.4.bb
new file mode 100644
index 000000000..2e567e9f9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.4.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-pyrsistent.inc
-- 
2.23.0


