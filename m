Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 128EAD3F294
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:53 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web11.30100.1729278829015374146
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TPG8kVVw;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6e2e41bd08bso30188477b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278828; x=1729883628; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFsQCs79wh7Ge/gSN2sg32DrCAblY6exK6cm+CNZH0I=;
        b=TPG8kVVw+tBHMZ1MzKn+LNBH82simsQaOXSsi27hDMHBQDNfPr/NBlBktXBHoBmyPI
         onTSMz8px4sNGKILr4RxJmVAcHIFm2TSr7MFJzcV6Td7NM8AO+KtN+hvogOG5zB+ZFHO
         oRY7l+x0dvMnvHkyW6s/auGtD9Jy5S/8Vf2JYtrg1i/oYBQ93EoMYV8z/AstiFl3JmoP
         ImOspL8WrqHlXEjeDUUBWg6UDQw25x6+ite60n2pwdioDUrVGON2K5eAKi2i/3AWuWB0
         9JuK/koty20Bx2qaORUD/bpAs4+OvMChpxgnZhG/AcdefeR5CBPC4wukrEiMwBCbzW9F
         Isyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278828; x=1729883628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFsQCs79wh7Ge/gSN2sg32DrCAblY6exK6cm+CNZH0I=;
        b=I3xT/v0ccaalj/HJKoyDL5aGQE26Mi/njtxAcZseUNghVS12IApkk2YS78wU1xMmKN
         HdsUgoZH1VdGLbpbkqXOBcNaI9LODIBTd/9vt7J3rUaQMwFD+pAptGj4q+0jo8hCUEWr
         0FQ1ce8f+nCGzxf+YZ03z2FFYyHvBeotG2c1YZXDIDD9reGXvgSGqUQM0IDmpNDyN7YL
         7VDZ+Nt42TrMcxdeH2GoYAzsLK/QMMdMUMk1RVUSRpZ8dVvgOcKw1gDBZg3OOCwVq2xQ
         Nwq24C6asF208tpn6NPhOt6J13e/0CPUYJrcRfh1B4dlVpgOm2HAHy86sp1r2dw0C2aL
         jyOA==
X-Gm-Message-State: AOJu0Yz0j/wFpXeI9scQ91ejCt3TUJo6jFRyWe25LV6hbNvongY0GULR
	nCfsolhbbwiV4RDhHmHv2lu8guFxo2XBa1UrhFT0HifA64NPH+oPLddz+Q==
X-Google-Smtp-Source: AGHT+IHjm+Ut43g+76ORnviecEQzPj7MD8YmbUPjJVZVRwj/DU5d4P2CkEO3E5QQmE0LVrC/nnb+Zw==
X-Received: by 2002:a05:690c:360a:b0:6d4:4a0c:fcf0 with SMTP id 00721157ae682-6e5bf9e8310mr39242777b3.20.1729278827604;
        Fri, 18 Oct 2024 12:13:47 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:47 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 57/68] python3-requests-ftp: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:44 -0400
Message-ID: <20241018191101.25184-58-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113044

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-requests-ftp_0.3.1.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
index 6df8e7e0b..119c62ea3 100644
--- a/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-ftp_0.3.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://github.com/Lukasa/requests-ftp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6683a23c9968b97709441dc884d46df6"
 
-SRC_URI[md5sum] = "1a52ad1219e696b5abd5449d1ccc0294"
 SRC_URI[sha256sum] = "7504ceb5cba8a5c0135ed738596820a78c5f2be92d79b29f96ba99b183d8057a"
 
 inherit pypi setuptools3
-- 
2.43.0


