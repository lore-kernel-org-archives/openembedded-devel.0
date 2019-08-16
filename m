Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id E52767F304
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:02:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id j16so1839080wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zBxlGMmJlFYkgVnX5bUXLlucHqcbUc2ldM9CvIllY6E=;
	b=U3YLCc9xePhlkQv7Y8UGBNuTqwgFpOr1z/Htqc/0oHn1TT7wzSUUInfFrmW9hoi9Wu
	r9xwIRg5mAzUB6q7hsvj2DsteWLFDQOKzBNLLqy0wYW2Lc9gByk6T2ytfEUF3Xb1IJ66
	bRsRZfcYaUzbvialAqgI6oet/sLyfqZwUTAd6py5Na9hakfzLWoVDxGD0lHcPZClf0/l
	TiSnSwoYI/gTrwVTI7fZu62RvxA0VhCZy3gkl4R2gk/5RgBJxu9aKEqM+1rnZzJMmgiF
	8465QJJiWkbK5Zbq91XYQIJI0pcfWmDjx1KpqRj60Ho88u1tkpmBraTWNxfk1UbUcdYz
	ZIQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zBxlGMmJlFYkgVnX5bUXLlucHqcbUc2ldM9CvIllY6E=;
	b=iGRVFWbFef3YTt8Kr0lTNqE2GWwaWlYLIXrCKXKjuSIdW/WKKAjhsC1xn+3Rwl485z
	ieTMMkgtVxxv+SQogS/CyyE7JcIZA1AnQRj2ZtQfA3Q6U9Hzqe7SM3MVpoXRqXUPRRKv
	BywCzKIcVRvGlYvI061cxf+38MCMEZ+IZsMQWtug44dlg4xWpn8z6L6Q8cTUcF8xLWEu
	C9L3gA97kyiZo68rKx4UJy1eTDcK+32yCHPYljoA1gKzduWjks4jvGseJABImWMM24Tc
	fFht6vgtWy/d8xfiUbKiU0aiDjus5cv5BGoxYUeO6zFBGi2d7hNBGjXcsSM9oZDOUy2E
	vdJw==
X-Gm-Message-State: APjAAAXAM/vX20JK5P7Zh5JfLtyIwm1xHG6ftlA767Fm90HBgJPCeLqY
	TNg+Y792hjMzIPm3rubyGBilmg2PW6s=
X-Google-Smtp-Source: APXvYqxN4Z5uq/5+uSu2IdSNh9vXY6ArA8pd4J1J0dt2LQXa/C5McGXFCpPz/2drx9syF+J5xzsoCA==
X-Received: by 2002:a5d:4946:: with SMTP id r6mr12351754wrs.266.1565967739483; 
	Fri, 16 Aug 2019 08:02:19 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id b3sm9934896wrm.72.2019.08.16.08.02.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 08:02:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2019 15:02:25 +0000
Message-Id: <20190816150225.3078881-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] scsirastools: add runtime dependency on bash II
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
X-List-Received-Date: Fri, 16 Aug 2019 15:02:20 -0000

* fixes:
  ERROR: QA Issue: /etc/init.d/sgdisk contained in package scsirastools-diskmon requires /bin/bash, but no providers found in RDEPENDS_scsirastools-diskmon? [file-rdeps]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
index 37d083c0ea..b922bb1f15 100644
--- a/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
+++ b/meta-oe/recipes-extended/scsirastools/scsirastools_1.6.6.bb
@@ -43,5 +43,5 @@ FILES_${PN}-diskmon = "${sbindir}/sgdiskmon ${sysconfdir}/init.d/sgdisk"
 FILES_${PN}-raidmon = "${sbindir}/sgraidmon ${sysconfdir}/init.d/sgraid"
 
 RDEPENDS_${PN} += "bash"
-RDEPENDS_${PN}-diskmon += "${PN}"
+RDEPENDS_${PN}-diskmon += "${PN} bash"
 RDEPENDS_${PN}-raidmon += "${PN} bash"
-- 
2.17.1


