Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE66C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:15 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4154.1790160074833925782
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IY/drrjg;
 spf=pass (domain: gmail.com, ip: 74.125.228.12, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35611so371329b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160074; x=1790764874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSx+GrMSwZt31iocE2rZKIHpTFuC84BRfeEtkhsKecs=;
        b=IY/drrjg+b7Mz2PeM1YiWvRaRdACI7QjvlAla9e60OqL63gMjDS9ndwTwOgig8GPDn
         jREEdgf4h4D3ma5Bh6qAv/8Pd2jZOfJB30ohW7tk2S9JCcZrxlibfMn//VPbrEDbz9Kb
         v/kKCg5/0rPLLAfrxwTJsRzs+9P15fi/SiEXNS7gnwqIvgimPvp7NBwXewWND2kIW7OR
         YQWLGOENIwUs4rFWEV2kprtJsf/93SvruqMyP2tAMRKY336gUK1In9RNUgfobhNmia01
         2RY2R02yY+RcNnZpvZwdfXiV461akp8WKwyWPPLOITXzpqLOPj4HAVHjpCYE3y9tAJp0
         EuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160074; x=1790764874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSx+GrMSwZt31iocE2rZKIHpTFuC84BRfeEtkhsKecs=;
        b=MlG+Iynx46Rcc0hqb8YvCNlUDF58cA98qgb2YzXAGrbC3uNW3zxyMYcI0hrg2YB8Y9
         wFyF/FU/qhvsT07euDdE8cTBviFpcTmA1zFncgDoqeJPfS+KqKHfpBfLgaPoLfXvJQMq
         phFyrb8tIDro3RYe3r+0bXuyzzH/kM2AkVv86a6KsTpPHZnHF0wgaLPfpxq7Wejat1KT
         39foWQpwFmnYzxP+E+r9U+IuyIMUF8757rl87fivP1i0VWfrkCMgFTg4zElW2S6cs1oI
         2K0qZkx9GAAETal+vi9EACPCwS8wyo0VZ6pngr+QmAMtF86LE9cLCePuXWup5AboRfy4
         eL+Q==
X-Gm-Message-State: AFuF++l4mq+NjaI6VjmLrMZI6HNHjB6+uUKPfJR33shW/u9kJfjeoZtN
	kYTr29BekG2M/SIbp71TelFbu5PqTDxUSFqMUBLhBvcGLdNQnTj2gdy2jvepIg==
X-Gm-Gg: AYBFou03G5w6gsYRbqx+VUnv6EXBSPmiMr5COlt3FU98Uo5iaczbtWjGPm5UVaoe3H3
	GUEjGfFa+uq21RQ05UmizbN5kdu6UfAoAIpqXT5BF0RSiOAYH+QosSU5Amu7fuWYhKJ24B/m1C7
	AV9zKE+SM6J7RJhXW4meyReoiUQIjmW4fgruQ46WWOTkiZe9mpYKTu1n9tlNyQIXShm1VSLg2aZ
	gCjoOBcvtJePblbLfRctfhJgJpiRiSXKl1b+N8RP8yU6DwiUdNX+nShUvetjrCC5K2WoBk186g5
	aRjhyHmxS8UydIAgBK3Bk3ein9mRtaSa2Z7K5vlQIvo/Piw4mvg/KGbbRO/kLNok/d+KixWV68u
	U2mHKyiKDqHMdIXYuXNoHgDJ6hOmzs90BtQLQUatdDmyHOkBC70gb3rlBo0pOQPxRam2fIo7Nk/
	ElJ03Yn/tesY2NvfrhrbUtaC6V7UQxMSoXA7UsH/OGGfkYGARAKYywuvXkhXXSh2s/qx/eglM3g
	XsQ5CWPwWaTmg82aQO6/Uo=
X-Received: by 2002:a05:6a00:3d11:b0:874:706d:962d with SMTP id d2e1a72fcca58-87d1c9bda24mr2008603b3a.31.1790160074165;
        Wed, 23 Sep 2026 03:41:14 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 7/42] fluidsynth: mark CVEs fixed
Date: Wed, 23 Sep 2026 22:40:21 +1200
Message-ID: <20260923104056.457360-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130194

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release note[1] also confirms the fix.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-58264
https://nvd.nist.gov/vuln/detail/cve-2026-61714
https://nvd.nist.gov/vuln/detail/cve-2026-61720
https://nvd.nist.gov/vuln/detail/cve-2026-61721
https://nvd.nist.gov/vuln/detail/cve-2026-61722
https://nvd.nist.gov/vuln/detail/cve-2026-61723

[1]https://github.com/FluidSynth/fluidsynth/releases/tag/v2.5.6

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
index 8bf40cbb51..43b9e0c870 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.5.7.bb
@@ -40,3 +40,9 @@ PACKAGECONFIG[sdl] = "-Denable-sdl3=ON,-Denable-sdl3=OFF,libsdl3"
 PACKAGECONFIG[sndfile] = "-Denable-libsndfile=ON,-Denable-libsndfile=OFF,libsndfile1"
 PACKAGECONFIG[systemd] = "-Denable-systemd=ON,-Denable-systemd=OFF,systemd"
 
+CVE_STATUS[CVE-2026-58264] = "fixed-version: fixed since v2.5.6"
+CVE_STATUS[CVE-2026-61714] = "fixed-version: fixed since v2.5.6"
+CVE_STATUS[CVE-2026-61720] = "fixed-version: fixed since v2.5.6"
+CVE_STATUS[CVE-2026-61721] = "fixed-version: fixed since v2.5.6"
+CVE_STATUS[CVE-2026-61722] = "fixed-version: fixed since v2.5.6"
+CVE_STATUS[CVE-2026-61723] = "fixed-version: fixed since v2.5.6"

