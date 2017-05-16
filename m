Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8353777D36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 11:00:45 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id v4so37234581wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 May 2017 04:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CCQcAOcHeFltqJ8R9H3p4gmMzFcSkGtrmLxdRDY4RS4=;
	b=nfKo04SF4Ii32d+5YL+2usFJAUkhp7S3sMnFos6AKS0a7oJSpp2MGWBIzjrPP+wotu
	6DAl26Gd/oeTuC6E6PDCZ1yLjbV3JM/jcU20dfsSz9OHOeNEwfm9fpZMp1WHyfIBmLo8
	QSXFiE5ZpELveCnRCpLRhk80ZylSnZEdSrrnL4iakgHEJQpOj+SBk2VSemloO3erF2pa
	8nqn3tr5+skyc27wJHQYgIkTz9fD0Mi5jlMFveTLmrnUUNfTYsXOxJPO+qB7me+e1Pu3
	06Lucn69yJcmagmVWU5ZFS0ea1/+hN1uXNk6A8bot+jNdQ7IpMh/+OqZOrYxqg6vkbir
	wg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CCQcAOcHeFltqJ8R9H3p4gmMzFcSkGtrmLxdRDY4RS4=;
	b=D2/vdd8y6z8FiTeb2IExfoaxclYjL0aEl/qkrPT8Jy8LASkMW2Mi+H1sKus7WOX/Ho
	p06VScynxzFZYhK6d51U61tDztPoPpNX1RmvNvSV1dxoaM8SVgRUS44GISmCCde63edi
	/wOulDQ+/SDRGfWdfPgpqh/5HXLkKRP+G86bomQKFz7YjThe5SUWGp5paseP0wGTgL15
	kzU+TX9Gg/STCjmLgh3QxZbvzzOaj7g/VyMdgoFJXD87EkzKqlabni0r8Fryh4ApxSaq
	VtNDTTRk3MoO8lKwJn3MQSxT3hfyb2VhNrxgWukmSAPgejZhUxygzMwoPAcyGGG5Nuoh
	57Jg==
X-Gm-Message-State: AODbwcDioyxaLbY3Jvz2cHnx8CV3LoEiresd+9/CXEreM1/o2+8mKT3+
	15XVaEF4t/Cj7A==
X-Received: by 10.28.87.16 with SMTP id l16mr6419493wmb.114.1494932445007;
	Tue, 16 May 2017 04:00:45 -0700 (PDT)
Received: from localhost.localdomain ([37.177.79.194])
	by smtp.gmail.com with ESMTPSA id f2sm1752989wmh.27.2017.05.16.04.00.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 May 2017 04:00:43 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 May 2017 13:00:39 +0200
Message-Id: <1494932440-30228-1-git-send-email-costamagnagianfranco@yahoo.it>
X-Mailer: git-send-email 2.7.4
Cc: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
Subject: [PATCH 1/2] libndp: switch to github uri. libndp.org is unstable
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
X-List-Received-Date: Tue, 16 May 2017 11:00:46 -0000

From: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>

Signed-off-by: Gianfranco Costamagna <gianfranco.costamagna@abinsula.com>
---
 meta-oe/recipes-connectivity/libndp/libndp_1.6.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
index e06ff7f..7cfdd4c 100644
--- a/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
+++ b/meta-oe/recipes-connectivity/libndp/libndp_1.6.bb
@@ -3,10 +3,13 @@ SUMMARY = "Library for IPv6 Neighbor Discovery Protocol"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "http://libndp.org/files/${BPN}-${PV}.tar.gz \
+SRC_URI = "git://github.com/jpirko/libndp;branch=master;tag=v${PV} \
            file://0001-include-sys-select.h-for-fd_-definitions.patch \
            "
-SRC_URI[md5sum] = "1e54d26bcb4a4110bc3f90c5dd04f1a7"
-SRC_URI[sha256sum] = "0c7dfa84e013bd5e569ef2c6292a6f72cfaf14f4ff77a77425e52edc33ffac0e"
+
+S = "${WORKDIR}/git"
+
+SRC_URI[md5sum] = "de58352aaee0e8edb744f1aef852cdce"
+SRC_URI[sha256sum] = "565d6c4167f83ec697c762ea002f23e8f0b00828d0749b1ce928f068543e5aad"
 
 inherit autotools
-- 
2.7.4


