Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7336CD44144
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8291.1765526546618528738
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HpW8VmJA;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so1137037b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526546; x=1766131346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LK5XOEXhbuzxHZ0cIuoVIUv9JjIFIMkPNCkkvjoJNXk=;
        b=HpW8VmJAYDi432mpTGKrH5167uqOpuXfQQ/hGjdcq1xhRrUvM3C7nQl8UNUnP/UxMm
         EHpaD/crEqDJHo3g6i5VuSysEVcS6TMvvp8/S+a8HPt5ze7Z1Qs0VvWw5Lfocl6zI54F
         G+xr1VV4YMObCA1al9ZTCrF4q934Rw/FYFjLgJLbKK8gk2xu/TxWEQNkYCotyfXbpHN2
         WmXFSjrhlNEoOm57NczmpeJfN+B4GZwGRA2KmnX/A2BgVezqWvRT86mHg/jSUsuEJJpN
         jgB0LNojpUSD1pwFrV5CUyRfHEkowxO17Erck8O/DcqaQpDnByD8UxnVUJ24SxTVSF6g
         lFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526546; x=1766131346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LK5XOEXhbuzxHZ0cIuoVIUv9JjIFIMkPNCkkvjoJNXk=;
        b=R3OUsuEz0hXZ9vwREVaQiXTAMgBDiZd4byrc2Z6hIca8LPnhhJrNYH5AAotABLjfom
         l/FbeRum6EmNlMzDEY5zzqe9yaT7jEFdiW3Q0lM4pW8ybWCs50gaVVP7NUZKf7OPDsvk
         9VNQEX+lNjvxUyPsVSvORMzmtA6yFIgmXCqACjWLgnemRBCnfTDTa3TbLnRcgq3LXyz7
         SrJHva8xbLjF61WGrQpEGKZtmxtP184YAK13hsMDoObCaY7s/aPnY1KYagcN21j13Cpj
         AAhVE2DnvNC0Ck++piybuAengBM/VhfnlBSTKNe2Z2oiQ4aHRtVbWNW5vyvMSdKCN29e
         hYug==
X-Gm-Message-State: AOJu0Yzo4AiJWfUy+JwS5u5A2fC8UwiViqGjE6MTCdTRFCTAXlsW2TyJ
	eFSFohykFxPQVg1Ns6cmnb8Z9+CKyxfP02DQFPOG2397jnhgAtIvxkLfe7Ft7g==
X-Gm-Gg: AY/fxX4OlyMaXatF8X1cGLfEEbNbhflOGR1DbbzapBsgrLWNBTf8lDRdUf9aSmnrPHq
	yzMNkO7Bjak3zcq70fk6+ZvpjMRaNUnfohMPyW3Pk7m2psKMlSe0kenfMEWAsWaBYdV7Nir5KAm
	6U6QU4Y/FYAxHzwQdtSjCgZlgFZVjHLxCM4x+VXwCJ/jX+oEaTLyFTOOMWJPE57xHROPAdO70qQ
	rduujBfAoosqTDcCLBcJZ5cTKA1mZlZB1XjRTbz9k2ZaSEezfH3f9BUq/swbTtWf8aQDyH2FRub
	bIB8JeiXqrKdifmWxxeb98DFqjaCWODFJPFpZGqfUvMARYQCeG03JwHn8b51FKwe6KrjJ/rt7NE
	zEVf/P2FhyjDwS5eUo05sQ8hihR7OkLpfzIOf0ViPQmQj1tkO/fHM682/8SERzja5xR8A/Vapxw
	OsY5d9VnPI8orbgFy5qndIW9c=
X-Google-Smtp-Source: AGHT+IEj2SHkQ/E/CHQsT0r04D3aMhm+2s1VgwC//x7x5+gYRYQsKjKq8s1dbjeIj7J2xI4Kq3Rytw==
X-Received: by 2002:a05:6a00:600a:b0:7e8:43f5:bd2d with SMTP id d2e1a72fcca58-7f669c85d96mr1215587b3a.66.1765526545707;
        Fri, 12 Dec 2025 00:02:25 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:25 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 8/8] gupnp-tools: upgrade 0.12.1 -> 0.12.2
Date: Fri, 12 Dec 2025 13:31:51 +0530
Message-ID: <20251212080151.3711461-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122596

From: Gyorgy Sarvari <skandigraun@gmail.com>

Changelog:
- Common:
    - Remove deprecated libxml calls
- AV CP:
    - Remove some stray debug output
- EventDumper:
    - Code cleanup
- Uploader:
    - Fix parsing the Browse result

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 25540bf356b601a4fa6f49c6f935f49f899c616a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gupnp/{gupnp-tools_0.12.1.bb => gupnp-tools_0.12.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.1.bb => gupnp-tools_0.12.2.bb} (84%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
similarity index 84%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
index 4f6ff3fb97..739e3885c2 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.2.bb
@@ -8,7 +8,7 @@ inherit gnomebase features_check pkgconfig gettext gtk-icon-cache
 
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 
-SRC_URI[archive.sha256sum] = "53cf93123f397e8f8f0b8e9e4364c86a7502a5334f4c0be2e054a824478bd5ba"
+SRC_URI[archive.sha256sum] = "4c92f2d1a3d454ec1f5fb05ef08ca34df9c743af64c8b5965c35884d46cb005c"
 
 PACKAGECONFIG ??= "av-tools"
 PACKAGECONFIG[av-tools] = "-Dav-tools=true,-Dav-tools=false,gupnp-av"

