Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEE9EE57F5
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81802.1767167685244589240
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Reic/3LZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso34445065e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167684; x=1767772484; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLA5XBTUtqR6mlOdHvmbGBPmPcdbXIk8f62rODYGF/E=;
        b=Reic/3LZw0U8uB/6465nVZFDWp1c31o1o61cgiqOh/U700VC/xLtctMPxrLGtNsFu/
         bqik57bMXUHtWp+pjTLdi3Lj/gw+4w1SWIga6hcHI5OvR8iWsSXckLm5VchCOORedAD9
         RnAlRdGQFqknDNrHzLQuY+zdeZ3BloS8qf5RV4i0AcX97C+6PFWB6XQAQGzOqxgKxbZu
         6Lq/a08OxZG5Dl7ZS2hMbwmf3y4vOJ/H37gjXTrnOQgu1KYV7R1nlTf+WqaXV2+CEsaU
         VcO20Ea+cGn7eO5iqfPfKBZcseV5FuA916Tjsk64EZACRW5dsLFbc+vAX2M9AP0RI/8+
         HPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167684; x=1767772484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FLA5XBTUtqR6mlOdHvmbGBPmPcdbXIk8f62rODYGF/E=;
        b=lXBW8Ru8mOBiscUC1YWxL/yDQEJUgFUfbc72USGrItfpp1claEsoquNzIzZsBKUNRc
         5lwTEX67+bDa8BHPxEnqAW+5fccAGd8AmEiv2I5ktnb61WQqkXgXlWa2nZ18bBWcsB+0
         3YEYmk++gaI4YVkqjyO9zYwpCE5pe0xe6LUrOnKdlE/HsgT4JdGJmFGn6kSti0lspnWc
         r4nGPxi0iOWvYz2Kms3CSupbmydujZ6g42BBG+LYpV7iVW1MW2R+3+/Jmt40lD7bAmEH
         0ef86ZYr1CAROL7tymgmSw4YaoR+WE8iMt0/Cld20FQtDFXqmy9KzhrtCKTv1f1lQ3wE
         cOXA==
X-Gm-Message-State: AOJu0Yy+bDqG267KN6oPSDs840WRC72Bvt5H6gNQoL7WLaFzCNxRZRQn
	U5uNmfTc+zQb2PPsD3GPWLRaSiAdOKVqc4k1G/0QUQKjFYMov3lfMwupk9WluQ==
X-Gm-Gg: AY/fxX5AaVZbIv8odRzo3UVae7b+CjyVBC9gsPvEDn+deCE9vzVZMaL5nJR7vKAU0fS
	0EO9dSskBrM4vdxy76inbx5Dk9CVY89DHnIm/ZKwAziL9Bz/G+QDSJgP578HwO1ArE4lns9UsC6
	wmmvtm6/wJQAzPquPl/bk3aLvtwrZMN9i2NjmOgu1aF5Vs89jP31naBtjNM9WyRRx9WvRAsByUx
	gs9G9c31anLlL/Dn11DQP3Z5qW7AzMioxhC6lcHqvJQksBClRXzhlTU2WXzRcPK97ME5eoqD2Qy
	GslGTCGNKvrkEwz3/qJLM3YvMeg05UyybxgkNrzX54D5RfnZMMfxjmJumqcnGbmCBhWVt05EHGy
	0YRM7QfrEXVmbaFKeg1Z0OuK5mugWiF6ikwoKLZVIE34OR5Gz8Fubps+DpBpDcSZtvH/nIP+QSg
	n5tiFBuqvt
X-Google-Smtp-Source: AGHT+IHUtPSWBpM/AFI17gwOj2fNAXtfLzbSeTdZQRmfNReOB+mPXjG9UP4FDXhmMDXkNwKGXemlDg==
X-Received: by 2002:a05:600c:4511:b0:477:af74:ed64 with SMTP id 5b1f17b1804b1-47d19593992mr403757115e9.27.1767167683613;
        Tue, 30 Dec 2025 23:54:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 09/34] python3-flask-user: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:11 +0100
Message-ID: <20251231075436.771395-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123049

The relevant CVE is tracked using flask-user_project:flask-user CPE,
so the default python:flask-user value doesn't match it.

Set CVE_PRODUCT accordingly.

See CVE db query:
sqlite> select * from products where product like 'flask-user';
CVE-2021-23401|flask-user_project|flask-user|-|||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-devtools/python/python3-flask-user_0.6.19.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
index fadfabd0c0..68d7361519 100644
--- a/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-user_0.6.19.bb
@@ -11,6 +11,8 @@ SRC_URI[sha256sum] = "601abcc0343dfbae0c56273d98362d5cdc266ac84d20b3f65a212e4a2c
 PYPI_PACKAGE = "Flask-User"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
+CVE_PRODUCT = "flask-user"
+
 inherit pypi setuptools3
 
 RDEPENDS:${PN} = " \

