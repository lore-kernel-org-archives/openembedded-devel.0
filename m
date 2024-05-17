Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06070C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 06:39:53 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.34065.1715927979733634984
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 May 2024 23:39:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ut7Nnq1p;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-61be599ab77so597254a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 May 2024 23:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715927979; x=1716532779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8w8MRQwY8XR0RgcPsZ0fT/YY/F9eEluj6owZn6faXLs=;
        b=Ut7Nnq1pmoYe3HLCtADrf6mhYC5uteJbWtFi3w5qNwCB6LS+31RCozhbV+qxsA27+w
         UYROnwqAw/OjFo8kYwJXhHJCcVjazpFwJ7xevignAEnQPWhFR51Queotu5guEHTy8GIS
         EWy3wKabpX2w3uZ6buHBp0Tp+5MTvg0f20rxZiW9mvhKkCxICmR8kl/xCwhq5bNERlt1
         rYGpS0XKp29eWvn8Yk6s6FHyeNVW9YCOcJlXsOeUNtRERBKifYjk399wj0SSvUaw59YW
         iNNvtvFWDtNb45/nFTASqhopROmPZk0AJex5I20ye//ypt/y6V8EETXzwnmOgA/1c0Zw
         19Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715927979; x=1716532779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8w8MRQwY8XR0RgcPsZ0fT/YY/F9eEluj6owZn6faXLs=;
        b=eJOosw93DlNlr4VmupO2bup8io+XFAfapcbE4MLZB20dkBohEgiuHQL4857nPRsHZ6
         TDUI0+rqRp/9vDIWbn6lfcx40YfCn5+AYHUzVgdJ2wv5478Iya/Hc449Np5Phoa/ZpuF
         DrTnr+smF+JVVoUocyRC1LKv4Lf6QmL5ve48agRSJRMqRBDTtPivSF1WjTEzTmfYGVV6
         +ny8Q13BkMmQxBh2vxy55h495Dcke4277MqgwjEWIkRP/JLrMZZI/lT0VvdhEHhPplh9
         69GtDdbbQ/tgMIi3hOI8EErVsEU7V2DgRX17zVlyo2tL57Zifty7FgX+3/jnPWuZtJRO
         ukZQ==
X-Gm-Message-State: AOJu0Yy/roskBz7mXRjrd83AAg3CvMV7rXbfhstfZKvNQHVL0k9jGTc5
	DAwspwA90yeSbyZsuVd3uqvVq8B2xdacVOf8wwimwxZK+oZHTCYsM6OJKqUxq5E=
X-Google-Smtp-Source: AGHT+IFrrlQOfl9csA0bKPVtpDB5pSsJaqrE8wtJo5EbSwNIeD/BjnfMF9EbtcWaGLNIbB9nxlsZow==
X-Received: by 2002:a17:90a:c284:b0:2b4:39dc:8639 with SMTP id 98e67ed59e1d1-2b6ccfed238mr17826640a91.46.1715927978800;
        Thu, 16 May 2024 23:39:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e372])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62886b669sm16622575a91.24.2024.05.16.23.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 23:39:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH 2/3] tinyalsa: Upgrade to tip of trunk
Date: Thu, 16 May 2024 23:39:33 -0700
Message-ID: <20240517063934.753527-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517063934.753527-1-raj.khem@gmail.com>
References: <20240517063934.753527-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 06:39:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110421

This fixes build with musl + gcc14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb     | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
index e261611afd..b513e959d3 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
@@ -4,16 +4,15 @@ HOMEPAGE = "https://github.com/tinyalsa/tinyalsa"
 SECTION = "libs/multimedia"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://NOTICE;md5=e04cd6fa58488e016f7fb648ebea1db4"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=d2918795d9185efcbf430b9ad5cda46d"
 
-SRCREV = "1c5fb68ced57d838f2b7ecd0c00bc1fefc9ab60d"
-SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https \
-	   	    file://0001-fixed-compilation-error-caused-by-strncpy.patch \
-          "
+PV .= "+git"
+SRCREV = "f78ed25aced2dfea743867b8205a787bfb091340"
+SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit meson
 
 # tinyalsa is built as a static library. Enable PIC to avoid relocation
 # errors like these:
-- 
2.45.1


