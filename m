Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E608605FF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 11:20:21 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id k12so86115769lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Mar 2016 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1DlRBDBh+rTSdQ6alsKPJmj3Hr81EqX8Txr5IFCKTTA=;
	b=TQV5Q3XZFx3Hm+P0080hXdkTt+MQz+Fxi/vdTHpXQFKZVCTWr0/kEFnu4kkqbQ8m3J
	nioWb9CIOMpaGcv2CxkB37Bj1Brq4+RyAJshrUTDbX/2QL2BK39XbwTM4/H4Js9K7OAu
	un/Cmdem1wXMXocTFIF5m/tVHjwt6wnfyOUI4jqnfgou+DSezjVEZP72I0+iGAetGEsB
	msfR0AMNY2vEtHK6cka4WxFor9/5E0CAGn0VssMZqFC5zn/81ExyIQMmJXRGF0ba/6h7
	WHI87Sq6+ZPKQImseIBliJTeXxIrOeU8h10z8F+KmmE4m2sbcPFMsfwHxHTT8otA/Js3
	0Tjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1DlRBDBh+rTSdQ6alsKPJmj3Hr81EqX8Txr5IFCKTTA=;
	b=XmwI817icQdpRXVWS9akXGBgEq2cm2oRByEMcnXF2oGcTM3LeTliwgTQQun7OdKviL
	9P0dS9uANBPB8ufAL0E59tBDBvkSntbp5Z9Bh7Lc7ISQ0SJ4rF4e1vd/DB0UI3RtVttQ
	ivN7y7T2LrDb/25kXs2MUhLhiA6u62NIQT46Y6UVzFUhgl1zd7R2Wz0SaFVPATVPUxIb
	l0cWwAvbiMrtct0YMsmWhDqOspNzYwWvCS5j0RrMViIEA2JZt+pT8BHkSMZ29avhKhzR
	YmOD/rk+GHgmIPCmFTq3dphpz+IQ2EnQ1R5QGflYWyLxArRIlt+KT5G20IMPS5S7jMMl
	aOMQ==
X-Gm-Message-State: AD7BkJLPy1uaF0jHigg3lDWZVYVNSPN3Mmt6J+2wv6h2Ret0vMq6DRAWq47DugkDXd/UZQ==
X-Received: by 10.112.135.39 with SMTP id pp7mr4492093lbb.43.1458300022083;
	Fri, 18 Mar 2016 04:20:22 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	pi5sm2107256lbb.41.2016.03.18.04.20.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Mar 2016 04:20:21 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 18 Mar 2016 12:20:15 +0100
Message-Id: <1458300015-9666-4-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1458300015-9666-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH v3 4/4] opencv: Remove blacklist
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
X-List-Received-Date: Fri, 18 Mar 2016 11:20:23 -0000

Opencv 3.1 builds fine with ffmpeg.

ricardo@neopili:~/curro/qt5022/oe/openembedded-core/build$ bitbake
opencv
Loading cache: 100%
|############################################################################|
ETA:  00:00:00
Loaded 2018 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.29.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-testing"
TARGET_SYS        = "i586-oe-linux"
MACHINE           = "qemux86"
DISTRO            = "nodistro"
DISTRO_VERSION    = "nodistro.0"
TUNE_FEATURES     = "m32 i586"
TARGET_FPU        = ""
meta              = "master:300f858ba07c938427ccd05a3d7220027a03d461"
meta-oe           = "master:29462f7161b346dbc2ea00830da869a0a1c35fb9"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1242 tasks of which 1228 didn't need to
be rerun and all succeeded.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 6f0c83829809..87338cad4a4b 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -133,5 +133,3 @@ do_install_append() {
     cp -f bin/*-tutorial-* bin/*-example-* ${D}${datadir}/OpenCV/samples/bin/
 }
 
-# http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
-- 
2.7.0


