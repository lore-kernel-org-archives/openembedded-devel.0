Return-Path: <yann.dirson@blade-group.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id CF7BB7FB6F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:58:12 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a11so12885284wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 02:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=blade-group.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sLfx8nRQHFIDZdeRmDirhBFfBPxy67NYJGcswNlS7TE=;
	b=aXZ3oEYlAtBfE8FwZIq2lKEvY0Q4tNYDsEUvhS6DStEOZ7nxg2D0W+j0o8cnLUdoxW
	GWJ0EyYQyrrhpUq6dOYUcIWAYfCNK8H3Mfm94srfyD+RiP5ouK2slQrisXuG0R4asSvX
	Lr3769Q7+7c/gf461M2JofZshLFEwA06Yt9ZNRuycxgPZtmE0yU5R+1n2TLrgBaH0ZjT
	BNlCebGoQlfsrGWtEmAseRKGZQvGagysuQMUwCxgzTSNf+8zoHEsaCcXLiaOI5VJW7/x
	PqeWl8n1k7oaxWYSr1wJ0sY5yBYmznVJMDcbZygxGejNvdheVZe4kIHDPlVBprnYXTI0
	kgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=sLfx8nRQHFIDZdeRmDirhBFfBPxy67NYJGcswNlS7TE=;
	b=IaQcsKTE+TBU4ic1vUgjKu31K0/zok/Sv2Zhsfu68NBNFPHNRRKLGrO8eoTplv66ta
	1Ux5W/yesUnKsGnuqEtZ/9wTyDCoirLNOROItTiRVgOOe18bmoDnurPAOAlJrWwFgmtr
	ce6gc2htzGpZfnr/E4RrrcrVaLp2ArS+Nq04kKQuYSjpR+ryNJ+fS2miJ6eDaz9XQOny
	e1XUGtMFejddGQhnf9GxRMpgARRfpwNTwJPDoa0ezgcFFXj+UqYf1iDV1g/I8Fig3DzY
	uqv5JcLbK1hlc3A+rDp+/Zu7gfKibB5NKDs9Lxpxzfsw0Jhr8uVyVkzjA7mxAJciOS+v
	2aLg==
X-Gm-Message-State: APjAAAWOgWDK5haADnU0ZFUDPoeybYoZg6XQ7KfnX6ay/yM1FoYi4MhE
	R4IMHJ6hgTH23kg0jCt60Ld/K8cr9gYW3w==
X-Google-Smtp-Source: APXvYqzK8lrJcOSsXzFeHCWG5rMDXaxlp1bMO6MbrFvZ3LtIuiw05YQLg1Ffd6wDzwq7YK5D1Fkp2g==
X-Received: by 2002:adf:9486:: with SMTP id 6mr18110460wrr.28.1572343093057;
	Tue, 29 Oct 2019 02:58:13 -0700 (PDT)
Received: from yantop.local ([85.118.38.73]) by smtp.gmail.com with ESMTPSA id
	j63sm2305839wmj.46.2019.10.29.02.58.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 02:58:12 -0700 (PDT)
From: yann.dirson@blade-group.com
X-Google-Original-From: yann@blade-group.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 10:58:03 +0100
Message-Id: <20191029095803.32200-1-yann@blade-group.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Yann Dirson <yann@blade-group.com>
Subject: [meta-oe][patch] mpv: remove double expansion of PACKAGECONFIG_CONFARGS
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
X-List-Received-Date: Tue, 29 Oct 2019 09:58:13 -0000
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
index d334956a8..07db1b14c 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
@@ -67,7 +67,6 @@ EXTRA_OECONF = " \
     --disable-lcms2 \
     --disable-vapoursynth \
     --disable-vapoursynth-lazy \
-    ${PACKAGECONFIG_CONFARGS} \
 "
 
 adjust_waf_perms() {
-- 
2.23.0


