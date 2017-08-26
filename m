Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 483646AC3C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:30 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g13so1334329pfm.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Y/xAZyl4TDDjx3sqrmqEw9zPJ76fgL9nn1HpzIS9k58=;
	b=Xp1NMhY/d7iaO6W5hekevaJyT2ddIEUWnsMRphPCvJnPKUyM7PIiuF5KhQ2ggpwy0K
	YaOiQVFXCAvrhlz75h5nG80K/e9bmppl33hoOT4rtg2+AqS2DinRlWHMpWf7oBJFqaWm
	iNNzutY73yxPuRTc7nVRHlQ8Ec06M7dyIukL37S3vI2M6rlYhdN46dQHDGNR3iHOHd3U
	MdyVNve+1rIZPczQ8AxHZtnzTnPgS405eJBPUHIqHJIrJWdpKJKhE33SR4giuBrOUZQG
	wQ7F1wvk5vA/bTf/kfYPnEQXu4lcKT38lI/rkyr0ATmD1xCAJwYCLZwMkowndpxZtcYX
	bZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Y/xAZyl4TDDjx3sqrmqEw9zPJ76fgL9nn1HpzIS9k58=;
	b=nTZUqnFx/J7e+bH6dYV8jQL/cR102Fsdw+vNUmR1PvPZkJu2uAHyKOMTDuvztw7hC+
	0q/eHjYWwTnp7uFVGEgYiBOnkPhk912HgphwXaYwKt1zAaPq9dPj3rX6B1LCyxiakqBz
	oUhesRapzbaJ1WLTjB+agZyV6QYs0SJpZqKMFh4YABuKVyxmQ1FE2z7pRC63KOoS2rvi
	ccsl4gW641X2Qp19TQq9klZqJKjQVDuHQtkBnWwPoozrt79Bwo32LNdb7pKUuTBXwz3g
	Yedwesm+S/NZUGXJ9qt0UbtBvG1a+eKcNFAFgx40j/Ubv5/9O6W297A5ZOR8N64ZE0Ap
	ImXw==
X-Gm-Message-State: AHYfb5h8ZYwSU/vj8K6/REiRhOdOlbD1oijSN1iVA3Ah3ALR5k9SzbC6
	iOiI5YR1Vij/vewm
X-Received: by 10.98.141.149 with SMTP id p21mr2487699pfk.264.1503772532243;
	Sat, 26 Aug 2017 11:35:32 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:17 -0700
Message-Id: <20170826183521.34294-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170826183521.34294-1-raj.khem@gmail.com>
References: <20170826183521.34294-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] vboxguestdrivers: Upgrade to 5.1.26
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:31 -0000

Fixes build with kernel 4.12 along the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_5.1.18.bb => vboxguestdrivers_5.1.26.bb} (93%)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
similarity index 93%
rename from meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
rename to meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
index 4085b9fc7..fdefe0317 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_5.1.26.bb
@@ -14,8 +14,8 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
            file://Makefile.utils \
 "
-SRC_URI[md5sum] = "1a7db64cd69ba6d39574fb333e031251"
-SRC_URI[sha256sum] = "7ed0959bbbd02826b86b3d5dc8348931ddfab267c31f8ed36ee53c12f5522cd9"
+SRC_URI[md5sum] = "d3aec8190c649d7e0d92ba374779dfe3"
+SRC_URI[sha256sum] = "b5715035e681a11ef1475f83f9503d34a00f0276b89c572eebec363dda80c8a9"
 
 S = "${WORKDIR}/vbox_module"
 
-- 
2.14.1


