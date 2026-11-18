Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5758.1794975205031073081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gd+/rBVt;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so866149c88.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975204; x=1795580004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ueB8tmSDE9hNpivyeEG6q47EyYf22Zz2Jdn0eYbm8g=;
        b=gd+/rBVtGHIA1vtAyrdDYa3F05pSXVTDS9EHjw53RQTTukerHVUCpppIJZAZIrlqzv
         o/2eWOQcJ8KSaD/FqzLQX2vEA/23oClfGmAqiLeFwJ1eIdhu9uGYoHXswCsB2Q5fy0j/
         VjVL20XPaIVOFZatyrDf4QSMFiuJnaOPXvReh78un4sDCg6L7jeFWHyxR/Dc7O4S/KKn
         qu39Blj0AVdpUwHyAXZHnUdD+M1hZpl/4wVNJKNPQcD47lqKya+rbAkR4rEkNTzzsXP8
         NosJT8fE2xhO0u+ctL3X4XPKwxNXTVxrLsBWAXKfVozUtQH0EeomKVgA4gfP7cIE5Oh1
         arxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975204; x=1795580004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ueB8tmSDE9hNpivyeEG6q47EyYf22Zz2Jdn0eYbm8g=;
        b=qdeeXZz4ZEdXyqSFoACGnRS6NwDvjNeI1H/r4fuBqp8PpM+TGDBmBqsPuwerdDaPgU
         wLKkvcGdCQ2hfM5kp7pLWRhYK0IgEYmkat/tNs1Se4DltS22CiAgB8ylgYCWNRsWi5Jx
         kb6AVitZ+SjZfurMhLQGrwclsVenTbhm93SdL1yvEEwyBFrTLyt+naHA+6dRzK6eTG50
         oJoGlkQ2E4rkTDHGIKVC1P6vyWPcPGqEkscRc0LNE1J3wMUT+66sssSt8bUPVqqffAzq
         HRpyqjGhaar19t3BIeWDmDXX+C+P0CEzSZTgpul5F2t1/vMcfyYX7ZmT6CSG1bOGj7SJ
         q3ug==
X-Gm-Message-State: APuU4Z9ThfdGuRsJrt930FZ4wNV6I5IJ5oVP1a4sxhFA/hRdB7eeq84Q
	+TFDGTToyyE4VpI00IyVbYavMwzabWjm84ixOKfyb56yyudGB3ao7VdCV7X6xqKK
X-Gm-Gg: AYBFou06rnAEgwBdPxOpQ/h42HU04swLpOE9N6Lir6DyjqdPQeb7xwfp4VFvihMzUoa
	+cbSjBteyrOEUYfRr3Y/tW348LlhLbFlbSBlSmu8rpdjmqvBX4KC8UboLJ197G0Lw8Cv5sK12sN
	QL7EaNO2rAXTM5zlrRpZLy0Lxogts1Kfi4blh8BiBySpK72DkYvrX4dw1OkecuxI1MPkRYBvRt8
	ZonRp+JdVEVjPXxcVsIqelPPsC2tFUvdiU0LezkTSBHUF1sw06PSTKyOehRSE6Yd/yiPFP7phy7
	GcvrZzE8Ygw8pWA2JmkK7OgrHtt4Htyi5m8bNmiLtk4h3w4FRz1rkgEYWLhyDdmZ/ahTW+8u5U6
	oCLvbwQZ81uU8qdrswF4PhQxShF62AuZELeYFxa3umO9kZaKrLBF29sUs9h7ESCxF3EGwUFLj6k
	QKJtyZhK7ITPVqQ/kxrBkwIfasMATR9oKJpNUcDXBF5Aqz/cxHLMT4bGL4/1UFGfaIKVoJ8PgCv
	QBWegpA1vMRvmB2thRMX+G9ZU74FjnynIYWIRMNCOOuxZDTns2FIL8w9rjD2kFR51L4Q8ZwDrR4
	px/jTdgnqBMPlTllYtaFcvAIKTxxspkbHgA+LuOeMc6aU7R2CpHT10BXA1tkKMiEPpmso07ZQku
	X3dT1z3NwU/4ACwJhi9Y2Oe4Pd+7SvcWL4RYa//NzZGLyhJa0whrTu/8SMxzT3LZIeMK03/BB6j
	geFRa5aiFXiNZ3Y6dUIPzCf2nNn+rvvgYb+N/NNxRgGq1edZ97LUN9G16BahTHc8pRZgyYbbL3E
	aUy/BSNfmXpzzXMZI/l1JfUQHs95Fnk3vOnkoINom4Eo1yWWnWcQZylGFpc+yjXYM7FLWnyOKM4
	5Xjk
X-Received: by 2002:a05:7022:f115:b0:195:76af:b810 with SMTP id a92af1059eb24-1b543cebd29mr1309337c88.25.1794975204399;
        Tue, 17 Nov 2026 20:13:24 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 04/12] gupnp-dlna: Fix LICENSE to LGPL-2.0-or-later
Date: Tue, 17 Nov 2026 20:13:09 -0800
Message-ID: <20261118041317.2287415-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
References: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132627
Content-Type: text/plain; charset="utf-8"

Sources say 'either version 2 of the License, or (at your option) any
later version'.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb
index 8dc5fce199..3aedb699da 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-dlna_0.12.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Helpers for AV applications using DLNA"
-LICENSE = "LGPL-2.0-only"
+LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://libgupnp-dlna/gupnp-dlna-profile.h;beginline=1;endline=22;md5=1b85459f65cb1e73a885ca137aab6274"

