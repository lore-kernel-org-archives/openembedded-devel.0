Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38C1D33A48
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 18:54:55 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web11.27736.1730831904046782432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 10:38:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UbQZm6QI;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e30d212b6b1so5092334276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730831903; x=1731436703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dAaxGXCpqLB2XNExevbHX3QW3Gs4BX43AS7Xo5z4q6U=;
        b=UbQZm6QIYlK3Rr5mH1azgzUhduohLo5amVt9BfQ3xhDo516TXCxeqvdsvAIG92Kk3q
         FlSGWCpxHQrynphwSKmqcQwkV7ePJTXqIocOy5Waeexqp73c0L7XvenMI75THe687hn6
         7jmMyAmY0NF1h+OlwqfpteIT4VvJMHyg+fuZukfCRGV72nCiqILM2hFrx/eSyHqQBFf9
         ARaHbDWeA756SHt/drZayB44MEN29M3pdDHNo7iv1y1JzE1hmObhzmYsVK5HunVupry8
         Zy7G5l0RVN/4aNWxEfK+tePho005BJldU5Bmdz9A8GprmyDJobIQHsW9r/vpZigkVYrJ
         +2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730831903; x=1731436703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAaxGXCpqLB2XNExevbHX3QW3Gs4BX43AS7Xo5z4q6U=;
        b=KGj1zljk+5U1LxBnFnVFIFoA5e4Kul3AZ8GR7TSsnTban4y+jDWTEW+/8nWlbiyJfc
         MhsSSU1FU+DNkaloIcvlKq8MNPfS80yzMnuRpc2PVcPGDJwIqxgzOAuQBgpoF5/w2KEu
         O0nPhI9bJ/zvxWfxdc2mR3TXGcIF2JiYcMAsFcvjSgESwTzGVJ/bbelAhzeyoi+Zvb0i
         Ees4BvIebtFT+Yq24taR+SY8I5VlRTxs2NN3ZkGOXQqbskxUXRrx8tWFV7SErkcgH24A
         aQkrlIBHX7pCp3TdcA66FliPC2hLXoV6RASPwWJQNsqfvkX+dv3o4U6U52gEZAiT2hj4
         9zLQ==
X-Gm-Message-State: AOJu0YyoiW4kMc3lWLNL3twWL0xas4CwK1CEqKz42RDmqzHHc0tn81m+
	4CTkl0eeaJWWMjnhkdieu7vWutmfoheqyDrb/H+pGs0dMBldHj4LdetfttXi
X-Google-Smtp-Source: AGHT+IHarce8FvdBlJXcf41gFeRvtUuijWg9Y1xMSoTPI+n882YZwenpNJwSqW6oXmB5QYag8mDG/A==
X-Received: by 2002:a05:690c:62c6:b0:6e7:e22b:fb80 with SMTP id 00721157ae682-6e9d89948e2mr399896897b3.19.1730831902682;
        Tue, 05 Nov 2024 10:38:22 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c48b6esm23957617b3.103.2024.11.05.10.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 10:38:22 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schonm@gmail.com
Subject: [meta-oe][PATCH 032/161] mcpp: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 13:25:08 -0500
Message-ID: <20241105183658.34982-34-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105183658.34982-2-schonm@gmail.com>
References: <20241105183658.34982-2-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 18:54:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113547

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
index b44c6d666..0c1815732 100644
--- a/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
+++ b/meta-oe/recipes-devtools/mcpp/mcpp_2.7.2.bb
@@ -7,7 +7,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://ice-mcpp.patch \
            file://0001-configure-Fix-checks-for-system-headers.patch \
            file://CVE-2019-14274.patch"
-SRC_URI[md5sum] = "512de48c87ab023a69250edc7a0c7b05"
 SRC_URI[sha256sum] = "3b9b4421888519876c4fc68ade324a3bbd81ceeb7092ecdbbc2055099fcb8864"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcpp/files/mcpp/"
-- 
2.43.0


