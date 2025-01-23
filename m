Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FB2C0218E
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:13:59 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.6699.1737620034290365676
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FcwBfbL3;
 spf=pass (domain: konsulko.com, ip: 209.85.218.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa6a92f863cso130436166b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737620032; x=1738224832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9hleGewrOYQxMRH7b8KM/ilR8CFyTMOLZg0Nj4gxwg=;
        b=FcwBfbL3u9gwvypA1KtRqOyy6rfDA12doGh7IpXcZSsN7RxSlTlqQAkWzTpzRqrcBL
         H6t0Ulc67QzGg6wDIVWDov/KSCXetoZw5k+vhF/dO3Z+4kccM4se3DOgb7hWRti7GNlm
         3nYfycK49Kig0YEFCHYDia6R8R2H3xqdMwaD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737620032; x=1738224832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9hleGewrOYQxMRH7b8KM/ilR8CFyTMOLZg0Nj4gxwg=;
        b=ww3opdxD5wsRl9ULtQqw3LG3ZWh8uLM9xQmYK12fVQcpP1411KrCdEdt2rqHbBwhQ0
         Ehj3oIyZRdWYnfPN9+jy55tj6YAGax9lu/aAD+gQdJmwEtvGxS0Gy1bdmmYzrF98K/Kp
         B6qdw593vBtSgvKhm/IcG4TQ8eWNHOIcgSWRo/tM0FphZ8jEGiAUsxtknZEf/VI45Xcl
         +fL5QUnux6zHDY9Et2xkHHg9vJySOhlt54PvtNLEMNIULDSM1zWOMZLYn0jYD55WvAnp
         0WlC88FLiuL2dvS/KTZbp8Q2/Jl9pCfNbcvU9YUYrvuvTU/7rnhogJmVMqm5E+zsPu+w
         lNWg==
X-Gm-Message-State: AOJu0Yxei8/vZqpdwuep+e9upZz2QE7AImogMW0dh7IQ+9RGW/2Bgl91
	W0yLOSQOb1b93qokr+yCfu3C4GVDBF8O6XJeRJxwDJ0r8lNT4b0Guq+AyiGqG/cu99CQlIbmSey
	q
X-Gm-Gg: ASbGncssOOcb6oYF8clD54fJPfKJxKdhuyzoQwlZd79hqNMR2m7ad39GIOXWhsOq1vV
	h31ovmSFJo3tgnZEi/MTtBFhyhLFxfybz4+oVduRh53Rvosi7gODaI/6Dqpzxozt7h8/Vr7p90w
	Bxj3VoTVKxfDtSi73vwL52Of2CVhoZa35QFXdrfMcwbsK6GXYzfK5/QfzjttZT0PTzEVcWoah57
	qdWzKWG1dkseyUpg6X5wkFnELsW7me8JgTgLPbJyxKeSMsGqPR5EFyPkpHfMXNdvtFL0Dsgo0Jk
	UK61j8HhcBgGi4W8Qn4=
X-Google-Smtp-Source: AGHT+IGj2NYT7s4nDbhwYpKMJV2dQMZgl6IvTwQXP1PF2wpagg172XREZ4p4rxCL4pMry9UXKtpu1A==
X-Received: by 2002:a17:907:969f:b0:aa6:18b6:310e with SMTP id a640c23a62f3a-ab38b429787mr2547727766b.38.1737620032440;
        Thu, 23 Jan 2025 00:13:52 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f290fasm1040414966b.103.2025.01.23.00.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:13:51 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-snagboot: Upgrade 2.0 -> 2.1
Date: Thu, 23 Jan 2025 10:13:46 +0200
Message-Id: <20250123081349.3440231-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250123081349.3440231-1-leon.anavi@konsulko.com>
References: <20250123081349.3440231-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 08:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115029

Upgrade to release 2.1:

treewide:
- make Kivy dependency optional by introducing a new "gui" package
  extra feature

snagflash:
- correct file offset computations in MMC flashing procedure

snagrecover:
- add support for STMicroelectronics STM32MP25 SoCs
- add support for Xilinx ZynqMP SoCs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-snagboot_2.0.bb => python3-snagboot_2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.0.bb => python3-snagboot_2.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.0.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.0.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.1.bb
index f22c53c6c3..db9bb82054 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "bc220722231b7f498a7b5df0bab8552ef9115e9ee1ad675079efe79da299fa9a"
+SRC_URI[sha256sum] = "cfd5e80db6010768d129eb123c4de6a8f3661fac353e20cc6e103e731d13c8d8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


