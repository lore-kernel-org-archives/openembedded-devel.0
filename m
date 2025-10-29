Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17998CCF9F1
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 15:55:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web01.9181.1761753328329072752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Oct 2025 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LHLQOmCl;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47117f92e32so68862375e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761753327; x=1762358127; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZZYuU8ulp0n2u1Sz6HfDtt0xUoC5G6iK6iaGU2R4l0=;
        b=LHLQOmClPT5YuMrpfPfTTrxWiIfQnFCUw8FyRIxKPkRrYasjP9K2nvxYvwg3a+969G
         ayn6U0WldQzPxBNnOWzAQO2SndHPg0o85ynbm0hopW0KIkaHEBxRmOOufLHcWfpHk0T7
         sDGCes87JZEt+use4q7at95de2AI/t0yR4Bu9OzOl3/PmhmA9XnB0cJpqmffs7OGQt7n
         LOn5L+u/BppVuTHAi2iuXARQAYJbXjrv+JraVlfmEfKF2tfmuL+ftIayi+vvSl29x9KD
         WyV1XaV7FepNx/CYzomihknJt0/LMRPMpCncydAyMiCKNG0P2h5qWNiMLSsM08MhYhYn
         j8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761753327; x=1762358127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XZZYuU8ulp0n2u1Sz6HfDtt0xUoC5G6iK6iaGU2R4l0=;
        b=AU3vvJNhXKyd8PbuCIo4ejmWhZkrd9QsQca/yaHn3F3EFDis2jTWa4yMPe6a+vEbt9
         19OB4vSJLpo8AtvBNRc1EsjS9VaLYIpaCNjhellkMAtuIuwh7nlEc/CkZjBnY4id1jHj
         U0lPlTbMbj6yDrvp2iPRHnyW4bv/CsxA4dbDLofVyiA/8xhQMT2qK9dmT2BAGu7Fzczo
         M6VPNS8IbXfNlvZ5/iWbcP9HCRPwQaKCTJFU+z0JwkEh3KEWIdYaPnwG/b0dFti2mgzZ
         23W00x5Ooe88JjLYiaPaSnhpsF1I1f7nrARLMLJygPSyHtOPG6FysLyP/mKX6YNJ7htk
         c0BA==
X-Gm-Message-State: AOJu0YxWD6ASZ3zp3fMyCLBCSmenFawQjMC+cJVkkUFYMgRDS8XBcy4p
	nBZCCwkJm4zrTCO6p2niOQJFpgY4K5zei+l/ipT8upub8mQhQGYOhIP5wG8M33w/
X-Gm-Gg: ASbGncvDsT9LcXCG2z8UXB5VWH1a/hAq+JBa+XGAOGy7jouI+Q5L4kz2uAvLUGt/Isa
	OLB2kg1T4xwyGLRSZRodOhECiqp/CDS5qB+Aa0zTi3U6awzAMPtdVpo0YvFogfmeAmoi0vSz1uW
	7r3ErODC74yizJo20LBA894+4HGvRcWH10ERfwc3bY8zIBA8NnjZiQxb4SMLvVPnKoq+xaKCYrF
	TH5jhyo/7POX8Z1pIJM3prG90PqG8lRgU1vVas04UxXJAQF1xVu1FBjJJXxZo2O8G+9UVOVpPfz
	AY0dWyHBIacQHtsvjHaz3ZqpCQ0wvU5nl7AVwTuDG/3WkAJJlsYA1em5w5LVVu4pW3BEMzjqNPk
	Qvj1wmOkWawMCUw4qovW32mb6h5xsm8YTu1y9clMzqmM8kuIlFfiD3LEtC1VR0m0kUO6arKWkKA
	==
X-Google-Smtp-Source: AGHT+IG/82irbL5fgzLklFiZEcjMhOpTXGSahpplK+i47mtAuoRVOaJcpfgqJs+esX9DeYUXUrIpyQ==
X-Received: by 2002:a05:600c:314b:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-4771e3937fbmr29055835e9.21.1761753326546;
        Wed, 29 Oct 2025 08:55:26 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d3532sm27723334f8f.20.2025.10.29.08.55.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 08:55:26 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-perl][kirkstone][PATCH 2/4] libfile-slurper-perl: fix ptests
Date: Wed, 29 Oct 2025 16:55:22 +0100
Message-ID: <20251029155524.3550326-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029155524.3550326-1-skandigraun@gmail.com>
References: <20251029155524.3550326-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 15:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121160

Install missing test file.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
index 3fa4fb17b4..32d85a5871 100644
--- a/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
+++ b/meta-perl/recipes-perl/libfile/libfile-slurper-perl_0.013.bb
@@ -30,6 +30,11 @@ RDEPENDS:${PN}-ptest += "libtest-warnings-perl \
 
 S = "${WORKDIR}/File-Slurper-${PV}"
 
+do_install_ptest:append(){
+    install -d ${D}${PTEST_PATH}/lib
+    touch ${D}${PTEST_PATH}/lib/File
+}
+
 inherit cpan ptest-perl
 
 BBCLASSEXTEND = "native"

