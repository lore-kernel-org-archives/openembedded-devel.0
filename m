Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id BF4467EE41
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 13:43:00 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id n9so7253962wrr.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jul 2019 06:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tYwqe2ZPyLtT7oY6rYJv1vW29LjYKiD/embqZ8vhmiI=;
	b=TsAVZNvlHhTWEZlJ22JyUrd9eDquG0S9LIE6gjKk0pR2GW1M3VYr7ON8IqHvNWh2+r
	mcfxfy2aqx8OvcdleLM/sv+fJelrf6PEyS+kit7o4FVQDeehPuPI+isrkSaEzfzdhi6i
	2iz74KgCXqnmZfwghD1ge6jtPYSfXnJJjB1Y3AFcj9n0JmpFmij9TQRKqL/V5t4Ktj4n
	mm2rlLc6htbmb/DvPU2NN2pAZC3N3xvC7UcWzYWMD4Ol5a1TUM2f0+i5MwDDcbaiCtYW
	QyQ9YNRymCF86zqPsWNExTJngIcnOxL+qvzkbeRC+GAJ0tz8s9EXqITpGTku6stNv36E
	qSlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tYwqe2ZPyLtT7oY6rYJv1vW29LjYKiD/embqZ8vhmiI=;
	b=V1S9AlujPoEaZ9uGvrZt8Bxp1pnX0icuo0THTh2cuFUAD5xvAYEztFMUisBx/Izig2
	ujz8wegAz/SfE2d7eh5dsPXUX6YpE9UlqZqA3tfid3uvnk87d7X8G28O+xdr2Vgtm5Kt
	3K4SDEM0ROE0U6P5Nc9Ox/buCFJGCC8J8gl7Be1TqYOX1wh9qUNFmcd/dO+AWjYrY8oL
	luJgXUr8TCHCYjxEGN0G79lZmY1kOmu+Qlk9N8phufb2GcqU/YwFLCkEYW2K0Ez32AOQ
	JJ0nC+sFxTmHCx8WwTbIMqCmAW2n/4vNqdoHY+GoGpZ/cWGr4/LDNXxzhepiL3MJf+1O
	u76w==
X-Gm-Message-State: APjAAAWAybdfseovlJkwKuWxdpZFDolQvO8mReaMybEkRgu2lKazW5Kn
	5OVNvS3xt+dAQ6uHZw/puOxrOttlQW0=
X-Google-Smtp-Source: APXvYqwtf47F6Dywk8pejXpOCRTG4ZXx0HYoPKiZLT0RkwGJwj5xUzc4fap/aF7UxJi/WcTKGXckew==
X-Received: by 2002:adf:db46:: with SMTP id f6mr5830214wrj.212.1563543781036; 
	Fri, 19 Jul 2019 06:43:01 -0700 (PDT)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18]) by smtp.gmail.com with ESMTPSA id
	i13sm28998300wrr.73.2019.07.19.06.42.59
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 06:43:00 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 19 Jul 2019 14:42:56 +0100
Message-Id: <20190719134256.1854-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] zstd: New recipe
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
X-List-Received-Date: Fri, 19 Jul 2019 13:43:01 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

Changes in v2:
- add nativesdk to BBCLASSEXTEND

 meta-oe/recipes-extended/zstd/zstd_1.4.0.bb | 50 +++++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.0.bb

diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
new file mode 100644
index 000000000000..06357da956f4
--- /dev/null
+++ b/meta-oe/recipes-extended/zstd/zstd_1.4.0.bb
@@ -0,0 +1,50 @@
+SUMMARY = "Zstandard - Fast real-time compression algorithm"
+DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
+real-time compression scenarios at zlib-level and better compression ratios. \
+It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
+HOMEPAGE = "http://www.zstd.net/"
+SECTION = "console/utils"
+
+LICENSE = "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
+                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
+
+SRCREV = "83b51e9f886be7c2a4d477b6e7bc6db831791d8d"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+    oe_runmake
+    oe_runmake -C programs zstd-compress zstd-decompress zstd-frugal
+}
+
+do_install () {
+    oe_runmake install 'DESTDIR=${D}'
+    install -d -m 0755 ${D}${bindir}
+    install -m 0755 ${S}/programs/zstd-compress ${D}${bindir}
+    install -m 0755 ${S}/programs/zstd-decompress ${D}${bindir}
+    install -m 0755 ${S}/programs/zstd-frugal ${D}${bindir}
+}
+
+PACKAGE_BEFORE_PN += " \
+    ${PN}-compress \
+    ${PN}-decompress \
+    ${PN}-frugal \
+"
+
+FILES_${PN}-compress = " \
+    ${bindir}/zstd-compress \
+"
+
+FILES_${PN}-decompress = " \
+    ${bindir}/zstd-decompress \
+"
+
+FILES_${PN}-frugal = " \
+    ${bindir}/zstd-frugal \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


