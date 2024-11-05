Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762F3D40D16
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 22:58:20 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.30937.1730840392625735500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a9G8Kvh9;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e9ed5e57a7so46929297b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 12:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840391; x=1731445191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMszca3xKsx6M59lWBUdhLk/xmvRNYB8H/xDPlCM3TY=;
        b=a9G8Kvh9PLGbGwJjcYuJpR+jUb5rrYONUxg8wYiRuw/WqxpmOX7YB5e77xT2Z9KJXJ
         55CGWJoMlsd3acPTrfC2wCaOIQV7o1/0YBNGGHPTsv1BHbNGC2AztZwN0e6kIO5lUmRD
         IxsUlc0moZPxqOS83mJSOQyo8lfDwRmFfbsNcry/UFyC7xqIOJIewyvffGrd6nbgGmey
         FfSOY06S+DLqdRMqvnvVUCETVm5X5HvJv/qgmPzwQwA0k4CMcTMgiXWEwybD2Yk8Xzt/
         RdPVXgDG4GTztte5QJbXj4kp0V4QO0MQNHjkOlL2L7k+vrqo7fAExUzKL1KdcRQrSzng
         X1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840391; x=1731445191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMszca3xKsx6M59lWBUdhLk/xmvRNYB8H/xDPlCM3TY=;
        b=C/Ce9W1GFFMVnItLsVtmm+PvU0eC11dy7hb0tj/k+33m7/Fjm+T+KdU3KWNr+OacfX
         yAYrv7G62SmxQmjWRs8peOqZvcASnPg+mJX6PnaNUmJFzlmcalOxlXbAVoiCHL3c5cON
         HGjWalsn1CRGK79HvvCftwwkv9Rve4D7TIDPO2lu0KNs022z4LAtbmjHrqzhbupJlBLl
         DONXPHU5HODQstoyuBDyzVOMIotfV+e/XzpsTIrfp57/S/2EgAq0PEr2p1i0MeSOAVcd
         l8tAdIBZfvCmtLSaKZQec8vJl8SNs9cufB0ds8/eUWHcTw6e1Mhbq5CD7/HbmZAi4mLu
         IfFw==
X-Gm-Message-State: AOJu0YyVxfZR7XHlDD6+/M0l6pNUd0wLliIWMROxC3UtDbns+1+sxir9
	FX/aPW3o0AR+DRR6zCg2N26uC4YdHIhb79fLEXwmRmkx/k6J+YTq1Fkl+XEJ
X-Google-Smtp-Source: AGHT+IEIElA0ZTKgEDCZ8xwnFhujpSzQJ9uiT8hWfLpzyuunMNh4WkUP/ASXxNosdfWhAoiI0jLQvw==
X-Received: by 2002:a05:690c:905:b0:6ea:848e:6314 with SMTP id 00721157ae682-6ea848e67efmr112184487b3.20.1730840391258;
        Tue, 05 Nov 2024 12:59:51 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c45b49sm24634717b3.97.2024.11.05.12.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:59:51 -0800 (PST)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH 152/161] sharutils: Drop unnecessary SRC_URI md5sum
Date: Tue,  5 Nov 2024 15:46:58 -0500
Message-ID: <20241105204707.4155-152-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105204707.4155-139-schonm@gmail.com>
References: <20241105204707.4155-139-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 22:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113668

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index 7a506d034..3f87fb789 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -15,7 +15,6 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-configure.ac-Check-and-define-intmax_t-type.patch \
            file://0001-libopts.m4-accept-POSIX_SHELL-from-the-environment-d.patch \
            "
-SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
 
 EXTRA_OECONF = "POSIX_SHELL=${base_bindir}/sh"
-- 
2.43.0


