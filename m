Return-Path: <marie.kowalczyk@vodalys.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0735660703
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 08:54:57 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id em10so425442wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 01:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PM3Y+mDI5gojNkB+NG9YHLvLl86xKOHQdBFE2zJtjzE=;
	b=D+XxOvHIG0YuiBaKF0M+JzLiT62bMvOp3zBtdkl6z2AArWGrtjAn0GeKgUh6cGXChu
	DPinCN/F9q+Nndk9E/7PcX/bC8Sv9cUtjz0nqjEWF8mQSfyXkCPqkUr2jCZF9ns5VPZx
	dDtOsLGtUDNU/QOrzSvToUqsfnbYrxRKPT6aXOi8OTgKjM7iMJ1yk/GozBrtvV6sHHS3
	jV7aA1l/aBOVQlV6ILe0KptBcTpXc9pgxWpXK0mDVUjQjlmjtHQzQ3gZndIagm8g6AUp
	FeXRA6rzXotnjz7xMlw3iYPsUkdAaa88BQrXnV2V9Eb4v6hqv4RopRlg/CJOfW3bwbdX
	/sqA==
X-Gm-Message-State: ALoCoQnuWG7YG/pM5zjgrMg1zumpsVuaPyuXRw6JxvpTy5V0as+Yzg+J8qacNglPiwWMQnO1daqE
X-Received: by 10.180.102.40 with SMTP id fl8mr428367wib.17.1410512098279;
	Fri, 12 Sep 2014 01:54:58 -0700 (PDT)
Received: from vostro_i5.vodalys.lan
	(LDijon-156-64-30-180.w80-15.abo.wanadoo.fr. [80.15.95.180])
	by mx.google.com with ESMTPSA id fa20sm1072665wic.1.2014.09.12.01.54.57
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Sep 2014 01:54:57 -0700 (PDT)
From: Marie Kowalczyk <marie.kowalczyk@vodalys.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Sep 2014 10:54:49 +0200
Message-Id: <1410512089-10975-1-git-send-email-marie.kowalczyk@vodalys.com>
X-Mailer: git-send-email 2.1.0
Cc: jean-michel.hautbois@vodalys.com
Subject: [meta-multimedia][PATCH] gstreamer1.0-plugins-bad.inc : Add rtmp support in gstreamer.
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
X-List-Received-Date: Fri, 12 Sep 2014 08:54:59 -0000

RTMP feature depends on rtmpdump.

Signed-off-by: Marie Kowalczyk <marie.kowalczyk@vodalys.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index e1e13e1..d8aa6ee 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -50,6 +50,7 @@ PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
+PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
 
 # these plugins have not been ported to 1.0 (yet):
 #   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
@@ -101,7 +102,6 @@ EXTRA_OECONF += " \
     --disable-pvr \
     --disable-quicktime \
     --disable-resindvd \
-    --disable-rtmp \
     --disable-sdl \
     --disable-sdltest \
     --disable-sndio \
-- 
2.1.0


