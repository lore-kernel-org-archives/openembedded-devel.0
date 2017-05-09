Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9B9C71A91
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 May 2017 07:57:25 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 64so6492851pgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NP0A8+AzW8w8JfyoSj9EXszU7g+dQWgKR0ec+dh96GI=;
	b=BYvpKHFmF2SyrJsvQg2+QjPjwDPvC9tRaMWZux3wr83kUDeZDxb4Q7H+lAzZfVEe1A
	zVOdoWrQoIh/IkKYLnaB1DwTKnLErSTTwm2Uh9H4N+gLpn5s+ybkvVZi9YgWZdq5v2ZO
	xFjBm+hWEBfU8VIhYouFRERaZlHn2wlQ4jnbu6t2Sn5+T2PHDjNYjG3WFlpdx9OgD38a
	M96s0wICQvC11ISqcy+AnoNKtVOfKLSqgr7NzgHN/UPk4lz+IMbytQt+jpOqmUBJDt15
	hy+Q24/A0/8tr3obBlp9ke1oXOcLZz8PBqxGDIPOVp1k15nrr2enY3R6hFQL7BXdOqqJ
	h6vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NP0A8+AzW8w8JfyoSj9EXszU7g+dQWgKR0ec+dh96GI=;
	b=mR6E96ELL9DdvAYeCnkhJQCxQJaHMtnQyRLHsIbKC27GAUdoFbjV5HYJGhQvxIcSiY
	9yGhF9ozBfxfjiRhmVebCIQWX6Wz2anlBg1eo0Kt+WfPSlUfjkw35JwtPUS1FPbbd9iX
	WKAUBP/CgTGHzVNQl+zWzpADr49pr273nrCsSxk7gjfFXfv9X55YuH/swW1zrhnoi2VM
	gm62GkUQ5wZHX9aPJgbhNxd7GaRq0Lgz6J/BM3cVAeyyLsDsyRLRUkpFkSxt4/Ajw/eO
	qMeMHg2TKGTxZ1LhHt5s3s1UVvY8apAuo7swPQ2SEuXkqrKZvKcNuV8iwGvR2Cr4jjYT
	wR8g==
X-Gm-Message-State: AN3rC/5+FBdL8mjQNoMyUfMoL1N98Cn0ERB3FcilbLlEZqxm4Felz7iV
	72EgUp54GgkizWUD
X-Received: by 10.99.119.141 with SMTP id s135mr23155420pgc.133.1494316646531; 
	Tue, 09 May 2017 00:57:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::c232])
	by smtp.gmail.com with ESMTPSA id
	i67sm20250916pfk.87.2017.05.09.00.57.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 00:57:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 May 2017 00:57:07 -0700
Message-Id: <20170509075711.1575-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170509075711.1575-1-raj.khem@gmail.com>
References: <20170509075711.1575-1-raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 5/9] gupnp: Update to 1.0.2
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
X-List-Received-Date: Tue, 09 May 2017 07:57:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb | 8 --------
 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb   | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
deleted file mode 100644
index ed0717593..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_0.20.14.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require gupnp.inc
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/0.20/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "63346ef90ac5cd925c3a941f51d8bca6"
-SRC_URI[sha256sum] = "77ffb940ba77c4a6426d09d41004c75d92652dcbde86c84ac1c847dbd9ad59bd"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb
new file mode 100644
index 000000000..1bdf7d79b
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.0.2.bb
@@ -0,0 +1,8 @@
+require gupnp.inc
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.0/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "afd96fe73856b38aaf1baf7526e08edd"
+SRC_URI[sha256sum] = "5173fda779111c6b01cd4a5e41b594322be9d04f8c74d3361f0a0c2069c77610"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.12.2


