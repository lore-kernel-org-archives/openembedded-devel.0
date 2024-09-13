Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7508EEEEC39
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:21:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.67588.1726208459243086172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:20:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PYrIMLMk;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-205659dc63aso19082535ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726208458; x=1726813258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYJe+eJ8OHSpcXRxYuzgSo8fXSv+LxihpxE7xAgJFa0=;
        b=PYrIMLMkQP3/dVBF+RFreeEXgeHRZ9a3GycQZz996Q0XXiwy+WXCuMx/K9nyPCKRG+
         UL4KfnuSb0qX4Q2LWprNfE7ghFmB1ECoOivVmWuG0gAfSpGzqwWlOLs2XfWte6EEp0tG
         Nz+W7qQR81uRwzvj2BUvLvdgKO1W3oL7w6Xy84Jx3BMv5E99i3U1aMWN0Xt1rf1TUAK/
         c+SjM7r+Ix0GaFeEWMPiyRJmgeFiI/tFYt1valh6Yv+Jqcic6uydiwDkSjJ92wfWHAhH
         iFT3Oij175zpWkuXb0rJ0D8ydlXdZ/ybtk0PcHDehKJwF6aCD2NnoQrwOHikgxeR3VfQ
         856w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726208458; x=1726813258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYJe+eJ8OHSpcXRxYuzgSo8fXSv+LxihpxE7xAgJFa0=;
        b=gEDjhho4X/OfQEIXZzMJrEQt+gI1LrKrg++gJTWw++jxEJTSO/lJEzuUH5AECTVBM+
         4Ts2i5gPflqWnDFon/kCbmVCnwgxrx1rizJuu0SSV2rMRwt5vFf7v8ZSJ95TMlTUi/9Z
         ZCQgNxBUTNxoVBbmvmCHVW1xtI13p3Kgb7xG5h8pBx55u2SNNTlknigvyfqyOL4Muhov
         4w5JHDZPt2MxFLc4GDTmsEAkDSIRrvRtnzztl2pCAeKEzKJy0I136EHUBUyoJIySgdBT
         iw2wijrqyXxx9tj9P6QC6pYAN1Ep3qPgIoEMN4tmuxDSrbK6ljE366MCgvtHqpBYz2xX
         oTzA==
X-Gm-Message-State: AOJu0YwnFtCiX7PErBrogRKzTn+JhR8L3mDmpqOgDl2dofIut9mfJrb5
	eMNvDm3R2uFbQomPJtlPq71bmaR1uFF8S7DAna9xjEkc5kzJpmSC+ctOYP8O
X-Google-Smtp-Source: AGHT+IEOJ2GINE0C79SZK0TaQoImZ8pLEbLDI/r34TJ7bkoNCCWBm04FkW7BpocPLpmhUbEX+x46TQ==
X-Received: by 2002:a17:902:f70d:b0:207:1842:8c5c with SMTP id d9443c01a7336-2076e4614c3mr94858245ad.46.1726208458204;
        Thu, 12 Sep 2024 23:20:58 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c5d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afdd0edsm22401795ad.170.2024.09.12.23.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 23:20:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 06/10] python3-fsspec: Add recipe
Date: Thu, 12 Sep 2024 23:20:46 -0700
Message-ID: <20240913062050.2597921-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913062050.2597921-1-raj.khem@gmail.com>
References: <20240913062050.2597921-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Sep 2024 06:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112265

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-fsspec_2024.9.0.bb         | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
new file mode 100644
index 0000000000..49ca4b3e93
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2024.9.0.bb
@@ -0,0 +1,22 @@
+SUMMARY = "A specification that python filesystems should adhere to."
+HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
+
+DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
+SRC_URI[sha256sum] = "4b0afb90c2f21832df142f292649035d80b421f60a9e1c027802e5a0da2b04e8"
+
+inherit pypi python_hatchling ptest
+
+PYPI_PACKAGE = "fsspec"
+
+RDEPENDS:${PN}-ptest += "\
+	python3-pytest \
+	python3-pytest-mock \
+	python3-pytest-asyncio \
+	python3-pytest-cov \
+	python3-pytest-benchmark \
+	python3-aiohttp \
+	python3-numpy \
+	python3-requests \
+"

