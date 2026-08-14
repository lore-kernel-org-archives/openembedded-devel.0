Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3162C5DF6D
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:49 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24513.1786747600694930762
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=D6mAqQs7;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1539209a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747600; x=1787352400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SLU6cOVjOEhSMIXQnsHToEeCB5h1/40RIZUxXGDIFHg=;
        b=D6mAqQs7F9WN41PH8uwpH0DvEA+v2ucAfNR/dpKbrYPEgzZRNNfDeHh8nmtx96KV16
         R6MDGMI9kJYIf/rGtAzBb9NYawK9/GKI5NJ8UN7uHfpQHkp9/6KvZrCrYtOKIAxKch+M
         xnfiG2yK0VmPqPpiCsfzmrmdoOYrRPhG33SGbAghs3aofS08vEYGJv8ZXJrPH9pTQrY2
         T776OeutBcUh4yVoTmRf4BHxAGeh6P4l0d0YTtHtXeJiz+imfsdMIydaMSzQyMTIptaY
         jBdZcKJD5RGojZXZCVHoy/IS7PZMSq9xqFDTfloIr/5IymhiNsjeNEjhQp2XfzSL7aZf
         E0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747600; x=1787352400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SLU6cOVjOEhSMIXQnsHToEeCB5h1/40RIZUxXGDIFHg=;
        b=l6znVjhGxc71UBnEZux/n3OwdIeUyLqH8OpnZnH8a665aOvR/LMRt1//i6sEVoMtOl
         SOZVXs2YbhegiJqbAhuS/5D5K4YT5Qc7a6BUnPGTZtiiKYb2i2MXuepY4TbJtlxJhjvT
         5E4j2qCn5btt7wT1mDx+pByCRL59px8JxLQrflgPmGrSUNZwLWnoUVNtT6JLlv3DnKAN
         /vvtOCXfSAyCIQGz8fgfG0F48JHOXdawpScbHC2Brm556EkLse3G8+5luYcHOeAGZfqe
         8ppV3xWlOuDwv2w0OVx1M7iorIEo9SemXmjviCSFyokN1DzOJAnjb9mWnsc91bQT4Bil
         kuXQ==
X-Gm-Message-State: AOJu0YyPVXeeJSIj/LXSrl8nfqTcfJsk3WZ18FRxY1/yyvRnpH3Iw92D
	04T61Cg+QgniFcIFRgFk13WDd5weCyWagxkJywbB79jnScOs98pI/h9tDzwCYefF
X-Gm-Gg: AR+sD11FcVU3QbEQ3ZZpY74ITPmpuwiebvKS2VGHP7kUU1s/dFU7vZAG+I0mq1xQl18
	TEbQLWIxh+CjlCbj8MHuG7XljGa37V45waXvD7RYQCJ+uOFeYorKnmUNiX54PAWBm5BjAipJRP5
	PNnOEc4r9uQxGETo9M/aesSfbFA4r2itIdtRMUGstW5URC4t+xxc9WUJj3vIlRQYasqrV+cn3g3
	zMKsCY2KrHT/CZVLHpsL5y0WpKdSEu/ROUnleVuQxe0TecFZfvzPjmiJAiZjFXKLGwnupGHwHep
	h/1Fh+5DIXXgjHAOkJvplPO3u7NrjxngFvSYsIplq4mGesSK1zw+e2yqXsL5FUaA3Y9xMT+n6rn
	pXlZ/0uow+aC7bVYJ42z1eLPn67d8+K9sDSZdw6zhwhMEM9ueBZJtFr3g3wcVcTgvuwyszjxxBF
	uNK5DcmCb9wedC7XWSovyrWS03nAfkIR2FbxF5vnvj2JeG9QsA6qso3zAHN3DORRWv0OHRY3Hf4
	7MSLTy3Rx9mO5YOdCokAcuhP18RrEoUW5O7ftBphhfzsp0eD+IpjzOQ575BPtjRk/3LrFsCqfzp
	zNcqTZAfBklqhqMNjzKmLRMyBtp8pI+ZQMmjOmfJ2C6XF0CYiZmmIAbjAvp6zulQ57k/Rnxn7w7
	79gTvVK1vkUYDrh3xoUrLEdiMBF4sgG4+lcaiF+XmCukUmw==
X-Received: by 2002:a17:90b:5447:b0:38e:2860:253f with SMTP id 98e67ed59e1d1-3933e5c8557mr10681707a91.12.1786747600025;
        Fri, 14 Aug 2026 15:46:40 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 051/109] pangomm-2.48: upgrade 2.56.1 -> 2.56.2
Date: Fri, 14 Aug 2026 15:44:37 -0700
Message-ID: <20260814224539.1523174-51-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129115

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{pangomm-2.48_2.56.1.bb => pangomm-2.48_2.56.2.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/pango/{pangomm-2.48_2.56.1.bb => pangomm-2.48_2.56.2.bb} (57%)

diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.2.bb
similarity index 57%
rename from meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
rename to meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.2.bb
index c00e36ccf4..d65891960c 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.56.2.bb
@@ -1,15 +1,15 @@
 SUMMARY = "C++ bindings for the pango library"
 SECTION = "libs"
 LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21 \
+                    file://COPYING.tools;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
 
 GNOMEBN = "pangomm"
 inherit gnomebase
 
-SRC_URI[archive.sha256sum] = "539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d"
+SRC_URI[archive.sha256sum] = "f1e984c85a85b6a0e61616366521f51dd8282a072bb45d15b5084762b62f4c0e"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 

