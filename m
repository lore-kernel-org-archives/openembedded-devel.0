Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22050CCF2D1
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 05:56:30 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9807.1792302981711328651
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Oct 2026 22:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yr9j/ts3;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35d7fa491deso1287835eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Oct 2026 22:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302981; x=1792907781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4NQaPIiAsAC9vdlwZHWlKIUNaf+LgAYgDAOZEodUGTw=;
        b=Yr9j/ts33dV2OscJwS0aizfCaFQcgPyqlWawotxJaYnHN08c7woYrWvJrYJgsLYPi5
         gZJIwAdAlPBhvIdk7KOiiEStpVaF/3Pb+wkCI84NCG0foLxUjTAd+excWX7gxlgvU/bp
         q7QetKZJ3fEj4YJVKWiKqIU0U7BDJo2A0GhO+qzbBK2I8ELJ7AHLGu9Pe/sjqewXqE66
         hSsUChaP4XKXgN4VEk0cmdSiOqVI57agrdXxnf3+T380bIQTw2yj2tuf+XkwncwHvY6s
         2rrehZy0KZuF1uq4Bj1ERmYGzM56d9mRlb+gD4AIwXo5Fmts/eZHXMMqIUIWVgYIg8C0
         1NWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302981; x=1792907781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4NQaPIiAsAC9vdlwZHWlKIUNaf+LgAYgDAOZEodUGTw=;
        b=pNIpuA2F6+iU0AIyOgoTPM9YVK6lwZc9BID6xu5jlVkBVtPD5HDM/Ohi1MB6ensVP7
         Uiy/3V32g02gfJc6tGBCgilSeJL0EJWvqiP6J6JkVF3LdsJmSg2336UxiWJTboqCcgbB
         6mLAMe7RXlywJPEGEyOqGGx9WnMF24GczlpeafpASgrrfTUgflfWaPHYCHBiq/7P0B66
         7VXRIgwOucAnZwT4b4FnxCY76h4PzbIqimpyqeQTkk/2RzJH4idMjl1Kz6HmhTfj2v/4
         KWnAV69hpk0Umu+sAm1akv5HVDakmxYY89I+y1IBZxux9G8RsSPIqTeDQNImBrp9bDEt
         BV2w==
X-Gm-Message-State: AFq9FYIgVwPbRgOX4ECplxEFEcsuECVyo4XC/sndQU8joOgfgDcqFomo
	uSCIiesD/TtLNcFbdGHKytStvttWig9jbl+1uZ3uAZxOZKPyF9r4aWBUXMF2yOw43WY=
X-Gm-Gg: AYBFou24AQlR+DH3nWnM8mXaRrL6+U1ctxCvLcHfjNqECTKmcc1YclTr15XsytCFOHx
	3My2Wzs5LeniG63jq70Vhr7c7FbKlTWQ9tRw5gqtc4x6Ps8aNN/5B7ph5g2MBpDTTTBD2ech4J9
	G2k+A4IObUhNus9cj2XME/QDXDhzP3f9K15AM/0De2hbFSLZILHBLSrmH3up953P8O3HoELcp2e
	vCEuyc8Bw8Pc08kgEQkHirsT8oVbqZ9F2qu8mjzfo1Yo60eg2eY/JNdB4+sWqm0jO60V3t1J1wZ
	hBf1TjS+Gskj2EzcKQDp0h2wEqEOJdNEet3GJlletrU98YiLoT7F6K1AvuLyypine49rBuHqBXq
	8CGf5y40ZUJq2lbOam5XlVHTg+mPZzrfGX9UHye/e6iXBBzaksQhkbpcPK/48uapnMDspJ1bGpC
	tCjqNqSEJ33S2vsTzFhqf9AoxhLdsg2bU7uDS6sJF+tN1BShhHOWtHTDZ82bANQNO9Vx7noe1fZ
	0dQP2w/THlmuREmxmQYIeO5e4sybaprWnoRgvn/Iqj5atJbeqS2Sso+EqZsiZXJkHrj+wx04LrZ
	VqW2a+MKfItilQcOyPHkfSLjj8TJNzM+ZqXbIzr+dPsGNjpjBSgMW77KWzJTpPiW6j9igs8Miko
	kf/om3BwoEGEDM1IgpyIZBNndVKSna7A0Do0b62AQROmv1lxa2phz7aTvFQBkLfwiy4QXHYogFz
	koYAKYQW1jUXJvcf7g4n8cozqMnDEgUJ9F98CXG+cQ8rNNbpBeGlTKFtgi
X-Received: by 2002:a05:7301:6f0b:b0:353:7f47:8168 with SMTP id 5a478bee46e88-3602e69d2a3mr9112772eec.17.1792302980903;
        Sat, 17 Oct 2026 22:56:20 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm20883415eec.10.2026.10.17.22.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 09/11] loupe: Mark incompatible with riscv32
Date: Sat, 17 Oct 2026 22:55:36 -0700
Message-ID: <20261018055605.179605-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
References: <20261018055605.179605-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Oct 2026 05:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131091

It requires libseccomp and glycin, neither of which is available on
riscv32.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/loupe/loupe_51.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/loupe/loupe_51.0.bb b/meta-gnome/recipes-gnome/loupe/loupe_51.0.bb
index cc3d855b56..7a7b913573 100644
--- a/meta-gnome/recipes-gnome/loupe/loupe_51.0.bb
+++ b/meta-gnome/recipes-gnome/loupe/loupe_51.0.bb
@@ -73,3 +73,5 @@ FILES:${PN} += " \
 "
 
 RDEPENDS:${PN} += "glycin-loaders"
+
+COMPATIBLE_HOST:riscv32 = "null"

