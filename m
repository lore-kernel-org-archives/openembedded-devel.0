Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17934.1794787842794660920
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 16:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=X/K+qqPk;
 spf=pass (domain: gmail.com, ip: 74.125.82.46, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b244fb7fffso3190557c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 16:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794787842; x=1795392642; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F17fqrPiF/wkcA8jfMtPkBcGJpZJGJbOt7WxiA4d5Ok=;
        b=X/K+qqPkxBiSGA4ZRQz8ATadGDRs9/hvcPbEVEKWyLklJA5WCgqymB3cv8/b6tl8+9
         KiJjf3Vj84KXptcRhaDhpfiWM6lFf+Xwpl8Jne5Cr0hzrjpap5HyIKVQCsiFoHisQW4L
         zxCTrVHH6B+T3OOffXAYMVcQ7VmQnHbIzfPdcXAeGr27iOSEbxoz1cXd3oxNXhTZTDO5
         p68dWagQV0CCgE79Yiqqk54lNgf5mFd0WvYj4/EM04feXunh0stH1S+1tvNoPSFKnzxG
         5+ifU7DL9QYlJAmS9bgoVEwIEsVHgUYpXkyZ5IZ/hS8rIMQffvff18z3TLVCfsH07N0c
         gTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794787842; x=1795392642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F17fqrPiF/wkcA8jfMtPkBcGJpZJGJbOt7WxiA4d5Ok=;
        b=YUPluYTlTafvMzHHP8TmVbGoRoEv/haT9GsaeU5USjuVHfMfPPvU9Tpz0A0YzDkZsX
         luYBYbFT9uyAGhQlKiKIu5BjHev+tukQc6e3QcyN7L2XqxAOOy+2mw+mHonthk+Aziwq
         rrTXlh2Eaz51uv1lXAAMZXe986hfj+di/YUajZe00iRkckLIzNwzj1oXnIoigGWbOo3Q
         WrmMfz8Yl0ixExrQz2e4aKwsVxjwonD5uIYR97sTJ9jvDBMkO/XiE1zAcWxitVoVLXLz
         KLpOzPM2YsVbTIpYhlULOUE3auIixTnMKU7gyMEE+rjUYmjF9VVPWjBBs/rg1VHEgP8V
         J9Kw==
X-Gm-Message-State: APuU4Z/zlISIHTpfCK5cZUmVBD5XFrCFlxqhOLGkCGw3HzuFIFrMSm9I
	nqVbn1uSuTWyg30+zejV7BsQYX4Q9DBnhMkP1AWdaclFoznfSNwrvYDq3Pfa7GcS
X-Gm-Gg: AYBFou0B0T6e9h6w8Rfad/V4b3CPEJqYQAJYk6QOZO3PmFi0uSOKI50ZMFrVvWgCdny
	vjZhoZjLplC+EcnFDp9HMMOpFOh05/vrhRZnIkZUWLqPVMaZ+X1UDpB/8D+JPLgCOGdbPUcuVC9
	FZb9drtXUD9rDtWgJ1jHJcrmw2djkyw9t64G+RP24D3cVIq+FQ1VIA+7t5DkVvSr6327hhraTho
	NX9N701wliKAx6779rl3F8E5D8UW6q1r/mh+RpKIemTtWHpSzCI+Y8rnUw4rrjWe4Pvus29pzU/
	PYA02owWSxvdsm77/MNVvhXUx62nF8Ns8JiyKjAgFpnol8SKW3Lh03sQtpLklWLjF9HZnUjwJ+W
	G0Vi4SsR2Y7LvTTLGANxgFEjmUi8Jh90MH0X5eM9xE2XsdJ7A19G4SVh8d7n9G2BJWcUPSiUzvS
	i9qT5LpV3M6Gx8hc9SyJo2ln7UZhYe6mRTlwF7og3wR5vEGjsQT0WjJcmZJDO4ZDSXtzj817SVJ
	fDXabmgqAW1cuyBG5sglvcXN2e/l1JrQqmXanEOxxEj47yqb6PC2+FPjK4jGjCcj421VtTXtgxJ
	w4VxFqrkCKLyQJzD2wOZ4iP+IV2wyn0ciFtmpK9ta78kwKi0aXo31LLnmWHcnJa+jI4uOwrAHha
	oFoX3f36bqEPyqqfSIj/nlNKtnxOAdpIYUzZ/wrx4wgK+TEz0R2zmxHLIh+97lKAeVXUmWOL2sm
	uh8veAp7oUUCZUV+++WkmEg66v4bN296q3dzDPheAnhWS/ljFRC6IBZP6IMdf5I2qbxtK1YYi1w
	Q48Dni4pZRHImeIJuUmb4n63R3vZ0ijMeE33gYymv+9weRktBEUA94zOKJyIqCUqi8TIbW0oC1H
	kjQy
X-Received: by 2002:a05:7022:b88c:b0:1b5:58e:b547 with SMTP id a92af1059eb24-1b5058eb73fmr8257809c88.22.1794787841852;
        Sun, 15 Nov 2026 16:10:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm24163844c88.7.2026.11.15.16.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 16:10:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/16] python3-zstandard: Fix RDEPENDS override syntax
Date: Sun, 15 Nov 2026 16:10:23 -0800
Message-ID: <20261116001038.440763-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 00:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132382
Content-Type: text/plain; charset="utf-8"

RDEPENDS_${PN} uses the old override syntax, so it only sets an unused
variable and the libzstd and python3-cffi runtime dependencies were never
added to the package.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-zstandard/python3-zstandard_0.25.0.bb               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb
index 86bd3a8ea7..5a3c7bcb91 100644
--- a/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb
+++ b/meta-python/recipes-devtools/python3-zstandard/python3-zstandard_0.25.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3ae87c50fd64b6f0942823686871e758"

 DEPENDS = "python3-cffi"

-RDEPENDS_${PN} = "\
+RDEPENDS:${PN} = "\
     libzstd (>= 1.4.0) \
     python3-cffi \
 "
