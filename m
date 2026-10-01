Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DA1CA5FC1
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:04:18 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3392.1790823849277207010
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ozzcvIsM;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so81625a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823849; x=1791428649; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KmbUOtMJwSOOTvf2b4cBdm7+bqOGAel7TUsBD5BUUZE=;
        b=ozzcvIsM/+7FD2T4C2hKU94S+u48cDsUVto3lzPPhnAAWSW/G+ggVxSjJZzcRZUE45
         kZVu2lNTdZDEK6iGJuwmHJpqGBDCAm+UGO8x3DWE5ntZ9FHaEnK//rc5b1h437UvPUua
         q9SdkwDm+acTj1f914h5Je07FcYetAyHdbIiM+haCwvhLeGIFDvBovSOwC1ok5wKRKae
         a2atVF9Nqm3sIbpmvjHjCQgEwR39xnE65GbEy28BRUxwcrLfV1sFAAbJU87kCxX+OSds
         5Q7rUTa+72QImB/gyoNunqmkk6amtQlFOb4Jai1YgPIMNYpPO1bGnqhbo60Nq5qFJnF8
         6lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823849; x=1791428649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KmbUOtMJwSOOTvf2b4cBdm7+bqOGAel7TUsBD5BUUZE=;
        b=bbflfaVY31STjfc3EsiG4qgmV8/uyVlRkkYuNgB+dmTwStE4s8YfIUPPQRhLbHcAgF
         byx+PqX/vIeS3qW1wvu/lsJ1VUk+5pihuU7dWtDU7jj07Xeh0oq4I3mDonZC6o814qru
         8KvKjaisUnUpGaq2diTmahSfCtdinH9B7k+kmd9NhbDQoZfFfAjYlpKKs96PT/0/mhi9
         fQRucomLgsUbW2iPgcIAMmtfJDmAT3hCzwDWnkfk9MQ4BujJWRspAcDLPZu+cqb417cJ
         TnR2BCJR+6B7hufTpBt/BSVeMZpMZfCEJNAc04AkVvGV8VpbmhJw3W+bL+9r7jZv3wHZ
         rUfA==
X-Gm-Message-State: AFuF++l/GazPuR+tfqX3LAIKiejz4soTc0VPI8rjSweY1B15AVaCzud/
	OuCtQwRC9hqS0npEGrHZ7W/KsRy4hgNlt38ukBkofpS55lwD0ixchFwMnvjxIA==
X-Gm-Gg: AYBFou0Tf5WiAOdQ7XqW/St875oKcAd8VXhLM7/kGeSB/c8SCYIUvUucBCzOmIX/Tmy
	Mm9Agr/0UZb2kj4oWBxWjcouFwtAz+VdGV7c1yQB8ZLkkbJySUETJtLmCiRuSa8xIWnftXchiJS
	pd2OsWN2ggosK4qoDqwQiO60jXOt50nROyBt7JIcqgTn7oonVp+saO2jvwqmzRREHGN04JTvUAN
	Dx/T5nTu6pECvyLUSp/odyxL02+O6HuAwXjwCZl4A4spzUzdYzuDOqFWXBdpexqj/xDKfI/qYZ7
	ZsPJVFLNgyyAUfQckYiYrE3lx6Q4nMegejVdS8K04MV/RvORBo9sCqA2E5MNz3+MKoHtl0yiaaP
	GDqdLfcjg55pTC7GfiJpTrPcejpd98T6v7eK6753Pf+jBf/8gbsm5paPG3WSZIv9kC36W0Z43oR
	uR/em9okgbG96+lasP8DrS3wmvwNR4zzxe3+HjqN2YAo83pabBqI/OQlo3mxEwPIE8ZWZJ25m8I
	PoGFoKi/9S/IoPf0OXFvUU=
X-Received: by 2002:a05:6a00:13a7:b0:886:d769:618 with SMTP id d2e1a72fcca58-887fe5d00e9mr968748b3a.38.1790823848597;
        Wed, 30 Sep 2026 20:04:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:04:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 16/17] microsoft-gsl: upgrade 5.0.0 -> 5.0.1
Date: Thu,  1 Oct 2026 16:03:28 +1300
Message-ID: <20261001030331.1581021-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130565

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/microsoft/GSL/releases/tag/v5.0.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{microsoft-gsl_5.0.0.bb => microsoft-gsl_5.0.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_5.0.0.bb => microsoft-gsl_5.0.1.bb} (97%)

diff --git a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.0.bb b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.1.bb
similarity index 97%
rename from meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.0.bb
rename to meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.1.bb
index 1521ed1111..ccb230f959 100644
--- a/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.0.bb
+++ b/meta-oe/recipes-devtools/microsoft-gsl/microsoft-gsl_5.0.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=363055e71e77071107ba2bb9a54bd9a7"
 SRC_URI = "git://github.com/microsoft/GSL.git;protocol=https;branch=rel/5.0;tag=v${PV} \
            file://run-ptest \
            "
-SRCREV = "417ef685eafd626db765f0027b7fc5a0057e0770"
+SRCREV = "fbd20b8e8c52cba04dbc869cc9068a7800a5665d"
 
 inherit cmake pkgconfig ptest
 

