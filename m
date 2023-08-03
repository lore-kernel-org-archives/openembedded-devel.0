Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01631C04A6A
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 08:49:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.9672.1691052538142100635
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 01:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jh+urcKg;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F60FFF80C;
	Thu,  3 Aug 2023 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691052536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3uV8RaGf7MPN4P/Ltc2JOQNiZUM/OupmjdUt8bjhYs0=;
	b=Jh+urcKg+XOcqdru8K4qBRtorzfUsZJ3ZgtG3ewiSBzSkke/S/nILEtQJQiyH013R7F1xr
	Ub1uJ5H/2xe/jlwfmx/+H/6DBfxqwTjZBp0cW6Xwyj6HHZHC1zSNYh/TARAzrv05XemVpT
	u5mJPhf7UO6xVjzc/0TOhhkMN3xscWYqXAO5wkJCb6zN+6W12S6A9SxLX20rT/HvssrgyD
	74Nq0SMha3YdHkgJ/KTwC9U+fXdGeRfwT9UCbiiKpovxQbb+ZzGiEkDLv9yVyeWPUmKAPD
	BYEAWUJbkAvaHYCgoB8HvcopExxmdcwc32rGTMg9raNzbBJesLgdXa3sD4fPKg==
From: michael.opdenacker@bootlin.com
To: openembedded-devel@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 6/7] [meta-initramfs] remove unused AUTHOR variable
Date: Thu,  3 Aug 2023 10:48:38 +0200
Message-Id: <20230803084839.3012610-6-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
References: <20230803084839.3012610-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 08:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104216

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

No longer used in generating packages
Also creates a possible confusion with the recipe maintainer
name.

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
index 88f32c818..5c7e84cc9 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_git.bb
@@ -1,6 +1,5 @@
 # the binaries are statically linked against klibc
 SUMMARY = "Kexec tools, statically compiled against klibc"
-AUTHOR = "Eric Biederman"
 HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
 SECTION = "kernel/userland"
 LICENSE = "GPL-2.0-only"
-- 
2.34.1


