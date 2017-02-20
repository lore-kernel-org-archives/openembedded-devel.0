Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6E0F47731A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 18:07:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so15741285wmv.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ejoaPscdcyAkC2/yHH1NYGPqhbdE1JFnjM87kKf3lCU=;
	b=NMwY03o8QF7622C9/PzAwzbUcOKmOZBpKHGWPqMIGV/lqpPLO6MN1ZclnAdINm9oCG
	mR3l9YRO4vcKUffxRGsYOPeNr2+ddpweEvmzbga1DBBtwBXVal8Dp+7HiHoe5MAnhfpD
	0qZ4BNRIAmBuqdAnObGJ29ahNB1HY1HWJgkk7zTzPONx7pP3YuqM9vAauofiDoMNk9ne
	hn8NerSlLCbzB4GnHmgQi9IuDm8Sg0RCKMDk5yLQsfn+ZMfhbLYYeMbMaeBcS3ehw+yN
	iShSy95Fn4ImWKwMWEBxW+Z9ozSbjYt/cBpNvVMSm8OV+ZF/f/ILeK2ncS2H/u28sI19
	5ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ejoaPscdcyAkC2/yHH1NYGPqhbdE1JFnjM87kKf3lCU=;
	b=Y/9B8iu9jySH5PEdlY8WQguF0tM0/BTMyxQLl8uaMk0M6VKaLy7llh5A8pKhGJ96A7
	juBjeE8o1g9VEiGW5fIxmf9auAi01hdtaFMYGkQBYx33QhaI5RPqqGpTEBqg1lJr5FWf
	llLrhm2Ht5Ep+xMCh6KXozaWIlQQu9NKes56yPrjDUwiZ23E1Sfq4CHZGRY1KZUPU9a4
	RttwZxF8HnA2N9hYZ6CAfnssA/BIP1vq9blZuwkwZR/zZEq56vYNoRsY25CpVKsQ2rlQ
	bJTvNgX6waJlOrIo83Nr5SjGgvrAJ5UnSy+JDQLTZaKqRkWHm/jemjnjURjSRWHj1VFm
	swiQ==
X-Gm-Message-State: AMke39lE5HIpzN54UilLSgaHWegtGbHI4MW15m696kRSDl662YTR8HsobezogGlAViMn8Q==
X-Received: by 10.28.58.204 with SMTP id h195mr20510223wma.116.1487614075386; 
	Mon, 20 Feb 2017 10:07:55 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911DE631E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:de63:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	96sm2863710wrb.14.2017.02.20.10.07.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 10:07:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Feb 2017 19:06:57 +0100
Message-Id: <20170220180700.29836-42-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170220180700.29836-1-schnitzeltony@googlemail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 41/44] gst-meta-base: unblacklist - all dependencies are back
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
X-List-Received-Date: Mon, 20 Feb 2017 18:07:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
index afd6a58..039abe1 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-meta-base_0.10.bb
@@ -71,5 +71,3 @@ RDEPENDS_gst-meta-video = "\
 
 RRECOMMENDS_gst-meta-video = "\
     gst-meta-audio"
-
-PNBLACKLIST[gst-meta-base] ?= "Depends on blacklisted gstreamer"
-- 
2.9.3


