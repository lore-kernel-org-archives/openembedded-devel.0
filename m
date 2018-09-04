Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 19C3774FCB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 18:58:04 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w14-v6so2058037plp.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 11:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mt+NcpkHfjBJZ20WIVLaPmf3PgNqixfzaVWOMBg4N8Q=;
	b=TeCightmNHMqNVAffpunZHbZDCAj/xdHj393KtM2VQnA9Xsp+qyW+s7kLHkQYOpxav
	fl+D8wXbRIHCVk6ro6a5cM2KV/3L5QvB7xINwjnYV27kLeNSRC0rzkT0t3F9mUSHaC5D
	99XEksylZcehFdf243VJuInxtMeHSTN1GaTnEw3oyPt9qI9ttORKugIAJ4/8QgGsLmfu
	s78swbtBx3ldYfBKLwV7srwKD9ytMcrfE79l/xFWymRahfCxm9STtJ1enZd/bPolM3Iw
	8pDRfSdj8EvVP99TvSnruAsmuu9MaYEDm4ENxIB/+9pBe6blYFXK7dJkDw1L/k3nfB1Z
	6lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mt+NcpkHfjBJZ20WIVLaPmf3PgNqixfzaVWOMBg4N8Q=;
	b=WuFtzcko4ll2NVbYwDACiqZy5/BQfnzxikY1UAbOcFKM9Utx+KJU0QwrGT/GBz7uEU
	UTanP85WWcI/YC8dzi2ANXKxYn1PgpfmzJOwEOxylQ8770nVcRbZkex1/bQoeZ4iANTg
	qeluGNOf3e7NNX3z8h5lc5BzfRBA5HI4c5rXLBLUokiSokJFJPd+hlEGzXb3GzIHiyjG
	ePgAILonwIT1ftItfMv8VOOpegB+GBPUlJKx87jdBW+iHQLhql+oQdnhynX/tXn8fVk+
	bGdNS+kOgBYagJdCeHklqY6EO3kEjHE1DtyFDW1mWfpopA/nnWL/EwVAUBfcOUvqe0KM
	DfwQ==
X-Gm-Message-State: APzg51A7wz8GXBpvBKxgfo029BHvRX2NyjO0soofFsPVZrsRRezTyImG
	JkNvBV0r2bxGu2O6U7uv9jvUSrnc
X-Google-Smtp-Source: ANB0VdZ2VxTDCFQfexKiclHs+wLZBx1etsdUkXfdh3vPTNfR4Tj37gZtFI6zkN46m7UdE2Gd49lqMA==
X-Received: by 2002:a17:902:aa49:: with SMTP id
	c9-v6mr10732067plr.195.1536087485787; 
	Tue, 04 Sep 2018 11:58:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	v7-v6sm33722784pgh.57.2018.09.04.11.58.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Sep 2018 11:58:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Sep 2018 11:57:46 -0700
Message-Id: <20180904185750.23747-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180904185750.23747-1-raj.khem@gmail.com>
References: <20180904185750.23747-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/6] libp11: Fix build with openssl 1.1+
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
X-List-Received-Date: Tue, 04 Sep 2018 18:58:05 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libp11/libp11_0.4.7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb b/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
index 949c33752b..87d99c1a68 100644
--- a/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
+++ b/meta-oe/recipes-support/libp11/libp11_0.4.7.bb
@@ -22,5 +22,5 @@ do_install_append () {
     rm -rf ${D}${docdir}/${BPN}
 }
 
-FILES_${PN} += "${libdir}/engines/pkcs11.so"
-FILES_${PN}-dev += "${libdir}/engines/libpkcs11${SOLIBSDEV}"
+FILES_${PN} += "${libdir}/engines*/pkcs11.so"
+FILES_${PN}-dev += "${libdir}/engines*/libpkcs11${SOLIBSDEV}"
-- 
2.18.0


