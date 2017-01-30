Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE83772F3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 08:12:00 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id v77so35922807wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 00:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dp/JSf8+4YHNP1k7oaPLdvxDbtXCys4zwM1G9CRt/Kw=;
	b=kc4HghW4OOCxKPDcG1VhUmaImW/dPhDdiDYLbigaW1o4QlwsaD8jgiVTNvR4Vzvr/O
	KZ1GdQi4/LTfIBjdgeQNNo22OLiIa5rJtlKzKZavByCQyARP07npp7x+WbTWyvNqqZgC
	iPpCT74nTkOAdp5vkxg5h2WE6HOGnmEE/B/2ww5SbVh459RPzKRmyhTjJe/MsVoI8PlZ
	SZP/Pe43J5vwEAK7Pk3xO3J1hAx+hBcqxfK+kAasHVYnQT4y9EM2k+opeoPIC9iOziBV
	R4gzInHOmBiVoVT+bCwM69iRPLbinvAJfq7CLZKJepGQTJaB9qyRGT0ozLHydJcnSIRx
	DgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dp/JSf8+4YHNP1k7oaPLdvxDbtXCys4zwM1G9CRt/Kw=;
	b=HQWjpsQhp6UpDa3sk+enquPZE0kHPTKvVtzZeLkaripRWVM7/OtJbHT5WVeXXMU50l
	iEg5+91XqFiA4R1cwwk5Ful/zdu0x7Nd8HhDPB2KYZA0V5dDDOI77AqJhUxtFdaG55iX
	xAYQNnG+Afth+Q71NOhmEZ7GmMy+FYlpz7h8djPh7jO2dC9cJsfNWGYgL3qZrgatRZuW
	Pl31jrJeVhtncvCiMjeRzEb9qkaorO3PwcxAib3/x6PBjak/wes213I/z1y4SHgsVP/c
	0Y3GImWBAf9gw8hPIMuK74pUJT6ETDxGgQBPf5M9KL6j1e5oQiPgz18fCHzy2DMary8D
	tAug==
X-Gm-Message-State: AIkVDXKP9cSbnk4WK+W2NQIz793/m8EKYZLYtQhtVvepcZ9qnU11VQ7Sm2nGMQcVVdSY078n
X-Received: by 10.28.15.2 with SMTP id 2mr13880962wmp.66.1485763921015;
	Mon, 30 Jan 2017 00:12:01 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	123sm17484320wml.6.2017.01.30.00.11.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 30 Jan 2017 00:12:00 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jan 2017 09:11:56 +0100
Message-Id: <1485763916-32139-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Jonatan=20P=C3=A5lsson?= <jonatan.palsson@pelagicore.com>
Subject: [meta-multimedia][PATCH] gst-instruments: add recipe
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
X-List-Received-Date: Mon, 30 Jan 2017 08:12:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jonatan Pålsson <jonatan.palsson@pelagicore.com>

Add recipe for gst-instruments. This is a set of utilities used to
profile CPU usage of GStreamer pipeline elements. The gst-top utility is
used to launch a gstreamer pipeline and record its profile, and the
gst-report utility is used to analyze reports gathered by gst-top.

Signed-off-by: Jonatan Pålsson <jonatan.palsson@pelagicore.com>
Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../gst-instruments/gst-instruments_0.2.3.bb       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb

diff --git a/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
new file mode 100644
index 0000000..b6cdc4f
--- /dev/null
+++ b/meta-multimedia/recipes-support/gst-instruments/gst-instruments_0.2.3.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Profiling utilities for GStreamer 1.0 pipelines"
+HOMEPAGE = "https://github.com/kirushyk/gst-instruments"
+SECTION = "multimedia"
+
+LICENSE = "LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"
+
+SRC_URI = "https://github.com/kirushyk/gst-instruments/archive/${PV}.tar.gz"
+
+SRC_URI[md5sum] = "14a394dec25642848b17f9999f1b4999"
+SRC_URI[sha256sum] = "5565658a33ff9596946541304fbdd3b3683dbb82171a0e6ce56f42b64a01e58d"
+
+S = "${WORKDIR}/gst-instruments-${PV}"
+
+FILES_${PN} += "${libdir}/*"
+
+INSANE_SKIP_${PN} = "dev-so"
+
+DEPENDS = "gstreamer1.0"
+
+inherit autotools pkgconfig
+
-- 
2.7.4


