Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 17C7D7570D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 10:58:56 +0000 (UTC)
Received: by wijp11 with SMTP id p11so71834480wij.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 03:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=z1QpZBJ5gqqZRAN4+QLmCU+VQKQXTgT7E9epvxmK3dM=;
	b=a36AIU0xbBFbYcMIaCoh0LDRTJ77Kaylmr06BI1oyclc8oBGBR21p5YcQgWULlS30j
	TLKNJgZljGE1xbx7vHQtsfEU/4jEQmZJUFaPD+IGOufMh39RA5v0Q8Gw8YKM37fhzriG
	YRZc7heHSjImQhUEQnxn37DaV6JQR7Sv+KA2bS9/DqTJaJxNgmazGw+MAx8UtdSRYeTo
	fFPiN/F9LrFRi0Xmxft7q5JUb4LNNQBIBxELTRwLPXLx+DuAnNUprpmsD/Ynuo0Pl4GX
	R9ep/wm5paiwV9ftljeXI8K9yidCawzXaJETjgQY3f1YHy2LjlyN8/POYoiHwg6a/pBM
	pRTA==
X-Received: by 10.194.184.207 with SMTP id ew15mr3660301wjc.99.1445597936504; 
	Fri, 23 Oct 2015 03:58:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m9sm2560602wib.13.2015.10.23.03.58.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Oct 2015 03:58:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Oct 2015 12:59:23 +0200
Message-Id: <1445597963-12814-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH][meta-oe] gst-plugins-good: fix depends to libgudev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Oct 2015 10:58:58 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
index af18281..eaf3b1f 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-plugins-good_0.10.31.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
 PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[gdkpixbuf] = "--enable-gdk_pixbuf,--disable-gdk_pixbuf,gdk-pixbuf"
-PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,udev"
+PACKAGECONFIG[v4l] = "--enable-gst_v4l2 --with-gudev,--disable-gst_v4l2 --without-gudev,libgudev"
 # sub-feature of v4l, but control separately since libv4l is not part of oe-core
 PACKAGECONFIG[libv4l] = "--with-libv4l2,--without-libv4l2,libv4l"
 PACKAGECONFIG[bzip2] = "--enable-bz2,--disable-bz2,bzip2"
-- 
2.6.2


