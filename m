Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBE8CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:06:14 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4467.1791540371568360941
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TcgmjeFx;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so2137151a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540371; x=1792145171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zW7fa9ELvSZj7Lk4aXp/EZ/IzrkEu4IIzWUTXNUwalo=;
        b=TcgmjeFxtYtvvEc4DYAkYxDJMB+ev+JhxgeuE1G6HsGxBfudFW0o5Mn3UcIbM6DWM7
         SBXWiOF6JW/z8mgtB/CIiEPoCip+eHbmk6+N1/LemXaEGscvzCMtL02nQcQQ+MVPoFBF
         iLoLE4qdXV4Wppez9rlDeLfwcflFi3qa926cG60tgg3AJGh+XCeblg75x6kB87+XzI3e
         YDyBNl5I/SPn7yvqO9/Hj7E4qSiIRV75vrusfjPiDwKmHG/QG1IHIGOYcdzmAw2NcYN2
         0irQ7RLWnpuvg1soAC37FeSa8fvcNKjFS5C1VJS9Sr6mVElozcZOq1nfXGOeM2YplBnK
         Vnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540371; x=1792145171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zW7fa9ELvSZj7Lk4aXp/EZ/IzrkEu4IIzWUTXNUwalo=;
        b=2xedgCPaEAi5/0KlsUnrkR6wl4ugnH+NWOkhgVLFg1x0VA5h2AKh1dZXINTEIpY64g
         ZN+aFuCWp9oy3jnXztEuBKbMeVlFSQwxLXbjMSaMb5aAUgobaXjK9zD5yLc6CAEqrqMJ
         4WjHCbNmj62kKnBuTd4UOr/UDR8REKCCObDQMrgfLj3pNkkR9NdtgHn4R6ZLgy7qu0Hm
         beS9JVU3jg26Nw9Y08P9NVC9sZB6XgOADU6avTIxg+F6anTi+/ehflEq8bakpSCvewW2
         8Y8/KOZo2IBmRscqzHvb+O27seTI7MesiXn8kb58YmT2yZpSa4o5k6b/lNvTxel8z69a
         +zQg==
X-Gm-Message-State: AFq9FYIlgTrajebxUKpI0XYRJsdNVTnLu0TNP69n5NYhpfXufT6KSyQZ
	U2uG7F5hs8ZHAq0HeyJbgU3h37ecZBt52W+4CeuUlfAnwXv5CoF0/gMA4q1MLBDz
X-Gm-Gg: AYBFou2xmv0EpkZta1+nfU9kH6IzW0GpTYM0cAcp/xUXbtq1k7uiV2Z5gpBrj/2dICn
	1ARFdrL3OsyubVPMTWNdhcy7q3piHAmVKAQDlpYnV88EnRqbszLdRbhDwHyuzv1E6fJEcrAdSpG
	V8U4cn49JmlbQkO/tzEQ0k51mZb6Gh+0VqFPRMaZgpZOFX469c9L7O2GvamIOgoVw08LCKhyN2y
	F4Q535sByGd6f7LokXSkguWKN6pfogqzwomb0oBiSYIe5M/f2h7WARY+iICcpVgRuCewRRxAYOq
	eC+4ft5Z1uoQNMU+ehOeLjIBaVJdixLkoElmot1fDn0pnsOukwP1ED7QI9tWY0o7nAbiKB2VtQ9
	7D163wf8eGRydzhWd6PSCRZQp4VmO1SU3y2kvZ9ltgUZt73Mx0ji1jqu/nMLh4GCPH+g77Z41+G
	7jHDsE+injXgoDF+Uyswu4aYGaw/l9Fx7zaEKoq3Ln55JFNxcMnIiv81e38it9PpHgPoC0Mi24L
	LT48KnJRM0TSdimsDzFWnYMIz8gyJTjfXKNpxsVk59Jun71EQ==
X-Received: by 2002:a17:90a:d44d:b0:3a0:8050:2ec9 with SMTP id 98e67ed59e1d1-3ab3a747306mr1297050a91.16.1791540370899;
        Fri, 09 Oct 2026 03:06:10 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2723866a91.13.2026.10.09.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:06:10 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 3/8] srt: upgrade 1.5.6 -> 1.5.7
Date: Fri,  9 Oct 2026 23:05:38 +1300
Message-ID: <20261009100544.1428938-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
References: <20261009100544.1428938-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:06:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130687

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/Haivision/srt/releases/tag/v1.5.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 426b417769da1b08cc17f80fe4385978bf2fc38c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/srt/{srt_1.5.6.bb => srt_1.5.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-support/srt/{srt_1.5.6.bb => srt_1.5.7.bb} (95%)

diff --git a/meta-multimedia/recipes-support/srt/srt_1.5.6.bb b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
similarity index 95%
rename from meta-multimedia/recipes-support/srt/srt_1.5.6.bb
rename to meta-multimedia/recipes-support/srt/srt_1.5.7.bb
index b4ae8bed09..2796ee443e 100644
--- a/meta-multimedia/recipes-support/srt/srt_1.5.6.bb
+++ b/meta-multimedia/recipes-support/srt/srt_1.5.7.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/Haivision/srt"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
-SRCREV = "c63c311e88aa55e430e3b7d94b89d790994f88c4"
+SRCREV = "d99d2e1a3b1a213b03c7dfbea5133898935fdeea"
 SRC_URI = "git://github.com/Haivision/srt;protocol=https;branch=master;tag=v${PV} \
            file://0001-don-t-install-srt-ffplay.patch \
            "

