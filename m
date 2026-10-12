Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802EECA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:23 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5053.1791839417169378333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FIQJ/cjs;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso1461180a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839416; x=1792444216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXETLo7OCgtEZvnkhNWh1tg9VjrtfeNUp4d38wajRg4=;
        b=FIQJ/cjsSKl3bPKHwza7aj790giF46OhYZ3EI3FbetvNojjlj1gCRfV1XxJJfcfJXE
         v58Nr9Z10KPLLQzS0WEhqMtcQShMIXlTsSCv3RpevLsXt8MRrfnDyXLdP5n4tGyJDt8I
         tV0K9DUk52PDNq+0R6AgGM95GVpxYvUt9fU7SogHCyBX1s031iU8O3MsJsrVOT3a3Sgt
         +A7kWxBixbjAMihl8M79MVEVo8aVHEdRdy5MLKyVXkYiiWaMcvuexqza+xzdXBMjXsyD
         enHrMbEEgA4lR38HIsWk2euhJ4kwwcyeONC+I5QM1jWi43oUi4itVSuajrhvAae+Y7vq
         Gi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839416; x=1792444216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JXETLo7OCgtEZvnkhNWh1tg9VjrtfeNUp4d38wajRg4=;
        b=QeMOQkYy28Y1zoNH3mzHRAuLsYSrUnHh+dxBWZVp1MLInCpPLJJyRGYe9XXXDgA09C
         aGwii17S1sZ6BogbW+7MPYQxwzlGTlnr4vme/2kUvVa9N544XQQ0GCz8ihXVyRCQ06lw
         TXBt02gW3dJQLT1r/QSOLCI35mC1HXy6EOjBDxRvm5J8VxDgTtYB2XplEFOYVYMKXwNM
         hZ/TjnVoCBcRzhpNiVJprczFCocCNSrIygqVB5LQCl66leYcC3DLTrkIacKT1d9pemfm
         XOIM1//yo/3c5mq9KSWqRRbrJlprQE6SRG68TrM4bEV7qaiWOkT/jooSEfkxo66V/fR6
         uvFQ==
X-Gm-Message-State: AFq9FYIXRCkVGbglE/mStgrGdznuQp4ej30m1JWQ6O0rEEXZsFBC3wZo
	bvYv/unVZSzPXnT+MbwJc5s7oh0S2u/DgOPcptB0DwD73PgOMQEl8s4/3mFFCHuc
X-Gm-Gg: AYBFou0zmU19gg6K+bdZZBhWxk+52xZC7PpUpF+nVG4ZmG5VRAj7OQnnAvDJ0kiayEA
	a8QYA3rEcUJSHXx+I/XBn4+U3CFEV65BuAbIfXvPB9ZBFBJUnIM5BMa38GASMdwXpWM2aZzddnA
	n8W38YjrrseFPCIts2e5EyMhhd50CGaXn0oM3ot0f94vnJMjGWAdJUP5fm/C2Fc9sAPh3E5hZDv
	0wYre2UqUZNapE5lOprzcnMUHRAT1Y/b4zTlhgw29cjDc8AgSZQbyO6ZBH/bvdNYTRKrI6t43dC
	OJxi32JgbIaeIW0D3Rli5THwEQrYGvSZKHe4MkVDHqcr8L/Ks0q0gsBNOsjwysT2EkfBHoWV3BN
	9UWbqqJLLByzKIBZMeQITlFklZuup+q99NBsewsp9p/wBoZQh9Qw0WwnWhEI1Tcc0KKeAFJNa6B
	PXcx0n/LnpvehEd8z9O/J5CUSADLQwMkKeYE/3EH5IAnJX0cgBoTT6x0x+hhZFuHyWi6000JM5T
	H8Z9Iip+iSonnNUAC6ZVmBAJh1z9Ig2Oh4V9JI=
X-Received: by 2002:a17:90a:617:b0:3ab:be66:ddd4 with SMTP id 98e67ed59e1d1-3abbe66df49mr3042819a91.19.1791839416500;
        Mon, 12 Oct 2026 14:10:16 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 1/43] capnproto: ignore CVE-2026-59704
Date: Tue, 13 Oct 2026 10:09:25 +1300
Message-ID: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130771

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59704

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
index 9909afb0e90..1149913c2b7 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
@@ -41,3 +41,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2026-32239] = "fixed-version: fixed in 1.4.0"
 CVE_STATUS[CVE-2026-32240] = "fixed-version: fixed in 1.4.0"
+CVE_STATUS[CVE-2026-59704] = "cpe-incorrect: this vulnerability is for CapSoftware Cap"

