Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8081.1795739715681181552
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 16:35:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EsqqQ3ow;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386ab9ab619so10131117eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 16:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795739715; x=1796344515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLwKY3i9+Cq7SMW4hVJZ4c0fZR43ByxgEaVBXJj5LlQ=;
        b=EsqqQ3ownF/TJ//DTEsclWzneLEMdcV48AeR2pd2jfJhzIU/YcHsLVEMy/83Vzb8qi
         R//VU0VuTW6KJ3ZpMgWNzqxMnQBYaUmyHIk9fizQW634ShNcnDLuMsPPPdW8dSlkptHl
         4TAYc9drnVpfCCpcbjGcMqWuOsArJa6QQsFO7bJRMWBzvOeNfyOq798GKDyM+pZW5umP
         GVtostw7a22CvjQt/+fPhdtKgEKshnOxcxcp7ruW+8NHmsrIkUMVuuyHNZAtqTg64Guh
         u9QvqDLI0MAcTltTxgPI7qS7GL0NmU6LRmErCbwwqbkBRg2YJ5p7cjecn3TVkOyEHQ6l
         KCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795739715; x=1796344515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLwKY3i9+Cq7SMW4hVJZ4c0fZR43ByxgEaVBXJj5LlQ=;
        b=wyMgRQPCo7tkxULYKtOrtkmckZ5Z/3fSchTKQ68zvjEpsILWZ8U1TWWMvjNs7MdGzl
         Mn4vIgIKi4qbDVEUvAeOmH+kUQU4JXsC2LlBOjsIZh4gGryeZHXL0OMFVTMwTHiAnBGh
         GqkXOZa07Nbrn6BCa1orCStxbC1qJhz/RZXdCuR4Xy4oOYA/ZR7XboVRKV2zoRazp6EP
         QpcjVtQbypSJncQJM2f3iwexpFKWl52XwQ44cDjE0p3t5tPEvJiqbvG1KH4k3w+SUg37
         Wv9I2T5cDaJxIz59dDCQICwkKWHO96VD0EFTgPiHPEufb+NZ5Kg2rYhtudrvsyMj0Qxu
         ogmg==
X-Gm-Message-State: APuU4Z+MhPQZ4Gbqv/IbKENr4IsJ0gitP2jX7fqqOIBihaNNo6+wzLCm
	cUbVofbOiacxSn1NjsSIdgzsnT9rsbAlqkAUeW0N+TqOHi40pW5k8FODMcYABPA6
X-Gm-Gg: AZFdTZcrJZ5hVZlJyzrQbm3jZ3sLgeW46EppNULETLsJ9TCWwqoleXWAjHnd6d4uYqX
	zhcXLh8v+tO3LMq+ug9r7lomoWSSm9Bkwtz2eGseWsxo4dtMaSlRPJ57eVZecuZEJenVjuYX+bk
	PZ0KTw2hF3pLc2i/n/YNHIwOm0Qt9ItFOPss4+/VUrpBgucTqsJxv0v6NoppvqqM85nbQ/51POo
	qAMX3rqqro/Tj33cIJu3DUSBvrP0oB/LGs6Qese6D+rMMUjT+HLTreNhYY5NRbFBb3F6PRaTnYd
	J8p/Ws6/Er6at6s00c+qsS2E/UGB4i/xrdPhbAwwdXgi0yr1PVrN0yDpmyEy2k/Z9992hUDStqy
	6grTsOw17s+43GFSZoF/sZ/j740OfkNHiX/o841nd1QDd5D1K3EcxZK8EHsIlUdnDTcNXbv2P1v
	wTI8AfkMTXOmmUJnOPNotYgXvRi+e3kVXNv2ef6Z2XMVOBYwNLi8TG7L/KsE4ZkNrBbJrcQoZ5f
	RMY/ntj3swSrRaL0SmBNXvr6EXdn6a7h87jWeowqJIBBV2XCpYWRmIdD+ziXpsbsIude8Xal+R4
	nSmLR6UZDcE0lxkYIBqHer4TQpqymGywqUWMoMWz3pYx3/t6OZXmF89xjKF4OhZI2mqQTdcviBR
	34BW9/b/qXSKmD6q5ubJl5wyPG6a0G/URJkfXD/QKDDgaD7iUcRqMS8bCimeBVn5ZBRECy1xNvU
	lGtxthPTFnBTRG0aCpVOZaTVgvC3qi+9dPhcLr2d+70UFyu1ufYUj7PlZC2aspQ4k4c0HiZDwYt
	AgiWt/eFinZIy8CFzF9BrxE79xn5xYinToB29+RQEwts9gQr7T1a5MnIJPu5HZSVKPn51/qbDJk
	5D/y
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr21018150eec.37.1795739714953;
        Thu, 26 Nov 2026 16:35:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm63029314eec.16.2026.11.26.16.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:35:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 43/69] ttf-liberation-sans-narrow: Fix upstream version check
Date: Thu, 26 Nov 2026 16:33:59 -0800
Message-ID: <20261127003425.2166632-44-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
References: <20261127003425.2166632-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 00:35:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133143
Content-Type: text/plain; charset="utf-8"

releases.pagure.org no longer serves a file listing (it shows the pagure
project page, which says upstream moved to GitHub), so the check found
nothing. Liberation Sans Narrow now lives in
github.com/liberationfonts/liberation-sans-narrow; check its release
tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb             | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index bb2930ae0b..a2c30f76a7 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -15,6 +15,9 @@ SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${P
 
 SRC_URI[sha256sum] = "61a7e2b6742a43c73e8762cdfeaf6dfcf9abdd2cfa0b099a9854d69bc4cfee5c"
 
+UPSTREAM_CHECK_URI = "https://github.com/liberationfonts/liberation-sans-narrow/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 S = "${UNPACKDIR}/liberation-fonts-ttf-${PV}"
 
 do_install:append () {
