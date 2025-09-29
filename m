Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D813CCCA46F
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 13:04:45 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.52849.1759151076244636623
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Sep 2025 06:04:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JUl+oLsh;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-634cef434beso3958783a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 06:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759151075; x=1759755875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ti+jnRDZ5+wma8uw9O0FXsaNtC6H96rs50RrSa6vdv4=;
        b=JUl+oLsh+8N66LrnWmHqL8rQAEqTkZZc9sASav3NZuh8mwOT++HajtbKMH1niZqWxm
         Mid2ea8ylyfzDJ3itUAwILyM9LFr8RdMIPPW6zpFRdPa3cy2sfJN5No4/DZC8cA+6tWZ
         +oEcSjJ1YY3AEDtMgGRpkpE5MLEdoMZO7e7owa5M6GR0TrRDNJQ5ILjdM+t3uQz4oC4e
         lCAiwoZ21xTTtTTaS/GMlESaS55Ha2Fvv0WzkOKmGcSl7lpxzVTQtoqlukrVdP8T2cvo
         AiRUGzC565J3ZoncJCUitUth2RTcGRmSK4XJPPPBrw5pF9RAsSW8utwfvgjrUubkznzv
         85hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151075; x=1759755875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ti+jnRDZ5+wma8uw9O0FXsaNtC6H96rs50RrSa6vdv4=;
        b=TKh+oAhhrEtU8R6dcbtDJxrOUmsfOtyV9TVWtTiRWjUcNefZyOthDINHwLwEGiXO+m
         LvYcpuyadKQGa/G739NBL5fsHqv+s8XPDigcU677My6fhNurDyzVdphclvkm+HRDOW51
         Xkhy4/JIrnKpCzIfzzdQSuePLKTknUBTeH7ZA/DsAKeexlLCraz73w6VGTL4HweaAtxq
         lVEGrS6ovcPWq3Z3F8ONHvPzzEpMl+zYRsze6rkW7WAepQuBaqJ/7nQN2ruuI2sPWYph
         f1SuU3hL0uBEgCOJ8OWG9j22qNcZgb5t7/xCIptcWNfjpiWSC3TwSViojS2VoWGttfxD
         WbkA==
X-Gm-Message-State: AOJu0YwHilTpeorWP2JVTWzCCxNz9ynolwBV9Ow2oOOjj0lq4vhjGwnG
	upryFw/z+QOShRodyKV9m+y9lVsV+qcv3mtUT0Nqm0mDvyrzlft6HjoFltOlvQ==
X-Gm-Gg: ASbGncvWPlXEaQv9mdxtSTD3qmytCHRAGTINuVsJkJfMwcbNGO+7Eq84dg2iAxSGT46
	t3Iu00hbBk0XgRg+hNFhgdLAQPN4okThbw/HPnKFPyTsaYUaNZ924DKT3zoFrdP46PKM8cAS1vO
	DzxYn3CHthlobP789wCnTSrNpw3FvC+s+nHXifBTmvFT6CHkh5R0QLX6liRrDI6JBGJyPPEyFtg
	oqO4g9jKWLhb/r9zmtzniHRa90PNnyR/zog11Dde0dHkd2b/4/mbBLWlHmxPDFoPYn3Op6j+Slc
	S0+YYlnYvp64hCwQKAketsqPTpwGTIf8iaIV8FgZOc+wOAe9YSqIa5eQA3t7a/5UXoDZ5mJM7RG
	m4KCDCyvZZOh/fKd7tinlTpI7yjX3Mp8=
X-Google-Smtp-Source: AGHT+IFzZ0wG4yYT8v/sb4hVal7K1c7o9OaRx28GkfZ0l3Y6s+6/8ui1IabErNv5ZagtAAD5qBPHAA==
X-Received: by 2002:a17:907:1809:b0:b27:edf1:f638 with SMTP id a640c23a62f3a-b413963a6d2mr51752466b.23.1759151074469;
        Mon, 29 Sep 2025 06:04:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3cbd81bcfdsm335426166b.82.2025.09.29.06.04.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 06:04:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 08/22] tnftp: switch the SRC_URI to https
Date: Mon, 29 Sep 2025 15:04:11 +0200
Message-ID: <20250929130425.2912077-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929130425.2912077-1-skandigraun@gmail.com>
References: <20250929130425.2912077-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 13:04:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120021

From: Randy MacLeod <Randy.MacLeod@windriver.com>

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8f4dc754cf2a01905211a89980f7a492c33b71a8)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-support/tnftp/tnftp_20210827.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
index 8c5892668d..9b1b25f152 100644
--- a/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
+++ b/meta-networking/recipes-support/tnftp/tnftp_20210827.bb
@@ -14,7 +14,7 @@ LICENSE = "BSD-4-Clause"
 
 DEPENDS = "ncurses"
 
-SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/${BPN}-${PV}.tar.gz \
            file://0001-libedit-Include-missing-header-stdc-predef.h.patch \
 "
 

