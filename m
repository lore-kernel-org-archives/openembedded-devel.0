Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E722C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:06:07 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9054.1788343557324937870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VHYyBLNS;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d71a50caa9so11061935ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788343557; x=1788948357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAPH8U6ljllikBZLetDRmofKTDHa5/+GRx/xeI2MYrk=;
        b=VHYyBLNSJHJDYcbtr9Y+UiFN2N4A835AjQrudpQ5G6zOpjtZ68UnRJ/3Ls44V4+ZbG
         pnIH3zUlZMg3e3mSWHXdltEAEcsuX5Sqrjcu+IlfOycIkhqSoTB5GJfgf7995rX4HPjg
         urZ6r1wQmbvjfwfB5sPFsbZXmtdIIIoqhe+UFZSRuhQqdWD/V33eJA1shTfO7LQs+e1v
         UkuIU1daADV6SteeN/Wlmnv6uTBsvdcDqAI4Awiv65/y2nxnt2sqjzsabZEkcbzvz1yx
         e5un3UK1Afj/VOBFobR+PPZDalEsd/innEz9wT2AT5nwfWq9lpGSIBaTCPsjyeV+dZsB
         rQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788343557; x=1788948357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kAPH8U6ljllikBZLetDRmofKTDHa5/+GRx/xeI2MYrk=;
        b=hf9XON+mYWGYYmFGnyjgeDGQpxyfU/OVf9X2OZG3a5q/0yhF3vV2iJmEepevGm+6jz
         +IjiiEr1ZEaOCmXQfQ5bBK1ySF07Ob0IDKNG6GN9qJ5Zbj//2Y4Cy18KYzGY7Z6ub4Pu
         RkaMB4LrEYe4IQeGZ14DPksu+YptngLEMpXAH7vr5MmVUQwn0/zBNbMZGvXlsxzDGJ8u
         s8ptKer2vBGRAkR7rwgVSnr9pvAOu9tYqq7qSVES/Rg8StT9mqKkf3xGRPw+/NAWcziJ
         yuAr+HLw0yMXHsqIzF3BdTTC/1lReWMkB+XSTzpMjicDovJ/xIDNstrhYyqhu/laOdTg
         m8FQ==
X-Gm-Message-State: AFuF++m9TMPYVcQstH/Fi3S9wd5nHbGdAFU2LIWNRY8w1gzrwuCJdOBV
	i3ztHWYoaRycLHAxSHczdBN/riq1Eq7GDWwy8yKbtnNNsmhFyqVqK7QDscUo/Unb
X-Gm-Gg: AYBFou2nTUqSZ3zInIHRqYp9xsixM9HrK7/zicOXivYg0klBCrwjLCTFtBec5l+V5MO
	TlGdmDZ/DPkD4zYV6oo7DxfHpwUEHUTjI/J57d//YH/dgXTruwCdr5NK+f+oFVWB32VhIsKQoJ0
	l337vrSzUMU9X53klt61AqyZ5oaupFmrT+g50+B65aYm0+gLgxvOQOTaZsZRAE/+qSH36J8rdIV
	ONAT4SqOOsy5B4vW0WtG7iZx5r/WRRq2wJX1KHFHpg9aE4SLdHup28NobruD6at7qMG3nG8d9sM
	0p/s8VUvPbJ59/vgKphDEtHr95KcOIlwEWXUcsggWUfupkyo9qL9PG/xMBQ6ACZfWGEcbmMBCMd
	S/+I1N7oRi6zQdgUVdLXAMcBbr4Ai5w6Vht9WwmzaYDBgMiGWl7xcX28ILSkXWbBSCvAb/v0lyN
	9TK6cdi2GM4n0fp1CisU08UDSmNOWPw0elNcgYj+ijFJQkZ+4od2CFYrMlJldey91f7ldC6qRxq
	7/zIx1Uayo=
X-Received: by 2002:a17:90b:2785:b0:398:9be5:b41e with SMTP id 98e67ed59e1d1-39aee285570mr5982606a91.25.1788343556699;
        Wed, 02 Sep 2026 03:05:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1dcfbsm10766784a91.2.2026.09.02.03.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:05:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 15/28] eject: ignore CVE-2026-28065
Date: Wed,  2 Sep 2026 22:04:57 +1200
Message-ID: <20260902100511.2105916-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
References: <20260902100511.2105916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:06:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129646

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-28065

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index aa0e86db12..90630ff791 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -34,3 +34,5 @@ ALTERNATIVE_PRIORITY[eject] = "100"
 
 ALTERNATIVE:${PN}-doc = "eject.1"
 ALTERNATIVE_LINK_NAME[eject.1] = "${mandir}/man1/eject.1"
+
+CVE_STATUS[CVE-2026-28065] = "cpe-incorrect: this CVE is for WordPress plugin or theme"

