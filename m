Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5DDEF7680E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 19:46:59 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so69108228wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 12:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Enq+bM++m0aXm6b1VrJkCJg6Feevro0QspkNO93DB8g=;
	b=pSLw2pRK0VnYsy25nXduPMsHR2ChkyuaAM9J1+dUHn7BQtBre6SqE0tW8ojcRGCiv/
	zUx9ObPnLGrqvPHz9IGLBnQY4AbR+odE0EQiKNNpszfKKxU3EREb15vK2YP6zWuaqOWC
	pUKmRcy8MWw+tfdy5Ae+zIV4Y4N2zjPcaIOXOGPH/pinEc+aHxtScI0JeMumxCMObtyw
	fBkEwOUvvEfLZLkZi2piYKZxVtvfhm8zybrVVpLbmwMTDk6OqQlmwcOmGJBWvinx0Sja
	Ya3mCVCGJxrV/xzm1a3cKm6mBTewCXUqJ28lg6Sx6gM+v3AErFXTaHPi6cpHoR8sDqN7
	EK3w==
X-Received: by 10.180.188.101 with SMTP id fz5mr5298240wic.3.1442692019986;
	Sat, 19 Sep 2015 12:46:59 -0700 (PDT)
Received: from razilix.corp.ad.wrs.com ([128.224.251.2])
	by smtp.googlemail.com with ESMTPSA id
	gl4sm15452617wjb.29.2015.09.19.12.46.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Sep 2015 12:46:59 -0700 (PDT)
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Sep 2015 21:42:48 +0200
Message-Id: <1442691768-30079-2-git-send-email-andrei.kholodnyi@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442691768-30079-1-git-send-email-andrei.kholodnyi@gmail.com>
References: <1442691768-30079-1-git-send-email-andrei.kholodnyi@gmail.com>
Subject: [meta-oe][PATCH] lvm2: add --with-systemdsystemunitdir in configuration Otherwise sed command for blk-availability.service may fail. It will look for the service file in a wrong location
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
X-List-Received-Date: Sat, 19 Sep 2015 19:47:01 -0000

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


