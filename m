Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B01CFC519
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 00:12:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.444.1763770370041700019
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 16:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FKdzMUDB;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47796a837c7so16678785e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 16:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763770368; x=1764375168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJ+rYq8kvfYSeqXyJ4IT7myS+WQczGlxrrudgUYYSe4=;
        b=FKdzMUDB6i4NYihrxQrPFNGLCQpz0VtlprwUiINbzm6RF4cmkovlfuOO1J4n6Qdvav
         9VEloL5KA9kwRZhHmCJZVqxIO04FY2q/cOdKjm+s+q28xVWFD4l36wmCKXRPz+FKydRV
         1UlCJJtfiaofYnFKAjQq2vbdsxPt0bjRXTuPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763770368; x=1764375168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YJ+rYq8kvfYSeqXyJ4IT7myS+WQczGlxrrudgUYYSe4=;
        b=U2EFC5CWlEJrbL0nWyWVyr+yeZ1RIbc5dn/hZePThD/408z+ir8R3BI4Kw6ojGv1vJ
         wGbq231IATI9Wkz0t/lDMdPe1MLOwq1zxZVwF6xbxzPgSnf7l+j4t/ZYF18Tyq1AVGDM
         AjF3bvYKfO98t9b9MKaz+0JzW4NtA32jiG0LsQ+MLxMDX+0f17lg1cQ3KY2hO6QcDQMr
         vMCPohNsTdZFs5P0XLv9MlUlh8KT4pBlhjYMPHYd/f0KkHG8i+XO9kFE5my/bejD0AZJ
         4AHYAhbIAQSUHRjUG0qtL59U09JrPNhsQKwBor1R/9PfhxXVyxvHe1kMhZDFi1x1wbAd
         Ffhw==
X-Gm-Message-State: AOJu0YxXuk6qMzO9kPcB3+Uds5OYJ6N4FgOURxc7eqIQ1kxel8f3mblo
	QBINCD5vw2KQxOMsDzgyP8pPtV6Ym6U1OJnoMFWOqiTel++kxTIa1X8XueCBrY0i1TYaWFc7Cle
	gHRlO6Bs=
X-Gm-Gg: ASbGncuaHuze9fDqF4R14bEaNAviPdFNTwYQanOoBJXwdlpQuLnEschlMkBWeHewfG5
	BoW0AeXMELbVp0KabBpZcz57MHG97wOLv9/c7HQP6J0updS4kfcvXUmUBnZFynJOTD9Oy9+SBCu
	IWiLEItlHK2N3zWCLzd1hnscGgtmgp3SucP4Au5EPgI+2N9vt5xucaPIA4ZSER6al2+2eJrw2qH
	pj1rIH9pBUmtdPSw1FOYFGLeRAaduNUslsGNQ9lh59g1QTziXtp+3ttluKPMD+Q+IUyPPVFTYtl
	4WFrZAkNQl/RRjvWw99Peq35z85MFl4xkR/FZs+uB5lc38Ckj1lBdTkv2AXrO5o628IXYsm/Rr3
	yt5HLdEpp+6PZsdFtyLK78NYaqZvQg1aV2T/fJsj//GpkKtMNe2+5rpS44bF69yM37N1jUMUGpl
	jCDKxe5C9iYlRQpWuWHYtoSrLHzEChlmmGz2fUFRTt5Qc/jAplHv2WHDxc4tFGwfv53M0LnWkO2
	BaOC2CkcQMFvpnAAs1ueg==
X-Google-Smtp-Source: AGHT+IEEj1tHBFxxua17NslKp8poat1n7h0q6+gNoKadLt9Jfn4ONaAuU1Wb8kgFEyTXtgrNb77jCw==
X-Received: by 2002:a05:600c:45cf:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-477c01c001bmr51643735e9.24.1763770368169;
        Fri, 21 Nov 2025 16:12:48 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dcbca9sm95018525e9.6.2025.11.21.16.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 16:12:47 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Tom Geelen <t.f.g.geelen@gmail.com>
Subject: [meta-python][PATCH 4/4] python3-propcache: add BBCLASSEXTEND native & nativesdk
Date: Sat, 22 Nov 2025 01:12:27 +0100
Message-Id: <20251122001227.3538675-4-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251122001227.3538675-1-yoann.congal@smile.fr>
References: <20251122001227.3538675-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 00:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121967

From: Yoann Congal <yoann.congal@smile.fr>

Since commit 82c2959678a0 ("python3-yarl: add BBCLASSEXTEND = "native nativesdk""),
python3-yarl-native (resp. nativesdk-python3-yarl) needs
python3-propcache-native (nativesdk-python3-yarl) to build.

Cc: Tom Geelen <t.f.g.geelen@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
index 0bb31cd5d9..53ec5b33b9 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.4.1.bb
@@ -22,3 +22,4 @@ RDEPENDS:${PN}-ptest += " \
 	python3-statistics \
 "
 
+BBCLASSEXTEND += "native nativesdk"

