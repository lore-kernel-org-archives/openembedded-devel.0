Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40F656078D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Nov 2016 02:09:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so21581570pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Nov 2016 18:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Bhz/iV7Afwpq+/5lLSV/i8S9+Oe2pCa10FZGh6/njsg=;
	b=qMxf/pxZbgwWKhVPNJJgILNZpqcI0R/joyjPMfWZjpd8piCWR7d7OV1GjPzkb6Bgp+
	AeLV68EjPP8kB5w4nL5zwYYHlqAom4aFqP2PpjJX4VAH+v6f7tvyMFBNIvgULuvfqMKx
	NCcVyv3XW4zEdSGChUCbxFUBA/dc4WnkGaHgI8Zkn4OPWfz0ZjxkorVI96M5mHQFac+x
	WTLXcfeF9OMx4Z8QG5Wh/3dofJuGjxjGYv9PUdyRw36V+lHQpiIhb7Q9KZkhMMiZlqiI
	+/1XDdDFpUE/ZzK7u4l8uJ9OIIh/Y4Lk+i+8IC6g2tLR6dWt+ZSbBiu6cMsFrqPapzJx
	Tgfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bhz/iV7Afwpq+/5lLSV/i8S9+Oe2pCa10FZGh6/njsg=;
	b=fSM8tCGSjK8f1Y1Q5nvvRkWPSFnpDXfKb4bpnU8z0juaCQSYyfcgOV/ZdmrqUMQAGn
	1H/8m8XtA4+sacMWD8PZlJaJ8C7RAFpL4Z/oB2Fc2Bf9cakNMgmaeRYSlbLDF6K9zBYs
	84Rxkxw81f2PeLA8zPSosa0Vf471o+KCp2pyvQobZKzanRQO6eo7H9pLVGcspT1QZKCe
	RPg0KE+YoN/A777PP+3bS4dxkjn+ILlSEEn4CUrfsc135Jm0EfmR4rpc/7hKYNmWJIJu
	3OGPRNH/wc4qtjkPny9li7I3cRN8uPoBR+Ikc8OcLd0ussYEnHV0CJN0AD8BV//WWU9i
	h7sg==
X-Gm-Message-State: ABUngvdhvElRvwFRMdhS9MVSu9G0hg1dOBta9uAs5JPGr6+j/dESZkEKWsD0au1zDlnjdw==
X-Received: by 10.98.70.150 with SMTP id o22mr28908913pfi.134.1478657375396;
	Tue, 08 Nov 2016 18:09:35 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u17sm50954064pfi.1.2016.11.08.18.09.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Nov 2016 18:09:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Nov 2016 18:09:26 -0800
Message-Id: <20161109020926.14361-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] breakpad: Upgrade to latest
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
X-List-Received-Date: Wed, 09 Nov 2016 02:09:34 -0000

Switch to using git
Gets aarch64 support

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../breakpad/{breakpad_svn.bb => breakpad_git.bb}      | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/breakpad/{breakpad_svn.bb => breakpad_git.bb} (87%)

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
similarity index 87%
rename from meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
rename to meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index b573ea5..6dc6500 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -13,9 +13,21 @@ inherit autotools
 
 BBCLASSEXTEND = "native"
 
-SRCREV = "r1435"
-SRC_URI = "svn://google-breakpad.googlecode.com/svn;module=trunk;protocol=http"
-S = "${WORKDIR}/trunk"
+SRCREV_breakpad = "2f6cb866d615d6240a18c7535c994c6bb93b1ba5"
+SRCREV_glog = "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
+SRCREV_gmock = "f7d03d2734759ee12b57d2dbcb695607d89e8e05"
+SRCREV_gtest = "ec44c6c1675c25b9827aacd08c02433cccde7780"
+SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
+SRCREV_lss = "1549d20f6d3e7d66bb4e687c0ab9da42c2bff2ac"
+
+SRC_URI = "git://github.com/google/breakpad;name=breakpad \
+           git://github.com/google/glog.git;destsuffix=git/src/third_party/glog;name=glog \
+           git://github.com/google/googlemock.git;destsuffix=git/src/testing;name=gmock \
+           git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest \
+           git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf \
+           git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss \
+"
+S = "${WORKDIR}/git"
 
 COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
 
-- 
2.10.2


