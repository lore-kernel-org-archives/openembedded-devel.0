Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8BD770B4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 15:08:54 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id x4-v6so9637775wro.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2018 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=oLUQ/XM/fSyiHy0I5n6t4zYzzF3AuRp8m3bHuqpc9vc=;
	b=N7DCQmcAsNbqrJQ0Zl8Y44/BOxMiNCZ3AiitY+pn9sHwpyDMLUql9T/34QogT7jJlL
	CynK0QMOeZVF0H3JJ2e3eWMx98LrkRCJVdJTgEYyO1MI9Kb5cVrYzbwvfesYPzaI+voe
	ea95C2aLwKiBe6ZtobrsGc/JMPr/S2zTqeZTy8NvoJcKn4wUJdHPZYJKrXTb9Sv6nYgz
	XXN6HKFTZwgenymv/gx8dighQoPydgy0oDz8hc/ljQaCuPRww/OowzlPDZ+v6cwRatkV
	D/NFPhsftdhY3QxjjCT+EBud7pGdP+3CtT6cVFvxzfDmX2Wl7erEGY+iTnat4+HEQFC7
	dwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=oLUQ/XM/fSyiHy0I5n6t4zYzzF3AuRp8m3bHuqpc9vc=;
	b=owjmTnSjsefMP7WUxVzlUjUciNj+UM9p5YlLkiCSZnWBLQlhoK8Y7aj55fKvLNL3Yb
	tJes/cUgr2GQu0CMWpvkMDf3up7s6QvZsa1GO+Y0DBiVNVmEoCKYpY+mDJ9dOJm6OjVu
	dynxRXBYjCfmTTqbxGfmXs3iKQMoqTRqZR5VH5xuHsjEUjQcIrniEiSFaz63z5//ABja
	NdzmD7ug2kOtjCF/69qJNVrzPQbzKLSsYU543yGgkqEoOyJx2E8fVA9b6FT3X93Hb8OS
	uTZR9ISlOcJEc3PiDqviZd1DVfkTxudWBrcOqMdg1OekWS8EOhSIBSJ6pv4DrfyQIUpN
	SUgg==
X-Gm-Message-State: APt69E2o/3oDP7MGHNeKSNYfCVVOUpNztD7+Vkbyr5eyHnwns3H1vLnd
	+tzT/MfOd+qgRBqdFM70wdp4XQ==
X-Google-Smtp-Source: ADUXVKKVWAy/Zx1isHDXjtUpoZgYKa7askEwwD8fhibOcD0vRsPJ4n9D1hfvyQ3miMG52Jq6EeSEyw==
X-Received: by 2002:adf:c4b6:: with SMTP id
	m51-v6mr10443547wrf.103.1528643334947; 
	Sun, 10 Jun 2018 08:08:54 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC13F69C25723999916AF42.dip0.t-ipconnect.de.
	[2003:f0:7bc1:3f69:c257:2399:9916:af42])
	by smtp.gmail.com with ESMTPSA id
	z16-v6sm43360230wro.41.2018.06.10.08.08.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Jun 2018 08:08:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2018 17:08:14 +0200
Message-Id: <20180610150821.9536-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180610150821.9536-1-schnitzeltony@gmail.com>
References: <20180610150821.9536-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 12/19] xfce4-whiskermenu-plugin: upgrade 2.1.7 -> 2.2.0
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
X-List-Received-Date: Sun, 10 Jun 2018 15:08:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-whiskermenu-plugin_2.1.7.bb => xfce4-whiskermenu-plugin_2.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/whiskermenu/{xfce4-whiskermenu-plugin_2.1.7.bb => xfce4-whiskermenu-plugin_2.2.0.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.7.bb b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.0.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.7.bb
rename to meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.0.bb
index f0780c701..34f622ba6 100644
--- a/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.1.7.bb
+++ b/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whiskermenu-plugin_2.2.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 inherit xfce-panel-plugin cmake
 
-SRC_URI[md5sum] = "5cdaaf5799c3f976e8cee81ed24c7fe7"
-SRC_URI[sha256sum] = "045c48bbe6fba62a46c2752a9eb3533f03bdd29dd23af29208622b79eb045e39"
+SRC_URI[md5sum] = "2eda14e43e37222035be619327c604cb"
+SRC_URI[sha256sum] = "8f68492a38cb2d148867162adff947dd37fed162b4ef4f31910660229ef00ef1"
 
 RRECOMMENDS_${PN} += "menulibre"
-- 
2.14.3


