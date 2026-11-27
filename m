Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11768.1795762888088356578
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uStTnS5V;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so1572535c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762887; x=1796367687; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+5fSGuvMTCeIKmpH8yBGK9VvgcWLju539u0pwk549RA=;
        b=uStTnS5VhU7V958kFeO0R0iWiV2Ts57j6UDBNa7lMFFdZU77AORYC3sqecmyDBPTge
         MvuogXKNJzg299U9kHtyUuLAwJvebqFcjid5899IXELNKp4ldeRmLO9OJp++oIQXxYMG
         1xvnxU86Q4gr5VAxGqwVD4l8cIkrdpBTen64bqiLciR6ueJC1m0H28dm3ZmO8L2OxFcc
         xWPHErLUN1+yPZsT1uDtcZuFlPkBwdq5g6ZQkND0UmrAzQkouYSrBzivXBVS3eloJbxM
         QN+41RhkFWf9BciW4HtIJCAUug8cVBlHRZ3sxqXRA5AvzjfXdEOI5eAj9y1RA5iXdTVp
         fD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762887; x=1796367687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+5fSGuvMTCeIKmpH8yBGK9VvgcWLju539u0pwk549RA=;
        b=he12vEiM2Nzuk5WocNtvFdeyWgr5WCfYS6bLTYl6xBgTKhEwn7k15Xolglnpmo6Rez
         ZozHnjD4Disegk3646PVTCPwkIKzBpjhIYEdeqQX2bddQChrDRxdrGhvoHAhKJ+poK2p
         0OlrNjjZGZz8NolKgyLAlzUgadaeTSEEOueRRndNFs074+AxKyG1bagY/XsB/00bfgAn
         6RQ0Zz9I3DHLl4wY6ZyNHfbexTwQLvahDV04u4FdhwyN0zssZo3VDDvY8HiYV5MQjrph
         fLkn3ycOJguNs79KUteA2Ww75+nhfSDeme3UnjzcKMgmGhAUj8/dr3pLT0hJ+JYnXkiE
         GF+Q==
X-Gm-Message-State: APuU4Z9g/319+UpB00weQWRVkoyV/ZP4Kn0UNZgf+irE21fv8Kv2dfwO
	MCD+FGbaro9tMrYvq2BvCkyGgvqcAiEX40B9wAJZ8+THoJUOGcHfMMlX079TAw7T
X-Gm-Gg: AZFdTZc5L0BCcR5IWVsm9EkGYIOP+l8XC1R9k9Uedjcd5ExZiMBiXSDKJEDmOQlfrwl
	7xzxvrCBz/SRx7RCoMUUn4uC3VzqLpUiYt3Jgq13eFOBQ7z0xt1qv+v+zELqcJJwR8kLay0WH9I
	kChAZ3AkfxO85Tx/JF2kCCIyz7QNCprndk91IwwOwS+0K5YqwU+JczE6g5Xwv+OlNWBO/0E2t8S
	cT9jUMIxEOhSpCOQyfGvqGD7OaL8x5OAUDxoy6LppfPdbLg2UM0fWPS33EccpAqZJyTAdJjI0sO
	yrs9eMGZm/7npcKvDGJQqVlfEMM8QFR51+XkplIfkKjt8MW/IWIPdQHvzjNuu0yi70zzPKJ9TRi
	oFpVio6CeuqgN6zkIgyi2NdRlsmoRuHZuGK7gw4wiLsAoN0JMBiVdlHbKUVkIqryKmPbvaqqFil
	S+tvnpeCp7schXUbYN2ekOtVDG/gFP92ROeYYfaqc9AgheEIpHfhuzZ7MuVqu0qLwRRdoRR+xje
	YLJzvZSaS1o2nKBxLhmxBZpXAGvfS0ibAmcxhBL4aYfLb93QTDjl2V/8hUFTixj5VhB3ujWaA1a
	D8h+j+a4NLaGLkIjjknNm6750n51x0vrF7FIgqad6r85GM/SnbrSW8CNlufAgb+f1PmkdufXZBs
	f8FS5lAvC/b0Iz/7F42coxjKrdyPY1e4ihy/XjRTR9I+5p1mRZ5RV2DypR+H32rQ146NU4rwrUS
	+zEbJL2k3UOIkC5kt9n4tcuXcWizqYAbF42mqgm6j5UYGp/MJE4FsGElttG1YJC2KPAitQzJyMK
	ruLQL9q2VZWnHMPjvxvnTaZDN1LoV87nSpdkatAcgrpOO+QA3m26WF1GFXn44a6sTvdhYdgF1GM
	SXhl
X-Received: by 2002:a05:701b:2608:b0:15b:afce:62c2 with SMTP id a92af1059eb24-1b55691337bmr20153673c88.41.1795762887288;
        Thu, 26 Nov 2026 23:01:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 11/14] tremor: Fix upstream version check
Date: Thu, 26 Nov 2026 23:01:09 -0800
Message-ID: <20261127070112.2273685-12-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133316
Content-Type: text/plain; charset="utf-8"

tremor has no release tags and the recipe tracks the master branch,
so the tag check found nothing. Check for new commits instead.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
index 707054d540..b521d5fb37 100644
--- a/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
+++ b/meta-multimedia/recipes-multimedia/tremor/tremor_20180319.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://gitlab.xiph.org/xiph/tremor.git;protocol=https;branch=master \
 "
 SRCREV = "7c30a66346199f3f09017a09567c6c8a3a0eedc8"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 
 inherit autotools pkgconfig
 
