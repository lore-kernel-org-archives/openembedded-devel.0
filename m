Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id EDD046FF78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:08:13 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id a4so161799106wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RJqZSvxU2ZuVs2EBwZP+3/T5RS9X+4AhEWUemxSdD40=;
	b=A46UbGp/6m83Xw2d5cSvSiYDWGRBweYZvY2yZL1KdloU/l0TPwCXqmTz37LfCMkLZ2
	N5qf1r691RlDosHEVfrTKPROuOCio6OoWBvXnON63K+oxFZ7GU6soi19BjSPD0SyjoKg
	3xoKMCzy8dhSaypqUHPLzZes3UtsH6cc5gJz/FZztMK4D9W92LdS+S3GbOEB3lgOEdqZ
	a+nUJy4n2LhNoQCcV3xL1YBnej0D7eUQIdClrBiHudb+OE1hUHoB3Hstq+rubvB+Y74B
	MydibtoEp4QZpNx4FkFVRCtGuaDpEW1oBYuJUmG3UjiDQhak4G2ed1+9llkz1ecZuYon
	TEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RJqZSvxU2ZuVs2EBwZP+3/T5RS9X+4AhEWUemxSdD40=;
	b=W1bSgQoQq70ox82KrteKp+IJdfHqs5fuXPCrOoPfWdOfPF/KiikjqFKVqaMs6laNHv
	k5q0ewH7eYn+8ZWVaWVH8OAyWcFk/K7fE6D1RcUFTC/2p6rRV3j96HjbFEiTSBOTJFnn
	0hK3uC8z5SPcr9E+cUDsRye/Kr9r91tNCjKZHjEfTNsWpvstlzqmuD0zBl+LATGMYg6J
	VV9MfjTg+FeRcnVHSGNhftl8KrmCeosJ/4LWAwzuwAAl41YP8N9OYd0LY2j6MBE24w/+
	uCsrjQoAOETuSUrmFyWFkoHo0ZrWIkNXvwpP9S+hRoGhr3T8v//2D/QrNx7DPvXoCgd+
	nDyg==
X-Gm-Message-State: AG10YOTHsY+koPFu8d2/NUIY4/zxEGkldYiNI4+q6kpBOlIQ4gSQzWqnsdyiAoZU2dHjKw==
X-Received: by 10.194.71.46 with SMTP id r14mr31257872wju.100.1456146493896;
	Mon, 22 Feb 2016 05:08:13 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n131sm20984669wmf.9.2016.02.22.05.08.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:08:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:04 +0100
Message-Id: <1456146544-32503-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
Subject: [PATCH][meta-filesystems] yaffs2-utils: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:08:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index 0e1e460..b6cf17a 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -33,3 +33,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+
+# http://errors.yoctoproject.org/Errors/Details/35140/
+PNBLACKLIST[yaffs2-utils] ?= "BROKEN: error: unknown type name 'u8'"
-- 
2.7.1


