Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34BDC44524
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:51 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11393.1784590724071123620
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bK1KMsKc;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb7926836eso93335a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590723; x=1785195523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5Sz6t4lxGZMO1AUq6co1acdRrknVS8HJGv4fhrFSsg=;
        b=bK1KMsKceLkZzRXKPBQxAjGVsyVuEjk5dydLmPlhcqOA5P6d+9j5mgNokLbw+etzx4
         xR2Qt1e8+y9il50QSbintY4IFYhmyzmMyq8AXF+cfZIZd/78Dzf/5EgtshVGjB8XGgjp
         tNggSMJBT9vkMx8yl6j7EAT0T3kqpDlWeqkp+01LFm/iKVX2lOKkC0W+5ouZUCtJNndk
         AFvYCHUXshVvHDwVbweK/c2S9iQPLaG+JahSZTPKKxT853aRnualjSFzY690zrVewZww
         ts/yCWHkYr/NDNgWOdnbLFKoJRpdQKowgNqfD6XirdNej4JDIFFFeRH7N8hNZr1xTCRw
         kJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590723; x=1785195523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5Sz6t4lxGZMO1AUq6co1acdRrknVS8HJGv4fhrFSsg=;
        b=mkTESedglbKcvRtMbla/Tk4lriduxHS15UUy9kUgljl6ppvH+hcg964TNzBiv4sR15
         4l36I5D2qKP1S9zLUfSjhHCrSipug/F31/QWKpYbm0aZjnfv0c8U08CrHERSwwHZmMlk
         QDgLT7wz/2eZyw9zO6eaWKE5JLGYeC+I8itUjw5sFTg7AVJ83v+TF5nLjYZODITioNUg
         T5i9L587Ac6+VrlRykFnsL3BKKD4xE0IQi1CfontujKBU+IH21b3G2TlZZXNAaI1hMDi
         TO4cTTy2n0F8x2IvI5VY5s/FT8/+LtYzLIUC/B3lBoy+gGLp72jcoRtvQANOSNSlwsY8
         zoaQ==
X-Gm-Message-State: AOJu0YxFftCmoQtgukb5Zuk+tau6Rjk8rL7nAhCTeD1GlNf5B5TZRbI5
	fGf1DkVZ3jVofPkTbaM6BWUuJq1qHjWfheDyzTZ35/75jeKHfWwvruosUy0QCg==
X-Gm-Gg: AfdE7cnGlCUP3CGvOsETjvvH0FnZh6Os8V3trSNUc+OWH5cNhVezVBYR/ugzPJS+rcS
	WcUCDFMNnLCsAwzVk5EYjoCbuv5cI1V11cI7BBZ8UUaIIoWUZH62znhaJq9DMerPb8I3+FxSj53
	g4DvDM6bd4Ci9EnZ+AzK5vi40KwqGgVCD83Zv6DP6/gdEVp6AnexFCkjWMsIJjCvDif1aKCji/G
	Y3R71hsjE6UczZDiRrF7I4ozzH8XbxVnS3PY7UNDgnmn809b01j+Qi+WBU0vgEEXDJrdanTnB4M
	1yExNNQL27Rn+MXPigbJ8GzHZ/3EXGLTo44r739Ch3FiSABG5/KQm2aFFY8wqXOaf5CaoynupLW
	KPwX/Q87CRocwJQYuNXJp5IReP9bNxwVGXx0OOUJcYcOLga/rH195PgbCLCi5premaqQdzF91V+
	r5c2joTGEHPwrybmQ=
X-Received: by 2002:a05:6a20:9397:b0:3bf:6c04:a813 with SMTP id adf61e73a8af0-3c3ad9e2f15mr16541966637.52.1784590723423;
        Mon, 20 Jul 2026 16:38:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:43 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][wrynose][PATCH 8/30] python3-elementpath: upgrade 5.1.2 -> 5.1.3
Date: Tue, 21 Jul 2026 11:37:49 +1200
Message-ID: <20260720233811.2324493-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128309

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix protection against type cast errors during the static analysis phase

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 90866b4b09547dea91f442f84640e8215b23fae1)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ython3-elementpath_5.1.2.bb => python3-elementpath_5.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.2.bb => python3-elementpath_5.1.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
index 466b97ec92..88b0995720 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c04ab6ce886cc843af8941bb199406ba"
 
-SRC_URI[sha256sum] = "43d67a38700153eb45349c6e14a4d4b3a06e390c31df06539f730a96baf9a7fc"
+SRC_URI[sha256sum] = "35e98cc2e26332305a49b32eaaebfb7289d1963c88d3989ff5ccb02c46809820"
 
 PYPI_PACKAGE = "elementpath"
 

