Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2013C5320F
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.116367.1723697131558662096
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YaPQ4Gkp;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so432835a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697131; x=1724301931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgkR4Z2Hwn9ZFyasbszyj7Jh872r1lnF5MkDORQx7mY=;
        b=YaPQ4GkpieF9VZ25a23ppA7IHhgs8sKD92/bewNT0AdHFAAier1zz9pQt2tmdhK3pa
         lGA44OT9+DQVfXi5/mPTEpBOJWwmTcFc/+t71MEI9cTK8SKGS4VDDl/Kg3q2zpUDX4mC
         d6mS6eoJoLp2E3MDIwllYk7wZFhEIVJsTYpqfHJJlgVtSv6UDBGVBI0ZEdvBuAxoXw31
         artqeIRS9m3OmK45FPpTnhDxUsyCgzXmggflVhYfEcyzdsAyzStWWNrKcb0OTMi0LaQ2
         UyA3Cr6Wns0MZqacxqcIJNVTLeAyc173xsQEpx1VyJWK2PeWCNLsicqxWJhRKYikbqKU
         b+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697131; x=1724301931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgkR4Z2Hwn9ZFyasbszyj7Jh872r1lnF5MkDORQx7mY=;
        b=hK9S6MH/WMQMEsXoYuUYGR0OgBaSK/9U2XT3QOS1zgpfXvsE9mg2RpWUsVjXulTS7z
         kccpLoGr+WktoeHb5md4bX6STJAGhIC2nXUclBEU257DMHEys5m3ljLNwXbJHvbAECxk
         xdhlVR11Rl7HwaP6JLGAU6Xoovk4prqebDuhrRndm9E1u9AbaMhWKIFCNGu4cZnoFWH5
         Ryn9HAWfGn6P5sKJ2+os/OfFvXiU7tFJCTV/V+Bif/MJNw8N3izXPXnLkEzngMA63jUg
         at0sw0yxzGKoyWRV7j8UgYn9u/cRz80AxY8nDptMFJdlJtgqaLJlh2GIq+aS/bryLSXd
         UTCA==
X-Gm-Message-State: AOJu0Yx1XG9G2CpNTkC2+Yx7yBQLQiWopN2lXsb+oPN9MgGjDoerSChW
	cLKgIWrUX9PUkQUnGcBsxYTWgdoA1wVETM1yrgheKKHj/sTs6GOr2jGf5A==
X-Google-Smtp-Source: AGHT+IEJA5a44ci2BhJ0VYuwIAnd/igvmsUSonS2CH6++SLZrSelAsGAcqrWRZSsWOB6tSC9OVu+IQ==
X-Received: by 2002:a05:6a20:d488:b0:1c2:8eb7:19cd with SMTP id adf61e73a8af0-1c8eaf800ffmr6728388637.42.1723697130681;
        Wed, 14 Aug 2024 21:45:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 3/9] wolfssl: Add packageconfig for reproducible build
Date: Wed, 14 Aug 2024 21:45:17 -0700
Message-ID: <20240815044523.1030831-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111811

Make this option turned on by default

Fixes
WARNING: wolfssl-5.7.2-r0 do_package_qa: QA Issue: File /usr/lib/libwolfssl.so.42.2.0 in package wolfssl contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
index d45f1f69d0..009434d96a 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.7.2.bb
@@ -19,4 +19,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools
 
+PACKAGECONFIG ?= "reproducible-build"
+
+PACKAGECONFIG[reproducible-build] = "--enable-reproducible-build,--disable-reproducible-build,"
 BBCLASSEXTEND += "native nativesdk"

