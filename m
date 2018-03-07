Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE77789F5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:30 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id d9-v6so626671plo.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=kV/V9Hkb08bwMFD0AJdj2r/eeIg7DX7rWY+GdOnn4tc=;
	b=vbzyyD4g7MK9XIeairIGS+AqyhY7cxu3FWkWQwaByXOz9iIypNyCZfD/x2F8iduumw
	bGrlhjAU+aakLzlF4Zlqc9e+z1gk8hp3gytRSdRSE0sPmOa+Mve5QjQrdIHvmW4CZ4i+
	1ES0KlXusiiN5wyxzIpbEy2RnxGQv498bb2U5oKePYrVsOnIBx8X0tUozmgbO/UM4k5l
	Vwbvkr3ZXtrTXtYW6yO+8L+7n/i/vkCijn9Eal4YtiqTHXS9e0hSDYwstNB2sqLR0IT6
	fjdyaZfJCYHyD2vDQ08ZeS55lfBA96fmeJxq+rn1/8oLI8/yx26KCIi5RCcfHx8VHD7p
	ecsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=kV/V9Hkb08bwMFD0AJdj2r/eeIg7DX7rWY+GdOnn4tc=;
	b=oe8At7IiydQo/a7yCoN7VaXdeb2D5eAD5Y/OcTLGSBDjU+WQRhmuZ+2N4AD8fmzTbv
	GOcV9P141K/2+RGb5cWXOvo317oLcAzQhIGd3KUdOADb8I1INaOQ3YMH1plyTZ50fpgo
	9PI7zm+4G1SiYFJ4rLcnurRj5f8g8iPteHI2Ri8kE7a6pW31RZ1NDZR+JuMRDrpmmjQ9
	KFS/ZlTczzTFOTtIOM5aaSbEdBGkU97ve5e46lD7WGwi9Em0d0FvcPWpmSSluwp5q2wf
	YIs7vl/IxsPBD7+MMzN0ebYkOnrP9uxhTPAHyKh76Xt2p5jTtRDQ7UWg24yKzjksJaNN
	DR+g==
X-Gm-Message-State: APf1xPCZexBweJTYmzracr3MwviHopzhH4QR5PseQ98MKtrc0oGxAhI2
	YVzNIvLQSzJ6N+VJTHTN2Vk=
X-Google-Smtp-Source: AG47ELurSgFos1F1FTQ+ouYrP0Ne/WSNb5e5ZIMR515wBSqM62yNf/hIAAjxPBAKNxEf3leE72Rffg==
X-Received: by 2002:a17:902:4d:: with SMTP id
	71-v6mr19033222pla.341.1520395411839; 
	Tue, 06 Mar 2018 20:03:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:06 -0800
Message-Id: <1520395408-19266-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 03/25] atkmm: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:30 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
index 30ac90a..307774b 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "atk glibmm"
 
-inherit gnome autotools pkgconfig
+inherit distro_features_check gnome autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "d53b60b0f1be597e86070954a49cf0c3"
 SRC_URI[archive.sha256sum] = "ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd"
-- 
2.7.4


