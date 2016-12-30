Return-Path: <oleksandr.kravchuk@pelagicore.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 79B356011F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 11:09:11 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id b14so235289337lfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 03:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=qM22sC5gpSJ/f/3DhA2eIdfx6rsij1odO7PL0+IslD0=;
	b=igJN+hG0yZI6HCNdTIWa0MPQKdq1+A9GEdM6ls35Ir1xHitbVvSpyED4laqUFiHw4p
	PiwjciUZchvG6j74IzDZZaHBpLK2zCnzy0feta1fyIJiB4Zr08XbHwQkFEO3dC5DLH4G
	tzJ1CA/ZUlQcXFPV7QwWcbxd1rc3OxHrJsk75HcFFwi/CKOE2KJFHVJwvKYupqkBh4bg
	K4MrOdA4NwE5p7xawWUm5Y3+eIO3sK6ZHKSzyDM0/dBiS6vfkQ1yRwE9kkOmEID5WmJD
	eXpZleanZmBupqMZG4nFruhP4R28n/UJJupNELtH05fMq4an8AaqUxxdU7/4V6znSk2P
	ildw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qM22sC5gpSJ/f/3DhA2eIdfx6rsij1odO7PL0+IslD0=;
	b=n5NV3CVeu1Sr05mTPp5afBu2D63pzVKHIZXorT/cis/OAVloJsgn2DvpQUiWNPYIKq
	k9kFjVqDzV6wnM7REgk0zbhJoNcfSYN/03AYm6alyQZ6SZ8AGcsuRuQ9ufLg7f6lH4Yr
	ih+xJsTwt9D9bFN0dHzG2RavAB4TbD8SbepjMVR+F9J4sIMPxi7dI53+r1QFreLCIfUB
	U/jsYVmZpvPvN8mHqTexSExORTPZTyXa7E2VJjMs5VY2Uuv47YwC2ZJVYvDmwlCC1Afz
	6FYi3LyR4kuWF+caL8ggc1rqCi5aZLCq4ZHfhcG+YVqs0b23C3xm7VGAWdixlu5qF3f7
	ek0g==
X-Gm-Message-State: AIkVDXL1Alzc8Fv1uSN/PeKBg7hk6m9a4vcytgHWLm9/PKsZkDUhTn32xueCZNwbr1rMffWD
X-Received: by 10.46.78.1 with SMTP id c1mr15527244ljb.39.1483096152495;
	Fri, 30 Dec 2016 03:09:12 -0800 (PST)
Received: from stout.office.pelagicore.net ([83.218.80.242])
	by smtp.gmail.com with ESMTPSA id
	i129sm13321799lfd.8.2016.12.30.03.09.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Dec 2016 03:09:11 -0800 (PST)
From: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 12:08:44 +0100
Message-Id: <1483096124-16547-1-git-send-email-oleksandr.kravchuk@pelagicore.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH v2] wireshark: update to 2.2.3
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
X-List-Received-Date: Fri, 30 Dec 2016 11:09:13 -0000

Signed-off-by: Oleksandr Kravchuk <oleksandr.kravchuk@pelagicore.com>
---
 .../wireshark/{wireshark_2.2.2.bb => wireshark_2.2.3.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_2.2.2.bb => wireshark_2.2.3.bb} (95%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_2.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
similarity index 95%
rename from meta-networking/recipes-support/wireshark/wireshark_2.2.2.bb
rename to meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
index ad72ca9..5e7fdfa 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_2.2.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_2.2.3.bb
@@ -9,8 +9,8 @@ DEPENDS = "pcre expat glib-2.0"
 SRC_URI = "https://2.na.dl.wireshark.org/src/all-versions/${BP}.tar.bz2"
 
 PE = "1"
-SRC_URI[md5sum] = "88bb55bcbc5249fee10bcea332a4fece"
-SRC_URI[sha256sum] = "f9acef5e9a9021a400b4244fafc06969f41ec594ec57fd7f0ff63bafca0055b3"
+SRC_URI[md5sum] = "68e201e06873c67cb7544d27991e79bf"
+SRC_URI[sha256sum] = "97bac89e88892054a5848a9f7e0c36aa399a2008900829b078e29cab0ddd593b"
 
 inherit autotools pkgconfig perlnative
 
-- 
2.7.4


