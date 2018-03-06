Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9FB8778A92
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 01:55:13 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id y8-v6so10939560pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 17:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=GNsxHcGZ/dt+P9nIkKHRiBnMYRIh0ViSlNPybldOBCQ=;
	b=IwbIqmEs3PxM9fS44GJWD5rSYLH1t6hhTw+78FjqX6M9Bdcs/Tb5hmv+RhPcLD07Su
	sCHuxdJ+ELRh03emHJgc2rwPR5DHbzuClZr5uYi7ASpo25j9o6uGLI8bXRcIsLfodU7F
	whBxUnF8CIrFOYrRFw+fZkcdG+juAiVHHr4m2zhzUcriFP0bg044rZW6xnGrBM1ZgBIW
	MvQ1sLF4tp0gfNafgF46/S3a0Qn4VcQIhoyUam6hB74GEGvU37MxHW43RSGfr4muF16Y
	KshxFrenOnfwK6Q37hASLwYW/VOi15OH9aaHGRf6Lffcyp5ZlMJJBq/pQo/78H69ovKz
	esow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=GNsxHcGZ/dt+P9nIkKHRiBnMYRIh0ViSlNPybldOBCQ=;
	b=Dp0pCKAQsLw+KXT1CbjeD43bSWXccNU77my9yTuo+vkHGCIflbV89ksZfdp/rB35O9
	IzgfwaFgP99pTRXQEcVM1BJnq1Sx0QNYaTAap3sKtM5ZJ8gQ6ik6hmOfj0VI0Ttq5Tla
	PQkZZ+efsujlF8hkzUwRjvWHIFH0nxApfNXRF0Dsxt/pJ/2IDy8ewfazsEdGD/20RzIP
	WRIcVFt3ukAYRmeHcfTT0b0kiBsZGtSb8HGuh8HG9NemKK5kM/fttgE/lwq6qpH0lV9T
	QItC+fZkD2IEZBwxnEb5Sr0rpaStoKAKAtFZP/8AlfOXcSXM7Dge/WOCrcwZOBvbDfQx
	RwRQ==
X-Gm-Message-State: AElRT7EiK/uel+UrYAMPJvcG0UVmm2ZKQrR+8uiqoPLwNsTCZu1jR7yr
	IE1pHIjQ4YBeark+dm8z2Tc0sQ==
X-Google-Smtp-Source: AG47ELsMpGWwzjPuRvNe4nrIRGsL7lk4lGT//WGSl88RVHGpYTNxWt7u3uwcVU456gX7DQ++y+tRGg==
X-Received: by 2002:a17:902:9349:: with SMTP id
	g9-v6mr5075969plp.319.1520301314839; 
	Mon, 05 Mar 2018 17:55:14 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	p125sm31985927pfp.43.2018.03.05.17.55.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 17:55:14 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:55:10 -0800
Message-Id: <1520301312-29879-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
References: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 2/4] xorgxrdp: require x11 and pam in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 06 Mar 2018 01:55:13 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
index 0c779b5..e86ebb5 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
@@ -4,10 +4,12 @@ LICENSE = "X11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a2523660329fdca3d954c0a87390e007 \
 "
 
-inherit autotools pkgconfig 
+inherit distro_features_check autotools pkgconfig 
 
 DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
 
+REQUIRED_DISTRO_FEATURES = "x11 pam"
+
 SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git \
            "
 
-- 
2.7.4


