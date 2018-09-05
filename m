Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 80151793E6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Sep 2018 21:02:34 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id x17-v6so4098864pfh.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2018 14:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=92yGilmE9OqroRARrFBtJ7KLgFlxEZT5FVL7UeXN9BM=;
	b=W2osT3Ni8fVOUd9F7z1l46N8DOfvicPaX6CqAJzLiAH3BzApQvyttCrtu88fG/Ig0c
	DxgyMXuURBlSrf5mK3vzsXmR3CJKvKP6iQNdf7H8XLWac6W54sq+M8YEhdNAEWJ8izYE
	5BiDaZT3Ap6Nt8TvuZB6JWnwabEITTFQYVIquro6S1kGQJtnj/RlK+bPsWFQa+Alg7Uc
	1a8OXmE0dGWrsKLb76CQgKyHucxWrVmyYDvs/JpwFS38VdDl0CmFymR1uzSLhEX4YyzI
	WMt5I84QVRXLslOl25hdU4NgvZqvYKDKg0K31qI3ykpY8Ibpi0nmellLrcKuDM7L6paY
	lqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=92yGilmE9OqroRARrFBtJ7KLgFlxEZT5FVL7UeXN9BM=;
	b=BwBnlC/fg2KeAXC8DOaNK2VfO27IQRGyyy9/TJOrews9xGxGAKY5tb9aEdPXURsI+p
	SY7WjmpW/3zcNvZhT5O3leIjZehVS8tfR0toHwkMmEYjpkawQoZgjsiU/MRMRO/kTaBi
	ut0/CHsl3KUJQFyALGh+NiVFqFK6SK054U5F1SjWqDlFBsv0dVPKC6NHXX0FVQhez7cI
	sQ+g3u05ItLMAagXrTXZlMA0OdO1lCasr7Nm59tYkSeco/TgRfiNNPT9wXR1qMm09Dw1
	hlSqfqPvbrWFDuEJvJOTlD8fkBVcwgAXa9Hh6VyfcyYqI6PPRH34C+qnpvWnzFGrsLu9
	eP9A==
X-Gm-Message-State: APzg51DXn8tDcQ97XDiFEhYKLC28B2diAFhvWVqGYoQujrq1NOr0rUax
	Hc0OGvThJQIgI5o2GTQzuajOITrB
X-Google-Smtp-Source: ANB0VdbyHVZVtJAx/BQVHMv9J1K7YHt3rVHtXKRNRIz27P12o91KzrHH5UAZ58AUSgb6oW8Wo2P9Kg==
X-Received: by 2002:a63:e14a:: with SMTP id
	h10-v6mr38116041pgk.358.1536181355315; 
	Wed, 05 Sep 2018 14:02:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	e26-v6sm3689411pfi.70.2018.09.05.14.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 14:02:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Sep 2018 14:02:16 -0700
Message-Id: <20180905210224.21225-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180905210224.21225-1-raj.khem@gmail.com>
References: <20180905210224.21225-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 04/12] opensc: Upgrade to 0.18.0
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
X-List-Received-Date: Wed, 05 Sep 2018 21:02:34 -0000

* Fixes build with OpenSSL 1.1.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opensc/{opensc_0.16.0.bb => opensc_0.18.0.bb}            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/opensc/{opensc_0.16.0.bb => opensc_0.18.0.bb} (87%)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb b/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
similarity index 87%
rename from meta-oe/recipes-support/opensc/opensc_0.16.0.bb
rename to meta-oe/recipes-support/opensc/opensc_0.18.0.bb
index fd67181dc2..92a3bfeffb 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.16.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
@@ -11,8 +11,8 @@ SECTION = "System Environment/Libraries"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz"
 
-SRC_URI[md5sum] = "724d128f23cd7a74b28d04300ce7bcbd"
-SRC_URI[sha256sum] = "3ac8c29542bb48179e7086d35a1b8907a4e86aca3de3323c2f48bd74eaaf5729"
+SRC_URI[md5sum] = "bce516f752e0db5327aa06cc0136fe27"
+SRC_URI[sha256sum] = "6ef62b00e8fdbe3e386c3ee25c2cadb56c1931ea42f1a11dce8c947f51b45033"
 
 DEPENDS = "openct pcsc-lite virtual/libiconv openssl"
 
@@ -21,6 +21,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 inherit autotools pkgconfig
 
+S = "${WORKDIR}/OpenSC-${PV}"
 EXTRA_OECONF = " \
     --disable-static \
     --enable-openct \
-- 
2.18.0


