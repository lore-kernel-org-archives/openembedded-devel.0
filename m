Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE2479267
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:27:58 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id o11-v6so5298328wmh.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=7gutLRIQRzEFc1qg7EPSHAsjueexprNW3Vpdxi2dt5E=;
	b=W8VMc+1WQzbIcPmmtAF1ePm9Hamw2Fb3ppKT5wa3pDCPTcTybQo7JSH2BDuywHG58H
	IeX5fZJtIHDEyMN4bVb7uQy328IKR6Sd8xYQsgb5l4237s2Sm08/AMHnUHWziqhBK65h
	d5Qmkpkms8VRIb85TuQgNiDDb8ZtzGE3RKP/r9YCoEa0HfX4z5Cq56Qo5rxw3Brbm/7r
	llrfJOxCJWJs+Oq4CO1WGDPqTQzyKscH4seAMdmNm4hj+YizsOnc+4WJWlfyd8S7+BSu
	NOGmRfBbpOFjGg422gQlQDBQUrt/FvL18pWCGmuCOOJAjtT8btkFFFborZ81m17DczrS
	vj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7gutLRIQRzEFc1qg7EPSHAsjueexprNW3Vpdxi2dt5E=;
	b=lqddFzEM8WiPILwQWdEHABS5T0dhaRT3Rysimrlh0yvNxKt+7MAy81uRpc9Bdy0WvP
	VPJyd30Kv5/0GpVXtWDFZQfug+2USSAY9aA5Mid3s+8jOCc8zXAlXieTJJ1Sp2H9pZok
	FdaafzqQI0fTdaRt8dRAJLl3DWTDe6fCEa/p/u3tZDT5eiikukrrhBxYwMbeM0u1U5pA
	6aSs9rpB7FgenN4BwlcBAIF9RRkcp5wQINkZLbueMjcFpKFMAs/FeElUp0dykCKL58Ey
	fnc+2vu9v9S99PvEOPbVo/Su7KN+nO6lFqzT0TfUCFW2ylkGDfWZnKqflfY7C7vm3Bvm
	jdtw==
X-Gm-Message-State: AOUpUlEwEPf/uXD/87bpdNoxtOUzYncPBZK7JAxoyHfJlk6ZSV3rxy3j
	ueWQ2dDKqbo7ZTHDwo+XvIm20lRM
X-Google-Smtp-Source: AA+uWPyo2J8EDHP9rmdNgTEMslk0DLDk9D2r4BTMlW2UnUJ5wEm4HBzq5zZNoyvVORy3+voa6pNwxA==
X-Received: by 2002:a1c:7513:: with SMTP id o19-v6mr476670wmc.53.1534444078793;
	Thu, 16 Aug 2018 11:27:58 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.27.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:27:58 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:35 +0200
Message-Id: <20180816182748.2400-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/16] libxpresent: initial add 1.0.0
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
X-List-Received-Date: Thu, 16 Aug 2018 18:27:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb
new file mode 100644
index 000000000..4fe9992f2
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxpresent_1.0.0.bb
@@ -0,0 +1,11 @@
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
+SUMMARY = "X Athena Widget Set"
+DEPENDS += "xorgproto libxfixes libxrandr"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
+
+SRC_URI = "http://xorg.freedesktop.org/archive/individual/lib/libXpresent-${PV}.tar.bz2"
+SRC_URI[md5sum] = "edd87ac15bb666081898dd7382fcbff5"
+SRC_URI[sha256sum] = "c11ae015141a9afbe10f4f2b8ee00b11adca6373dc1b9808d7c6c138b2da7b8a"
+
+XORG_PN = "libXpresent"
-- 
2.14.4


