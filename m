Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B8FCCCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 18:19:16 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.445.1761329952105107984
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 11:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOxrfUXk;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-784826b775aso27523397b3.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761329951; x=1761934751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mQsCZvwaMbsaO9c2FK1IPmNfxFipiMVyOBttfEG0C7c=;
        b=VOxrfUXkGNNz52Y0Djea/1ZvvPQA/OcK6x8VPE+xAU2IxqfKYD+HH5b+dmzX5vdeu1
         2bmAmItLX5wkyL5vwhAFUIOHL66DYwSU9CMaDNF6KJ0gXSheWIGFvwmgawIA5Uu2F+F9
         4QpDo21h9IvmU9anVLECnerErFZzttfkOwkyorFar75gYhN4mheXMBJ/Tb+652hUfoZb
         +FZVkQs/dd58LiHM5nYBWoX7iY+4pc/yQ0XqTYRgWV8Vz4bmfSliOi4EmOFqyVKyyNt/
         N5pkrN67xO4VXPkqGmf6hU/9yFGhJ7l5BARak6lRYKslr4njx12vTX5RZn2afvc+lM3A
         wqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329951; x=1761934751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mQsCZvwaMbsaO9c2FK1IPmNfxFipiMVyOBttfEG0C7c=;
        b=ksJWGpWacUhnvVcp/ZzajfNF+t8Ves8p8sMCSFdWP9nokyvI9n/t+SZiuRGKA3rpdN
         sElrUF2uPZC3HwnULx2iE2briHIiSb5ZT8YQnMToFZQ29JhM4d3sm/Xc/ggIuG3pEUFu
         csk6gx792G0Rx8rgMDsW4x+Tst+6+/Motxz7Ddqk4Qlbqy5zfoqwe2Ds6lkvG1Mv5N9b
         0F3dSefky2ClsNvBi1H6v/i5DUWP9nDMy8l8opm35hzNphpPY6dA0atfActYpT3YTu0U
         BA4qAtUOpZF+1MsD6vXCsao77MfokgtgAF1IWFR9DHAUrf+Ky2Xi0OMIwtPGWfj1KPhR
         /F8Q==
X-Gm-Message-State: AOJu0Yz9EiANvQr/Lf6aN6LFi3OFkb7K5LgT6bHWPJubV2UB/wNgnMxn
	wbfF3qQwWXw2+k5/3k12YNXWYNH7dNK9BZdiSXG8/6zqibD6/eDt6LXCIFy0YKT6
X-Gm-Gg: ASbGncvIVkmnjisQ/BrvzX7VRCgAHL0+39QEl5WuYnCRMONc+LhMzjsLlj0pkGkyzKt
	tKoqVfaCm4CKYCo+6jlvSDcgIp07+RevUYX8Hk4zHr6xvfBRf7vwICpxQUXjpFmtzS8dw0OVjv7
	LwyfvmrpOH7Ghj5w8tFHGDoxqbfYFozBQAbEdlR2SECKkmoD9TeRsp2xVCKwhwO3HrXtjiEflfK
	/433BP+5YnhLIcqzkf0Ylw6M2M9maGTHk+rj5nJRnGJ32r8V/Wf2qh2g0k+7B0eq64FEK1FzInX
	aw+xu8hbPz5ZX2Yf6ggWCq5eMqCMUcSlMpPipimHi0YALykHHzu+cRD3UNms3+vCzAxuowElnac
	BOJh/HaKUdiU6mLczR2M8Azt6jYvxRQpNw+DjXjY7P6ZTDSQvecYt98/0w0zJ0K4qFqgGCd1vIY
	4Bzo1XxO8mdwBSQrONLdgC4LlcT/ie7Uo=
X-Google-Smtp-Source: AGHT+IFsyUz8TSH+JH0/QxoVsaTRBYCrgk2MgsbWf8wyQc1R1kRjuqtRrotwEJKpwuqACQKhM5sqEg==
X-Received: by 2002:a05:690c:9209:b0:785:be5f:fb7 with SMTP id 00721157ae682-785be5f1554mr90687907b3.32.1761329950734;
        Fri, 24 Oct 2025 11:19:10 -0700 (PDT)
Received: from localhost.localdomain (71-208-0-23.ftmy.qwest.net. [71.208.0.23])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-785cd6ff86asm14989397b3.55.2025.10.24.11.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:19:10 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-perl][PATCH 2/2] libsub-exporter-progressive-perl: fix homepage
Date: Fri, 24 Oct 2025 14:18:58 -0400
Message-ID: <20251024181858.121370-2-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 18:19:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120971

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../libsub/libsub-exporter-progressive-perl_0.001013.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
index 5ffc3eaef9..969a36e360 100644
--- a/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
+++ b/meta-perl/recipes-perl/libsub/libsub-exporter-progressive-perl_0.001013.bb
@@ -8,7 +8,7 @@ features, like renaming exports, if they try to use them."
 
 SECTION = "libs"
 
-HOMEPAGE = "https://metacpan.org/pod/Sub-Exporter-Progressive/"
+HOMEPAGE = "https://metacpan.org/pod/Sub::Exporter::Progressive/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=003fa970662359a43ac2c2961108b0f1"
-- 
2.43.0


