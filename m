Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id ACD8B6FFD7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 07:00:53 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y19so27163628wrd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 00:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OMNEofDivKsg8ULC5V47maUHoleqscgIkdkHp8IHrE4=;
	b=hs05UOW0PEgMCgoHbHSARE4H/eJ9E/laaj3JFpUUz6wYLkkBsgjo5bTwytKB6i+dO/
	GeoH44QsI0fhDuCL2VNIJFc+U5meuaRkR/pMwgh1Ro7Rk7VOWASYOKLRj596UO/Gyhdn
	Rh0IjTSR62+yP03FHS51M0eqL7ttWM2cjbh8ELgvirBOZ1Qk4BPW/FfuTH3PBbM6wV9c
	uCVQeiJ9fA8hiMsYE5ejgMWCWHTdgTSqTTsIz/H0BoaXcgN6Gb//7jIeh1DiKUuAsNHc
	UIQEjuBxfqess3+1MOS0jKo+12OdfJTlnujK7crPR2/p+bFKoKALzy5cPOsjMWsudSh3
	conA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=OMNEofDivKsg8ULC5V47maUHoleqscgIkdkHp8IHrE4=;
	b=iiCmrv/it0opZbjhyezC27e1cTY81uOZJxOuZJPeVpSeOTMPJE2qoIqDcVRCSv/Bks
	PibBP6Lh+e8RvXaJWSRZFaYOwiOenBGaacuYv3NG9TnSp9xWW0KttcOwh6N9aD25cJiN
	kqXBc/pk/swDN1QKXgz2kSAoTiIXvD5a3M8UL2KGoljD9clOCVGtfJ7BDrygbfVFPfdF
	sPqO1wsU5kM/AgTDDTKfJT1Qrw1dHbzKxz/PKn9v/TJoxGK8kQisyBWfBVDe+gMr9csF
	nlBCE2VkRXCI/z7cNb1fwCY1ra3OLAWGep5f9foUap+XET+60j5R8Wx7ciKDzBAtyABx
	z5uA==
X-Gm-Message-State: APjAAAVZtiKMOL6iFi8iamKnY/4SU5utNtOi/sjRk3A2J3Z638hUnWI9
	yNhKpxMDPsLf3Unx0s8vdq6VHg==
X-Google-Smtp-Source: APXvYqzLVOcQeWQOSQEIyjtQDqdXfjBlsc48gvUmZtxuOkmdDpOqmXGKse7eYBZpG9mBS15hepd4sg==
X-Received: by 2002:a5d:6785:: with SMTP id v5mr9836902wru.9.1568271654257;
	Thu, 12 Sep 2019 00:00:54 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id
	g201sm7512363wmg.34.2019.09.12.00.00.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 00:00:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 09:00:50 +0200
Message-Id: <20190912070050.4388-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [meta-oe][PATCH] yad: new package
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
X-List-Received-Date: Thu, 12 Sep 2019 07:00:54 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for yad (Yet Another Dialog) - a command-line utility
allowing to display configurable dialog windows from shell scripts and
parse the input from users.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 meta-oe/recipes-graphics/yad/yad_4.1.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/yad/yad_4.1.bb

diff --git a/meta-oe/recipes-graphics/yad/yad_4.1.bb b/meta-oe/recipes-graphics/yad/yad_4.1.bb
new file mode 100644
index 000000000..cfb13c4b7
--- /dev/null
+++ b/meta-oe/recipes-graphics/yad/yad_4.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Yet Another Dialog"
+DESCRIPTION = "Program allowing you to display GTK+ dialog boxes from command line or shell scripts."
+AUTHOR = "Victor Ananjevsky"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "git://github.com/v1cont/yad.git"
+SRCREV = "3857a0a8822fc0a7206e804f15cc17b85a5f8ce2"
+PV = "4.1+git${SRCPV}"
+
+inherit autotools gsettings
+
+DEPENDS = "gtk+3 glib-2.0-native intltool-native"
+
+S = "${WORKDIR}/git"
+
+FILES_${PN} += "${datadir}/icons/"
-- 
2.21.0


