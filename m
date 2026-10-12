Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA2CA9EBD
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:03 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3519.1791763862191802623
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=A29gIq8X;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso506703a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763861; x=1792368661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWE9KhoFhL239uXRN8REY/sU5aEGM5GPnqCa3pDUgE0=;
        b=A29gIq8XLWOc1VyFXG/SE146YEG/LzskEIioefPDQQTCBr3cUCw4Q0sinGCSWL4Pnh
         lid4sH8vY9H3xKOs2Al+54RSGkYB9RtRxDlt5rGphj0fdk+gZUmXGE5smQ8HzPenb6gS
         dUGh7A4ujH354HqR0yzrITvSao1IErqJ7ZkleERp4moEUh2qMlyPV7aijymVjLTv1K90
         Tx7gT6wdmfIktS8wkjXJwoL7IkUnTx5/BhnnIoM48SuCrluR1hppRRjQwtizt8AheU8f
         1KoMvmCGPZq+SGdsYqNsgRRFxhptjhvwvzmYk94vJurHHuvEBykxf+kZFhFAwHyYDIHC
         gh4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763861; x=1792368661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HWE9KhoFhL239uXRN8REY/sU5aEGM5GPnqCa3pDUgE0=;
        b=dCq3/m8a3CTc/rBg24uXgapfc0OxpRuF+syqLLRlYxzOKv95b4956jujcFY6kXTdDq
         tLNKaRFZPI6z8/F7C9GJJscvuYRE5kmjTP8iKQJao8o3EhE9TiJUguzYbCxrP86K7LfM
         0HNrLOWmCSLisROZH8f96M3JAt4cQBAOwkCBHeFFL3Irdd9laeVQrSbaIqHBXlrG7Tqx
         2W/tNysFpECthGSj125R4lXdL75gaRM6YfKYmPtCntB4ifrsdzH7uXG9qvRSGw4FjLoG
         K7brHmelhIdkrfJSPyjLf5WOJv/F4tQBgY5BAFRtLzGbv5ebbpxagNclNJQn8OeT/P/p
         lJgQ==
X-Gm-Message-State: AFq9FYLOAigqnVBnz01nty8LHmtb1oMI7MOTYUm6nd1fLSVvrR8MuTwJ
	E+e6aOnbExtcEV5eiApivt864Ve+traOm/AIdkrGc+FuBxNA04ZpKWnv4g4KY2S1K2g=
X-Gm-Gg: AYBFou0qcQfrvPofp9J16zWxuOLgXS8qtUKJRN7SLzCasxo11tHvp5bM+Qcln6Lfp3V
	Zdp5k5OGnzc7/npJuMNCeHnmY9VHZl7mdwdasi67jXY03pCtk4PU2kWAdIkRgsl2wJ9jQAG0VkH
	/yXsXR6PAjSFzLyPiQ7X9gW1jiuOAJxdhruhSQQzt2xUmhi5rAWF0Kd3xS0JW0dqJ6M5Dutfy9S
	+db3OP11ofI3j+eVXVylpSS85GmpQHmxt6yK7tzsmcWDXh1yP47rq1N8LJ+ZnqOHMZRzm5WGxvt
	CqQB+5RLNz53wUoTiBkyU+jw3AsUysoxfxtn47tc7c2ztKZwgD1EdiLsOBcff6vGgdmKgkni1IH
	FANM5nvHyCpJtRGSM35EjlO6WMr70bUkqXyIEH0PkpPJxQUvVh691u2XBgzAU86cHRXqkhFounw
	yaXY+mfWhPxdag/PB17MPRZsImpjRmwZuBrcTrGP6bVmJD+BZnx6u7XpKovjVbpxR/D5Bea3urv
	4iXMMhUPSNymL3WjTL2WAX1qpyK0T81LsbvCgg=
X-Received: by 2002:a17:90b:384a:b0:3a8:bb56:f1ef with SMTP id 98e67ed59e1d1-3ab3a2902a2mr6819402a91.2.1791763861472;
        Sun, 11 Oct 2026 17:11:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:11:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][PATCH 18/28] libde265: patch CVE-2026-54240 and CVE-2026-54241
Date: Mon, 12 Oct 2026 13:09:56 +1300
Message-ID: <20261012001007.2541673-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130743

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Debian identified same commit as fix for both CVEs[1][2].

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-54240
https://nvd.nist.gov/vuln/detail/cve-2026-54241

[1]https://security-tracker.debian.org/tracker/CVE-2026-54240
[2]https://security-tracker.debian.org/tracker/CVE-2026-54241

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index a02d6dd5d8..8e145cf8dd 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https
            file://CVE-2026-49295.patch \
            file://CVE-2026-49337.patch \
            file://CVE-2026-49346.patch \
+           file://CVE-2026-54240-CVE-2026-54241.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

