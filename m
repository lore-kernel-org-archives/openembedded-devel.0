Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19.1794851770500044809
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ulYvFByq;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-372bdb942dbso3345133eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:56:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851770; x=1795456570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdYUBs5MyQteMKFyCX1ZWNphqaz0j2DFKWfMm3JbIdM=;
        b=ulYvFByqyogaeaQnmB72Qt9kPuXVZ+Gq/w+mFnQIHAJ0a2CRBepJPvyWLFl5EIptLJ
         Vh+tAlQVT/kDbEMyFZR+TIw8Sm0JA6vPFH9WTHpHKe6OTSOCyhZbVfCtftkOEFPdneXm
         syHTca7dEw8cOQknP+89ptGVO7IhXRsOxRvTQqtDc7FgA/gi6hy0KMqBboVkXshvl9Lj
         6U1xoPHopJ9N6Kqn0aIqNTOdaNnbMA49ZPCi/F2jXz4iW9JPhXGM7pXH6lsaRbqXcAU0
         pmatwMdpF5CpXC+hxfHQuotCiKSTEKjBw9TZeFrABRq5w0RJJMy0rCzHOdSbBHAqzEqn
         rwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851770; x=1795456570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdYUBs5MyQteMKFyCX1ZWNphqaz0j2DFKWfMm3JbIdM=;
        b=pv0RxjjnEu4XtThriuHojVL/hIJJSeTc1FnV6y9rH//Iw3H3w85in11pwpK8zr2ykB
         up478eE1lt999Gdrj6kBjBK/YFmZ2ApgxphDiUJAHTsbOiCouOkYTmbuR+4K74Fdu5N8
         MRqyJCoPdZNc7IXhZE4kV0uWPXHA5tJlli/yHJ7+5lydSqQtbvR/j0axf1yrOQhBlvd1
         N1X+VDqDRB8n6ICPJFmXWnmVBBTDpxpKM06mwJGXZYUKFyYdl9/8fi6QM92K3dR9jVdy
         7Cbk7gaBGx3FmzwxacMhLX9wISmlIPof6X0uLzrG0PdlcQOhvxauyPO4XKWby7B72tr0
         oZJg==
X-Gm-Message-State: APuU4Z9RpGI/jdk5yQEG8gZ8x870iE8Lgj9bfiTZbJk0qrPSfdoicRMu
	9HVg59uiGCf8phfGR/upGHHBO53ZVO08pBXfleJMEOfNt1BwE/cRqBiCz7laY0C/
X-Gm-Gg: AZFdTZcFW3xoUr4gg8sun503fXf6poX2ZNVg82JlYil/2ACMexeFq1ohXaw/egUr50x
	dKG1PqooSMz8uRD1mulMWcTEyKSXVTXVfZjBwgdf26RRtnFzJgMM5nBAuAZ7kZs23fJrTHHaCRv
	LssMEBWDrg65bGlFSjEm66DrIUiji242kMeWbIOFxWmuKQpht9kn0xqXqjaV8HzpBB1Dkv7zBx6
	zWLkpI98ldr3q0Agj5VA3sspggsMNLNsXlDshpsUeJlGWzQfAigCpyp2loEkBAhjSpzznu7NKMO
	Kaf5jI3flf7qouLe/duutX0YzbMDO4F9CUiyT8jOjqvTcKQUjqXU5AfTV9nTO5VMUcPZ5GeugoW
	O8293b8KrmvvKDWgKVC24S9EP1aVGN0PoaQEg5GfTSdhlVyJWsRBxelCJMd5qWPIoC4AyxoE45p
	r8ZtrCKU8JpX6XmosLrH8+VOeJ+ybP+6bPQoDyqUdFz9NsMPnyukH8lFi4+7ijniYcTAHS/TYlW
	2omtAfe3y4eh9Hrn5hB0ZK37bATlEuqGMtyLPanYvzcZW3fPNw/pI9W0933yGkVMTpK/QSuDv4g
	zJP7Sb3Xxndl+hXdBNSouRoKB8HJZM9/7BMp4AF3gxjWuIBVco3VsamxxqWz5w4BjdlKsPRIx1x
	4LV2nBvB6FHkaWvTKjQXi+Iy9NFluy1FeglSKjkXR7XF1rNHXS7Vf5H12t7t00w9qoLjJCe50F3
	3vhUXHEXFNQaM15nHHygkCdp4WPPB/Hogh61/jRiJTrS7fNPdkapt9Qh4LkDxeLAOrQSPnTJHrH
	tsDwGR3Asicu3qVSAiYbgvRrPK4XUVTBljU7GZe0rYLEdWr9+7y6823VDU0dS4ExN1Ibs6h7jzo
	SCKU
X-Received: by 2002:a05:7301:da82:b0:37b:2731:fd7e with SMTP id 5a478bee46e88-37b2731ff62mr7591789eec.2.1794851769791;
        Mon, 16 Nov 2026 09:56:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:56:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 095/105] python3-types-psutil: upgrade 7.2.2.20260518 -> 7.2.2.20261111
Date: Mon, 16 Nov 2026 09:53:47 -0800
Message-ID: <20261116175359.342679-95-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132550
Content-Type: text/plain; charset="utf-8"

Changes:
- Typing stubs only: corrected terminal() and nice() return types,
  typed memory map and heap namedtuple fields, overloads for
  Process.memory_maps(), added __all__.
- Dropped Python 3.9 support for the stub package.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...7.2.2.20260518.bb => python3-types-psutil_7.2.2.20261111.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-psutil_7.2.2.20260518.bb => python3-types-psutil_7.2.2.20261111.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260518.bb b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261111.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260518.bb
rename to meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261111.bb
index b56ef83775..8b4d4d2c2d 100644
--- a/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20260518.bb
+++ b/meta-python/recipes-devtools/python/python3-types-psutil_7.2.2.20261111.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ec038232ab86edd7354b091c54e190e2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "9f825f631463a5b4d26f19f63aebc9ec25f01140d655026f3ad8a67841f9b331"
+SRC_URI[sha256sum] = "d677119c44fb80cc9be41d8ac731f08bf89974bb1daa49b6688665a9d7224f42"
 
 BBCLASSEXTEND = "native"
 
