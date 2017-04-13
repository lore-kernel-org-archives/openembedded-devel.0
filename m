Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE5777E5F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 22:58:29 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id x75so15347237wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 15:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Y4kBjZ34MqPoq8/cKbJlsmWjxrXjfFxB2Av70q4JkCE=;
	b=Go1TxOzjbVEWXYd4tOKyv6MYbuVLHaU4Gbh7oBTFCLE3OKoI9MWCvavuHfPGMWMJWS
	21VPLd/4lkvLk6Nykt+W9gR2ZG1j/rTDIfFtyMSpue+F7ZJeuUi754kZDEQTFj0B5kw8
	lJRp7delJX+LLX65N7N/quHVB5GB4pg7fNZfh6tZSrWggiTtawdKJISjrDl+f2lCIJKO
	609byElx5hx6f+SpqCtcVgzlv3WS8cAlaB8LRsNSvygakWYtYEgDu+dn8xGIXyXbx70R
	DIfwaZIr/PT1TwuDrmyYmR4sZjrZHAQ4PjMoiiEysyGbagLmZxA4MdUbmT6AwnqtfPYY
	CZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y4kBjZ34MqPoq8/cKbJlsmWjxrXjfFxB2Av70q4JkCE=;
	b=CRRBYut/SRJDZY4HlFK7N/FdhRQbHv8EJPs+QwAetp2wwgI2ploSYZ1EFSJ4Tsafd/
	aYJVjomLqPjX8UsK1MVcjsuTgsg9UkJ3KjXaEMUuWlJrGJR85ArWGnuhTM/Aw8RZALO8
	HV2OXA2CQCMjJmLqm1C3MLnfC0g/GiwrgDpsQq40A2p021lhOoHSecJ7rZB2ln+ZDz2H
	4OGXVx3WwWt80QffowMcbrSjAiQhTXKWMOIGYXptaJfDD49JC25e/M9ufh90/Vm8D1sc
	6+j0WPEf2POMfYup7x+eFhIhS5RoFaSc6ewQ+Vnbkeutwi/SGd1dQ1LJpnpoiFT1fRHq
	nbwA==
X-Gm-Message-State: AN3rC/68DOTyJxv3mxYzGWxdOddR1SkhySfYQYLPYY+ELuJ4EawVu2D3
	RxqDjapUoaZq8UzY
X-Received: by 10.28.95.67 with SMTP id t64mr15427309wmb.140.1492124310220;
	Thu, 13 Apr 2017 15:58:30 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1051E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f105:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	32sm155689wrq.25.2017.04.13.15.58.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 15:58:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 14 Apr 2017 00:58:16 +0200
Message-Id: <20170413225816.10153-3-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170413225816.10153-1-schnitzeltony@googlemail.com>
References: <20170413225816.10153-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] devilspie2: update 0.33 -> 0.42
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
X-List-Received-Date: Thu, 13 Apr 2017 22:58:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sources have moved

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../devilspie/{devilspie2_0.33.bb => devilspie2_0.42.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-gnome/devilspie/{devilspie2_0.33.bb => devilspie2_0.42.bb} (81%)

diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
similarity index 81%
rename from meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
rename to meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
index 3c31c1b..ae2ec5a 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.42.bb
@@ -7,12 +7,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=00aefaa50aad75c21367df66102d542c \
 DEPENDS = "gtk+ glib-2.0 libwnck lua virtual/libx11"
 
 SRC_URI = " \
-    http://www.gusnan.se/devilspie2/download/devilspie2_${PV}-src.tar.gz \
+    http://download.savannah.gnu.org/releases/${BPN}/${BPN}_${PV}-src.tar.gz \
     file://default.lua \
     file://devilspie2.desktop \
 "
-SRC_URI[md5sum] = "99c88f702e134d2b2f2f8caad4b1ef03"
-SRC_URI[sha256sum] = "01a2ebcece14065c9a2e47decd81341e2a6f63e3bf43ff446103686718748356"
+SRC_URI[md5sum] = "f205409e921aa2d86481f1b8d518da45"
+SRC_URI[sha256sum] = "11f5bc310fba4df404c057461ffb3fadac8ef51d211008c665c48f587a5a3f85"
 
 inherit pkgconfig gettext
 
-- 
2.9.3


