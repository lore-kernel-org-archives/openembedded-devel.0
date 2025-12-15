Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071AAD5B868
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 19:33:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3192.1765827225588672196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 11:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NiRP8U1w;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so29804995e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 11:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765827224; x=1766432024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8OLMITDU+X6a2EzJPl6nj27X+GZfTTpI260I3wwnb4A=;
        b=NiRP8U1wjxuw2FDQGWOzmO9twwF5z2cZJ67n4evgzdLnEPptJDq6UPlpp1y/9z9hNn
         /nHdoq2GDWHPjf5iVqEY+z0XvFOqMQGYwXngxIZfzFdbsaS2RwXSYFhljbndSKrXyTKM
         4zHFFH5R3N8K82VfNHJ9GaTalC7r4dLS2b0/j/3h+0fzvG3gn0zandElfqRSrmnrK1NP
         NN29GV2Hv1E7nZQp9kCUT/KesppsZ/KAh5uG3xlCY48QryLAVi7ydFS8+p1OXqKOS1TE
         WmjKRlLPAPoq6ji/gpUkfaZzDuBNjicVIHbir7GZ1QvDdnyr4KJJ9Scbxo8Y0Si+OtEB
         NS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765827224; x=1766432024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8OLMITDU+X6a2EzJPl6nj27X+GZfTTpI260I3wwnb4A=;
        b=S+NWtow85D1j2R6EFkmSmhYzU7QzoQhBLSjRUGG4ivX6S+uTGXgamzxvNLkvjoXBmt
         KfjVSn043eUqC3xqcTCNPwmYWDNQigK5hyNyqUDlBmcYWMppoHiviOQAd4rYgxvLN5pe
         ZGaKLZoAhVRcPyY2o2u/H1Mgm8TRI1LQvUx18XhmuPV9pzAbD6LQ4dcN06mjK5nCnpF+
         SvJE6/E7fTLN5hgwhj5xtGKka9Ad9ntSIYeUMaocAU8BlAj+KNBueSJtzBbi3jIp8Qbh
         VsA4/44Ee+Vs/Srq4lq3IaiwQvr3w/TrLCCDypDToFS7wbIyaaswYPB8FuD1OLJi+jtI
         tk3g==
X-Gm-Message-State: AOJu0Yxp1IGYC3yXt/sqqbnNgfgm51/zFQlVI4w98MSPGQnv79fahClF
	6ZDtHTVBuMnGZy1LUamOHWfIcDaWIx1uacpatnwQQMLc/bhRaF9F93BJmiYGhA==
X-Gm-Gg: AY/fxX6kvH/tpK20DpBeoZhiCPnzFFH8K22uwoS6sme/6U1VdsvkP6a5jiFWrgxN1FF
	EIebELhasqn2Oj2EbSk2nwCmW4rLDN0LGezQdYuzoSnkbiBumalFgnfx2+5pRN+cmP3qIIRIx+t
	jYGw+v4o4PJT+NLMCtMGsy+SIAO00dk7yzo9nXWnmvMJauLlaFCIiOcVa/xxyz05htTCjEEmQ3Q
	oUflMKAAreKzNt4Z9bZjp7EOsSEjem8Ewo+m1U54tgA6RA0V0+EZCDPU6EcOEotFcXe9b0pgb2g
	wdQxVf/pvpElToQWxFqVia+mlky/EsLaFlR/yH2UB5uehrt2QNRnXlnxD51oJza/9Vn67/MhHdw
	TgdX8AQWvUFLWJVA9cw3Ml7HJLHbz95/mBaFwpwQ23Fm9uPp4JCC/Kfc/4IzCAKXy0NnNFBB56O
	KnAC3kbqr5
X-Google-Smtp-Source: AGHT+IHtQq37Gjxvf2GQwjaKBpW9xXJ5HZ/soJLc7MvFe6206VvmYjea/dZrwrCE+4sqmWhJmMovDQ==
X-Received: by 2002:a05:600d:8449:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-47a908011f8mr104157635e9.17.1765827223894;
        Mon, 15 Dec 2025 11:33:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8e90f2sm198728625e9.13.2025.12.15.11.33.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 11:33:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/2] botan: patch CVE-2024-34702
Date: Mon, 15 Dec 2025 20:33:40 +0100
Message-ID: <20251215193340.1057380-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215193340.1057380-1-skandigraun@gmail.com>
References: <20251215193340.1057380-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 19:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122669

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-34702

The same patch fixes both CVE-2024-39312 and CVE-2024-34702, according
to the release notes[1] of the final 2.9.x release.

[1]: https://github.com/randombit/botan/blob/2.19.5/news.rst

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../botan/botan/0001-Address-various-name-constraint-bugs.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch b/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch
index e9abdaedb3..9ce4a4c67b 100644
--- a/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch
+++ b/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch
@@ -3,7 +3,7 @@ From: Jack Lloyd <jack@randombit.net>
 Date: Sun, 7 Jul 2024 05:02:48 -0400
 Subject: [PATCH] Address various name constraint bugs
 
-CVE: CVE-2024-39312
+CVE: CVE-2024-39312 CVE-2024-34702
 Upstream-Status: Backport [https://github.com/randombit/botan/commit/68338f5912534c74469f7f4e6e22b37aa5159952]
 
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>

