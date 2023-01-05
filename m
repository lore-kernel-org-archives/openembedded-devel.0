Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3225C3DA7A
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 17:09:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.18548.1672938580516246298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 09:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Rz8wtDLX;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h16so36724808wrz.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 09:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqBEpX+IFwqtrbme4QfvGEYwkUdq96qMvGXFkQcg/tk=;
        b=Rz8wtDLX4O36iTBGK5+FFi4Ef8q58MhDYAlLROsgRHgl5D7qkAQYc5cS5zxq3vCPXt
         vrQFOxa3f63kAHKqtp4KS2k8TdaoOKFpdJ6oDVCU4ZvcQdAtOCFUMzAXohn0MHLtSO7x
         PmQPOa+gJgTSya5+QmZYIOwVpj1hbS99YU3KAMdDgs4ogI2Il32jLr2DrVMreqfb4rGr
         bbNGgunto3Rcl+YPtoWITfLPx0dU7j3+ZN3j98RpWh6CIrZzyAlN8Pn4Z1wTx/7pI+G3
         Z4DW7HDzwU09IHEjmy4/EuEOnIiT3BFUWsLTe3IbTJ9FEPNhli2kWBras70EfuJA+ZJb
         MvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AqBEpX+IFwqtrbme4QfvGEYwkUdq96qMvGXFkQcg/tk=;
        b=AeQOUpjaHlrQq3Zm1ah9OhbeM+LtPdkvWZI8Fe5xxe1fd5BuklrRtENH6QrPKQozrA
         NEU2+9gsS95591bM6FTrgr9E/r0UrHIbQMwwFeUZkV3FOYb2HdqDLwtR5X4G8Zy53Jqw
         /ODrgkn2Af9T1Z16kXnjREb+fG1G3unm5DaRRHSYgTehYIxc56PAXxCFtZvhKmeC4lfY
         3K6rctd7E8Qj06r2QIGfe2i0tAuypysHSzebIlAmT+ugmffXQnPXG8YFaLzUoeQakNgg
         8f8zd8q0ZUFyFX4xrenHUSNo/W+61ElRD34lFTIOn7jMnbZgQxcuPuPvREE7AIGuKQfg
         E5Iw==
X-Gm-Message-State: AFqh2krSkvhjPKuCz3HUqRRRjDFqByA+6v4w2ggKww67FPY0omhrOKKE
	kJn8jtMUF4KHHK9GjDE/d7/J+xYCUbc=
X-Google-Smtp-Source: AMrXdXsT8f/Ij5bNZzJwuhSPT3SowxjT/o4+caMDI/d6CqIdi0pCegDjGDBqzWhwY52q+17cmMz/UQ==
X-Received: by 2002:adf:e449:0:b0:27c:fdb:cfef with SMTP id t9-20020adfe449000000b0027c0fdbcfefmr22683043wrm.49.1672938578500;
        Thu, 05 Jan 2023 09:09:38 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b00272c0767b4asm37090980wrc.109.2023.01.05.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:09:38 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 2/2] usbguard: Upgrade 1.1.1 -> 1.1.2
Date: Thu,  5 Jan 2023 17:09:29 +0000
Message-Id: <20230105170929.12088-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170929.12088-1-alex.kiernan@gmail.com>
References: <20230105170929.12088-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100419

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../usbguard/{usbguard_1.1.1.bb => usbguard_1.1.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/usbguard/{usbguard_1.1.1.bb => usbguard_1.1.2.bb} (97%)

diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
similarity index 97%
rename from meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
rename to meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
index 2e0934931de2..e1e087a6d01e 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.2.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://0001-Add-and-use-pkgconfig-instead-of-libgcrypt-config.patch"
 
-SRC_URI[sha256sum] = "460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432"
+SRC_URI[sha256sum] = "dcf5c90f3f93030e04df1baeb8d388b678c40dd48b135ea12a7be7dee8944934"
 
 inherit autotools-brokensep bash-completion pkgconfig systemd github-releases
 
-- 
2.39.0


