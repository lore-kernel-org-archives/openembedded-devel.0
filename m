Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B64B10A88CE
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:22:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50968.1774538522540859972
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=S+8EzXSl;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so11003645e9.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 08:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774538520; x=1775143320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2y4B7onmwHmVn333+cs5QAH2s6vcwUq1end/Lg5KW0=;
        b=S+8EzXSliDvJO3uGaIDWSNj6rCoArsTyaIXfvy0DepxKe9Znu2rdBuA0rcU6x39khj
         L1EVv6vJF5wQuru2l1Zuq2hG7gAmk/2Sll1lrhdggN+tvHBMjny71GUvaCZHZyWluTri
         0d8PQOaN87mA2oXyXFqPDwkzhCewx2J1tK1JV9gwIkJdGXHdn0Qc5zgRhFOd1hq1Fog3
         +N/V1MbyuU10tMNU+GWff2hy6/qfTMrHxIBfEBHJ01/J0kdJGfTz1LviW5QXibUqQfAp
         SpTQZx2YGSBv/psJkIt2NPkxNgprTk5IkxREhJQoG9v54DnrbYGxAzJpWqsTRy/AERLK
         IJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774538520; x=1775143320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2y4B7onmwHmVn333+cs5QAH2s6vcwUq1end/Lg5KW0=;
        b=XvnS5sgBHY039lXElJqgvEv8mnOi3oEPFUyYQ+viUJyomTsF7+yT33Zlye1Sft5aKl
         IkNBMb3QGq+T5gGQB/L4OKOL9fFdVhGwgsmpupgGojqXNGTZYBZP+27Soxp36DEHXK1p
         NHPsJX/4V6WlgjUddw9c66kTh4U2DdehCMYD4HM8ZXlKKLZaDtx/+6HrVa8J4eR4EPNP
         M+d5EaXkZ5Tw/8sUOSU5h5LFU0pomeD15lJvx6cbeXbSU58TUdgOGlwsrvAjVDf8rZdA
         evrvkYlfHzM2b6sXBqyf6T05WC38hD5i4Lh7YSZEmuTxi84B4t+LyUvRVAV1ztydBbn4
         VfBg==
X-Gm-Message-State: AOJu0YyD4jRQFmXpV9F95QJW4kuiIpgrUbqXQQUS7ufyaQixsVs+XI9e
	C4rip0HRCRbUxUOWh3z1U7yNBM0OY8aTKapXylyxDGd3ZjM+IVkuNNRG9/Bx9w==
X-Gm-Gg: ATEYQzx5XH5ORdpMLhIzTnu+2d3fP4zhliSxfqSzaMh6GEUIXr/WxxA0QqkTEMo2sMu
	NvAlS4LCiJbrFY/SHs3ZJ3xFDaAq3l58XAM0OXCoWTLBMBtUYooIEsaGWVURaCtaKvAXG8x1TeC
	G0AdvswbRa+uszBLn/UEhjrfcUTb+KYBc1+Uul92FWNfzbkyBolgsvRkW4ZC0YIJCCjJdj4lKg3
	0+tzqG9XheNioqC6Fju5eLQSrlZ+CneceETajiwZkJ9gAGGTT0wA8Bm0X0XH/4QTdRPcFFgW0IF
	dFBAMaeOy2o5cYZUDkO9MF50lsnzt8wfGVvlPlKBJuizRCtnpKI4J0at/G4VuKvYXCbqyb9Fwmm
	dPhmZo1tNRONj8oKKEDWhV0C+c1wO8/anTJzAiJwOYI+MMSv7QdUWCY9fJw3rBdL17FpE2FXuEv
	4wqzgnLGd+25yW7g==
X-Received: by 2002:a05:600c:3b12:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-48715fc3677mr120237315e9.5.1774538518587;
        Thu, 26 Mar 2026 08:21:58 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48720925591sm16478935e9.25.2026.03.26.08.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:21:57 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 04/13] gst-editing-services: Use PYTHON_DIR
Date: Thu, 26 Mar 2026 16:14:29 +0100
Message-ID: <20260326152143.2224099-5-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326152143.2224099-1-zboszor@gmail.com>
References: <20260326152143.2224099-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125743

Use PYTHON_DIR instead of the custom constructed directory name.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../gst-editing-services/gst-editing-services_1.22.7.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
index 50d45ef57b..1c951ecf41 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
@@ -25,4 +25,4 @@ PACKAGES += "gst-validate-launcher libges"
 FILES:gst-validate-launcher = "${nonarch_libdir}/gst-validate-launcher ${datadir}/gstreamer-1.0/validate"
 FILES:libges = "${libdir}/gstreamer-1.0/*.so"
 
-FILES:${PN} += "/usr/lib/python${PYTHON_BASEVERSION}"
+FILES:${PN} += "/usr/lib/${PYTHON_DIR}"
-- 
2.53.0


