Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5F1C35FE3
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 06:04:36 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.14908.1726553073819471551
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Sep 2024 23:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=apZUZMtA;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2055a3f80a4so34924185ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Sep 2024 23:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726553073; x=1727157873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yY+MndtgYWw9I2hYr1jZv+6A0JS49FpXQguY1+DiG6k=;
        b=apZUZMtAyr/vjYB5zXmZ1VrH9GKl//t8mfA8WR2nmuTK0mAqYHR7KvDMVrC0yqpPRc
         uOCPJ63DK+UzaT7pSso/GlX8tK8qZHuQaIFvsre98F0lVYHF1WEt/IzN9Z3bFha7WRyI
         egRGns+a1vvPMjEXwVlwOPIkcXCTkaLx+KBap4nbOTK6ryDUq2VdkKg7DKKNioyNJsAB
         r2eQ4LZQrgPe3xKIXp1k4XNftUkI5CXUa8hyg+vVK4UbHXBE3Z+4IfCsk0/aFM5PopsQ
         s0SDgGd98xrj0b0QFk75gZmKclyOlr5X3ZR2rzqAYkamnWqEKNgA7RJ7H77YrKB++ILw
         rfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726553073; x=1727157873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yY+MndtgYWw9I2hYr1jZv+6A0JS49FpXQguY1+DiG6k=;
        b=ZA1Zwf2cd5woorU6W5aAJ2lVC/LnIERiL5mueA6vLTQadIM7JNAR41zv1LO3WOoDuy
         zPmJ9X4dnzNsUwN+i64l4I3uzvNAZXpVyy4oXIDIV8cz2WKOQgh5DiF12B7Sujfv2r68
         Rk5XQpl1sHyoVjdYHFulLAfSeiIUlPUglOYeeNFix1kp5dIe3P3Mw4c2VfrVwH4jkRAg
         ZnpMtnvOsHigdLuo871Lol9hEIy57nZ8DnK84JHGRLwIz8VXmjVcEc76OAOhseNjz+x+
         bfuMfJCdpli8XuvZwmNQPyOk0qoFOsUO4HASMQg+H4oKqhLb6oS5KhRgXPpV6+zHKJbD
         XByQ==
X-Gm-Message-State: AOJu0Yyx3S2q/n9Q2o0+3wp3fzsSLil9RG/8Jl+1N0FzGWTSox2SYATZ
	+WfE0205fWNoyD+VSytR4Tlt78sTNiVrKc16URSn+CPZ3LQnGQxJrBbnIbXI
X-Google-Smtp-Source: AGHT+IEt5Sz8uzOmgqV7dE//4RDswrwtq+WGd14PdA+iCuZMpIpEuiO4fvfwvcPBS1TSLa/lcLJE2w==
X-Received: by 2002:a17:902:d50a:b0:206:9caf:1e09 with SMTP id d9443c01a7336-2076e47a81amr249508635ad.61.1726553072847;
        Mon, 16 Sep 2024 23:04:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7379])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079475df17sm44294645ad.298.2024.09.16.23.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 23:04:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 06/12] dlm: Disable fcf-protection on riscv32
Date: Mon, 16 Sep 2024 23:04:18 -0700
Message-ID: <20240917060424.1692067-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917060424.1692067-1-raj.khem@gmail.com>
References: <20240917060424.1692067-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 06:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112332

Its not available on RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-extended/dlm/dlm_4.2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
index ee006efe28..93d293493c 100644
--- a/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
+++ b/meta-networking/recipes-extended/dlm/dlm_4.2.0.bb
@@ -37,6 +37,7 @@ SYSTEMD_AUTO_ENABLE = "enable"
 export EXTRA_OEMAKE = ""
 
 CFPROTECTION ?= "-fcf-protection=full"
+CFPROTECTION:riscv32 = ""
 CFPROTECTION:riscv64 = ""
 CFPROTECTION:arm = ""
 CFPROTECTION:aarch64 = ""

