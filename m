Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE66C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 00:03:36 +0000 (UTC)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47668.1790553814095511425
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 17:03:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RxNniEck;
 spf=pass (domain: gmail.com, ip: 74.125.227.140, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso10559725ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 17:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790553813; x=1791158613; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LFGRDT1JPc0QeRfMVWuLfexVjF1ZxMbQAYkUE6pVHhk=;
        b=RxNniEckRaP96elcXamWlwEir1L7xO2PSgqVH5/IDadLrmgoSBVwaAuLSRwHIiDF2F
         temUbEDfmorqAdrp+/kQ1YRNVOYBBX749dEHV+vnQaHUTDJQrOIqyZJrIjwxZ7Yx/lGa
         Eg8KuQwcz+MEJ619qa87QfAltZnETifcmhJvJYxetIeHPm4kW271MfiOJf9/DGGiMCGE
         vo4eZo1pmikq3W2QH+hEralqBm7JMcnCe85FwXwJkt7ECUm1WFR1bL3Ns8krCNc7bMYD
         UF+at8lp+3aYsyft/0VhXccUAZEBmMLKQYizdvYqJxo0Bb2RzldYPb/SB/kTNuV8BY/o
         KUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790553813; x=1791158613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LFGRDT1JPc0QeRfMVWuLfexVjF1ZxMbQAYkUE6pVHhk=;
        b=mpYb/ushvUHHVEw0oR4MjaNFaup4spVSYPmXsnKj1H9qSktDd1Jvvy7hCmmrQAwzIK
         4JBdNzIvbnOb9VvCuHjcKS0rgy5njw527ifCIrRfREUIj/p6XX0MR4OpCschr5bqPYoF
         kdfUDGszX+4Jawt8CW4q9wdM53g947vGcEOQroGCh/5UDIv/mockLjrIvVZGvht78kh3
         NOsc6rcol9tDofwcNI0FaHTAZezkTb10gqkxVxSZob0WJklq/wFtemU/0oxq5jpeZ8AT
         RFBzXlPTxV60OamkWJ32KU7cCV98eBel8Vq152tiJ9t1r5adb1xJm1F0gDa1T+GQW79Y
         Nnwg==
X-Gm-Message-State: AFq9FYK6HRESrlVJa/3rHOjN2nR9BgHlaEO2J05UUZuMIQzfUHVMLWsx
	zaj8ma7bnvoO5C+m05/8lndT8tTHSyFJMN7/cXfXpZojsQbzGIqvhJHJ2KXKBw==
X-Gm-Gg: AYBFou1jItMFV9OJqZc8zYs1fjyDfs/f7R5I/9V5If3oFuwy5PZ7G1hm3hauHGIeThm
	4pyFSM2r7zUIHEcW3OX1cIcusnSR+kdI6ZX1rtHv9+2L/kXd3iKil77Wt5FbL4pHAbnBmhw1Olj
	7/Z2IaIBb+dk/wLg9Xk/rcYm8ODvHok+vGSN1f+Q0wgOEVnu8KhfLQRRAz4ydHmE6taR6P0S43G
	6dh24ISWtXoXtg6U7iqilOs+gskIVBXBP0wPozsUtCleIL34t98yjBDaUMCPUnTsTg4xIMNPJtb
	jHiGfmSVqo7cF/ST0V3P3cN37mRyPiiAnAYk12Fv0pecapeqJUEiMOhkILnphgkJ8NlArwYVFjs
	tEZn/8qLC/F0ftX6SeTmKU/eqxZsjkN6cc7MxRDqANPimCoynqoMKXYSKGPaZK0Da0FG0vuXxe8
	6o7BzdUp8Atv9rMhijmlJS2yLg0Xb7Qjg7aJiGCB7bcbRxPazjp2Rx6oEorSe1WDNK3drgiku26
	MXIDH3AlVolyq1j2nvHnfk=
X-Received: by 2002:a17:903:32cb:b0:2dd:c100:80b7 with SMTP id d9443c01a7336-2df7e6681c3mr97408455ad.50.1790553813399;
        Sun, 27 Sep 2026 17:03:33 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913fcbbfsm32347775ad.30.2026.09.27.17.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 17:03:33 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 12/30] python3-configargparse: upgrade 1.7.5 -> 1.7.7
Date: Mon, 28 Sep 2026 13:02:44 +1300
Message-ID: <20260928000302.2528437-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
References: <20260928000302.2528437-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 00:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130399

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also add optional dependencyto toml[1]

Changelog:
https://github.com/bw2/ConfigArgParse/releases/tag/v1.7.7

[1]https://github.com/bw2/ConfigArgParse/commit/04fb885605a3aaa165b71c8f72fd7bbbc93ca469

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...nfigargparse_1.7.5.bb => python3-configargparse_1.7.7.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-configargparse_1.7.5.bb => python3-configargparse_1.7.7.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb b/meta-python/recipes-devtools/python/python3-configargparse_1.7.7.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
rename to meta-python/recipes-devtools/python/python3-configargparse_1.7.7.bb
index 5bd3b185a4..a6205be59c 100644
--- a/meta-python/recipes-devtools/python/python3-configargparse_1.7.5.bb
+++ b/meta-python/recipes-devtools/python/python3-configargparse_1.7.7.bb
@@ -3,15 +3,16 @@ HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
 
-SRC_URI[sha256sum] = "e3f9a7bb6be34d66b2e3c4a2f58e3045f8dfae47b0dc039f87bcfaa0f193fb0f"
+SRC_URI[sha256sum] = "607bea276a219912158afa1e5a716c3f8f88d542f9997dfd43bbd0b492a9f5a6"
 
 
 inherit pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native"
 
-PACKAGECONFIG ?= "yaml"
+PACKAGECONFIG ?= "yaml toml"
 PACKAGECONFIG[yaml] = ",,,python3-pyyaml"
+PACKAGECONFIG[toml] = ",,,python3-toml"
 
 RDEPENDS:${PN} += "\
     python3-core \

