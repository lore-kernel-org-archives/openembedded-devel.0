Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id BEC3D77EA8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Sep 2017 04:56:59 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id u18so4290481pgo.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 21:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aWxb7xQCNSy5/wlAyeV3E1faCf5ADyyzxjOOnHTA8ow=;
	b=EF2ytXsBTomJDM8DFMDniHv1RBjRR3WOwKNYVoGi4chZdsn/kTSi+56QbacbnwTNP9
	QUTH3KOnMxGLlt5zwy9O0ExoYplzaTx89pJ4+jSsVtPXeRM2dSb+s/IBTi2bU6ie2np/
	s2jxSvWzBMz2IGyHaT2TBQzin6p0fUONyohhp4OS4mxqC1kV2tELgYwQmrOIMSQw6UM2
	jX8Z/xZOxPbxxRmWet78nHYjofySC7GL+HiDyaFOHenBD88iiKRNe2/2mk4Ww6r3lEJ9
	DzK8xOELmE2qp1oUYm4G+ps6uiIMqtxzBWexFnGnRhuZd66+mg9CQvkr7ANSz93iWrJq
	NZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aWxb7xQCNSy5/wlAyeV3E1faCf5ADyyzxjOOnHTA8ow=;
	b=D3+SR+7Z/IqbFONjzDmoV49YOFaRQjsw/IA0j5EBz2PVhPTsi85sCgds72Xdgesd8K
	TcmDS4X0HA5OuUmP9cHzqdNzvcR65WREZd6WZK2Qzcc+KF04oXUitUmKXtJ3kSW1RFn1
	beI1rNKcjKoCiEFwGlbLCfXiBGXKGC58/FiafYE+qOZPUQFPBgN2/Ey3mo+Hr4ytOecj
	eamFV9paSzpQFhkzFpcPOVMZQ27+eQjDKNEITqW15pZIHPOmVtJcvWEcfzBR7Y4h6bFJ
	IB/K1/xrBWVekzMls/thtjuutl1Ux9evDjwM/4wjEylgQPc6hjg6t0LtTPCawI8GI7Jn
	rncA==
X-Gm-Message-State: AHPjjUj3vQ3lYcQaOJxo8hErviZcINp0ACetQ++mu0j++49EUYHSwVS0
	Q+vqMF4oKdw3781nzcVsbQpq1w==
X-Google-Smtp-Source: AOwi7QB5SuIQT6dRer0uIGrZRo0fjzzHfYLlIbbE/wkHojtTr4pLUBjCVmcrvtRenUw5J9tjrWSaHA==
X-Received: by 10.98.79.23 with SMTP id d23mr6412981pfb.105.1506315420810;
	Sun, 24 Sep 2017 21:57:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::b736])
	by smtp.gmail.com with ESMTPSA id
	p127sm8863496pfp.168.2017.09.24.21.56.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Sep 2017 21:57:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Sep 2017 21:56:50 -0700
Message-Id: <20170925045651.32107-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170925045651.32107-1-raj.khem@gmail.com>
References: <20170925045651.32107-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] c-ares: Build native version
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
X-List-Received-Date: Mon, 25 Sep 2017 04:56:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
index 8d297aa4a..70e497f5f 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.13.0.bb
@@ -20,3 +20,5 @@ PACKAGES =+ "${PN}-utils"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 FILES_${PN}-utils = "${bindir}"
+
+BBCLASSEXTEND = "native"
-- 
2.14.1


