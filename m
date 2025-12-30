Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE40EE0211
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:29:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65068.1767104946926813129
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:29:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1lec0v+;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4775895d69cso42139495e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 06:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767104945; x=1767709745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rtbWH9qHCVcVFUVMB52IRWGCD+Gd4mr4rSILWLpKGJY=;
        b=k1lec0v+4zMTYC3fMxdZTN8JGhovWSXj6MKUHtZJQcRAdwgsby7c7gw8LEZId3jO9n
         lX97aNiM9m5WxC+YEdAuddsRmAaaUQ27iKAiCIktP020jsp8zta8Xw8xnjyFiYPjCZDB
         wkhmgFMJAD/SMGYd3yNdrurMFD+LDCkHFFyjZbTnhEanDarVNSkMq/e7rVvf/0270SZY
         DsVusdcDJDcFy/qvW0jk8ZrhBLMNXkAG1fERMRdwfiu3IEHE48Y1sww8o8s9R3TipP68
         l7l2B2J31w3iXMJHIq3EjofsABlNp7yqrXo2u49IpX+2xdlANeOc+p/G6xoxRmzceMrb
         PifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767104945; x=1767709745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rtbWH9qHCVcVFUVMB52IRWGCD+Gd4mr4rSILWLpKGJY=;
        b=duTnModXKH1omXBDTe9AN2NUoaIvdFZIJJy3zauM3EZSH1ONbDovDycpcTyAGaD+KJ
         +F883jhr5ixdslJLJw0baVYkEqL3Pzj3USGUPrVBgUo4Ue3RTGBqo4s66nT0PF/3fh95
         RqV8awRsiP6CJ0Nub2Jj62hvMS1ZuEf4jmq+M8xjb4Ru/evjtI9ubWBq8IKC7ZGkIHyt
         RfLxJ366ijI2tSuROPlCHif/WA5G7XcmzHOLp02lZl1dJeJ8oH6I5Epouenc40rXdWkj
         8FOYFHJNpvdR0ou+ZUbIebFVj+PgVadRA4eMqZ4nDiWQLMjRW+qwexQ15i8WOPyP4kfv
         mmQw==
X-Gm-Message-State: AOJu0Yz4G6vdvrrvgzMjr0tx7919H7NQGixPxhTmbFP1j3jyYDIFXCyl
	OvDgwxOF5Ebm5eNIHKqLAJ9RuVZseu1TWjUL8tC4OBkQg+0yTv7e3rpiokVWXg==
X-Gm-Gg: AY/fxX6cyfNyQkW8GZcO+LCaBxJUbA2bw2lZjr+xcKGpXYsLpGtrPlyfmjYhawZRgOg
	uTxteVAGWnKRdodcS8A4lnkLTJeA8aB0bEhw1zsVuVvZDF8jnDEKxb64JcHC1HXwr2mYnUXlSDl
	ibpQCqc9h9YvGoHYom9E1ji6YVb/y8szI8DK/1zpm/5MNvTPn892ibTM6AVyVg19GqmTbBI+5wZ
	lQlaaBH+iofhNo6uUfdtu91D2qZWTCgFOZNc/rWcuFReGxeRKuCKJTJdL8Z85H3KAPlnJ0DofLN
	kQRpU0Qrt6ZtNeP8Sy6MgSLMktb4p/QxLBZbyZH0bIF4B12NeOfaFOIpDTClJTAiDjQi0GMie4f
	0kNcPWneM+HkQUY2nh49BanxoXGTpgzIuuvvkbUH5MIawUvoXSXVmw+i9CnUfPUZqRcV8IWnjYw
	SgN0eCC0Cg
X-Google-Smtp-Source: AGHT+IF/KULzdZsF7iNw2a8OOcDLEor6+fp7uxXqeEKLT6AoCHc8gNsaaOTIp89bZUkuOjKUmtw9Yg==
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr397226025e9.11.1767104945273;
        Tue, 30 Dec 2025 06:29:05 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm653345045e9.6.2025.12.30.06.29.04
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 06:29:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 04/10] python3-m2crypto: set CVE_PRODUCT
Date: Tue, 30 Dec 2025 15:28:56 +0100
Message-ID: <20251230142902.730667-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230142902.730667-1-skandigraun@gmail.com>
References: <20251230142902.730667-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 14:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123020

NIST currently tracks CVEs under at least 2 different CPEs for this recipe,
but neither of them is python:m2crypto (the default CVE_PRODUCT).

See CVE db query:
sqlite> select * from products where PRODUCT like '%m2crypto%';
CVE-2009-0127|heikkitoivonen|m2crypto|-|||
CVE-2020-25657|m2crypto_project|m2crypto|-|||
CVE-2023-50781|m2crypto_project|m2crypto|-|||

Set the CVE_PRODUCT to match the relevant CPEs.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
index 9aac7b344f..03b178fc8a 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.46.2.bb
@@ -51,4 +51,6 @@ do_install:append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/M2Crypto/__pycache__/*.cpython-*.pyc
 }
 
+CVE_PRODUCT = "m2crypto"
+
 BBCLASSEXTEND = "native"

