Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 729477FCF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 19:11:36 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id kx11so340165pjb.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 11:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xh6BsK3ehWq6RHt8drD+yWj0oItrFQh73gTSOpdmqCA=;
	b=bzOHqRtW19J+/ibneAYp6wxMjJSixp+PFFTtBfyisE+kSXQeQBs1km+8z80Cw3Jf3a
	s3pgRF7mcnaRJCKZf0rSvJQ7ugmwCudhim4Jm78YgE1945lfZV0gmQW0PGmuFQyXIT9A
	5Qz/gDxNVr8Mq7/MT1C9hEn77ncOB4IG8OujDslZNrJPCJpxNjSax3vwR8neuDPNuKxj
	sWPKN2SnHEHaDNOUHP0m6TkhzkMdn1QlMSsKFZW1xGrM98xswbP8wmTU3XjsyXORA/LH
	GKIv85mIxOQXI64ib2J54u66qaL2JTo9d+iQvi8Z47bPuUbABeHKcBh318BNLNgvOC3B
	mNWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xh6BsK3ehWq6RHt8drD+yWj0oItrFQh73gTSOpdmqCA=;
	b=HMOD07rNJw6Q7I3w5rkqySkTNyyvH3lNFXfec3dHZfX0GJXD8S785MMnjmy26OD/Gx
	fldKkl8qH1l/pmnSMSanIRPScxxxiMYLDX0ytOmvL45aHqkDlNToOmybSWSPj/omkAut
	n4SzqvS4Xn8X5PBvhvpRWFMxu6fVtIi+n4gHMAFvFajaneaFlz+UQRiRHKi4JJyQZSvn
	E52xArPZ/vKUmQeM7FhrM88G63U9zDkLuNimTHAgV2nkTFEYbaNhwP4JcuBka++SyORj
	UAa2ud0b287wr9MjnoFQtVdTLxDtA6qtg81VDIrVdnQkn65LjNKNv/oDV1y3zmdSMyoF
	51cQ==
X-Gm-Message-State: APjAAAUvj9A2AoB0QcvBPrMF2MmlhxPxljjAEJ6+/Ifu/ty0WR+zepSj
	KD6E/w6zrIC0NuQbxBaCKEUJaY9OZYg=
X-Google-Smtp-Source: APXvYqys6kQlgtr4s3I88shxdPpi3p7f+KcAUZXQMvMIparbnEdh/67hV76pGa19evMNRwwQgHFQnQ==
X-Received: by 2002:a17:902:be0c:: with SMTP id
	r12mr347995pls.197.1579720297192; 
	Wed, 22 Jan 2020 11:11:37 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	c19sm50595184pfc.144.2020.01.22.11.11.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 22 Jan 2020 11:11:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jan 2020 11:11:32 -0800
Message-Id: <20200122191134.3307089-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122191134.3307089-1-raj.khem@gmail.com>
References: <20200122191134.3307089-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/4] python3-pyro4: Remove absent py3 modules from rdeps
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
X-List-Received-Date: Wed, 22 Jan 2020 19:11:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb     | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
index f9dd9300b0..ffe58ee9ca 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.77.bb
@@ -11,8 +11,6 @@ inherit pypi setuptools3
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-selectors34 \
     ${PYTHON_PN}-serpent \
     ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-zlib \
     "
-- 
2.25.0


