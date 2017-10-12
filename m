Return-Path: <limon.anibal@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id BED5071A92
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:57:33 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f66so8357150oib.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xSRYpjMyHo/0y1zxDhbnAln3TQ4FjuQKiLYLpv0wXs8=;
	b=Tv1c+EjoipoI4l8TSePhLqX6Dcc83zjdUKh2QZgkC3PU6cELYxmRo4/n7eNZtWEPDj
	NAK6f500zF/u5h6t8qTYZx1FWBr9YFXUVVS/lLMLU3hTV+bYZ0nuxvLa4E743SK/Vwzm
	xWj+i1zeJrlB2C/+ILil8HgErUlRFuKhqGgDQ9qQuzdGZrFmJ437payXJZOzrxaRcNja
	Bc1CLOlyKCwhyFle+Ni+ueCiber7v3ONYFjUKmv3oDQ0LKuVW/WDSlKBuYX9w70123xJ
	MbGUAqu/ImRsX6dLAiogaeVihSX3SxsekDqYZGJ50v3+9w6R+hVACf7epUanuTX94LsO
	ZQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xSRYpjMyHo/0y1zxDhbnAln3TQ4FjuQKiLYLpv0wXs8=;
	b=XzsmTsP6EhGpFrofu+dtIgT801+5LJntkJNhACsmRwwoMAlZ9cFON0fonda6ReWQz+
	bySxEb1Xz/dbUV0GEXzwS3v+RyXWuqMV+wK5xTOgvQ+/1hpSmCrQ/+Gb1EN/ycap9izi
	7dd/cLSGpKT/jueniuEyRHHL56wvcl4be+DzUlVTa790CA056eoogTdZjdbipDkfyT09
	m0jze5hpC7IPPzsR+1iYUzLO2o+kC9bunOFXbMrPqoNwBOhGl5G4/qO8JXhBGaW4dm7i
	4oBDw4rxKq9pRtXgqT2D65RnpxGcvn98gL/Ht7DNkyfVm0ozn/FfvnSRVt1p7GZmFYbO
	mD3Q==
X-Gm-Message-State: AMCzsaU6FSfYVsHukoysvLeb0m9ICQKUku71PjRcoZ3ek6Sez47v/2LL
	CluFI7QxvE9HlbBi0DRqy75hDyJb
X-Google-Smtp-Source: AOwi7QDdLG2Cmt1fCFw+DJps/fy4oqcPfLQDUhhDvE1rTilG2RvakLZGaM0sJXkBu8FzCRDo76jULw==
X-Received: by 10.202.166.9 with SMTP id p9mr1256242oie.220.1507813054419;
	Thu, 12 Oct 2017 05:57:34 -0700 (PDT)
Received: from blackbox.Home ([148.240.201.158])
	by smtp.gmail.com with ESMTPSA id
	y90sm8199347ota.52.2017.10.12.05.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Oct 2017 05:57:33 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Oct 2017 07:56:25 -0500
Message-Id: <20171012125625.3061-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv2] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Thu, 12 Oct 2017 12:57:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

A tool to generate load and stress a system, currently this recipe
is on a couple of layers [1] and is not updated, a good reason to
have in meta-oe.

[1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=stress-ng

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
new file mode 100644
index 000000000..86f577006
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A tool to load and stress a computer system"
+HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "zlib libaio"
+
+SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "e0f6497a8c06f5d652bc2ad88d449c12"
+SRC_URI[sha256sum] = "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2231c1058b1a5dd18"
+
+CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"'"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
+}
-- 
2.11.0


