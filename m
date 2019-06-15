Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id DF03E7E9D0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:35 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id d30so3406465pgm.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LyFIkF2R5KDrfMoANPmldCu4T6E4Yl74jVmrQ/WPaXA=;
	b=szxFJm4xyDh3VPy/1W0jYdRGw89fVpkbqeYDCU/8IEGUkJ+qzfudCgaiQ263NbLh7q
	8SLlIQek4q6hbxMX9Wz++M945a73llu8QkoYO2FtSDHUpgWD7gfZbJe6X6IUaB98xz1v
	tP4/lfqi1FSTrJTfQYDlyZsttUglwG6eClzz08T405NSN9nMtTlKMZN4YTmdLw2Ho8LF
	HsBeYp+lMIiIsAmjYMab+1DtwaLpnW7wfkEM2pIBLs+dUA5yE7XC7TH+41vSzT2YJLv8
	yagoYo3cykIwTFnGZHsxkxU6H4WUMVGwFZ6NOK/5IbtSJeABfL6TrlIsDaGdViDXYHBI
	yn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LyFIkF2R5KDrfMoANPmldCu4T6E4Yl74jVmrQ/WPaXA=;
	b=TN4T9EkEFOQFOuqqROPya8gJise7eV2OmsgkdMPfej6D1pNHEqNda0gzYU5lkAPNUA
	fwe8AWAu7XTbKe5wsJA0HAEmeiMtSmfF9MR4HxF+mVlOfRLebhifku8yVT6uFXCdcULH
	Wr5dVe9LksZxNXajTplvFGD+i1sbBRCA+pDk+DjsoFnNGBCzF6G9hNlSxoZGQJ4mHIQc
	CCpNR88m1qR9mSui76JNH7JgBcoLUf/W9tfw8yzQriSaLNtNJaStPuRyz7j0lh/bsO/Y
	SDn7ViJwu2sEU3sZqRmnYDqfrwBbc6oaEfIX2Zgk/0nvG4YUSkFGCiL3hPu9DPtpCip1
	eITQ==
X-Gm-Message-State: APjAAAW6YmdbCHgkRtn/wZb9OBNregwwbibTTqu2OWEHza3NcqdRWlEs
	DHe79sNh80g1rYAt+qWHxFPmaKq/
X-Google-Smtp-Source: APXvYqxTrOs6DPGN9skoN38/+LAj6s9I61KbCCYpV15BqRoDubexrB20hza8gjajku4p4IXUFNhTIQ==
X-Received: by 2002:a63:684:: with SMTP id 126mr35612790pgg.401.1560621456891; 
	Sat, 15 Jun 2019 10:57:36 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:09 -0700
Message-Id: <ac3b63a7405aee4ca86f4d99908731ccdd2eb4fc.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 05/23] mscgen: fix SRC_URI for multilib
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:36 -0000

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/mscgen/mscgen_0.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
index 6ead015..276ad20 100644
--- a/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
+++ b/meta-oe/recipes-support/mscgen/mscgen_0.20.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.mcternan.me.uk/mscgen/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b1e6a340187c1cf716513439d07c1d79"
 
-SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${PN}-src-${PV}.tar.gz"
+SRC_URI = "http://www.mcternan.me.uk/mscgen/software/${BPN}-src-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "65c90fb5150d7176b65b793f0faa7377"
 SRC_URI[sha256sum] = "3c3481ae0599e1c2d30b7ed54ab45249127533ab2f20e768a0ae58d8551ddc23"
-- 
2.7.4


