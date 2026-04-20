Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7B5F588EC
	for <webhook@archiver.kernel.org>; Mon, 20 Apr 2026 15:49:26 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22598.1776700159019111047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 08:49:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D/UDTS6/;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so49902175e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 08:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776700157; x=1777304957; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=67c+2nbrJvSCCd1LEC3dug7wX0tnYu5qRdXNTQS2Y6w=;
        b=D/UDTS6/ZcvSfkXjXfJVEc56XgZdgXeaV4W2w1EkISOvsLtYZTKLYcbIIhcg0/2xPr
         aTLt/5j5nyXRzpQrZ6ig9y+FZnElOxin8S69U2qDj0VpnKrqac1Ma1DgeJHx+TLld4rF
         yg08/xsBMn63LWFYLuCzeqkDMoxypbpado33MNHZX+TLGjt3ggwA3bPC/5KSAZdaorci
         5xNrUblPaJKTSeMN3RM8RV860sdbkNWl1L3JI8YEgNyYci6twNcFUaWRd0f3YorPSXQ4
         Z7j2ftq6jUoNWA0QXzsLTpP5MfNW7Y7RBelRgqwHyXVb31h9fjWrWgHAzppH6Rbssz7H
         Wg2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776700157; x=1777304957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=67c+2nbrJvSCCd1LEC3dug7wX0tnYu5qRdXNTQS2Y6w=;
        b=EvU8w1+D7i0vrH2T8p+Z8jfGyObWL13t0tok2UzoXAZdqkk40oYuAKzgrsuygmkdVj
         oHYUg5Q70ES5EGnoHQwT3B+a2c1yP6X12Zqem0AHertOk5Lf8JmtiSgnECfiu56QWEaO
         yzKwkGPiRCKHfN5UJ1asVZOAy4WubjfSAm0f7TA6lnLdymXF3duQkCVr5nOuwMWCi3/e
         9EWL+gdKKTxVRxntgKf+QQQdVy5hCGkOMFJp8rL0rm6n6MOJbF+A51n3/+iFg+NsvoOF
         HkZuS2+SlH4RYIqklqK75gmW7LYKgriSrwJTxf+jzxKr5Wt5MfpAbbQepSBeCkdCX+xU
         8Wkg==
X-Gm-Message-State: AOJu0YzvmvbrJW6hRGbeFiMwxbSlGAmE98WvyvbAfsM1D9a5Vadx4oBZ
	+/+YfeMpnK0urvZZvnps8eLuua3mfnCpdxsf/WMk2dwJDpzLfrtBaXjzb+R5lg==
X-Gm-Gg: AeBDiesgq0xuYcm+rIEroyKJZqY+/8vOQXmpRGqWAzxK+N6DJGUSOle4ouEiT80tsE+
	Vi+vy9yD4ranBLTMK1iFyiEQW3GEVxMHQD0EkIv1H9A2FGI+7NRnhg/qMtR9djtiAdfZXfHR+sd
	RVLS2hBhou5w1Odd9pW5maNiO7xfPzTIsSftPQnSOwV333UpK5/D3CpUhIJQDswbDXUtOvasnsj
	oLdFtEw0i8fSpNEj1wqbPXeA6qISycjAuWFGqO+oqWcxOpxknA2M5p7ZWlKtMovmKV5Ni9xvWAq
	hqZCYYKdDRIy/MYhvxyu+Cql+c3gbvp714NzJLiPTpl+nS+mf5n87OoilQKJ+WLKzJIaPLBjy+I
	7v1rGQroFvduWGdv9j1grylZufHZwNMktPolDTEAWDT7TiZ/V0wnOVAnxa9ACA0+ykMEYw4LBP6
	gy/iW/nQjx32u+cTk0ZIwsG+kx3E3Hel4=
X-Received: by 2002:a05:600c:4f13:b0:489:1a65:dd6e with SMTP id 5b1f17b1804b1-4891a65de3emr88032485e9.8.1776700157323;
        Mon, 20 Apr 2026 08:49:17 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm85279255e9.9.2026.04.20.08.49.16
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 08:49:16 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 02/12] logwatch: fix SRC_URI
Date: Mon, 20 Apr 2026 17:49:05 +0200
Message-ID: <20260420154915.952359-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420154915.952359-1-skandigraun@gmail.com>
References: <20260420154915.952359-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 15:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126505

The previous one stopped working.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/logwatch/logwatch_7.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb b/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
index 8cb88157db..5e936bab60 100644
--- a/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
+++ b/meta-oe/recipes-extended/logwatch/logwatch_7.6.bb
@@ -11,7 +11,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ba882fa9b4b6b217a51780be3f4db9c8"
 RDEPENDS:${PN} = "perl"
 
-SRC_URI = "http://jaist.dl.sourceforge.net/project/${BPN}/${BP}/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}/${BP}.tar.gz"
 SRC_URI[sha256sum] = "689f3c68b99ef7af7d3c7007c3ff0a55d5674bdbf9c01f69a9f187726d6d4baf"
 
 do_install() {

