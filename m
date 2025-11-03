Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABA5CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 12:45:31 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19511.1762173920758124878
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 04:45:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=D5lj1OIQ;
 spf=pass (domain: mvista.com, ip: 209.85.210.176, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so943488b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 04:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1762173920; x=1762778720; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QnPHaheKgSFbI8dWfV42aW8RFKvFktLrSeYtINhRYw=;
        b=D5lj1OIQW/vSAfmv8TExm67rHwH/dqHZI/C6h1bynfFnGymI3N+58O0CqHDVya/s3w
         u9t3iZzheTv6STRdXMtIVMH0ahIVyv4PE+82x5c3+4pV58saWuKvY6MAwL1NnQGDu9nU
         S7ABkc8MNFnzEcR6GV+YiTnmbDVsZnnns93bk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173920; x=1762778720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QnPHaheKgSFbI8dWfV42aW8RFKvFktLrSeYtINhRYw=;
        b=prmIg97DvHzD2cbHAsqPPas1Rgrp6QiBnS74rEPE/G7oezImw0+msejmi7Lr6iDmkJ
         lfSm0mWc1Ioi4qG/qOZf6hsk0iyYN8bajGirxCb7bftgV0vOXIeTmwb1hhxETbX8tnpA
         tDJTnEeH71k499nR0alU3Bv5pqRP7h/G0x45VSnjoziGCNBbamWkJk1syQt6/eF0+8Ns
         NvmgbMxb+Tar8pSZ4ML4GcdZx6W/kKEJNbuEBwqShxZrlfXdH/jYRYkmAfLpO2rsa9Mi
         TEsyBex7Y1SFCaSc5H905M/wfyOVI3wUYxvwVBj0yNKyc/YOKsP9HRPFU18uq6XxcYKD
         OKJA==
X-Gm-Message-State: AOJu0YxZo5O7hpm7AJeWw5CbxdpR8rlmd0L5xlxHi3IKnZG+8zSFanuG
	2EHd63pjTXYJ+jBiquFxxXaSCKTxuLmCjQIQ1heBN1n0VOZ/wykjWXdITvryq0Dk4k84hciX+nw
	C7JeWMaw=
X-Gm-Gg: ASbGncsjoaRC8fa/KzV/1wYzUHYn31hmQVmu2C48Ml+u3ox/2fvgtTJhzS/4Zj98Tn4
	2idbBpLI1+YhcrBBF6MIOpptCpmw8l1ug/mcRfqeyClsKbg+s1RXfQxhyWIiXyxXJU78PfA9xiz
	Is+G+vO9WpNpb+KiIN0WJ/IVBkPLJ73yJh/4LFYLoMTJpuuwC7d72eiVqTEGip5ZUmIFTrfpHQG
	4PqoO3uVyKPFTFrUFfpiPEdwdztgsaCDDCzInwiyXQV2XYe/mdKUFDthFrPrXht7YvZ/YDtMLib
	3UpZk9udmM7onjIxFIF95YBDmwhe0ye3RsdL3p26wry/jThXG0l+jkh8lrdSkv9iDSNtOcw+mHc
	uAxaAZlwKsd8XydMuum2r4mfaZznWlJ2aa1Xr7lxz9D/cwS8hgt2qFJ/rUSwb4k2H6d7Px3HUtW
	6PRg==
X-Google-Smtp-Source: AGHT+IH6faaCILdgRjgdHnBu4mOT6HiL+xEXYt6q5N9mz/DPxhUeWstEmiN8GhsY8JWtP3uB+bKETg==
X-Received: by 2002:a05:6a00:3c89:b0:7a2:89a0:92bc with SMTP id d2e1a72fcca58-7a7796c4ac4mr15308006b3a.31.1762173919687;
        Mon, 03 Nov 2025 04:45:19 -0800 (PST)
Received: from MVIN00352.. ([2401:4900:8fcc:e57e:9b81:ad4a:f564:be77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7aa2819641esm5454076b3a.26.2025.11.03.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:45:19 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][patch 1/2] wireshark: Upgrade 4.2.12 -> 4.2.14
Date: Mon,  3 Nov 2025 18:15:09 +0530
Message-ID: <20251103124510.40771-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 12:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121270

releasenote:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.13.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.14.html

Includes security fix CVE-2025-11626

Link: https://gitlab.com/wireshark/wireshark/-/issues/20724

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.12.bb => wireshark_4.2.14.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.12.bb => wireshark_4.2.14.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index dc987e08ac..6246a1d9fa 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "6ed51da5f6638aba609be8d1d64a7a85312749a49261146c391fea391a3e5f06"
+SRC_URI[sha256sum] = "098177f021951638f5bdca5b01f284c14fcc3f6c804f7aa2ca00fdcb99c7a166"
 
 PE = "1"
 
-- 
2.43.0


