Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D39D5B167
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 20:18:32 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12629.1765657105382810627
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Dec 2025 12:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k4JxpSyj;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so1377761f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 12:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765657104; x=1766261904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dge2/W7TOYJPPq6D7u5IymcKxR3NLeVBSsG+N9N7v0Y=;
        b=k4JxpSyjhHf3TAEUjONG9u/NnhF7Au2jTi0Am1tlQEet2bNb11wyJLehfT2gGxc8By
         2ZwwHE78grB44QCA1NBbK9Vr1TWLEtxmOVL4XjnGBzmdtU72WGXCG1wNs+s3fxnDY8RW
         6ZBp0H/6afNcowyS+TkhR3opwjZwPzJnpLe9s9V8sC0lAo59d/qk1IlJXpDQ8ENSJlIB
         k/BaU43WLB17rH9UgJSOiT9ueyh0TqTRbHgPjkkaug6flNDaYtZlqGjQ/yqqNzyfCpnQ
         VqUIGnnZjQRVaPhamjfdbuZFlKsjAVxuxf2UivRz7KzKkz4ucmIvgpQm0ykU4IBZiy5H
         IK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765657104; x=1766261904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dge2/W7TOYJPPq6D7u5IymcKxR3NLeVBSsG+N9N7v0Y=;
        b=qCN2D94YnrpRzZh0uxg8DNzcsm5JvWDCH3flKsT84/Y16cyU2e9jrHedFBBQ2Du085
         pfyW76sT5iOAyabLKqkCJnseTDDZ7YD6vf4oKFckb6r91PDn/gNf0BwTgJO2kZBLLPY3
         JWme12F91+rbQIxVTwifN18JFOf+2Y5kM33vdo3tpoGI1TKq2jOhzp42I0SUttgfjT2P
         sVJAfAe+Ny1wpAl2DVE/FA2hajzux+p68E2YjIGhS3PucOZ4TW7jcONObf++NEMdNV9y
         xnYT+5v6WOLIu7mB5/kqU4KMZtPiVeuFcxJCvoiya9sgIWKLeB9+GtGxyG33I4rdtxUW
         J+vA==
X-Gm-Message-State: AOJu0YwNtkVDbIMwvABV10qRt95/OBK7xKyY4226s79jOHVebj8Bkmks
	VmILDXpLSxTx0KmBWoSThOWbL+fSXJyLF6dg5r+KxYem3NlxFu1oz/XBeYn4jA==
X-Gm-Gg: AY/fxX4hsvHkrR996M5jbm105gHAb0uGSfPj8kBh8ELZmVTSCKbwupoP7h2/u/Jgyba
	ogtDFTFYmLDRO/uGvbWZhUMRDP1ZwzVZND9SojTpavZbaspRamWws9h3wkAelyot2pbfzNDlglo
	+a6a0kE8dk0nEdR1IOruSlcL1M8zCJOY+hQjwL+GOqPOqZbTH3BdtQaYPPjHCZ6mP4AKNR9HC2O
	MPev0FFI9fPMOwXPxCFn6LoJzzEZPt2syVYwdGChyY3qdeVumV9fh+CdqOS50akxilXO3QPAQQ8
	3aJc9jBoSmjM1vZc51v1pon7ITTlAZj9H0yOfm2QjRqDVgp9zlEhxnZCLaDQOQMo6ZaSYyK2Par
	CLCskgOHzOF9JjJY1x8q65wa/qIjkwnLmCQp38+uD2lb9jA5lH3fesbwNbp7vwjs+0j5C+/+ToL
	AXHK677wEE/K3o2PEotRg=
X-Google-Smtp-Source: AGHT+IH/N1ZvURDUW3aAFpYSqVXYNPmFSXBfBmwa1bRMbaGxmVt2x3F3l642uqB9V4fqftgCgHIN+Q==
X-Received: by 2002:a05:6000:2dc3:b0:430:f437:5a6d with SMTP id ffacd0b85a97d-430f4375af3mr2037204f8f.22.1765657103678;
        Sat, 13 Dec 2025 12:18:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f36b6a19sm4309160f8f.38.2025.12.13.12.18.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:18:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/4] sysdig: set SRCREV_FORMAT
Date: Sat, 13 Dec 2025 21:18:19 +0100
Message-ID: <20251213201820.3214133-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213201820.3214133-1-skandigraun@gmail.com>
References: <20251213201820.3214133-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Dec 2025 20:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122644

It fetches from multiple repositories, but didn't have SRCREV_FORMAT
set. Because of this, the recipe couldn't use sstate artifacts from
a mirror, just threw many warnings:

WARNING: sysdig-0.28.0-r0 do_package_qa_setscene: ExpansionError('SRCPV',
  '${@bb.fetch2.get_srcrev(d)}', FetchError('The SRCREV_FORMAT variable
  must be set when multiple SCMs are used.\nThe SCMs
  are:\ngit://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sysdig
  git://github.com/falcosecurity/libs;protocol=https;branch=master;name=falco;subdir=git/falcosecurity-libs',
  None))
WARNING: Setscene task (/cocto/kirkstone-next/meta-openembedded/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
  :do_package_qa_setscene) failed with exit code '1' - real task will be run instead

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
index 4181da732f..7a894960d3 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_0.28.0.bb
@@ -29,6 +29,8 @@ SRC_URI = "git://github.com/draios/sysdig.git;branch=dev;protocol=https;name=sys
 SRCREV_sysdig = "4fb6288275f567f63515df0ff0a6518043ecfa9b"
 SRCREV_falco= "caa0e4d0044fdaaebab086592a97f0c7f32aeaa9"
 
+SRCREV_FORMAT = "sysdig_falco"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE = "\

