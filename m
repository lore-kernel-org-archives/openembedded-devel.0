Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B58CCF2E0
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 00:41:36 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24761.1792370488481089566
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Oct 2026 17:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Kj3KNZtM;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35ef6b49813so3030958eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 17:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792370488; x=1792975288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ANBItL0/xrP8CQAr9q72z95rQACPMjzdP7kiPkHrSx0=;
        b=Kj3KNZtMvjW0+yrjahZxLtT9dZIu55iT0uqE3couiGyrm2Uo1kdmGoIOfKGsxRoHfJ
         aBbx7BgeYeovsvyy5Uhmw3vUgiEZGMkFx7upXclzW0QgjMaZtd2cvaeVzcMAH1X6eFYP
         CRis+dvD8eXjBAFzEKq8GqU16Oj2PzJzgB3yJdiyj9y+O9zpYOlSTd2/Ijc9srZGhhgU
         rIqNALkS2C3wZhWpKDasDPAgtl/4AKqoW/guzn+qtyou0gf0xYN3jr9EXiWP45Tc1lf4
         DF2qCUuRzr8oKzwV+tCtHFSBOkuv+DdUquR+oRM3KXCCA06EeL3S96PGpVPExHSaBPEt
         9Rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792370488; x=1792975288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ANBItL0/xrP8CQAr9q72z95rQACPMjzdP7kiPkHrSx0=;
        b=Rp9dx3tcSofp56GcaURhmzYqjmQd8JEOrXxb3EixYRWz42/iOKGV06nlSCC3hjsZZ/
         T82dhaimXg6r3DVn16qskQvomD0CnBx1s56hm6uoCmFBkN/DbDU9BMMxrXVtKXm+sADe
         5Mtvdo3dfrbKP9YPbj/POTI26uhTjlsF/tjwTFiV+yHyNbiZVsnFepQnH8ZTSUbn6G8T
         DLFfiF3bDV8XG4LbBBc1g2H8kJPJLhOYzyqyDGD3nlI/kLSQnhVA98IEel+IFh7x0LCM
         Spfe1/8kI7NaOvdQsl3U8FtGtdj1FQq2smfAdinUHjek1+kbx9fD5OYkkFQy77QtJbLW
         awsQ==
X-Gm-Message-State: AFq9FYL1+H4+1y6kILO2hxEgN1L9QMtdQqD0E4/h2vHALgOeLxLmkiqO
	phSZ5eG7AvI5/PdCU1Jzj7fSbKWzy4f63hAKuJlDgnMKuD+/s1Cw7h04YVB0J//+Pxs=
X-Gm-Gg: AYBFou3V1pfCIf4HfgXsLTWmLPyqwtOaiOVYz9hO/y8kdqf3nDgD7TOVBi6OBauFqXC
	Y3aYV6q6JvHOmx7HTqjx4pGY0RVHjfkZc67gLLl081lpXyVXw9QIk2/7ixnWeFAjjx0PjQiha01
	QTZCwW7FmW5uwB0c+rydKuaFwkH9tfTGvwBWshs8YnPJ5ghc8kEBqF6EcyfZ1AmODpRpGuEeesR
	KFgOBeiw5wAmOoAoVZ6NRQhAwf07s2eJxjpKw2srR/zAkTv5Arh923lH1Np2bB3r+7iWBL+E2tZ
	VIXzpeTQB+PQcoWI+3Rex1Trys7nOh6Lhgmu+jsbGOxNm4uiGVEzS7Fa0GfbzYjukp9j4VdGNYM
	zmPKRddXSb+2DzGJ2ZZE20/0Ft91TsDUwjTjhczRf2BEefwmmYRg0l05s0jlvXfx0SM3rHJm2Gq
	U8bxdMVsHbmvW3xkfqErqJedZAIWRbyUeEwX+k5QZHl6joI8xKo6wOSfD6gFzvnCmamjDWwdxJ4
	slt+SiqXg5V2XPg07HT0wasIgsSE0ASaOds97eeQRntnFVGTkKLJRd1bub5n0uEaXSY1mcI6xLr
	NmBvzGbixqQb57Jvb7I16cxrPe/4wJJjgR7SYdjj6G9vztAq5cnE3ZVZd4qahhs2JTT0wWpLYGo
	d1Y6jM9eVu85zLSxZdBoYzLLvt+vCCIbzbkPkpX6CrsGHEja9qeAUe/K/WZwM3xTJfyAwSrcB7w
	5od5IleCfONQNmRpIxZnhJMcYu0plBVi7BvXuY0MIUINYDTA==
X-Received: by 2002:a05:7300:f287:b0:361:8d52:e148 with SMTP id 5a478bee46e88-3619f20106bmr9311064eec.4.1792370487653;
        Sun, 18 Oct 2026 17:41:27 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm45211774eec.28.2026.10.18.17.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 17:41:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 3/8] x265: Apply the patches with right patch level.
Date: Sun, 18 Oct 2026 17:41:17 -0700
Message-ID: <20261019004122.2475327-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
References: <20261019004122.2475327-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 00:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131102

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/x265/x265_4.3.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
index 6459fbc8cf..01edc1dc42 100644
--- a/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
+++ b/meta-multimedia/recipes-multimedia/x265/x265_4.3.bb
@@ -10,8 +10,8 @@ DEPENDS = "nasm-native gnutls zlib libpcre numactl"

 SRC_URI = " \
     git://github.com/Multicorewareinc/x265.git;protocol=https;branch=master;tag=${PV} \
-    file://0001-fix-dynamicHDR10-undefined-uint8_t.patch \
-    file://0002-x265-fix-build-with-cmake-4.patch \
+    file://0001-fix-dynamicHDR10-undefined-uint8_t.patch;patchdir=.. \
+    file://0002-x265-fix-build-with-cmake-4.patch;patchdir=.. \
 "
 SRCREV = "e9b88125dc21393b3fd8d68e98083bdfb89778a8"
 S = "${UNPACKDIR}/x265-${PV}/source"

