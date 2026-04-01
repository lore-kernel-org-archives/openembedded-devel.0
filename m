Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0ECAD35148
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 06:46:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6985.1775025962901185254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 23:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CZCaSiC4;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so78053515e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 23:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775025961; x=1775630761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYiHytzmfnW7jem1xLf8MSismfwRS53pQa3A5cunkO8=;
        b=CZCaSiC4KZhnBYLO0Ajvv+M0Qy5wOxarMWdQLD4Ph3hRTMOYNihRAavkmy8mI/PIPW
         9s0ko8U8mFQzDeoY4dWGbQ49CdsEVOYpVxR5qarQkQbexN+JeRF/CSnXzYg3dPjFL2tj
         hjzPRHDWfSx9MLUPZVI5zvZXbdLlFaGUHeAW4PNc2s3KKK7BiN4nAfP2Z+SYKgIZF9hH
         tbeHT5pTOiKMcFxOfeqk/E7T7KsqD24uok1qYUCcbMN/p42u6zl/Fq6qBjNZXw71TC+Y
         AisxHtZArhT6TR5dtNco0y1NS4fEgI702yTPnquSwA32XvkBaQq2xjwVu2rgBeq4ft2s
         cb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775025961; x=1775630761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fYiHytzmfnW7jem1xLf8MSismfwRS53pQa3A5cunkO8=;
        b=ZEESswRk1DHsjhHaS2lGnnkLabIsZrMpZUWblBYv4LkgIRxb+JcEZZ/O7k09x4kAOJ
         cHUb6D/FjgLASM9Xq5eBTUgAaFvhd/G+oqo4p9HAMXNJ5qc6IAT1RbnMOsEuLbJo3dUJ
         EXQPUBzmHG/hiNaCO0jhwGXF9AN9rT3/B6buHwLeC9zK4aUvTIgtOLeIfXoi6yTpxwED
         4edKLK8d/FvKyJTwrN1U+7Lf05pi7B8wh9eeJ1Wt93lZ5b/wvD9ALtWNwUj7drEXmarM
         ICuLBM+kYlvSOnn+atEM76DH3wZ6SfgiiqAAb37EKM5VX5GKQBT0sAE8+jYHTyEaeboE
         g6sQ==
X-Gm-Message-State: AOJu0YxPsPHB01eL3T26Ni5CSAJX6RqUcLY+B1Nzm5kqphGkN8BktqxF
	/NhqNvf8yMC61d3+wHYiEmrlgcKg8HBbV8L9mKfOP5tCmq3dRbN+l1R8lr9Aeg==
X-Gm-Gg: ATEYQzxctPCm/XrAVQPPTzGLICeD7IQ3IkmJqf530nTjb4Rfg3hDdDpyW7tlugZAINi
	uVhyPpTcGehMNlp8SNdFD4o8NUQVVS/149MadtmQezPVTo+AzIiHyUAsXGLkWGLlNuBLBv9nTzK
	aao5XU3zMUYqhC3+DoffYmlxVxrPLh7mGPCNeH0RGwRvefV0tbyp+OG1JnkKKJSOB9ISNuPWJ7e
	I0NeW9T4GVGbzHooiCn7LE6dxwUitPvc6T2xYGzTRdRf2y5BYJiTs+aQWGlfypNQ91tvCx7mNZQ
	wSELtQTUGyOvwfqzfv26HuYfJfsIjakX2E2/sAYzLNXdveMxzpNA45WYWsVjc+0RNQ1HF4Mc9xb
	QBSwgz3NRiWMfydHTU7HEe7R420JtbHx8pSQgct6Ds8goBzAT2wyNGpETCa/sFHrTrrafJB5AVi
	yD+KDo2iLJEw1kZjeCx/dyO9GhsalvovM=
X-Received: by 2002:a05:600c:848e:b0:488:7ca1:19fa with SMTP id 5b1f17b1804b1-48883575c06mr35298565e9.8.1775025961115;
        Tue, 31 Mar 2026 23:46:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c751158sm50971615e9.6.2026.03.31.23.46.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:46:00 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] strongswan: upgrade 6.0.4 -> 6.0.5
Date: Wed,  1 Apr 2026 08:45:59 +0200
Message-ID: <20260401064559.243277-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401064559.243277-1-skandigraun@gmail.com>
References: <20260401064559.243277-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 06:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125898

Beside other fixes, it contains a remediation for CVE-2026-25075

Changelog: https://github.com/strongswan/strongswan/releases/tag/6.0.5

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../strongswan/{strongswan_6.0.4.bb => strongswan_6.0.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/strongswan/{strongswan_6.0.4.bb => strongswan_6.0.5.bb} (99%)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
similarity index 99%
rename from meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
rename to meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
index 2587722b6d..991ca5080d 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.5.bb
@@ -10,7 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "79576bb61b9a406cea9eb73d0c565cc6254a6b6d2e7198f44758d2d7c61a7aec"
+SRC_URI[sha256sum] = "437460893655d6cfbc2def79d2da548cb5175b865520c507201ab2ec2e7895d9"
 
 UPSTREAM_CHECK_REGEX = "strongswan-(?P<pver>\d+(\.\d+)+)\.tar"
 

