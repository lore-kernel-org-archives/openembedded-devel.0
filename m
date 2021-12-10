Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BBF2C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 21:16:29 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.13325.1639170988175806211
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 13:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VgYg0c8D;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: philip.balister@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id g28so8976922qkk.9
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Dec 2021 13:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rxHJFPSuKmfbRykV3TDDIkyrxVs5otrCfBf9Amj3fIE=;
        b=VgYg0c8DFT3ZeuRF30YdLQZRM4Q7a/rWj6MdetRrLmalcHDgwW9uyiOu9AOXF52ML1
         lR3qTxLocHApAE0OCTcC+c0YVW+02feNXRMbBDJ8BUx6eNQFOdZmKPTx4N3hAjIJl2hl
         MzKHNWXDX1LnTmeTuMfZfVezJIpD/ywZeZvzDnj4cEzPb+CQJFcLLo7O7HgbHUVIZjDp
         FlvLAAmUx0uI2BbSccDszBy7Km5mqALp0+TjZEi4R+O8wtHgT/kIMcgGJzMCOxBKF3i+
         ljtx2ozXontwJ1N8/fiZKdY0HobfkI2Vo45f+wdNjCFPmQDn8v+RasugU602pkNnmVVP
         ycag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=rxHJFPSuKmfbRykV3TDDIkyrxVs5otrCfBf9Amj3fIE=;
        b=53foraN7air09B2w1msIwyrPPhuBzVuuUW2qEUlrVMOO11Qq0Zg2WoNJcBfqHyI4lE
         gUU6dWG4wcBQfI3CL6lerp1TMSw0pOh3wlyLthufdO3CsaESOxkzg53RBfu/d/e78opB
         zx4s2EJ6lhL872DluyUmS4CHaEdIoDQokC8g5sEc5KxinSwsAg/fnEPDwGqVLBXiwHEI
         2zgJGISI2fA8HXC3fschrdDRXkuy3eTONnkCcC46c/LV0b/m9LKHO7oc7hgCNF/c6gSY
         NqnwAXE9Y93yenq6iR/wow1uubXhsp9oyn61A+TuS4KanPM0a66hSEgbA8WCarBqChME
         FfHA==
X-Gm-Message-State: AOAM530q8AjEksS0NnfDzxPwK3MoEnlIlR2u/eU1qVuq+z5+ddig/WO5
	wWCsGEgewDFuqVaRbwBeYhVznX0uhRE=
X-Google-Smtp-Source: 
 ABdhPJxWfPWmJUkT6KZl9hKcpVfCoMS8XN01UY+3+mr7LcudRmbJdyAOJDtG3jeAorKWKHrxtjlwKA==
X-Received: by 2002:a05:620a:25d2:: with SMTP id
 y18mr22599366qko.442.1639170986753;
        Fri, 10 Dec 2021 13:16:26 -0800 (PST)
Received: from lyon.hsd1.va.comcast.net
 ([2601:5c0:c200:1421:c468:1be0:eb10:978b])
        by smtp.gmail.com with ESMTPSA id
 m9sm1885931qkn.59.2021.12.10.13.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 13:16:26 -0800 (PST)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>
Subject: [meta-oe][PATCH] fftw: Update to fftw-3.3.10
Date: Fri, 10 Dec 2021 16:16:17 -0500
Message-Id: <20211210211617.399243-1-philip@balister.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Dec 2021 21:16:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94283

 * Minor bug fixes.
 * Ptests good on qemux86_64.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-support/fftw/{fftw_3.3.9.bb => fftw_3.3.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fftw/{fftw_3.3.9.bb => fftw_3.3.10.bb} (96%)

diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.9.bb b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
similarity index 96%
rename from meta-oe/recipes-support/fftw/fftw_3.3.9.bb
rename to meta-oe/recipes-support/fftw/fftw_3.3.10.bb
index 38bf3a19c..13541bce4 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.9.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.10.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
     file://install-bench.patch \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "bf2c7ce40b04ae811af714deb512510cc2c17b9ab9d6ddcf49fe4487eea7af3d"
+SRC_URI[sha256sum] = "56c932549852cddcfafdab3820b0200c7742675be92179e59e6215b340e26467"
 
 inherit autotools pkgconfig ptest
 
-- 
2.31.1


