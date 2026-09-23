Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 886EBC9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:42:07 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4297.1790160121589532641
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JDyRdU+7;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469e211a0so468034b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160121; x=1790764921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71S0SZEDaeFRtx2Wmh7C01Ku70zlgIeEf+7xFqct504=;
        b=JDyRdU+7s16EG74uIjy4jucNfgGSBKy9LkdiRPcbb1JawbLoqa+cRojU8Cg9hzYH7H
         r0Uh6S4WUC391J+tDk5Hl1UK7A+G1PN3BGIEmLArZ3kkt/E3bY7S15CHihjIVCaEywFM
         cfGai8D97lzrTTn3foWikCqpchiSv6vXwj7xYl0dyZVHIwJ92+cA47wCuHWnKXlKAiKe
         ukco5GMERkZ+lMrGRa1/ikSool3bcxAEbgD+0Ir/XPltkmRO0YSIksCxS/jXWuYX/4c7
         6GriwxGspLnuPnkYx0MQzAnd24kTFwdb5s6naowIQjMF27+0kifBLSrhcNdo9ASzbiAG
         iMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160121; x=1790764921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71S0SZEDaeFRtx2Wmh7C01Ku70zlgIeEf+7xFqct504=;
        b=Y1sXKTS8wnpMC/GR5pIRRPyvv+JnYmes0DSV740Qxi2qsnC/G2978GtEqtgIg1PDAa
         a75/9WxRbWDnK3TD01UUyu1Wk1290+s0PIZdzpUL3RwjrFKvgMC2DwU0/Ihr3PhCllbX
         Q6KXzmMrX+MrfVs9qOvB+aWLlf0h+GECiGSCXnqj9Wd+oXbRtOOQnDMJcqTafNiz6iI5
         2nEjkK8I3xtpZWRmrE0jV7NimFkZGXdQzINj9RBeKAbZ5D0RgTmthkoAEQCfpRyy0Sqa
         4QlRZ2NB6SAkpr/UAzfcTqbWB04YBqX6WdCEuyR2K+I9H2PmWzIMuP20tE+BOzrAhXxt
         JAtQ==
X-Gm-Message-State: AFuF++najZ6JUI3fLNidYM0SjGTNpd9rxNoygZVx0q1m9ZtEgnAp2p5j
	BGHvVnv0p6JG5DdVldExkd8kmOjgT4XDxUwAhv8xUpKKTy64RLBqkB+F9y/b6w==
X-Gm-Gg: AYBFou3ucDZIbPkqddtrti0cdlqofP4OxPQA2bTDepvNhvDHkzIlfNFbkdFuRHjFW8+
	2bcKA3ULiYg64NkUYp2GqE/JAHXSlosbNHrBFN86oKuKb1oKsfAR4ERy6H3SElsgvNZsqZkNu8t
	Q5abJRZUmB2+Gdn54PGx/QsQ944LmvvjSWm1RZZEFEBGnqEC15Z3mL7Cg9GgblGAh+js1N8ECer
	zQiI6l0x1INHrpEK6H5MPuSX5vM2XVKWQ2BU+x1eW+Y8hC8XBFN9Xh+TX7vv4SDXvmx23huiZ8R
	e5WTalOm/n796XtC/fBKnUjhlW1kDqsVEpqQVSILFBjlE/mHyPdU8jMhXfw0IkBTSialVJvhiHW
	xnnxppJuscjG95ldJYABHuvgc6lNu/Zffr7p5X3QLHKKZdeCMZog+3hqtelqXJJgKu0FG8VSKve
	4oLRpkbDYj8RFMpEHwPL1VBjjsmgu/NOJRNki7lue3Y7Kmugh+B3rZODYw6mgIrZF8PYEakH+fF
	UAmlbmY87/fuYfqHZqza0s=
X-Received: by 2002:a05:6a00:1f14:b0:878:3811:238 with SMTP id d2e1a72fcca58-87d1c1babf7mr2034335b3a.52.1790160120970;
        Wed, 23 Sep 2026 03:42:00 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:42:00 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Devansh Patel <devanshp@cisco.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 29/42] dnsmasq: correct CVE_PRODUCT mapping
Date: Wed, 23 Sep 2026 22:40:43 +1200
Message-ID: <20260923104056.457360-29-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130216

From: Devansh Patel <devanshp@cisco.com>

The default product-only mapping generates vendor-wildcard CPEs for the
recipe's Simon Kelley source. dnsmasq:dnsmasq is an NVD configuration
identity and CNA affected-data identity; the_kelleys:dnsmasq is an NVD
configuration identity; and thekelleys:dnsmasq is an active NVD
dictionary CPE and configuration identity with CNA affected-data records.

This changes the generated product identities. With the frozen
sbom-cve-check database, the 48-entry CVE report is unchanged, so this is
an identity correction with no CVE delta.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 8dffafdd1dcf46ea5d544044a238364eed6d0535)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
index 765287018b..a01507de01 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.93.bb
@@ -18,6 +18,8 @@ SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getV
 "
 SRC_URI[sha256sum] = "cc967771abdafeb43d10db18932d6b59fd4bed2c69c22acf8cb96aff6920d55f"
 
+CVE_PRODUCT = "dnsmasq:dnsmasq the_kelleys:dnsmasq thekelleys:dnsmasq"
+
 inherit pkgconfig update-rc.d systemd
 
 INITSCRIPT_NAME = "dnsmasq"

