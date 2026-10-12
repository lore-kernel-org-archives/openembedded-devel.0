Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D9ECA9EDC
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:11:29 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5081.1791839484304334728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rd345ITk;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac397836fbso162715a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839483; x=1792444283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVITSVbl7xeJXRH7g7Re5urKiKlSHDaSKBKFmBAleaM=;
        b=rd345ITk9QP2t52drO5koV/p6/3KMr/bMGH3LRe7HwjySki/DgqntnIs57CiU/pwvb
         e69polfG0nkDruXdOi4GS+jAEHP1x6emQxd93n2b9Xw4OUA865MSMsAaynSAP3BNH1jS
         /3xcvAP4xJgoGmPXL0IcZ+HXfUGorMN1im06BnonGYuNyOxlf+waMlRa94Ag3QeZMt95
         Y1yBshBENMWNFl9bI2zTnLkLrUdmluekszjtOxiPEeASCf8P9A0ykKtGWVH2LHQU00i/
         EEFLHm9mhEPfiNVliV7ICwv08cZVRuZv9Gn5yqhlEwLzbd2WzZSTtdrf7ePRrXh3eVww
         cmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839483; x=1792444283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVITSVbl7xeJXRH7g7Re5urKiKlSHDaSKBKFmBAleaM=;
        b=Rxa3wo06Bj9ADQz+JNoUl5NQ5aTe7krVsNf/9KwPz9wORA+LMeyrfLjRcXTC6E2QOd
         UR39GPsTKlbNOkc8vVo9A33rE/9PVbaG+e9kl3PJdnzknhVk7HtKpWfDqBWfmz5DScLz
         e4aEpGMDfyBzoFo3k5c1mTi5E5rAm4tQuF2sWccAmHr/nyJxN5SFMN8RAa49aLJiQ5wU
         O6nY12SKyYXOvinxRWXkFkUTsVOdg010HHsToGoPKAF84l4M/dvyGJY4EGxQNXxeuXu9
         Ku6OUjsDgG/gAaPrXIuIuoCbza5ABFByMqA0RPJDLHkYmuHuj5YDKtxtWkeRDb8LuAqm
         KcsA==
X-Gm-Message-State: AFq9FYIKZeRlKUZxmqacCeECU0XQwgd3p0//2Sb9eq5oBEvygF4xZ9d7
	cxnKt3QRNHwz6M1Jh8M2/teaFCraPJ+4XJj3hsYJQwxZ/ozTEMb+kl12XfFZeMLg
X-Gm-Gg: AYBFou3MJ2U59sfi2cGBiyGc/cZW9M9JJ3xjP8bb/4OMD2jDoO5rJ9X026OKMRX2rH3
	e+C49rIE8Dh52HK/UNMm1gQQhCFu9ChEg9HKYMDI1VapLAHToau/eWL98l6DVoOY9cYM1OIpLSC
	bSB4h9ecEgi9aRzCbb9/wIeoXSeTfKRjLuiARchT60hUN46gEfOLq857ADiGNAKqitnFTb9G4Vs
	ADvUT+sTRKw8uSMIotR0liLP50FZ9YCsB/drcHI02/5fiM5vgXxfzp6KL5+f7eC/wfabcSZZOYc
	2fcn1EifVWcKIVay/GNUER+w/9zRm7p/850IAbedFAeJsW3UdLb7OunNUf/5qpuhQ5NENpf7NIE
	uVLthu5RjQGZkBC5oRfNzDFNUswEbwwSSV/aMIJepCXoKSqpT39bt8mt4XF9wIubeWp7nXiyN5c
	naFt+bIst//oCMiX+Kuqjqrvw8/w1DXLDjQRPa4JuT8tfDc+ucFIvDDdxTCFL6WAyIbR22rN0LU
	2kIsawOSV59MuGAxFaj6DmxNF1/Bs8BOqqwEoo=
X-Received: by 2002:a17:90b:58ec:b0:3ac:17c:6e8a with SMTP id 98e67ed59e1d1-3ac017c707cmr2868044a91.51.1791839483556;
        Mon, 12 Oct 2026 14:11:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:11:23 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 26/43] libssh: mark CVEs patched
Date: Tue, 13 Oct 2026 10:09:50 +1300
Message-ID: <20261012211009.3352822-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130796

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog[1] also confirms the fix.

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59843
https://nvd.nist.gov/vuln/detail/cve-2026-59844
https://nvd.nist.gov/vuln/detail/cve-2026-59845
https://nvd.nist.gov/vuln/detail/cve-2026-59846
https://nvd.nist.gov/vuln/detail/cve-2026-59848
https://nvd.nist.gov/vuln/detail/cve-2026-59850

[1]https://gitlab.com/libssh/libssh-mirror/-/blob/libssh-0.11.5/CHANGELOG?ref_type=tags

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 738f8b1731..a99c4ee788 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -50,3 +50,9 @@ do_install_ptest () {
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2025-14821] = "not-applicable-platform: issue only applies on Windows"
+CVE_STATUS[CVE-2026-59843] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59844] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59845] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59846] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"

