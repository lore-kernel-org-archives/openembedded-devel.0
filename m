Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10289.1795753075402459644
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=qS5Feioq;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso8341710c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753075; x=1796357875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fcLu2/uGfTZBDR63pnfKa2TrPw2v/uEuCI/r/2kbWHI=;
        b=qS5FeioqC5EzIHBIR8mlhcCKCX95LWRQ311NnSwJRKYQEf1LCi1ON7umxVuHUmT9aI
         23XiCXtxGjnByp3Nh5jaL8IM/bz6cAwPIEiOtrPBodxlHPHJZiiEPjvAlFCdHgofgJ+I
         GKdqWdXU+8zXijujuzjBPNL0h9mae2rpzxd5IE5RCghxnh9tTHwU8b3rPcdOiNArOQ5Z
         JDyi0UGzxbxksydzI7BgQteznC1cX/gIBqHPB3FrBxgqTFngZBpKPZF0Ls8u/adsLz73
         bASm99tDUBNSkihjIAbKNAp7v4cgjhTXh2cqxehckwCq1Cz4CrAQDWH+B09CFv4RTS+A
         rBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753075; x=1796357875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcLu2/uGfTZBDR63pnfKa2TrPw2v/uEuCI/r/2kbWHI=;
        b=yn01lqzEqRE/Bfq3zBRTOUvL8fPLmdwGg4S/cCVFGtfK3hR8NtZN76r2keZOgzr5/z
         8/P4Iv4OtgSXETBK0uvznGm7nPbpginsSjw5BpymqW86dGsg5Lb2VWVXFY7FiCCxVvu/
         ydCqe27hxCsC25zfKUVJihza0BM3aGs3voKzyPJ6+cyG4FnMs2EBan0UTl4qvWpG5hxF
         ZvJbs4fQTIQxLegA+jKApUEGjtAOoVLYGkBvQiUDLqePMVc1KiocwIwkIhvhXhRUz0Nk
         jljZvYsBiwzbTeoKZQKO8D66LIiCPrDxY6c/p9zqqYNwQWVcYoU3WqbXzPjnb1wR/Sxt
         jTiA==
X-Gm-Message-State: APuU4Z/40Qy9+bafo5DjIIwafy+tq5S8x16R8Zs3hp2lAsLHWIGGphCc
	58lKjyqs/ARllv1iXHm0D6LEcCGek/M7e6eZp8yyx/xXHdWiPDOGfOYH9sLb1DU+
X-Gm-Gg: AZFdTZeeidxukCMHlFUg1QxKdTE+vPngpRnmhpPlwL+J+JxCPBvX8vkpJxFJq0KiyvW
	SfCqeBr/xC5VaEEh+ThLqIapcnPXvg1MYft5LklVjV9rIXPhYllLpxVLdtZtCXvOc93SKcIs+2U
	0Ksh5KZVCWF0vt6YfzlYk3q8jbC8lc+IFOZ9xb4h+Z9X4kbhySnI0+3ICxh5OdSwheGLbe4Xr+N
	9UdOwMWNKu2YI/q3PHb8941CbPGJvF/qWGBAmBXTze6q/vS3315/SfNhSw9Jn+BCkS+PpeqTLDc
	QJIvwbuAPwL5/XHOh44kgPuAVzYdVetv7NnktzSWPuJ5ROKiDHOyJuYUQkM0IbvMXxl+lwfwWV8
	RADODOAV+2aNGgsetnEvDrJEvRHrZyMg4noUFCwhwpQ2YEfSXpBC7k7/9fA/GDedFMjHu8/fczZ
	M2L7EFVFNNG04SVASuzV5wy7tHPW662FQOcroM39UlLibKtL+SP7sXzgQAuDKqk0etuhbXam/pl
	On2ZEmePXhpX0OIIbX3VWmK9BuYqK72TMOfCDI7laoAAluD4nnw5OkadXxqr9atcBLI2mmyci13
	r+9DN+SUzvZd8XVuAV7sZ4fqy4Vn3EtiXdbwv6TohGsHF3EIR6GQr4iJXwPLpaMmuo93sOct4bT
	TY7mFIisN6amI0ezAhb1Eru5NLb2Ntx7wLakETBgSqDFpLP5WayFQf2vKZBjLWM0ycCObbZCt1v
	mwmnGd/FE9mEQ4gp7LlZp4S7DN+m199r8ITRQrdWuEuieqmFgAAnqCj0NNmTIyW3eYyb8UA18jv
	6cWc/V4d4pcIKoV1bubO+mj2cNEgchbuOToiCM+P92CFs1yaJhnwj6UE89EBZQUiENIwn8QaIKV
	EUVA
X-Received: by 2002:a05:7022:e80a:b0:1b5:4b48:b9fb with SMTP id a92af1059eb24-1b5567c0ea6mr23784671c88.5.1795753074733;
        Thu, 26 Nov 2026 20:17:54 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 33/35] open62541: Anchor upstream check
Date: Thu, 26 Nov 2026 20:17:13 -0800
Message-ID: <20261127041715.1776485-34-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133285
Content-Type: text/plain; charset="utf-8"

The unanchored tag regex also matched the prefix of rc and other
non-release tags (e.g. v0.1.0-RC1). Anchor it to plain vX.Y.Z tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb b/meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb
index a8cce65386..8a15454f04 100644
--- a/meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb
+++ b/meta-networking/recipes-protocols/opcua/open62541_1.5.10.bb
@@ -20,7 +20,7 @@ SRC_URI = " \
     git://github.com/LiamBindle/MQTT-C.git;name=mqtt-c;protocol=https;branch=master;destsuffix=${BB_GIT_DEFAULT_DESTSUFFIX}/deps/mqtt-c \
 "
 
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "^v(?P<pver>\d+(\.\d+)+)$"
 
 inherit cmake python3native
 
