Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A359BCA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 10:27:59 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.35856.1756981677650777295
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 03:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+VBr36j;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso5908175e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 03:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756981676; x=1757586476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3u2xu+5u1t3+3x0HH9MrS0QRSbmJdn/xAZqkKmvrSPc=;
        b=J+VBr36jlgxiCoW4tPocqxLkECIENMmI/3dFLekWh5efcAVrT52NFaofLUltd2b+N5
         zl3ozJB9J6G6Rp8//PjwP5UgslOpPiIPt1UN4zG/nPA2iduUfotOnzfejGruNUXfKZMT
         f0r10gv4TQtBxu5D3qpck/67Sp+auDwY9CNMvVpUssjuTO66CJPHVEh/ydrZ2kEKMN+r
         iucHXJH1NxJZb12DvJVB6f8E0Mt2buAXrSjtjmtORsdzFRarFiOKFmG5sAwC3oud5b2u
         xYkj/DKtzJ4+Wyow+vN9oO+9PZpzCNwbAiCBCogXo+y11MrN9FMY3YOBvAEwExwr82he
         UuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756981676; x=1757586476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3u2xu+5u1t3+3x0HH9MrS0QRSbmJdn/xAZqkKmvrSPc=;
        b=szsqbWTF+aPANx0MkJK4dfUtDPBN8tnxBTc+YbGyBjgE3sXX0AnFGDUIKKHOVtVPah
         FjfeaejEv7Q6/ROJemM+SZrRsx7bGNw640yD/Lqd6Hju4Utp84m9Tmy/6xV51qYDI2qR
         +KhQmNs+xVHnRTscYi60x9MgoM7Qi5J3Wkbk7RdQC34DqK4vUNnpCDGIu9eG59DTenCX
         0PSnNL/rAT+l5ymf6RHcHBsMfepaS1NHd/80X5qkMWGAEA5UWFi2W/d584TSnjdU7FAZ
         tYHD90V8GuxwVIRzOGe29Yii0OupfY9nRLycdN3sIqqSjZxA+GGYQyLbeGwHsxRyn6pU
         anXg==
X-Gm-Message-State: AOJu0YxXU08eeFz3t73/dlxIK6vsBOcWdm/yRiTC3dIcHPtkkY41dT4E
	FLAClV6N94Qz8ZRf3lUXa14vCrDp5hS8Zvhe550IU+0gYDgCLGu/uywJkJv+rA==
X-Gm-Gg: ASbGnctvLt371zh8txB5kEcvaT9oS1z7v24AXayPauMhIyLwDKYDxh5pzYb0M11r7xU
	6prS0gMRtpDGw7MVaR3OHTi2wI7t4NiRsVgT8Um15O08/+FGkiQaU5QkiRKSLewrgQRAXiEXSdd
	IGcOw55pTyJI9o9QOEzxiNOgajHOdru+mLqMFjC2kg2liK4zhPmEWB1h5cpwo/Ea/kXgAo/b89m
	cvR0cpvo0J8+2KD7F2tqLMKx99b/kegV3BVyBeCumR4v9fxttr1qkjQm7QyUu4blcyQGH6s4DoD
	Vn5mMZtVwcwM/W2UL/ouI926p+8Axmz0tAGxxbS2rKc44ipjKxqFAM0UeCLULpcmEdyJOVyzgNN
	NWEoz5JisVpbMKtu8ipHvlqLHzSVTpkXyYn8BlrIpdpkl
X-Google-Smtp-Source: AGHT+IEJ2Zr874DlY+ihyk86kTAkr3vwL1km3j+Q13BNxng9CNO/xm6A5KRKhJs4YGOVp3gagUbaMA==
X-Received: by 2002:a05:600c:a59c:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45b8556a7b7mr103694465e9.12.1756981675744;
        Thu, 04 Sep 2025 03:27:55 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05faa9esm14925335e9.3.2025.09.04.03.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:27:54 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH 3/5] python3-identify: New recipe
Date: Thu,  4 Sep 2025 12:27:46 +0200
Message-ID: <20250904102748.602126-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250904102748.602126-1-zboszor@gmail.com>
References: <20250904102748.602126-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 10:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119281

It's a dependency of python3-pre-commit.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-identify_2.6.13.bb                | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-identify_2.6.13.bb

diff --git a/meta-python/recipes-devtools/python/python3-identify_2.6.13.bb b/meta-python/recipes-devtools/python/python3-identify_2.6.13.bb
new file mode 100644
index 0000000000..2bc0d1aeed
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-identify_2.6.13.bb
@@ -0,0 +1,12 @@
+SUMMARY = "File identification library for Python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bbdc006359f3157660173ec7f133a80e"
+
+PYPI_PACKAGE = "identify"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "da8d6c828e773620e13bfa86ea601c5a5310ba4bcd65edf378198b56a1f9fb32"
+
+RDEPENDS:${PN} = " \
+	python3-ukkonen \
+"
-- 
2.51.0


