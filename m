Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5650AC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:39 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24508.1786747595441398070
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RfBEYhKj;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so2258030a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747595; x=1787352395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKKz2G1nuzNgXhXUFfF3vwvghcsjQbA26X2bVCte/6I=;
        b=RfBEYhKjmXNrQSu937Vwk2mQNfSzIs97iLMVRh9+S/Hrd+serboH6linVJ69KcCHd/
         /Oqxy5aSIEaKqPi0+ux6pGrxLj2dfUG26mC9fV50ckjTsi5P1WnikeMb4u330eHS1BxS
         SzYPKQU6KuloAzm96hR+lwTjjDij3OiUsw9obBWZkLpNOq25aazqmMty8LP40mJevCTc
         cs/m5WmNEpKMIRRM2xX7iU7EyXIjKIOeJkazuZENc3L+61EmS44yAn1ZWzf8XEuRIAwa
         sMmF7E7h7OvFKbYxzaYY7dhcFqnDa8rjXyB6sUJFLdTb2sxRbPX+kTsted0d/O5lFdXG
         4yoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747595; x=1787352395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKKz2G1nuzNgXhXUFfF3vwvghcsjQbA26X2bVCte/6I=;
        b=BAQ9hJ/Rm7wLdmYYs7rqzVpFJTxmm+W6PZWon0vbs0w62qVSNFGkuU+clv9Vph8VJQ
         /8xc+71577p9T56kuO3grGypnzT4y6xbsMXvdxyLWMRxBKtt1QnxPulsbWlocsn2kaSo
         gWmQpZVy5ciCQP7+bbTbcplvV2bea8+LOR84vZob8m4owLo+YZ1pEc0R/uI76dyEoctA
         r3F11VIvaJP2PwbCB6hiDntq/BfkoQVm4duEXAzq8uuZOy13b4GKU1L8EJMk26ioEdPM
         LqdKwa3xtPA4u5qOb8QPyz85UIyu9kaXz/o0rAsOhMzFQxUeyjWp/eKmPF8hbRyIaQ1h
         L6KA==
X-Gm-Message-State: AOJu0Yx2er4vSY2Tn45O8ZPJ7L5WvS1s0xA+n44GdZA5pF/rwrtFXaC/
	OQnIJAgBTeGatwfNFSAmrG+qP1FEneFJaybFbbumCSeO50i1PWu3qlAB0DQO68Y/
X-Gm-Gg: AR+sD10Ut5BE1iYtJY9S+qZrGzW5uS/yVGp07wHvzYnrYUBV92hui8Wyt9Qz/WN7fc/
	sThUeSPoEw48RS5wOOWWjLMkQULATskzRVAoSolxZusb9YOQYuWWbffMnDr/uiXmQYDQ+urPYGy
	zs+IHUmQvXt/6CMMllvZZrM55U584c5cOkCNbr8ahIxI4Uq+29WTGA3L/bF5y1XlCJL5KUc7/Uy
	PmScppSt7nH4QzKr7LrkLZWDrYZAnmtVc9M3bgU5tQ5UBGfpQAF6cGIrcuvEoY9CMcIvZoXyQW6
	vYRbe4NgdkAQvQ3Nyns+wtPhtNJ62BqD52XCx69V5CYI2yqaZvUV4Ue40V0GWf0Ci50bRPo3Jkb
	2Hkzx/O7TSbV2DA11n1QOXOae2PtBpTgevp8ZyfUWD7dOgWmWJt6GslIErPN03J0JOjoHoVoDFG
	2lUExwAlt8CjQIVddf1itgcZtnmTC24zPqbfLxzCm27rlB7AYtLkbYDgsl5E/3VYfK9AEu2yszn
	YX7/uGNJvF7hWVvc4+QDiSZlAbKI7lyv2/lm128+jvEaK3lhgQ4sRdg4qlNrhdx8wFEskhiF+rS
	p77DxutP1axugrRlupwkUyeCUhsHCNGu0No0t4uejwjX4wBJpEDuQvyNrHRt9EVT/qB2RnhxqmV
	J1ZQKhwlMRViQkD0hUNpKPAZRm+27pELy/QV4n/aiMJGJpQ==
X-Received: by 2002:a17:90b:33c6:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-3933b96b54dmr9441389a91.15.1786747594720;
        Fri, 14 Aug 2026 15:46:34 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 046/109] mercurial: upgrade 7.2.2 -> 7.2.3
Date: Fri, 14 Aug 2026 15:44:32 -0700
Message-ID: <20260814224539.1523174-46-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129110

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../mercurial/{mercurial_7.2.2.bb => mercurial_7.2.3.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mercurial/{mercurial_7.2.2.bb => mercurial_7.2.3.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.3.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
rename to meta-oe/recipes-devtools/mercurial/mercurial_7.2.3.bb
index 99f54b7627..8559d2e40d 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_7.2.2.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_7.2.3.bb
@@ -10,7 +10,7 @@ RDEPENDS:${PN} = "python3 python3-modules"
 inherit python3native python3targetconfig
 
 SRC_URI = "https://www.mercurial-scm.org/release/${BP}.tar.gz"
-SRC_URI[sha256sum] = "f2ec8e7eeef0500591706d374555f0ceb118822068e75fa3b32be07dd2184f6c"
+SRC_URI[sha256sum] = "1cb74ca95da021666b5a94a9bdc62f16255a6452f5a84cc2ae71bda8c7dbe36b"
 
 # Constrain the version to digits-and-dots, otherwise the auto-derived regex
 # also matches the X.Yrc0 pre-releases in the same directory and picks those.

