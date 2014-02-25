Return-Path: <ticotimo@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 461826E9A3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Feb 2014 06:38:57 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id g10so1718419pdj.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 22:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Pb4W8U8Qt6DGS6AM3BnAUEEDQrAISNNTagBhlokJixc=;
	b=FciyBx12sZ98ksn17BrsfBwBDX4VdB44u1McrvC82emu6Il87jw+3lD76MJMq1N5xv
	qtYhmBq60pJ33+UBt3X4qptn8m6FNPo8Lr63LbYCHlXd0rGqrdt+ZXdYWFCMjpMubTUh
	Jc8G9ymO979OIvn73RXVH+md3wmRgjGxn2JMgVKNHa3ZmbT8+iUcVtQoPT7BtImzmg/c
	rQ8J7qv4RygHwSqTAHKYefMW/GkTQ5NpJ+i7BDGSRp5z8OUAvH0Un3VmtPSrgTV/CQF+
	gQ9uxJ9O8kGI7YelSBQhSRQCKXPaHDCDnoG2HbU2jHoBO1XLvhcnV7DvnAyqy0oP14zQ
	q8AA==
X-Received: by 10.66.252.135 with SMTP id zs7mr19083076pac.13.1393310338407;
	Mon, 24 Feb 2014 22:38:58 -0800 (PST)
Received: from gentoo.localdomain (75-128-22-150.dhcp.snlo.ca.charter.com.
	[75.128.22.150])
	by mx.google.com with ESMTPSA id dk1sm6740418pbc.46.2014.02.24.22.38.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Feb 2014 22:38:57 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Feb 2014 22:40:37 -0800
Message-Id: <1393310437-18094-1-git-send-email-ticotimo@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-multimedia][PATCH] xbmc: disable rxsx (euphoria)
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
X-List-Received-Date: Tue, 25 Feb 2014 06:39:00 -0000

From: Tim Orling <TicoTimo@gmail.com>

Signed-off-by: Tim Orling <TicoTimo@gmail.com>
---
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index f438a2d..b72a0d5 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -35,6 +35,7 @@ PACKAGECONFIG[opengl] = "--enable-gl,--enable-gles,glew"
 PACKAGECONFIG[openglesv2] = "--enable-gles,--enable-gl,"
 
 EXTRA_OECONF = " \
+    --disable-rxsx \
     --disable-rpath \
     --enable-libusb \
     --enable-airplay \
-- 
1.8.3.2


