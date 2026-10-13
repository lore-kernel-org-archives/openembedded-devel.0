Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53BABCC6B08
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 09:59:36 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3512.1791885566592559741
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2026 02:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Us/F2rcB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab3260b35dso1682252a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 02:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791885566; x=1792490366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aCNrHROzSGrBwyuBelOAqyHW2e2UcD7LzYWMrr5DFYU=;
        b=Us/F2rcBwVJZrbEckG+tysPHauFHasscQJ1EnBoRVSkA68Y4n3dzFkZauGAx5q+T/i
         R3vUSmFAx5Q7REtM4LV1e6a4ddTqbJ6qa6rKWH3SRW1ARevyGmcmTE/fr/yZF3Too4Ft
         jv/1axlEGc5/HHoqgkO0oviYw61AM/GsrYQwvzQElMqEzjGc3kbxZrdOcnhH6Q+C5tbN
         VD38DP1MOm70v21R69T3iQKR3+FhBRlDQBRPALQoLds2elp2liFJkl/6Yso/KkNASunT
         SM2SllM8Bul302gpS1WG/01GO9dE8b+RrVZPBOGVSfHsLpvYt4Fdifjq7dBdkRGBrJek
         njLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885566; x=1792490366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aCNrHROzSGrBwyuBelOAqyHW2e2UcD7LzYWMrr5DFYU=;
        b=fLT/xWWohkthyZxKQTmnjkIMhYJjjiC0yjBShk8i7MGK9ylYMallN1+t2gTvhqNIPW
         OifqEPi8IR72R66swhJ+wPSOzate4FT3F8AlhN9R83pTvbZTJ0I9Z1rvxWd6gmc6dPsB
         tlkaaLNYzf/crmUFJ37/K9eKa+OvWYHaRe1kw2RqQBLmdsR+66YrJ0GrzfucXY7UdINI
         TlF6pVgjJeFJSj4rp4kjZJh7SIkzspXeuBi8oevMLLzdrJzUQ7zZVwCzMrUqT1MyOhFK
         RYsD68+/1YPDpfHhh9Nhu0Nv+hLoFIOukTnbmJaCVZAGIsCYHuca0+vyEbDPuI8P2Ixy
         1Rqw==
X-Gm-Message-State: AFq9FYJ2YeFGJojWOtNdiQkD+h0QrkVL5UDo/8ufra1p3BFlXyjMNeNb
	0X4LxScBG4Vn1GXGFZAsYKiEKBfsSYHXsxbbI6QYgaMMnevad9ZW3dS45EPurg==
X-Gm-Gg: AYBFou0abdTNlz4Nz8uzVi6UwgV3hC3ej+od5SIuHoLI82+s7zWvllDWYjQM+plew0c
	KMUF2YC5wTS7PzH1UvzBhylNggbAZJ2KAC2iaXejYO3iLcr+Wkhw5UyLm2XDnF1C4xz+0ZDXfM4
	ss8gnSyUixvFLg6jjoEcGs0Fhl5aKx/SvjTOwFIiNuOeYKxtXDh7r5D2rzbUkEtSdbqrNlpkfSI
	nptCCsQj0hWEPWaNSmFZquqVyFROErKreLh85dg3GxnPMjFCqsmbbgC23JdHRH8Cs4c2lpspgFB
	4XCMkNNkDkL/zCDqmCkyPNae6RiQkIoa1MaP1/Z7Bvyh1Z4hkrSvcdcOrSzPhdpfqWyRBqNDSOO
	uogNj4FdcJPZK3mz4FkwBU1+Non1Zuk9LIIsn3jvyQg5NMNCKZFhRgkL2/qtZpMUc5+dfjmAk5n
	Le5euugoerigGAs7HyP6edq9LrGGyWi8/4hTv8H3qD9SGgS2mAf2vsBL+MKuelmfSap1I+SmR2R
	fSmWSWVdSFPegzErf5fG8aYiBzAk8R52d6JnAg=
X-Received: by 2002:a17:90a:a8f:b0:3ab:413:49af with SMTP id 98e67ed59e1d1-3ab3a92850dmr7836439a91.49.1791885565977;
        Tue, 13 Oct 2026 02:59:25 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37817414sm21282398a91.2.2026.10.13.02.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:59:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 6/28] smarty: mark CVE-2026-82531 patched
Date: Tue, 13 Oct 2026 22:58:41 +1300
Message-ID: <20261013095903.3544906-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
References: <20261013095903.3544906-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2026 09:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130839

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-82531

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/smarty/smarty_5.8.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
index 83f428d388..c700ed5d93 100644
--- a/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
+++ b/meta-oe/recipes-support/smarty/smarty_5.8.5.bb
@@ -35,3 +35,4 @@ FILES:${PN} += "${datadir}/php/smarty3/"
 RDEPENDS:${PN} = "php"
 
 CVE_PRODUCT = "smarty:smarty smarty-php:smarty"
+CVE_STATUS[CVE-2026-82531] = "fixed-version: fixed in v5.8.5"

