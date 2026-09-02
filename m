Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B65CC624D9
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:07 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9360.1788343566733280310
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:06:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cb+8zCMP;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1cc97b84bso750870a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343566; x=1788948366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFSiDMmOLw4lL8OZXjQVwnzrCDy7sICdqOTpO9Jc9Uc=;
        b=cb+8zCMPCFQlLowI3pxp0PaKgWROMS76AC3cNDtNGil1NmZg6H2jyWWhgJLIaQPgin
         mmrpo2IGF1vyd+vHYq1xqbm60YxRKYMgpO3aI9i9byrjD1XY9K7MH/2xeKElk+qlLXLl
         MBBXtWJqXrcw/+mLLtM63lh8gZgER0/lRWmF8qv+XoYhdJVHahuRjI/gThl4zYpzlxN1
         4ZnA89d9ei0IiSIP089MLxXF9L7KS/ubKG5gtDehCkf/OxQc2AgQSQTMwdt4bzfPRjRf
         Z0YWvXe4Pr0WL5YAwmdfTuJzQG/fAM8lC0vgDnHNBQUa8AYin17/1SWlQNoEBoBz0S4y
         r89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343566; x=1788948366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFSiDMmOLw4lL8OZXjQVwnzrCDy7sICdqOTpO9Jc9Uc=;
        b=J9vpwofZefLPxOy59Bv/HHLN4oJMElGV5UuveH4TkkbCkd75n93QI3iQKX2buqTFQw
         xrNWTzsWJuZo8HfG7TVnDt9rAPJWPgFiAqkp3n//aB5YuWLUweTQ31EiprILeg41u7i6
         HeOa3T+CML/+GBzw2rlQSCrXr1Fm+WNQsTi0QVLOMjOucScw+S5YsHKNdRDh/8HkddHe
         87xL1LI0SuLX7i70pStPSKH7dmV5SXbXhyE8C41b1fT2MRL/izsyWbl7GAUzYlcrxAKc
         Tgb+dyQD60pbjsX/5lATIyTeWxWFaaaQoLjiFAdaL4+r9QXY9ZHnj3ewKCXwSAAgRLqO
         KfOg==
X-Gm-Message-State: AFuF++l0iNci9PQfi46NS2FZq+xioe8hhIvlRVDHGAQEekwxjF4KnaA/
	7c9Z1PQyQ4g1NXtlkPgFdJwD1cEodPW1B9rnk0ksf9ci1m60s+zraNtZhM1btyss
X-Gm-Gg: AYBFou3vPL3azb+8NbndjeTVdq7UdEZo40Pi63CtlLH6x8o2/5LCtWk1G0mdBjoJTt6
	UF3T3aj8XZDGHTB6d066NPglpHGxjn6mxYlh7vCYdR/jBbsRR4HTXhrTbt0Fkh4ejw5YaODbRiD
	JCA6DR+I82EUopQKS8zbNmea6ocsqeK4teu3AL8ijwtySVxuEn8k7bjrjLtxcVU/rh1Qqkjlg1/
	KMs+1xkjS7Rx2mAZu2w3rE5922kWJGG3ljdTAZTNppoS7pn1/z/LYSZivDRKzjMnZQ3j/gEWRxP
	vV+nwVmpVL+H2g5MMtmsyZ4xYM+/PV62IKxlUkpI8E/EBlYUqA9p/iEGslKVHj+/L9SxOcofIgA
	+bD66JzU+3IpG8vVHnOZaHcdGCogRN02imsyCARivI3JU4MdP70fzk3nSpJgDmF+CKB/wx4JqPy
	gOcG+VGbDjr1lQLUbhDCUIwbKDVfO0/PkcRLIm4WnSxDKa5E0zvgHOdk+esDxOV9PGShEbzPGn
X-Received: by 2002:a17:90b:4c05:b0:398:d93a:b343 with SMTP id 98e67ed59e1d1-39aedebf901mr5507637a91.3.1788343566068;
        Wed, 02 Sep 2026 03:06:06 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:06:05 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 19/28] gpm: ignore CVE-2025-4558
Date: Wed,  2 Sep 2026 22:05:01 +1200
Message-ID: <20260902100511.2105916-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129650

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-4558

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gpm/gpm_git.bb b/meta-oe/recipes-support/gpm/gpm_git.bb
index 155e56bdef..9c07f334b0 100644
--- a/meta-oe/recipes-support/gpm/gpm_git.bb
+++ b/meta-oe/recipes-support/gpm/gpm_git.bb
@@ -42,3 +42,5 @@ do_install:append () {
 }
 
 SYSTEMD_SERVICE:${PN} = "gpm.service"
+
+CVE_STATUS[CVE-2025-4558] = "cpe-incorrect: this CVE is for GPM from WormHole Tech"

