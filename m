Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D38C47255
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 00:38:29 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.198978.1703983103678594433
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Dec 2023 16:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xia0ISC2;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7bb39897b8bso108512839f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 16:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703983102; x=1704587902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDrzMTV/l9NTX0Mdl3coDyC9hw18b6V0YSQiArLm9rg=;
        b=Xia0ISC2lpGMUzXb1sKc+2Uc12/QLhLscD2Z3T2D80pjSynbN4V62QRmkS9MtlWoMA
         eTTaMGJM2DjNdJdKU1wJXQRW91yJ/LwmeRpMsnJ5dNNNfsnOvVLX12i39v4T+L999ZaY
         ZvMavQ4PP1Jrzo8GRVIzu92hWmTED+le4wxpTJoEdrU6vupqgKpCk0wXIuOj/78BEDwz
         kc1Dwp0tObCI1uuHX6WTxe4neJMvDR9cvX9AJtOERgzCdVbqgLAXGbp7+V9VpgX7U8iL
         ok8EThg/zh0JhR5Yj/87AiPmyLQ3PwQ6vqke/NYG396k1Id44oBIoCUmkGG6aIV8g9UJ
         AkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983102; x=1704587902;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDrzMTV/l9NTX0Mdl3coDyC9hw18b6V0YSQiArLm9rg=;
        b=qtdsLvl3NQ8Q3fPVdiHPF7YBs8MJxU59/KESjJId6q3BMReLVmdd3DpRGXL4ftkNnU
         rmW2+Y2AhnNX1QfU9UJ6yAZDE5Uo7TuVE+IcME/tF/BYUP0T+91lw8VCqQD/cr2iCxUT
         ijpUdNC5IUBSA+9RMWm5Vej3yrECN47VgSVvYrJ8EosMGDtJUZmEvOTfOtheSXLj8tcp
         35bRE8X18Z+H7Jp0OM4QTySIdmg0IxkjH7PfAYSzRHHR5z4t/+rw6sWLbobLQhTbMWO0
         9Jm/unQ7umTlykL3BtFNz5Llq1hCvve6g6ExCHoD+ZnyrkH0AknMBjtp2mM8V+GZABvS
         ZlNw==
X-Gm-Message-State: AOJu0Yz/z1C0o/IDgmgOv1mkNOPJUgOUEj4H7B1GPmpGBlM1JK5X9TBh
	AtT8cKXyV4fZRvsCts0vLFQO2vxfCmU=
X-Google-Smtp-Source: AGHT+IFw+yyfyEun9SmE/X8JS0yu/BmCvWZmXSrxoiO5tvm6ONRsWivjWOj24+l/w+g+9dw84VhMHw==
X-Received: by 2002:a5d:874f:0:b0:7ba:b744:bc4 with SMTP id k15-20020a5d874f000000b007bab7440bc4mr13963851iol.30.1703983102647;
        Sat, 30 Dec 2023 16:38:22 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id sj10-20020a17090b2d8a00b0028b845f2890sm16692026pjb.33.2023.12.30.16.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:38:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 alperak <alperyasinak1@gmail.com>
In-Reply-To: <20231226063250.35258-1-alperyasinak1@gmail.com>
References: <20231226063250.35258-1-alperyasinak1@gmail.com>
Subject: Re: [meta-oe][PATCH] libharu: upgrade 2.3.0 -> 2.4.4
Message-Id: <170398310166.873206.6751970731745528611.b4-ty@gmail.com>
Date: Sat, 30 Dec 2023 16:38:21 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 31 Dec 2023 00:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107917


On Tue, 26 Dec 2023 09:32:50 +0300, alperak wrote:
> * Dropped patches because fixed in the new version.
> 
> Changelog:
> 
> * Add copy hpdf_namedict.h at install
> * Added page boundary support.
> * fixed glyph index to be 16 bit unsigned instead of signed
> * Bug fixes
> * Shared library has an SOVERSION now
> * Fixed HPDF_FToA for small values
> * Add static hpdf_version.h header
> * hpdf_version.h included again
> * File attachment issue resolved
> * Renamed *_LIBZ defines to _*ZLIB, enables compression of PDF files again.
> * Reinstated hpdf_version.h
> * Fixed library name
> * Set correct version number
> * Add support for free-form triangle shading objects.
> * Fix config constant to match use in hpdf_mmgr.c
> * Improve small number writing in HPDF_FToA.
> * Fix missing /CapHeight key in font definition
> * Change HPDF_Page_CreateXObjectFromImage zoom parameter type to HPDF
> * Fix another case of png files with background mask save uncompressed
> * Avoid issue with libtiff duplicate symbols
> * Reajust bit_depth of png image after striping depth from 16 to 8.
> * Fixed typo in Japanese font name: Mincyo -> Mincho
> * Fix various typos
> * hpdf.h: add missing HPDF_Boolean typedef
> * Moved to a CMake only build environment.
> * Fix bad unicode in comment
> * Fix various typos
> 
> [...]

Applied, thanks!

[1/1] libharu: upgrade 2.3.0 -> 2.4.4
      commit: b9b9a9578b484741edfe451cac324c2761c07454

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


