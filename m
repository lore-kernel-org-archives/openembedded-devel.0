Return-Path: <andrei.kholodnyi@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4027476417
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 19:46:59 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so100313145wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Sep 2015 12:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Enq+bM++m0aXm6b1VrJkCJg6Feevro0QspkNO93DB8g=;
	b=IINHzVnILjuAmOi1FnxLYM17nEj+OxUD027vxtE4x1yAfV9ST5yzYSRT94P6j3srQW
	klh0U66YEv5y+2VQAfMosw88Q/yeJOfRIdFxHbB7b0VNFsM0geMx+kpNGWE/YQ/iRskC
	5CHMnkd0zg907KVvfn2Shb0skZRz8VACfe3UxHo88SL/TNX6Mw4mcA+XIxbx0SPHMTV/
	oCwLCw2COcC+Ng3PM4+qIuSd10dUqRT95R7FQBXXWyDpP5eBxF70oR+/THrHvLsajdk6
	ZKAHVwPseeX4tcAP/bkHvX7tcib3DbGqMFdnOvZJVzUrKvNxcfJS3YM6sGfKQBD+R08W
	xL2A==
X-Received: by 10.180.100.37 with SMTP id ev5mr4742024wib.15.1442692019384;
	Sat, 19 Sep 2015 12:46:59 -0700 (PDT)
Received: from razilix.corp.ad.wrs.com ([128.224.251.2])
	by smtp.googlemail.com with ESMTPSA id
	gl4sm15452617wjb.29.2015.09.19.12.46.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Sep 2015 12:46:58 -0700 (PDT)
From: Andrei Kholodnyi <andrei.kholodnyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Sep 2015 21:42:47 +0200
Message-Id: <1442691768-30079-1-git-send-email-andrei.kholodnyi@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/1] lvm2: add --with-systemdsystemunitdir in configuration Otherwise sed command for blk-availability.service may fail. It will look for the service file in a wrong location
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


