Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5067471C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 13:32:22 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id s18so8049740wrg.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2018 06:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=DPuutX+ucdS3VleXQX8PzOkPnQ8WD09Rlose1eLsyZk=;
	b=amq+G1qNhdP1XAXJkN7iQUenN5tvdQIZDBsOxHsmLej4cS+XEoo1cpzsuM5PAncdxz
	g9MXx5fsqC2EnSuxZZDJtOm0hHbKZeY13CCxDIgEJR1hN3MzYmBeVz1P+q4JjMaTPhSN
	sm3MnbQnO1K8TjOOgaIsYrUn+Ce6VfnrNyQRQI4TL8WMVtYMtgLoAogB/OvEWVYS/8ja
	5g26gZ+HktKRGAF1FHum/zIOM2ZaF7UhRYEjcjEQvvo8L5s9YogMSCoyoEaUR4p87BvW
	7xaYnbVJatkwkJwr42gGJiZT7Jw7j3IXaFp6a2V+ZHvBB+lR2vodCNCKFpFfTaiVkQl3
	p6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=DPuutX+ucdS3VleXQX8PzOkPnQ8WD09Rlose1eLsyZk=;
	b=PUnlx1u9aM8qkM6IHu25NcZWio0mLcVf2snTyRLgM+8TcMNEN8+PGtMjhEaknV9xKy
	mtdScmYuEh0j1Wo61SEYztC1XJ7IvFSMj3ItOphlpqW5dPQVf4mb4dpkt0z5x2fgzSd8
	aMVeRsVRaK3WJISki8kv2u3kBc+R80YevJHaWUnEytHKkwqJNy6cY56bdouR10x0vzKG
	K11e3T7RiyWtA4w+BVqh59h7P/TPzyfc/Th2R+dDkZ/HCYmzUT8xK/OhayFiP3s8F7x+
	ayDKzj9rpFKQo78i/h61d7XQO3oAIy/gQig6MRAoD5YzXPtKFs8ZFf1upQSB9ARbOY++
	+59Q==
X-Gm-Message-State: AElRT7EWppVZKwYlETJaooj8poEnpSHkkwWsNTkBkUgl+buq9AS9GYoH
	QHqMwerNyWsRbGUimU1XO+Hgsg==
X-Google-Smtp-Source: AIpwx4+dNs9E9+Z8RMXWJNF9NnQ/G00A7Xc8vBh88H6bPfHVbuXZSoen1BUgA7MPuck6EPaHVmIOmA==
X-Received: by 10.223.153.177 with SMTP id y46mr9325820wrb.215.1522416743113; 
	Fri, 30 Mar 2018 06:32:23 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC180221E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc1:8022:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	93sm10468396wrh.46.2018.03.30.06.32.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 30 Mar 2018 06:32:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Mar 2018 15:31:30 +0200
Message-Id: <20180330133151.25882-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180330133151.25882-1-schnitzeltony@gmail.com>
References: <20180330133151.25882-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 18/39] gtkmm: minor cleanup
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
X-List-Received-Date: Fri, 30 Mar 2018 13:32:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is enough to inherit gnomebase and distro_features_check
* GNOME_COMPRESS_TYPE = "xz" is default for very long time

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
index 195bb2183..b780d09bc 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
@@ -8,12 +8,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
 
-inherit gnome autotools pkgconfig distro_features_check
+inherit gnomebase distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-GNOME_COMPRESS_TYPE = "xz"
-
 SRC_URI[archive.md5sum] = "6c59ae8bbff48fad9132f23af347acf1"
 SRC_URI[archive.sha256sum] = "0680a53b7bf90b4e4bf444d1d89e6df41c777e0bacc96e9c09fc4dd2f5fe6b72"
 
-- 
2.14.3


