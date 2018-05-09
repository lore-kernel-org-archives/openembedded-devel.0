Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CECBE748A0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:18 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j20so11768730pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XRdMFc4Az9xN68huk1BUX1+iPO7jpIQqtYU/aPaOIZw=;
	b=vA3+ZfBHYe2Lt39WXA/7YXGXabbQU2fkHN5dQO10mjLZJhW1LScBqix1p3GeGaf9A/
	UOFfoGdHqS6cReJdgSgW//XJGbASEWC+Hx+4gcvzF5wlj1H8+DMSpO/C6zI95tOlt6kc
	2PiIdum5FkJHgnbzqiBwDWfOJa3Vr0A5ReTG+f1deho0werO8A4riZuUzJ3tS5wCjR1D
	lZFRSohHc96WR16B6ruMI+YvWh1RNCu0j3fyZ0Bmvkf66RcI92iQnLPiOE2mBPewZGfy
	ryaT2oqhi/YQeWDkbm04liDFQ3Z3KYm4J+jyb3L636xlEHpFFjwuss+dvE7O2wrWf2Vl
	bK/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XRdMFc4Az9xN68huk1BUX1+iPO7jpIQqtYU/aPaOIZw=;
	b=NMdRyd0ria89jg1M4zMb/EbwV5sTwNEjPlz1zBmXsupyWFelhUGKRUDlP8ruOnx2AU
	GEdbgl+W2ryxTDj+CPByBnuhcln6GGG6K1lsL6lCzv+kLJHNkpx7eV8jRusthZ2MpUE9
	G0hwSG2pSo+pgX/3sKWH0FsaZwd6EVST9fSJA1aU1BtBcmNe1YazZ4+b5YAPPlBoWzqB
	Tunko2qH7MEqMDGutqAn3iecyJcwLvGMHJR1sx3nhltB/adsvD4HnZjTZumCoUXYV35s
	R5Ue8pbJbyoDEPn4Is+c5jGBm1geZZG8BBXJPqavSCTDYNyWZAXCsdBiflpnbXq1xcoF
	n52g==
X-Gm-Message-State: ALQs6tBlZUT5Jgnb0Aslb6HlEpmKF86H/ytuZRtvTes575/71hk1t8n3
	RRnlMpnOy8tVo60LWhKMafQOaQ==
X-Google-Smtp-Source: AB8JxZqAeg98LvxuacsKE5ep/HX/BtWJxiP0+6q96WwO7qG4MNpWOTL/o+u961hdikozkTcqbFD8Gw==
X-Received: by 10.167.130.208 with SMTP id f16mr30450953pfn.199.1525892419396; 
	Wed, 09 May 2018 12:00:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 11:59:56 -0700
Message-Id: <20180509190011.30006-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-oe][PATCH 01/16] poppler-data: Upgrade to 0.4.9
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
X-List-Received-Date: Wed, 09 May 2018 19:00:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../poppler/{poppler-data_0.4.8.bb => poppler-data_0.4.9.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler-data_0.4.8.bb => poppler-data_0.4.9.bb} (90%)

diff --git a/meta-oe/recipes-support/poppler/poppler-data_0.4.8.bb b/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
similarity index 90%
rename from meta-oe/recipes-support/poppler/poppler-data_0.4.8.bb
rename to meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
index 343b6db812..b2af097154 100644
--- a/meta-oe/recipes-support/poppler/poppler-data_0.4.8.bb
+++ b/meta-oe/recipes-support/poppler/poppler-data_0.4.9.bb
@@ -17,8 +17,8 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.gz \
            ${CMAP_RESOURCES_BASE}/Identity-H;name=idh \
            ${CMAP_RESOURCES_BASE}/Identity-V;name=idv"
 
-SRC_URI[md5sum] = "00f8989c804de84af0ba2ea629949980"
-SRC_URI[sha256sum] = "1096a18161f263cccdc6d8a2eb5548c41ff8fcf9a3609243f1b6296abdf72872"
+SRC_URI[md5sum] = "35cc7beba00aa174631466f06732be40"
+SRC_URI[sha256sum] = "1f9c7e7de9ecd0db6ab287349e31bf815ca108a5a175cf906a90163bdbe32012"
 SRC_URI[idh.md5sum] = "009c93cf0141ab7bd6acb7eea14306cc"
 SRC_URI[idh.sha256sum] = "ae702c203a82ea124e9b96590f821db6fbf8754e2c4547a9dba0e82f94739e95"
 SRC_URI[idv.md5sum] = "2f32a45d43d001c26eeac6b878855fbf"
-- 
2.17.0


