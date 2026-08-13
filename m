Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED28C5DF6D
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:08:57 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27761.1786651735404147613
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:08:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZkgOow6B;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so370599a91.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651735; x=1787256535; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=28h5kYg27WFds0c1wFryxudUTSA9WQTfzpBAX2pGI58=;
        b=ZkgOow6BBJHYlH1ZVfXY4MQdnv+dtXdC6NFiSgHNYHbKJpvpRge3tum/fqOSACPoE0
         Neb0ombFAsn5iASjkDuvlEksi9kNRrbAmGkQPzKZDO7bt3L3AOPjZ7IxfZbfdpegwwnD
         A5o2WhscI6Y3EsajclNu4sOMEwGYHAi7DjDEiP6O83EVUEjEpjNE4yQ2uIGGShJUDeuW
         02s82uX6X7e84eGsNPzBaJQs9FFF0m106rDLoROIF0PprS/7NgAPdPdl1X6LAmleLKO6
         GYs1YCsXL3HqJzKgZbB0m2hF4B4FXXhTc1mj0TwqbSJXoZim0SwJ8paHeSc+1wgMlPIZ
         rWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651735; x=1787256535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=28h5kYg27WFds0c1wFryxudUTSA9WQTfzpBAX2pGI58=;
        b=WOJdtKZA1jI7vAx2TrzX+QA2G5oDySQwrPhoI0ZL0mWvvvK07YhOSBJyxYZLXFtMYD
         86nX3h1ZfAITDRzljPq3tH8fiOGAtvJzp0kvt9DJ3o1wmmXt0wiX0BV9aaazT4Ht2s1z
         89H8OGqJl+xW59L97K+YbBdRkurkD45BIUjXYYrH6ZhIxcJJsPmaPGicDEOXYKFrfEv5
         GGmkkhZ/4DsezVpncAK3MB4N4ugF3zG1QoMekbhonKEayr70OcC8fxOkeJEAodd5Shwi
         dfS232a8qg//sS7tkBHUd+/D1YUeGeAAvL8tntrqV1NTuqt0yJLhh+XcP5heuXBHEm78
         m38g==
X-Gm-Message-State: AOJu0Yzs9MCzBWeOUL7nEWUna7xN9JGOgp7Dbs/URXMOYt6uINReQPb/
	5+EtlhCkMvlbQXycBL8c3QWoKxf3xY5FvcDpYJGLLZvz4V2Iwrd+JYHJcus3jKnd
X-Gm-Gg: AR+sD133w+VNZAhJHJ0xTILmsVgGsyzxREFV32pq8a7F8KnluPlPHzFXYU7hO04AXcK
	oain33el4MSDV8AK7lpfSuYHTeCHDUUeNWiYb006zPEkH6F1E+T58oTKd2mreqopO/aBNZiSMNp
	n8USyt/DcggbXDFo0qQ51VpokT/TqEuqs1vWqbyJ75adOvjhwEJUscWG2l46KIgwRwTFby7zRzN
	+khq1nb0qydbv/zQTFSbBu8rL7iHCxVQPKfTMH4HuuvplYsWzZgt6k7P+XlQ8rpG0oUITzHLoWx
	3Bu/6kY8GHY31AnPQL/xDcnNM2neR+zKzxv4W+JmCx65hgBTVlMUKmRa0EK5/6wzoACJ+srQNmh
	02cWcf2xaO5QbwmZl6dCQC3uFAVQ8PfAQlW1OhSLokGf5VWsW8AwlSNcKOg/q5xvVAy1u18si4z
	z/DF0xVaBTcrQZU1TrGS3scVvSRltDePOIXlWKMwEyOWh0WH1x6W0+NCdZphDrQoJyyWaT2/lF6
	30PLwGcrdD+tcwfxhNB9imqpgvnh4st/IzgceWPeNSFTAgALdo0v6cVy/JbpCkYCSyhwq6rp7Cp
	wplfxkLmQB50mCai493F37a7+Umdp3j4TFHfx/XPn0eCSMQucSFAVFGK3iMcDCzdQuadRDX2AJY
	yZuGww7BsVQHvMMFzqROuU9IrPmLN3mSbfpoOyYoJ4Jg7Mg==
X-Received: by 2002:a17:90b:384b:b0:37f:e1af:df22 with SMTP id 98e67ed59e1d1-3933ba90e38mr457364a91.17.1786651734720;
        Thu, 13 Aug 2026 13:08:54 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:08:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 09/80] python3-automat: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:23 -0700
Message-ID: <20260813200834.1302829-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128953

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-automat_25.4.16.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb b/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
index e95138849d..29b26dd358 100644
--- a/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
+++ b/meta-python/recipes-devtools/python/python3-automat_25.4.16.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "0017591a5477066e90d26b0e696ddc143baafd87b588cfac8100bc6be9
 
 inherit pypi python_setuptools_build_meta
 
+DEPENDS += "python3-wheel-native"
+
 DEPENDS += "\
     python3-hatch-vcs-native \
 "

