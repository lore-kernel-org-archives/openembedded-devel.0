Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F0BD61001
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:17:16 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12776.1769685431387583866
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:17:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l69qEyWu;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso7464055e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 03:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769685430; x=1770290230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U2l0zNuRSZYZMKizodmY26ecZbEhZleaEYZbB9JUw+0=;
        b=l69qEyWuYSCb/4pCyliYW9Qlm3AWqdsS76rVyutoLFXojan6oxJ7J3lUHa/i+EN/+C
         /7QAYMxpxiJ7grWcM53aKlQis5ZfAV8SZFvVa7pAsQ3FvmH8h2MggKBkDrsOQGJSZZrj
         Fc+Oe+EbAkJl8JhATpQGYVBrI9HPVC31lWvtnywWeKtGK2JnBF6Cb+kiBTSQkD+FgrsC
         MKdt1X/sIrStXrzJqpuFycp7wif2/aAtRocDG+yZxfDbI/PH8OUxXWbi+Ua/0OU3Qb6r
         k2FQZdl1Mgs7TktPWdq9LH3/Xd9nCZrc8uZmcFcLgvnuqmhPypSvYsckRlXHhhyhaylo
         gkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769685430; x=1770290230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U2l0zNuRSZYZMKizodmY26ecZbEhZleaEYZbB9JUw+0=;
        b=dK1O4jI43tx8Pyl8wn1RDRBv7b2FvPNv1MBDMOcJ5b9nhZO3u67nbK5/ep4Z492ps0
         gGspkHkzKiDpZCFQuHZ5Jmjcy7ZbeMYFZOaM+3kDynl1IenCKaWaWwmVNxsGajBJruex
         aTRQRIxfbmeDrxzJ0NwhEmxTHzYYRu6FrjOCNEeUk60ORYf5vpimaf+IBq6/QV5mHrrA
         +u+/r4z5bwFXsUI3L6Kc5rjwp2qTuu29FQ0t6yTk7HApwyMC4JD0x7Af7MPOHpkrrPwy
         uIXdWR84EEjnv0iyvCoSMcralx7hZ1S9VZ3CkLSKNtxeA3ee755L/7/ZlB5LdPwDRVsO
         5RNQ==
X-Gm-Message-State: AOJu0YzOkFU70PelT3ezoYvdgyObT7YjJcn90tX1MtHVN+CRoMc0eYda
	Es3qIUeIo3FojGXl4CdwCwT48SMI3HbbdC1+0CeJn/u++5iLi8deLZIdIl5nRw==
X-Gm-Gg: AZuq6aJ+B4xapSfNfcKZfW3lBlInd+rLtkd6+0paHBnkzZjT4029vrH8vbFGDdLIPpL
	ndKCK4+Q8jp6us+CiAomw8nDaFPS9dwxah/TkW1kyDizcmk+YqC9R9yQlemoFglhGwBxCLy/7JC
	jdRaT+xtFSw7yoH90VgUvNbrtpdLuWTnM3JIOGjcj74k5dK95s2NuEVJRA1pQcB+coJchqqcJJE
	/mEs7K9dDwkh29N4rNVFvm8RMtviLrIajWIHkAfQq1+w3wNzlUfKS/0svwMGB572C0fssaoY6wY
	ouJ1DumZZp6SQsYQW8QwKEfjM/Zq0VT0FndpU7myeLuWJzcSRxc/C/bnO8e9ZJNXy/QH5IS83Ct
	tVIUQSnnjX9O7UVapww1p+LuWfDx30MzSMnTWzU7SSlOPEP2lkkUCf81VHALNsAc+v4i0tlOrY/
	J62kv2NMSP
X-Received: by 2002:a05:600c:2dc8:b0:47e:e452:ec12 with SMTP id 5b1f17b1804b1-4808493b38cmr21295255e9.15.1769685429630;
        Thu, 29 Jan 2026 03:17:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e4824sm14718443f8f.1.2026.01.29.03.17.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 03:17:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/6] nvme-cli: upgrade 2.12 -> 2.16
Date: Thu, 29 Jan 2026 12:17:04 +0100
Message-ID: <20260129111706.903623-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129111706.903623-1-skandigraun@gmail.com>
References: <20260129111706.903623-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 11:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123991

Changelogs:
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.16
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.15
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.14
https://github.com/linux-nvme/nvme-cli/releases/tag/v2.13

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nvme-cli/{nvme-cli_2.12.bb => nvme-cli_2.16.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.12.bb => nvme-cli_2.16.bb} (94%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
similarity index 94%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
index eae49b04ea..3fbe52020e 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.12.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.16.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "71fa5d9310d6b41a69e844593423ac91b1453472"
+SRCREV = "faf7326a2997dea91687fd3daa17fc405910a4c1"
 
-SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https;tag=v${PV}"
 
 inherit bash-completion meson pkgconfig systemd
 

