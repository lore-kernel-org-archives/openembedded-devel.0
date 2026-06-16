Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98F6CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:02:26 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150597.1781604143543614933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RIc+M5ft;
 spf=pass (domain: konsulko.com, ip: 209.85.218.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-befee9e5ef7so518801466b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 03:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781604142; x=1782208942; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIxiHmMVU3JdgA1yo7ciitiDW1khEoVVvTTp9THU/Pc=;
        b=RIc+M5ft20QHGsdCIOEW/W7D5jC0ABTFOz4oZlGNBOXnk01kQRO/mEoEvBD8OEerMc
         wd7IrSbMF+hGC6KleSms3PaEd3P5Cp+TKw87puWqVtzfYz9sX+Mjgxn9uJ1DK1FDgs50
         jImtBA8lHMTaRz71uZWyyVLZKkSUYZq+F5TP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781604142; x=1782208942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIxiHmMVU3JdgA1yo7ciitiDW1khEoVVvTTp9THU/Pc=;
        b=Rf222wJYyu3quimc8jszwbin4jGSwqbjVmSm0Jnxcu1LFmThSZQgSHAdSbegRQVf62
         6pmOOu3nQRid7rZ/c0mi03nl4ROSuah2MQl6laZwFv+KtHU/qEbeswCuIFLntFCx032/
         6Jrt6JBMERcgUvAuUIsadi+Mn1PQ8OzEW1s/RGJzgPeq2OFhraB7PVEJLO4ilswD6KTg
         LDrUdVlbL4JFY1xW2LWC4Or/qasLs7vgPsSfrAxL0IIy9vKtxZpmcU04qzzkuCxkSWjT
         9119GCWPmtX9j2pnW4z6C8gE4fhmKazrFwXcs6QoPBU7h8CfAiAobfBB3RC/MLHuYqrG
         5/nw==
X-Gm-Message-State: AOJu0YwrZovz1CE/0kuxX4k8Aqq08+CLgUD/4Lzeu9Ky6KObs0D+F31i
	9Boql+s/2VnuxFaOQNA17+3fCoArr0MvyIsxBlv7vsuEPT7t+GSL47XbdibsS9kUS9hUXg8W1Kb
	ko0CL
X-Gm-Gg: Acq92OFegjaYWY8fBbT7OC0rHgxVsRfyVaBIXWSYekmSBmKWsONCaNhbRV83Qh0hoKJ
	ZlRdzbxnoSPBsQDkkHlB8ZkiOY6J5IZT5bihvX9zQjx3KIXyjjOxJm/PVt0VMzP4weX+8m80V4s
	shghjLRNCtmrwJEg+hFtjduvxhIrVSR54M+E/vDgUUv77xI7jleytsrnRyi2qY7+Me3yuYtuvQt
	DYlBHl14/51Ics2oyJTtNrwWybq1156sfCVmmKBc/rzXVDhNY/ssTfhA68VT/HBzXVLFBa7zMEK
	hWXLRcGQNl32PSxmX9vAMWCr7fh22eBSjLHoG6exwWPdcviH/hWjOISNql7tnPy3U/ZJ2bIL06C
	owjq38YenNiUGBGbvMa3MSSP3RYEoeXFcuTbWN8kSLwBwmjHH7QVfK6zpWsBBKTogwTmfSNt/7w
	qDbuFII+coZ2lSpdnC4qlu9gjMV39txx+CmjeV
X-Received: by 2002:a17:907:1dc2:b0:be3:b3fb:e2 with SMTP id a640c23a62f3a-c043cfc9eccmr98937466b.32.1781604140892;
        Tue, 16 Jun 2026 03:02:20 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2d9becsm40940932f8f.34.2026.06.16.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:02:20 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-sh: Upgrade 2.2.2 -> 2.3.0
Date: Tue, 16 Jun 2026 13:02:14 +0300
Message-ID: <20260616100215.3640011-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616100215.3640011-1-leon.anavi@konsulko.com>
References: <20260616100215.3640011-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 10:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127617

Upgrade to release 2.3.0:

- Fix sdist builds from littering files
- Add all special keyword args to .pyi stub file

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-sh_2.2.2.bb => python3-sh_2.3.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-sh_2.2.2.bb => python3-sh_2.3.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb b/meta-python/recipes-devtools/python/python3-sh_2.3.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
rename to meta-python/recipes-devtools/python/python3-sh_2.3.0.bb
index a84017a393..962f9afb6d 100644
--- a/meta-python/recipes-devtools/python/python3-sh_2.2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-sh_2.3.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/amoffat/sh"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5317094292296f03405f59ae5f6544b6"
 
-SRC_URI[sha256sum] = "653227a7c41a284ec5302173fbc044ee817c7bad5e6e4d8d55741b9aeb9eb65b"
+SRC_URI[sha256sum] = "402af9087bf8a5557562913ca83d715bfa0646cb93865c5d60c5578b07b17871"
 
-inherit pypi python_poetry_core
+inherit pypi python_hatchling
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.47.3


