Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA6D7826D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Feb 2018 21:55:28 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r78so6794982wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Feb 2018 13:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=fn8EJC1irFJoD4/t2mBi3sxMcTXa4IxY8rBBiFR9jIU=;
	b=WgKZ1lmrrASWZi6cJPnzMF7aUn0ZGgLLf5fFpNnMFPT1bzIQ7hq0wlxeV1TY0PjnKo
	AOXVVkA6riXcrTUcvBfhuk3kcVteZRTecvPvOYCryHqaSTzHFvCZCl1X7BRlX0s3lMyS
	cw9uA9XDYIoE31g5uNTnF0pWgzrJes2/WDd2JpAoxCI6kd5eDqE387SdZoeSSd/3Su4q
	/uPWNIJbcuY9dMB/55tzn1f1RYEVdMfgsZeOxp33Js1b/g0I91wfMpbOf1JwtTes7QO2
	TeVMji0wgFE1uw/gE4flxRKrd+cOC8frjo2GNmez/hbbieZ1dAnrrJDIGA0CZ4uTFegA
	e44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fn8EJC1irFJoD4/t2mBi3sxMcTXa4IxY8rBBiFR9jIU=;
	b=QybvnWm+M4L/FXogArRBS7tLOHb6V5oUpfY4ezwwJaKbWM8hfLqfIHIfUwzeyUKdN/
	hhvSDsAo6w9CKSJIhXyY2XI8nUAbKlOJYO705ODYN+wMd97vSRrcXj4Gz5O4wKx9qmuN
	lC2GlcB3gI40hKhxwL0lzBgHlM/0z0fk1ZwN0/uT6KDYE7jB4EXYf1wsES6bHMSduxqo
	DGjzyPlBwDGSemxJuF4Lkmx3TCBImhdZyS4aK21nKwrgT4gq/bVfmCJVXlpSXW6JcJEy
	24zIE/qjfsuenZ/5A6az3AMyGFY4oT80Je4ZZ7v2lUDMTB3gYU3l0V3NAXun3QSqbq5g
	tuww==
X-Gm-Message-State: APf1xPDn+ugWxbMXaCEDvf2zwJzJCmk9hNTLcMK5j1IAGC1qnQjzWuJl
	OXCp2EW3+UZ14x9S7RaDbC9nDw==
X-Google-Smtp-Source: AH8x225XI3xtLZWTuJG6l8XpJYm0wf/j42m8zT3Ajqz41k3DZIYL8Jt99iIKppiQdQY7RPo96mbglg==
X-Received: by 10.28.10.6 with SMTP id 6mr2927339wmk.1.1517954129710;
	Tue, 06 Feb 2018 13:55:29 -0800 (PST)
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it
	(host57-10-dynamic.248-95-r.retail.telecomitalia.it. [95.248.10.57])
	by smtp.gmail.com with ESMTPSA id
	p10sm18421145wrh.96.2018.02.06.13.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Feb 2018 13:55:28 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Feb 2018 22:55:24 +0100
Message-Id: <1517954124-28351-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-handheld][PATCH] linux-qi-ben-nanonote_3.12: fix bb warning
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
X-List-Received-Date: Tue, 06 Feb 2018 21:55:29 -0000

Adapt after oe-core changes:
 6c8c899: Add support for multiple kernel packages

Fixes following WARNING:
 /oe/meta-handheld/recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb:
 Variable key FILES_${KERNEL_PACKAGE_NAME}-image ()
 replaces original key FILES_kernel-image (/boot/uImage*)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb b/recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb
index 0a232c0..8d97b26 100644
--- a/recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb
+++ b/recipes-kernel/linux/linux-qi-ben-nanonote_3.12.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 
 inherit kernel
 
-FILES_kernel-image = "/boot/uImage*"
+FILES_${KERNEL_PACKAGE_NAME}-image = "/boot/uImage*"
 
 do_configure_prepend() {
 	install -m 0644 ${S}/arch/mips/configs/qi_lb60_defconfig ${S}/.config
-- 
2.7.4


