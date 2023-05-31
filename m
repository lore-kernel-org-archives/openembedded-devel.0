Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39646C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:26:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9093.1685521605317832247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=q27gVxOB;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3094910b150so5613595f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521604; x=1688113604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PsgJS7m6WiehZvu+G/48wO12ohYtzKrl2QGg9c5HEI=;
        b=q27gVxOBPdfgYYlp1AabQOPAgNgUat8r0WQBvifLDyThe1xgD17ZE5qg0COPGpKem5
         do57OHTlmA9945g3WlCRgB9bqDckgqq/2lCf5qilFx8/R/pACXTvJxHmtFJn+AFh7ihq
         O1q6EgY5iPqBNd+mLvjE0/QDnUcRTgdpsSChUs3A9g5HJsCJC4lFDs/JJbKzIKZ6mpVn
         fAE0gD9BLdUahnUkrZXC8ZXJGKbnFqT3XmrKtXy9hjiHSzvnB+Vr377pnLwhQA0he3G+
         mYgcNtHgO/iePX6Xhs+wA8jb9repVWRq9+YEKumw+JERAeouUzKlYycfqKrfeycsr+J5
         kU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521604; x=1688113604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PsgJS7m6WiehZvu+G/48wO12ohYtzKrl2QGg9c5HEI=;
        b=QMfOcpaEw2/l2NKaQIdm9IRxhd12nho4rpWIPJ0T/ER2cobzFV+Al4UjmELpwdsqj2
         Wad3klHr86RrqySBxSHsrqSA2OwsHt4Z7fcpfbvL5jcVCIUJXDeYpJ2vK4bviWDuWPqn
         nDgw/gobD301+PGjjY/fdqdVXAh6i1zoB9EtKFCGHKZkZZXnzrlCH7zMpE7KUzly3FMU
         DCrqDFup5wZ0jrccrpIKMcSrbkVK0ybm8imBHC/xyHpclCVs2HG8yJFY/wja6KkN2Lt0
         3Xw+o4QuOd6JEl/7OVd3ubPdLtv86e1SpCKM2oxzEfXHCdPXnuLH0EXNF4tYlRIB6cFB
         jERg==
X-Gm-Message-State: AC+VfDy82nXdbz1eGgwTbpvrmDolOXHtr0W6FaecV2QdeseMVlRN8lve
	229lTY5ZnriVTrfHdEamfWrP1xaEgE/ofs6h69s=
X-Google-Smtp-Source: ACHHUZ4iE6sCPcTcnR2xNCbgtAGQwV904BrH1xBhUompudytf5KrmgN5gNmLV6j88qnzz4Vxh7OvwQ==
X-Received: by 2002:adf:cd02:0:b0:306:41d3:fcb9 with SMTP id w2-20020adfcd02000000b0030641d3fcb9mr3616477wrm.27.1685521603880;
        Wed, 31 May 2023 01:26:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:26:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 088/149] python3-linux-procfs: add missing run-time dependencies
Date: Wed, 31 May 2023 10:23:36 +0200
Message-Id: <20230531082437.10646-89-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103015

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-devtools/python/python3-linux-procfs_0.7.1.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
index 9395a792f..d51eecf97 100644
--- a/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-linux-procfs_0.7.1.bb
@@ -10,3 +10,5 @@ SRCREV = "7f43598387e44e2da93ead2e075b7232429e4cc4"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
+
+RDEPENDS:${PN} += "python3-six"
-- 
2.39.2


