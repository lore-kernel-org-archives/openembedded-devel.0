Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 94C2277D45
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x75so8664205wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=3qFroi7vnkWDXE+t684MlTvm7dnnpcIU9lkM+zpIvb8=;
	b=jcUTi81nF4AKc9VAmz7TgKXz0bsIwlYiS2SoNo5qDm+tvVxP3ej4g98JbASFYdrbUy
	tWtEuJJ050vOZwysynQqoDN+AygmGhqJRZbqZmPEKgJpY2a2rONQpcZZQ1HFC5okyUkK
	UKiDKDkZHtdkJmnViQRCrpg0PZYl1YqDmFVxGH0VrA7bArkUsFw52BaugMVCX6GatcK/
	5MKOfQLbPCcqNGwq3vGvl9ByJ0TqrCNyeNPpwDW6ziamLkJ2zPmpRiRJrUrvxq9rXbpP
	kon3G5VHdKKvYrBRoAfDDD1+NUuuFpNsjJ01LbmUrzFW3Oh6g1XBLvKBUYE4T8mZn97q
	0k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3qFroi7vnkWDXE+t684MlTvm7dnnpcIU9lkM+zpIvb8=;
	b=lFjgs26YZdb3dKxwaC4oewleoEJc3nEDOWhf/xp/pobfH9So4StCWkb0l/gDmyQzFg
	hHkFkQIH/o/SxYcuOX6gcV6ljYzeiDH6Lnktif0NE1UoM7uVrQOwItVetav0jgeqpVPx
	6YatCMv8JkHQ18wit1IOYSTrzNC54pznmecAJmFrE0xlESBUHhtJ/1WoPc37zNcPrUMo
	7gsKMWgMZ2/uKpans1bWjvCjFf1FZFIx5U0+2lNhQP4oFoT2ahtW3sBNIWXFOU5K0vjS
	z+oOP0re/3sDndcdOIjLIwZx5XW1E44pO5+lwKMZVY7zulzaXFbkt6QeGubckJR/T1od
	TmtQ==
X-Gm-Message-State: AN3rC/4Bz4KE41L2TxLICU8zRAJ1bGVjDxcv2ehXJ2h1zo8xLsnFYBAm5GgEjFHOHYcNqw==
X-Received: by 10.28.47.15 with SMTP id v15mr4420251wmv.116.1492027023058;
	Wed, 12 Apr 2017 12:57:03 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:02 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:22 +0200
Message-Id: <20170412195638.3243-14-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 13/29] xfce4-netload-plugin: update 1.3.0 -> 1.3.1
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{xfce4-netload-plugin_1.3.0.bb => xfce4-netload-plugin_1.3.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/netload/{xfce4-netload-plugin_1.3.0.bb => xfce4-netload-plugin_1.3.1.bb} (66%)

diff --git a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.0.bb b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
similarity index 66%
rename from meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.0.bb
rename to meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
index 9e31ebe..7d77782 100644
--- a/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.0.bb
+++ b/meta-xfce/recipes-panel-plugins/netload/xfce4-netload-plugin_1.3.1.bb
@@ -5,5 +5,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=35a7203c41b86d15546dddc05995f97f"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "9b625d8ad513085f2e1569171db00b44"
-SRC_URI[sha256sum] = "615a280a1bc6c1e3f40755798217a230fd022f7744b095e7df978b63f25c8057"
+SRC_URI[md5sum] = "f25aa3242e3119b49f259a3e4a1af08b"
+SRC_URI[sha256sum] = "99762781099d1e0ab9aa6a7b30c2bd94d8f658dbe61c760410d5d42d0766391c"
-- 
2.9.3


