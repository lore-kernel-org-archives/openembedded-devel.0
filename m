Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 115317FAC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 17:46:42 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so11911896wrw.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XcA8abCKYpSsBtPXJUs3aAlikNEQESy49boqZ4N3eQQ=;
	b=MsWACqrRlNOZC/AZN+nKhZ34NqmoTrspYhdOpXRNQfMMh/eDX05+/Ql/nzg/uTASD4
	V74GUXjy0ATmamZbBb42q232qCDnJ0mUbbT18R03D1WbLVK+WJ0G5T2B3TX2tivL6dG9
	ZRD8BrCnmtqTiG5MqHCDapx6xKo3sYhJOFt2Sc20qBNsXnH5IN/3BjzVXmQwVHhyt+jt
	g6+wX/93Ukt0AT7/3ivIA6kkId/LywO/MH00tLB5nHpuDHqmFyJKV5dMGTXydXfdZ8w7
	xZHZsTgRCKogwuRdNCVYYmTyHv7v+QHKrrZ3xbpsVAZayxs68w9bHG6B7hXoQHw47uKz
	e63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XcA8abCKYpSsBtPXJUs3aAlikNEQESy49boqZ4N3eQQ=;
	b=DDGA7IiUiLFTOFtPDxB3SVkA2er7hHTq5tMX9n4dI0b1F+6XvUtRcp6U5Hp1pbx1n3
	4SIJU+I5jxShxlAg5VB21eYlI1bIOhgb2xuzEygpsH1B0SMb4uwPLv8DGJxDIHr01cwd
	0HRjXeIcS3fxc08cGX6ZXskbI3Hz/vCuAorc2+OFfCevs181vCAWRC9WrAxq7jAlI8D2
	T84DE6gU5OWLCtdO/cQ7diJgoERY6lx+8SOwAWE/kG8C9oOjqVcsujbDDYmSPzw6hyVi
	Ppd6gP3wl+C6XaBZOC78hY28HqBc20bIomi07zMMzfAoWt0oCe9Y0LfhgnnD9+ZHWXGH
	ycTA==
X-Gm-Message-State: APjAAAXePP3QLkOvfkte5ZhyPT2XgU56kRfeS6mqrjuAU7E/+UEWOTag
	E01ArVjhyTzX2WC3zm+Cc+beCv6q0vE=
X-Google-Smtp-Source: APXvYqzS5hsheiw8J4TpzSzmClvjz+v8T8Ip/jcNdC/N/8BgslhJbod69NUJvJD62CW2VdiYYasiOQ==
X-Received: by 2002:a05:6000:1602:: with SMTP id
	u2mr1646038wrb.249.1573840003355; 
	Fri, 15 Nov 2019 09:46:43 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w7sm11811908wru.62.2019.11.15.09.46.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 09:46:42 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 17:46:18 +0000
Message-Id: <20191115174618.39355-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH v3 1/2] python-jsonschema: multiple fixes
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
X-List-Received-Date: Fri, 15 Nov 2019 17:46:43 -0000
Content-Transfer-Encoding: 8bit

- add second license file to LIC_FILES_CHKSUM for json module
- add missing dependencies: six, datetime
- add HOMEPAGE field

Also:
- add RDEPENDS for PACKAGECONFIG[format] for optional modules that are
  not always needed. In particular rfc3987 and strict-rfc3339 are GPLv3
  modules.
- add missing idna and jsonpointer modules for PACKAGECONFIG[format]

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-jsonschema.inc               | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-jsonschema.inc b/meta-python/recipes-devtools/python/python-jsonschema.inc
index 1841b5893..c1b11a2cc 100644
--- a/meta-python/recipes-devtools/python/python-jsonschema.inc
+++ b/meta-python/recipes-devtools/python/python-jsonschema.inc
@@ -1,15 +1,26 @@
 SUMMARY = "An implementation of JSON Schema validation for Python"
+HOMEPAGE = "https://github.com/Julian/jsonschema"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+                    file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
+DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
 
 SRC_URI[md5sum] = "a802ab85600074a726ef6acc4e6a8148"
 SRC_URI[sha256sum] = "2fa0684276b6333ff3c0b1b27081f4b2305f0a36cf702a23db50edb141893c3f"
 
-DEPENDS += "${PYTHON_PN}-vcversioner-native ${PYTHON_PN}-setuptools-scm-native"
+PACKAGECONFIG ??= "format"
+PACKAGECONFIG[format] = ",,,\
+    ${PYTHON_PN}-idna \
+    ${PYTHON_PN}-jsonpointer \
+    ${PYTHON_PN}-webcolors \
+    ${PYTHON_PN}-rfc3987 \
+    ${PYTHON_PN}-strict-rfc3339 \
+"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-attrs \
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-importlib-metadata \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-json \
@@ -18,9 +29,8 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-pkgutil \
     ${PYTHON_PN}-pprint \
     ${PYTHON_PN}-pyrsistent \
-    ${PYTHON_PN}-rfc3987 \
     ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-strict-rfc3339 \
+    ${PYTHON_PN}-six \
     ${PYTHON_PN}-unittest \
     ${PYTHON_PN}-setuptools-scm \
 "
-- 
2.20.1


