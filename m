Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630D8CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:10:43 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3488.1791763838925972453
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CMOrLQ3s;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc50ad2d650so899776a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763838; x=1792368638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+1OKLLfY0HM+hYdXDzeeA60NjAWoNrRG1H/m8ZLgSM=;
        b=CMOrLQ3s2Y1PKACUD0gpOzH+of6jtBd6OHSqZdGVugxxaLnywjFA6qLAy3YEm6ZkgD
         KHTGSm1SN98ylbSRQxG0YXczgIar57F6EGKFmmj7uK7lgTZEPPTHFM5V/EJKbLd5J17W
         R6YfrdGtJviS3AG6COVpEC47zL38A4m0Q8ORXTvai6N2Aj4xUCgHw35CRz6mgf8RMpNo
         LjF+Rp6f0X5wSN8fp0rSOAgIek/B2h9981ljjO6cq6Mvnw6Bn+pZfA0enW1kOc9KOKKG
         zBapLd8E0K4b85jMSnDX8dft9ta8Pvy8vHLOctLpYxSyvkL3CWGiHnPiw+89Ob7s6HHF
         S/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763838; x=1792368638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8+1OKLLfY0HM+hYdXDzeeA60NjAWoNrRG1H/m8ZLgSM=;
        b=Fx6/i9EejfMlRjih7k77/w8mwQj4hsBITINy6EIUHtB4xQZv+sLz5SZu6gaJIljSq8
         Ull6JO1T5Mqu6f7jkJ7r+LBTBd6YRkk6oWk0Tepxq1KXrMgdtpcMaCZmITsZemGU5I67
         RO5Palnu4/RfSigZNyPpiuv6kNqY03uTkLqvwZqFDeOmOUnTnKBj2r8N9Z5TutZnLmcA
         W9taZXEV+LzDDXXN3y+4J5PQVp9W1+mpmVwclDXxkwh3YTN51F+oWNAYqGyLpM0I47M4
         1bWl2KvQspj9wdI36fpy/PmaZoDJRK3IIxOaJgcPt1CMHiFAzuJBNAPJoV5SHDvl1G3O
         QGvw==
X-Gm-Message-State: AFq9FYJW/50yJ210+DekZId/qrorogv7gTM2Z7ooa1cEzRfwgDEDjfvZ
	HQa1rmEuWLCbAkUn9o41/+QW659SekyJYCokEqj0g/hObZ3N625YMtzxHRlbjZjBYKI=
X-Gm-Gg: AYBFou3tLvUsxm1zQQY/+dG8O07+6k0QC01SI6RoQugz+bL/ljT4sHs958Vt1+ayKW5
	VzYmGc8/x+nMX+YJ5al1nsupKNyzoR/vfAdT0ovUjzJWdLvUh7nGWgDcB2i/+f2UsVhdfkXXamu
	SRvHBS7GAdirOu+N+a6RGpqjfp+G/HzyETZHga99pPP5GdA2qeRQM3EkLa2rnWIR13aP53Wzi7G
	b1kc9b7KpurIfz+37rXDoSXSr1Juuvbt/u0rhuM/YoX2pV9K/3UjOVPfWw9bEsITUmA5lW/VdHE
	0ICkRW3zNxVuou2m2dJ/T1S5avpbEUVmF8LEtVRU4OeWyu8TUycTgCMwOm9Gai6MWs15YcKceB6
	cjAv5KT1ohjD4wxAYHHlo8w0x3Q+JlWjZFR4tlwu5gGE2RxtbIZh8rnjSQlJ3DNkxWv2S81kHTZ
	p8fvg9eZkboiaaNyJy4gcZY/VpFxEK2yfWqE7GtR6t+0JHzla+/GLGaVA5q+euoiEyo2cbVnJJe
	emZfw6MMzXsOprXAc65MstUOZr8rdcOy931UB82+IqMNCMTfg==
X-Received: by 2002:a17:90b:384a:b0:3a5:37e7:7118 with SMTP id 98e67ed59e1d1-3ab3a731577mr6717168a91.16.1791763838341;
        Sun, 11 Oct 2026 17:10:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:37 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH 9/28] haveged: ignore CVE-2026-41054
Date: Mon, 12 Oct 2026 13:09:47 +1300
Message-ID: <20261012001007.2541673-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130734

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian[1] also confirms the fixed version.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41054

[1] https://security-tracker.debian.org/tracker/CVE-2026-41054

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 086a780db02e001946bba0ecd337ee7834da1823)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-extended/haveged/haveged_1.9.26.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
index fbebb158eee..727f8563799 100644
--- a/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
+++ b/meta-oe/recipes-extended/haveged/haveged_1.9.26.bb
@@ -21,3 +21,5 @@ EXTRA_OECONF = "\
 "
 
 MIPS_INSTRUCTION_SET = "mips"
+
+CVE_STATUS[CVE-2026-41054] = "fixed-version: fixed since v1.9.21"

