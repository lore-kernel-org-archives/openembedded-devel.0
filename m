Return-Path: <costamagna.gianfranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585D6C5DF94
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 10:34:22 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13807.1787567658887104367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2026 03:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YCzDZO5A;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: costamagna.gianfranco@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c214e625259so470281166b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567657; x=1788172457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=esF9FjUccZ1RziKXitSjVZT6UXmbHEEF1UGelESc74k=;
        b=YCzDZO5A/rGm/pSNnF3Dv1eCksOkPBjn5OClhkLm6aJKhS/fc6RDCjNDrjZyJeD+Et
         zBNtu3MM4feip4UqiM7ObXzX/1u6pCqKNFUIcCQ50wTHioriYQBRRVqoo5aE2gGDp+gE
         C+Pggr7TeVgGdPW0Wjv6dKI6e8EsFjF621ripqKtWRd48MdCeLmNGpBcL3PPbUoxmMXu
         vJeJnPOFGgFVCFcIqTJrlLQgf9bUBuVhYuNL6MghJJcvU+V2yE5gWU1DzDUpNdX75db6
         jC8V7Y1nsEi73yVQ1I960LhxaTWRG5rp0Jj3sRsqhuTFI5FecUrUGyLai+P0ctvrClNL
         lThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567657; x=1788172457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esF9FjUccZ1RziKXitSjVZT6UXmbHEEF1UGelESc74k=;
        b=klzDEX40ioHOe7N3urUCGhcT8ehGiSkwoZ8Z5UkkRrN04gnvsH7KPHaO3tRmddw8kv
         KgRj9DrTY5BbdfX/iG1zGIqdTz8vVgmeWnmP9wr/loMnbAIPvQb1etMP1Iis64tM9+ag
         gcZaPAB8Okmi05mQE11fR7vX6MgCFsQwnsXEUAfqDD3Q4703znMHhGR0dFWZOun77RR0
         e5FwC+xzBFWIT65bytwEjly5egd22+QlUj4wUQO3zz/LfEozf4QFt68hzSA4QZZVm8Th
         nGMfgREEbO8Y0lWrpmPuFtwkktnXMnichXJekvvu+0NpRaIj+17CCEJnCg0IsDSzSX2a
         6yuw==
X-Gm-Message-State: AFuF++k6K2YydCB5yN4/goYLLR5xelilaL1N0sJ65ZS6jp3BmT/EXLWK
	9+2KLelNtx6/FSU/OBtx7J6Ff8OeytLbA53gq35F87aAyomd+lwzjGMAe6DAUTLaGA8=
X-Gm-Gg: AR+sD13VoYgW9eQOHYZhu+hMKe6MNPf7jtPgZlVtNNa2/Ifm2OkFWhaBq2pD+9PtmPt
	J+c0fzzNguoZCIL9gOitUrf30tj/MqrqYht0Ws/kd18DsBXzU9Rm4+oLmONGuiDdMkq+Rh12Kw4
	i6X3vVJ7Nq+eFxtkR9iPQ35rhsXHypTcVsugxffzQaJGYN9eln4T7TLpeAL+bgBSIhFdCDnL59+
	p3qAaM/Z3Y57sCmswiVEnYKqpaI19zGxX7Z5RuRAYzck0l3nFmZEpZsl6JKHcrtPoiqYn4NV3mL
	Xu+HEYrx0WGY4Uw0B8Rksk30ViRJTaU4PLk70x6AIp8y6+Io219rRPXdi9VZZgac9T3YH6Kx4d6
	CODUL34e0e+m78GQ4Ycv5UM28Q4mydwwy7x18cBunowcMx90LKiXUr06I7JQLQGtEsA/4zy4wXH
	0UZmlZ4Ayi9imcuE8/K317SEqNjTTlFy1rCbJi+YoDDGKC0IPrwYd8Sj1r3AHvsRge1DbfeMJBe
	UTII/qn
X-Received: by 2002:a17:907:d78b:b0:c24:d6f0:a53 with SMTP id a640c23a62f3a-c24d6f078dcmr273292566b.23.1787567656623;
        Mon, 24 Aug 2026 03:34:16 -0700 (PDT)
Received: from dld58y9k4-lin.dl.net ([2a02:b025:10:2b61:2067:3222:ac59:1d40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496297c7dsm1171146066b.20.2026.08.24.03.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 03:34:16 -0700 (PDT)
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
X-Google-Original-From: Gianfranco Costamagna <locutusofborg@debian.org>
To: openembedded-devel@lists.openembedded.org
Cc: Gianfranco Costamagna <locutusofborg@debian.org>,
	Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
Subject: [meta-oe][PATCH] vboxguestdrivers: update sha256sum hash for new release
Date: Mon, 24 Aug 2026 12:29:07 +0200
Message-ID: <20260824102907.2341187-1-locutusofborg@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2026 10:34:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129457

Signed-off-by: Gianfranco Costamagna <locutusofborg@debian.org>
Signed-off-by: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
---
 .../recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
index 952eca1a06..f12270680c 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_7.2.16.bb
@@ -24,7 +24,7 @@ SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2
     file://Makefile.utils \
     file://0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch \
 "
-SRC_URI[sha256sum] = "384f293184c52fd51bc941c17d753b4019446f53a6b07c828adfb3e61fe0a500"
+SRC_URI[sha256sum] = "50356ccdaefe8f03537600ec31898b506e3a85ce79b94f26fb6cc1920c9e18eb"
 
 S ?= "${UNPACKDIR}/vbox_module"
 S:task-unpack = "${UNPACKDIR}/${VBOX_NAME}"
-- 
2.43.0


