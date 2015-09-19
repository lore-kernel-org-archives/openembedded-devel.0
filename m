Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 4FF9C73D17
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 18:34:48 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so68022531wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 11:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O2ylFeLRpYwD5OZxQSo+TpFXEUQmod8o4ZRiJteSO78=;
	b=NXS4ZLNJYZYfTUBnmeDMCXFwWU7kIkhJxVYPXr3r/rIr9GABn2XLuO43GLUI0mubPm
	N7qfBDl04Ea5gbZN55MieivTGjVah2duX3qxax/B586g86f1j3nxP5d5fEgJXYSjvwqt
	SfQm0F9L1GMBB/GIteEByVmDTIrP4yafHhHP4G533c08KYjOqdLvsHOZQpCYrQa2Vpm9
	spDJ0HUhbjKxtkdG9rgW3lYUsjyFT5JRHPusGuPlGJH+80RcApILkWj3ls4woGmhPvIH
	n7eZUkUz5zsCsUPILJvEg9MtBs/KCglWctyoM/5ZM5pux5FcGdgO02Con/DksZaNYAKo
	p9oQ==
X-Received: by 10.180.186.195 with SMTP id fm3mr4950246wic.1.1442687688977;
	Sat, 19 Sep 2015 11:34:48 -0700 (PDT)
Received: from razilix.corp.ad.wrs.com ([128.224.251.2])
	by smtp.googlemail.com with ESMTPSA id
	d1sm4532170wiz.0.2015.09.19.11.34.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Sep 2015 11:34:48 -0700 (PDT)
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Sep 2015 20:30:36 +0200
Message-Id: <1442687436-29326-2-git-send-email-andrei.kholodnyi@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442687436-29326-1-git-send-email-andrei.kholodnyi@gmail.com>
References: <1442687436-29326-1-git-send-email-andrei.kholodnyi@gmail.com>
Subject: [meta-oe][PATCH] add --with-systemdsystemunitdir in configuration
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Sep 2015 18:34:49 -0000

Otherwise sed command for blk-availability.service may fail.
It will look for the service file in a wrong location
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2b2d8ed..8114d5f 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -27,6 +27,7 @@ EXTRA_OECONF = "--with-user= \
                 --enable-lvmetad \
                 --with-udev-prefix= \
                 --with-usrlibdir=${libdir} \
+                --with-systemdsystemunitdir=${systemd_unitdir}/system \
 "
 
 PACKAGECONFIG += "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
-- 
2.1.4


