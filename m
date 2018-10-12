Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id 038D479BAA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 15:26:24 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id p24-v6so6359123pff.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Oct 2018 08:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=DpRNDRCfC+aiNpzx/fDMAYZhNf65ddvOjRfHvPWOs4c=;
	b=aGrUmCQe4RT9f2yiWTq6KurHMcZqWE7ntops4Prusx5WW7ISO89ucsHoQz75YCKwWX
	KOxQBjR31tdkP3rylAA8aExoShmW/jOc/MisU3hS1wetzbOZMbr9nZTLCsAoMF5Aja4O
	ywSxunSvgMT80H1IlyctxA6Xk5usghNOIjgVR4rwQ68XLQ887RDlI1jgzKpMOtcqIVGn
	V43s9CKby9Scslrma5cFJeOmztXnBZQ7nTCk4/Clcb71YkbOf20DVqXr0/Vq56jBOyO6
	AQ2vqqxG/QQY4OjYyU2P2DtrTXDTtYGS8kJI6xveyclq2ceq0phq5MhhOe+wC/+6gmnX
	YE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=DpRNDRCfC+aiNpzx/fDMAYZhNf65ddvOjRfHvPWOs4c=;
	b=eq1tbFhFI+fKE3q4Yp/uCYOAwZx7SWTMdUrFIhUKh0LEjcpzRTlR0soKxW1MP6Vd70
	dH+o8JT/A9LlZGPD0gQ0dBF1YV+4w/HWWMRb5mqIAT+FYNk6bwSW+hCF7KET6QFenmb0
	dPCUT7sAkGHq5Pz9cMcUfd5GEXHGhVbmQKnzXGc9uVdA+MwyC9iwqcVDpAWOB6lYrz+Z
	ZjrQFy70uRG/9e6k65UbpgkeM6Qd0/9/g5DLIePEElQIcU3PVZNISoEE92Pk78t0G7GH
	tYVbKjzX8B35YIUScwSE46E7BHkzpM/vKYNuCnJ59xUYXnYsWSldDVB7x8O6qosjjinn
	bxmA==
X-Gm-Message-State: ABuFfohNgtWzwXWylx40ARBgeFl2YsKqk3U4bkaZbPfBuxlVcJr2gu5g
	x7HFNBrrgRN9k1F1IJ7Vjlw=
X-Google-Smtp-Source: ACcGV63dvqf347ZstKNZAl5vqQC7xmNs3g+EloOSO3DvxG2NZqoLCaq3FIc4V8p2utv/IOZ6xyj0Xg==
X-Received: by 2002:a63:ef0b:: with SMTP id
	u11-v6mr5942643pgh.283.1539357986144; 
	Fri, 12 Oct 2018 08:26:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:1074:2cb7:7274:2f54])
	by smtp.gmail.com with ESMTPSA id
	x20-v6sm3525729pfe.131.2018.10.12.08.26.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Oct 2018 08:26:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 12 Oct 2018 08:26:18 -0700
Message-Id: <1539357981-3675-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
References: <1539357981-3675-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/5] vlc: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Oct 2018 15:26:25 -0000

Nothing PROVIDES gtk+

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index f13c0ea..e395b24 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -19,6 +19,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz"
 
 inherit autotools gettext pkgconfig distro_features_check
+#REQUIRED_DISTRO_FEATURES = "x11"
+
 
 ARM_INSTRUCTION_SET = "arm"
 
@@ -40,7 +42,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl vdpau', '', d)}"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl vdpau notify', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
-- 
2.7.4


