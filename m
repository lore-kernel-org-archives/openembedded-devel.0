Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id D041874621
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Sep 2018 05:06:39 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id v66-v6so9800575pgb.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Sep 2018 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Zt2g/PFZptwtqB17r9h7IfUQMLxNHITp7mSkAqlxzo0=;
	b=dnTZZj1Ek0N6mgIVnFCFObVnvBGXX5QzuUfU6RVr/qrvoiUo9A0M8pThSox5tAAIER
	cO32LllLT/GAZ50X5ZUWXdDKCqvU90sqVkjzSoCm6dnq2Pns9chm5f5IFUHtKvTIdN7G
	Yh5c2C5NeqD8j5k3PHcFInYaGEFKIRzurXFMDB30AFDN7/HGcDB56KJrfYSEp+M2DNQz
	0OowlbN/xPij1YEezVVMmczqBTe3rRhy97k5IlLPEPU++OKTvK+4Q79w5bYL2TzX5rCw
	mOtQIzoVVOHJBi3i+zpmBqzzf2n5IbbB2yf8MndhhGhsBTWP4zCQvOXMjq+TGGA/i37+
	QYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Zt2g/PFZptwtqB17r9h7IfUQMLxNHITp7mSkAqlxzo0=;
	b=knp05CSg4MC1m3iwAavz6RpObF9FVeoXVDjrV/e8q6yQO4+svUAHMhtnODK2Klicok
	fQ8bZ2wTeFjSRi0nh6jm0MWTVOgvvvEqoyD4ABFw+r84bR4/a4lzzoeBz2kxlGjcWaip
	vM96qp/V5Y2wC/uh6rfcWHCsCcLPOucbqSMbZul0OYT9qIve4beEic7mKL/222sJgbQO
	QyWyAyE0hZshexejOcBvVVba3BN0u4H9Vehfm6AgdQD0VkUVZMLXbUAjZyotZTmpoxK1
	9M0o9Ohjslgm9igfoC2PBAb8ULYRtD13C9m4bDiUdL+eU3XBren7HxggqH5EjtT3bz/j
	GyEw==
X-Gm-Message-State: APzg51CcIJvj9fMH3r4c7Kcy2/kM07gX+vZwupIpB1J4nyvYDUuo0Iii
	t/LUcXit539V5A5YXlk1ZGMo7HjA
X-Google-Smtp-Source: ANB0VdaFuaNvp96N8RsEWGWiT9q/HwKNapYUjC3IBBVH3nUqMlmAi3f+3/k9yrZB9DbrRHWi64OHuA==
X-Received: by 2002:a62:5a01:: with SMTP id o1-v6mr21925126pfb.0.1536556000611;
	Sun, 09 Sep 2018 22:06:40 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::2887])
	by smtp.gmail.com with ESMTPSA id
	x24-v6sm18819188pfh.67.2018.09.09.22.06.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 09 Sep 2018 22:06:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Sep 2018 22:06:22 -0700
Message-Id: <20180910050629.16170-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180910050629.16170-1-raj.khem@gmail.com>
References: <20180910050629.16170-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 03/10] libqmi: Upgrade to 1.20.2
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
X-List-Received-Date: Mon, 10 Sep 2018 05:06:40 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libqmi/{libqmi_1.20.0.bb => libqmi_1.20.2.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.20.0.bb => libqmi_1.20.2.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.20.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
index 9301cbd5ee..3e08c4f9e6 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.20.2.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-Detect-clang.patch \
            "
-SRC_URI[md5sum] = "797e365521df76b77b067e6317618b41"
-SRC_URI[sha256sum] = "21428cd3749c56246565123f707fee51238651a22c60bdc85ebce97388626eb4"
+SRC_URI[md5sum] = "584214476ab75c394160cb85fbccaa1d"
+SRC_URI[sha256sum] = "c73459ca8bfe1213f8047858d4946fc1f58e164d4f488a7a6904edee25e2ca44"
-- 
2.18.0


