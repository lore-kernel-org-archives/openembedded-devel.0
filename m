Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48030.1795411846202662352
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JI3w/sML;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso6385498eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411846; x=1796016646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9r8RGp9uJYhTDCn99hoZ3zK7iOLsDhYNg4OKPiuHhco=;
        b=JI3w/sMLYtPRZm8DyjBn/eVJ9ImCAIQXbtxKd9pHoB6Bk1n7H6wusXUtO1DbtlExd7
         b4vC5CeqdbbQ6GIxMzvzooTHGY72FxJNOZhoAuu50eVVPcPns36NJ9UaHx9qiO0yQFpM
         XeRM63Br6gd1kpJeGCwiXIOnrjSc+rl7mOVfS0iSKNyJPZPlUYkkHWLgSVrTaxNC3AKg
         Z7AmmRiwBTthMwaTTc4bopj+h2MIkuJ6QyKl/vzjFTSh2f7AqGDr1wo8XABHrftnJKu7
         xRjtXGSjStw0Ai2GvOlWPAQTZVnqVB/oCjCuw/Tz8tE3fzsLqU8XURj0mxqmnUDnmnIg
         UrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411846; x=1796016646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9r8RGp9uJYhTDCn99hoZ3zK7iOLsDhYNg4OKPiuHhco=;
        b=DnpKDtOD10xCfsAEQqrJuUi3nFRqj394d5t0RPJEnRtz6nLsQk9rCFzsx/hsgOBN7P
         yVkHtRt+FB+D2Q8Oer2ooQrPRDmx3z2fNHl5+NDw0fyvX78h1lmZ66F3QoB+9kbp/gEL
         /DQ3BMxaQgmdDWjGXAw1Px7V5yHTbJ8SxAK42hhmNNpz1yTvxdm4GisfOXwA4gFFzhxT
         xIvSj5jolJz5FVIqH26DxpNPCIkEkLJOkIyBEitJRmrgbZXjHbUben9fBvjjT3ow92/K
         hCZL7L7KH5KPOnxmmNr3Gd4R5KbWaNgmSnKEXckv2JNI77dhKt0ruHp0P3xDIU/I61/L
         +C6A==
X-Gm-Message-State: APuU4Z9Gtp8gy2YaqTq8+ABSE78cOcl6MNKg8GqR5bWfqIzA92bTe+S5
	5KN4+ySuXCtQf4Jvg0vRtbzzOoGdw/w8QGRSh1gh7NOY37XJxepZ2P2ThVEJL0sWR9o=
X-Gm-Gg: AZFdTZeOCb0AXTxomkFZ8XfNBunosR9TPbKNdSMr4se7ay6Jj5ULetXlMqhnhLNQJni
	n56Viq4akWIPPXv+zqVj4SWK/wzbdMV6IGVMn7gyvBTCZ1RftbiDtvskICxZ8VLcfUWIFTGVbHG
	0ZRykVQ1ZzwibbWPF6Yvjg024EuaUCZaLxHwqAKWFOR6wwWazXVNDry4r9OtbY6vGeIJhtFZb+R
	wsufCYgHknebVsQEpueZ+DHZgVqAgx1SCoXcsrnj4bkyyYlpj7ocQ5VIAKIBjRBy6vaoPG0bBXu
	BSccyhZJ5kKu8WkJDZxxIuBf1McYUZGG+dU6AQP/v7i354ghavu//dWzvBKHapBH8/2sixMe4W4
	ebTn6DLNFIIrA/Zb7nWDfEfkwAG6U92fl+yaUeP5WtAnZPG2Tl3ArsVKfVIsHc6rl1j7yG87Uiz
	Ju0yIYo1e15y3byImJMNl2iAlRpnSngg6s8J3pRcnI54ZgbMTsmIXYJNgKLWbPOtfv7s1arlkJ+
	SV38+4roLFBNDzzSRioVgMfj7JlkIfiQgTx2mw6Yi8/iUG4p9eA5eH9IX6ZoLH32gtBb/hoyz5u
	xTIEGScTDadic/tP782SN44GZTo9Iqz8NO1nzhpwxqd5JqoDwxFY39IdPUfaQ9wn4qxdxEoBNIH
	SaAitlQo4lbH9k05nYEIPf6Ep/ox7XTcrv0SdxRzS0Y1K2X99VYZP1vCC+Pks9mfwqzuDS8sQFG
	mbrHGMRgyK5G0VNay48lglsZ0GMAdU7CP6gbNvmRSv57alWzolLbJFifDc4N++InTY+IrH0XQ4d
	i1aqRYBZnzbwCViGrLp7tbICf18PR2+JRv/NeCMzNtT2A7BjwgPUgy3lcrmJuOpC6uc6dT4A6yA
	8qTr
X-Received: by 2002:a05:7301:b02:b0:382:48a5:cd53 with SMTP id 5a478bee46e88-3857111f187mr11535275eec.31.1795411845530;
        Sun, 22 Nov 2026 21:30:45 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 12/42] graphviz: upgrade 16.1.1 -> 16.1.2
Date: Sun, 22 Nov 2026 21:28:56 -0800
Message-ID: <20261123052953.3658549-40-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132827
Content-Type: text/plain; charset="utf-8"

Bug fix release: fixes several dot layout and spline routing crashes,
makes dot skip rendering when layout fails, fixes an assertion with
lhead on edges without arrowheads, and makes fdp recognize clusters by
the common rules (case-insensitive prefix, cluster=true).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../graphviz/{graphviz_16.1.1.bb => graphviz_16.1.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_16.1.1.bb => graphviz_16.1.2.bb} (97%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_16.1.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_16.1.2.bb
similarity index 97%
rename from meta-oe/recipes-graphics/graphviz/graphviz_16.1.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_16.1.2.bb
index abfcb96316..8a06851572 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_16.1.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_16.1.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-re
 SRC_URI:append:class-nativesdk = "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] = "52e7fb9a57b52b5c67f41dba6504ba3231e118258779421cb8f4f99104de71f6"
+SRC_URI[sha256sum] = "9780938f03659e2effbbfbbaec94940108e794199b73196fa339ca911890e8c9"
 
 UPSTREAM_CHECK_URI = "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
