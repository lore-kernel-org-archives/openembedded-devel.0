Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 023CA7927C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id v90-v6so1812474wrc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NPPo/7lZW4OxKMjfQHXQFAblMQKN26VQZywuc3OX12U=;
	b=p1kXtJ+mHbLGTwAqWo39ufp+4ah9YFnPwdWNDvufb4N8KPMI0DExNnKnbI1fkoPNaz
	cMeCll56UFxJqoiSihDqw/uDq/O8KXW7nnDQd8/wCDO0Mzjv+4ORi0s1mvLakNWiqkdV
	jcdwRsCgnLaWKKzjCVLPvGjOPK+RHaPBNZZ0t/X/x4BnsCisi7LDjDBWS7heKNt8LA0z
	hoi5HALN7yF7DCTMUkfadLKM0uve2yUidv4bBGdyjFoqERnDGXh2ucL9ObAjtuYqNOyj
	7gUBkwfSg0qRgyuEdBjHyzBN2axqp6ukzKadXg8rg8iVJyldiSOQIBftxPIrNboATkxY
	1dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NPPo/7lZW4OxKMjfQHXQFAblMQKN26VQZywuc3OX12U=;
	b=mpkyTGaW6a4Rkx0PjdFFDVkxPiRYnmobehCNkfAWHOcfMvOVwPWA96RvfpPouVUAZT
	aSdv1GviB1zko6gD2DPEy/qEe99zQHHSy2LBRPhSTTNBHdB5f5vGOTaKdz5DtEckgzZY
	y3mZUBvRunUQvcIK/OHZm8KJmDl3mrVQ3E4VxozE+u8GQ8MbjkmV3722nH0AFG6lLqOX
	7mTa2NgC4CuBSW1uSfEkWmovHa+qUcRzY9iGeNi6YwPdQWjitzGpZ5DxFyeF+Pc38nsJ
	pmvGKszeu4d/ToJpxNH4aCjD0H39BycNlP3l+PFmOvtUEZSGc0SunMXZ5s4+lMbxrf+Q
	uPhg==
X-Gm-Message-State: AOUpUlHocS68VZMvJYlq9I94CToD94Kqww/gIQJYa99urDDLC4v6FBf2
	4XQSvU9mQOIA00SQQtzgeKE+y0BS
X-Google-Smtp-Source: AA+uWPyeldeoxTs/KETuM6QwMmk2iudUSshFwzodiQl7sT4mX/2dwH48HNPlmT1+Xd/26ELq3qTFzg==
X-Received: by 2002:a5d:438d:: with SMTP id
	i13-v6mr20556024wrq.156.1534444084463; 
	Thu, 16 Aug 2018 11:28:04 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:03 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:40 +0200
Message-Id: <20180816182748.2400-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/16] xfwm4: upgrade 4.12.5 -> 4.13.1
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* gtk3 based
* it is a development version - but no stoppers were found
* add PACKAGECONFIGs for better customization

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfwm4/{xfwm4_4.12.5.bb => xfwm4_4.13.1.bb}           | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.5.bb => xfwm4_4.13.1.bb} (53%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.5.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.1.bb
similarity index 53%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.5.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.1.bb
index f90d8da59..64ad9f64e 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.12.5.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.1.bb
@@ -2,14 +2,24 @@ DESCRIPTION="Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-DEPENDS = "virtual/libx11 libxpm gtk+ libxfce4util libxfce4ui libxinerama xfconf libwnck dbus-glib startup-notification exo-native"
+DEPENDS = "virtual/libx11 libxfce4util libxfce4ui xfconf libwnck3 dbus-glib libxinerama exo-native"
 
 inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "61f6bc8b15c6a7361a58d875917e1791"
-SRC_URI[sha256sum] = "7775c02216666c2d023275e7ed6d85e57d965e5cc1407bb6a05c53cc38d8caca"
+SRC_URI[md5sum] = "1a78bcc2100c03f6fea0dbce0ca813cf"
+SRC_URI[sha256sum] = "75ebc20d313cff4905e76fc320254c30461dbfa985461b8e75dca04770cedf12"
+
+PACKAGECONFIG ?= " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
+    xpresent \
+    startup-notification \
+"
+
+PACKAGECONFIG[epoxy] = "--enable-epoxy,--disable-epoxy,libepoxy"
+PACKAGECONFIG[xpresent] = "--enable-xpresent,--disable-xpresent,libxpresent"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
 python populate_packages_prepend () {
     themedir = d.expand('${datadir}/themes')
-- 
2.14.4


