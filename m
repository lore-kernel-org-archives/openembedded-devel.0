Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6A9BD7391A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 22:33:06 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id c4so394732wrd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 14:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UpZV05pYeWZUsx8NSjpfD72JTy+h8zV3fTVmMj/YHww=;
	b=lyV/nL6SbIi3F1iJDDCpNhohrzl0VbI+1zWnTuCni23QdnESZOPU/zkHAo5mwyeBVW
	2pdnGGB2/KjcsfK1uxQu5V/wUWa120Uplue48Oqzi82qqLKjWGVbF6Lt78dpkyfZ2XWS
	Ibnvb8gD+A0A5feHYzdjN1ttLvVPeXKG8eH9jcbIHwVaCyveHIcR0eu7PZCig8TBcVX3
	mobTqTCNPHu9IUSSyDyh9oejlGdNciFfo45S7p576mtaVAEc62llpBoUzvLSTjU+HuQM
	cvvzzfuvntTicY+5p/ZxW3KjijIJaHVkq8GizrFp9AFqPagJxC0GQtQfyTpGAT5NUwDJ
	3oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UpZV05pYeWZUsx8NSjpfD72JTy+h8zV3fTVmMj/YHww=;
	b=n2XeMIrufp/1l8U7TwpSL2LcYAwOxjE7QoQndR5FOPcNa3ik7E/EX3kTACt9tT0Fmy
	g0fYRVeu0KcBbywHkgpZoGsdTXIAtvW1S51eiFeYk34SBUP4MrpZ/L9NZteQ1gHlowgp
	mcxqbtqaCtrlPTSOVPVl489/RbhnvonuvIi+nAdO7xV9Fgbv0VzFxk2b18TQ66CBoXOR
	epqssuln7oYEcTbblyP3TvCZvNhf8N5m6QEnEmOoYzIe9cR/0ElUi7HWuZIoylWMicqa
	32G7R7Pe5FvSTnibJnAbRiP+u18wNLOrwr+Prt29SaQRckjwi76YaR3iQjAYbg2oDkW4
	f7DA==
X-Gm-Message-State: AMke39lKJAU0wDA/8sNbBCxiZksRFxYnTR13C8g/f37NFR8uErEHxcb4h3lRks+zmmIQ3A==
X-Received: by 10.223.130.111 with SMTP id 102mr24226500wrb.59.1487025187285; 
	Mon, 13 Feb 2017 14:33:07 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id
	r100sm15550944wrb.20.2017.02.13.14.33.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Feb 2017 14:33:06 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 23:32:40 +0100
Message-Id: <1487025163-21628-7-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
References: <1487025163-21628-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 6/9] kexecboot(-klibc)_0.6: remove blacklisting
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
X-List-Received-Date: Mon, 13 Feb 2017 22:33:07 -0000

Recipe does build with the pending changes for meta-initramfs.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
index a695ea6..45095f3 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot_0.6.bb
@@ -73,6 +73,3 @@ pkg_postinst_${PN} () {
 }
 
 BBCLASSEXTEND = "klibc"
-
-PNBLACKLIST[kexecboot] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132823/"
-PNBLACKLIST[kexecboot-klibc] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132853/"
-- 
2.7.4


