Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB1A755B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jul 2018 01:27:16 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id i12-v6so52840552oik.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 18:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=fW9TeMKoVZhhBgEEEFwbJfWMw4VPk8BH4POlKCEx6SQ=;
	b=qwFHwfybjjcTCTzKX6XO6FDBbB8v8pxcGQlwQa+Fcf1AdcfIdiihp0UE2Zpqe6E0eO
	hp1KKKFh0gOe7DH4p5AADTvCeI954502PbGO1X+c/CgxB6TcjloAzrsfPDpE8ai5p6jq
	3E79GGWivvc4GNqv2za18DOYSsQj+ODEstKVP68Wh7HfmgLQ+XNTIplb5zKWqwwPncs3
	cM6SzoesfZ+9QVRSl28uGld3JMwTReSUbevpc/2Zr8eYrZzCZvd6m6ja1KGTe4JHKy0j
	CjF2MX/G7nooniIbBWzlAabLd0PchqJ+X5Y9QlyixfcbTZzRn6orUCFMD9E1Q+M/ErsI
	TVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=fW9TeMKoVZhhBgEEEFwbJfWMw4VPk8BH4POlKCEx6SQ=;
	b=cMeYX+HOGDoOvLDt3MfzH/AcGfV3g1kCX9f8dzfvgccjJDcIfyqCsDCVXqiZ1gwBeP
	CNwikSpipewkuFa9Lpo204RFZJWo/ycsBnzRda01LnsTHGdmagegK+pnUvcuoANYkHT6
	TMdmD38gWoMpdD6PoYH7Jl7niR6m8fJUGZyL0g4j67hfeCj3CXf9YlMsuC15HrUe1fGW
	pQsQPH0Iph2iX7su3UVdThC5wApPK8GXv4cdJGHsQJc0lT+ngsJURBDR91jNUXgt3deW
	W1lDTrdnrY42cxnObg9On8lKcX/KXcoYQ8h2YrGHfLoVf6sh3ehtX8C/d4+SxbGVyJqK
	Jn1A==
X-Gm-Message-State: AOUpUlHkeGkhK+ZulPvVFfVK1pFYPjUZTS2Z/GRfwSO8KC8L6cA+1BDS
	6VryGS2IwdWjemLb3dn16q55cw==
X-Google-Smtp-Source: AAOMgpeCP4o0moHBKRzwUZJcxAf8hyOK06PjXFZd6SIE/j6gFZFMSxBEMvrdRxWcLY3UlclYHFhjlw==
X-Received: by 2002:aca:bc54:: with SMTP id
	m81-v6mr233343oif.308.1531358837526; 
	Wed, 11 Jul 2018 18:27:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:3df0:c2f2:5900:71b6])
	by smtp.gmail.com with ESMTPSA id
	y27-v6sm87401oix.4.2018.07.11.18.27.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jul 2018 18:27:16 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 11 Jul 2018 18:27:12 -0700
Message-Id: <1531358832-14848-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
References: <1531358832-14848-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 4/4] xf86-video-armsoc: add new package
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
X-List-Received-Date: Thu, 12 Jul 2018 01:27:16 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../xorg-driver/xf86-video-armsoc_1.4.1.bb                 | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
new file mode 100644
index 0000000..b436ef1
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-armsoc_1.4.1.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-driver/xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- ARM SOC display driver"
+LICENSE = "MIT-X & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
+
+DEPENDS += "virtual/libx11 libdrm xorgproto"
+
+SRCREV = "8bbdb2ae3bb8ef649999a8da33ddbe11a04763b8"
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-armsoc"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} += "xserver-xorg-module-exa"
-- 
2.7.4


