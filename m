Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC066C0F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 22:05:38 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k8so5828112lja.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Apr 2019 15:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=WWXt5JD6rFl1jcsiafvo3sgv488g1ko4ws7SopbBxF0=;
	b=Q586AgkSp//rOQdCwgvkTDJVThq3x0I+eFbXjj712TtPJltV1iwVnTUDxtl189IYE/
	pY9g7nTsLhZIU7D7FduL8t23FuoIOOhQr48UbZnwYJmNeieLTgsxC+reMN6mG0OWZgd/
	RtSro8hp750XMziIApJGJ1uN6LBEX1tZ/QH/CmGjn2A9SbGvSXOnDyJ+vhzJH6dRJq1M
	ge9PAYQi+2C1KYuwvy2jybXjGYPzNaXIIFYz+gw/ohnKTSYzgvkGG8aA3XioPTuVb1Bc
	5RL9SiSsIEgXqAAnzAF0h39bOqfwb7DqBkYriIF8n2l4/OKazHYbrNHWHP0gV7oXQOgW
	Ty6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WWXt5JD6rFl1jcsiafvo3sgv488g1ko4ws7SopbBxF0=;
	b=m9Z7AOd30v2S2S5T7gWnPl6laHy5LPGAk4vOSgE8gtgLpHB10eBnfTpKR7fu3dONh3
	slmsXWNT7hlGEqOTiPRs5Y92Di90XBty+a2dg3ayjftsg1MGVyOiTUwXV3QgeHqOHhA/
	FGh9hZ2iWbw62q7DQJZumfjwBEPyTDOZ1bXBSCQTpMZw1WvdwbjO427cajRSEBk/YM3+
	0SyXGaQSaj4w1Vlu4l4lJG7x5G4tBdMJ6svq4rl+Oic9EkQipMPKGIsHs7DieIslDEMe
	M0bCghJTwx9wPocJ8wYBAWjQEhbLvS80dA6yY61Hls8jw643n7827Sm//d89P1Qh7TGh
	Z1jA==
X-Gm-Message-State: APjAAAUqOgLZl+iiUJWxgjhNcsIIROG+d/ogW49LLWRHBLVlB2eyVpdt
	6Y0QiOuW+JjdAV2KyrbQOAnIEk7VpG0=
X-Google-Smtp-Source: APXvYqyu2HxoaB2iFBs7rOWAAt4WFQRRq9kTypMAAVtUEPsYDkFaSFiLFt4m/pdlc8p720jLBncqyQ==
X-Received: by 2002:a2e:960b:: with SMTP id v11mr18530891ljh.135.1556143539137;
	Wed, 24 Apr 2019 15:05:39 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	l13sm4556009lfc.61.2019.04.24.15.05.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Apr 2019 15:05:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Apr 2019 00:05:36 +0200
Message-Id: <20190424220536.15622-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nfacct: add UPSTREAM_CHECK_URI
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
X-List-Received-Date: Wed, 24 Apr 2019 22:05:39 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
index 8177ebcc2..324545527 100644
--- a/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
+++ b/meta-networking/recipes-filter/nfacct/nfacct_1.0.2.bb
@@ -3,6 +3,8 @@ HOMEPAGE = "http://netfilter.org/projects/nfacct/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
+UPSTREAM_CHECK_URI = "ftp://ftp.netfilter.org/pub/nfacct/"
+
 SRC_URI = "ftp://ftp.netfilter.org/pub/${BPN}/${BP}.tar.bz2"
 
 SRC_URI[md5sum] = "94faafdaaed85ca9220c5692be8a408e"
-- 
2.17.1


