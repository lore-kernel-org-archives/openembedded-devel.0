Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D349278267
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 12:07:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id y5so7606980wmh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+XWjfWCAbwuBvK5jIMeaGAeDDtlFHLsG8s6mn4qDrr0=;
	b=qGsTWjI9IleBddI7H2L/SSd8OFt4drBLrV0V6hf4Yo0Q72k1oxdUkUxprDAPar0Lgx
	xPyKb+0sYIDEg1/i+rj7bU3+iLg+4spZp2zgxVoJxA7cRVpcsDA1t59je9hozAoCCM1s
	y5Iuu9EQqMveXoKEzsrNmWCnCrFefExMcQWXBlnDM5s0hS82pIiDcHsdKdRCYEPXZHjb
	f+Jwxt9hbwlub6ZkLckub1KKc7/UVBFXZo5aTENLrTTwayPtWACrE+Hh28hnNTn6xQSO
	PbLtcBuOKIWtzaqUgdmr01Nfc/Vta8jNZ7xyAm0L418EPlu8rKDjPMgJ/eOpSXGy6nXV
	ohlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+XWjfWCAbwuBvK5jIMeaGAeDDtlFHLsG8s6mn4qDrr0=;
	b=Rz5l6A2xjwknNB6YRKrgbV3H9s1Lrqupy5ZppFb7h5mO+6XddKVLCX2ysX3ngGu+x3
	S65kgxluKV61LeIYJhfQibCG9jfPFWcGkuwcwLFlq7xTekQaGP7Ay3qe4meWqS1wN0km
	hyVlDCt2QYLyEF+DWL9ULMDAoxcH3LwsVib6jpzRMeJO/qh4MnBfytWb+BjuUbtz48y7
	hZuc6fU1/DeBi5JM14pJr/72e9yUVMJHBo/SJ566tBOA4ucxV0gofuGptTvy7F7XtpTZ
	jAdansRDxHIVoLgJhUEpfT1xm6R83yD/ByyY8zYVoYQ8FGXC6Amkkqahp36nOna9YtfY
	Zrmw==
X-Gm-Message-State: AIVw110yZjWNLPclGZJ0Cj4Y6L3IlW4VtrBgqjzxGtdjvrE7QcxGLr3L
	PuTu3d68QpkFGUBi
X-Received: by 10.28.19.205 with SMTP id 196mr5819569wmt.122.1498824463380;
	Fri, 30 Jun 2017 05:07:43 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-134.hsi12.unitymediagroup.de. [109.91.251.134])
	by smtp.googlemail.com with ESMTPSA id
	d91sm14159496wma.7.2017.06.30.05.07.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 05:07:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 14:07:29 +0200
Message-Id: <20170630120731.3745-2-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170630120731.3745-1-schnitzeltony@googlemail.com>
References: <20170630120731.3745-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] babl: update 0.1.16 -> 0.1.26
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
X-List-Received-Date: Fri, 30 Jun 2017 12:07:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/babl/{babl_0.1.16.bb => babl_0.1.26.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/babl/{babl_0.1.16.bb => babl_0.1.26.bb} (72%)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.16.bb b/meta-oe/recipes-graphics/babl/babl_0.1.26.bb
similarity index 72%
rename from meta-oe/recipes-graphics/babl/babl_0.1.16.bb
rename to meta-oe/recipes-graphics/babl/babl_0.1.26.bb
index daea052..4fa2aeb 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.16.bb
+++ b/meta-oe/recipes-graphics/babl/babl_0.1.26.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 inherit gnomebase
 
 SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a1c72e5f5d55a8b736ef2fa67ddb86ec"
-SRC_URI[sha256sum] = "7d6ba55ec53ee6f6bf6945beec28839d09ff72376f4d83035eb379cd4f3e980e"
+SRC_URI[md5sum] = "c5dd31d249379a75dec224a152bbf8cb"
+SRC_URI[sha256sum] = "fd80e165f1534c64457a8cce7a8aa90559ab28ecd32beb9e3948c5b8cd373d34"
 
 FILES_${PN} += "${libdir}/babl-*/*.so"
 FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-- 
2.9.4


