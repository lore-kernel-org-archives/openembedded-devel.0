Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.10751.1593562075232527944
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2020 17:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=V7iwBDML;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id k5so659103pjg.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2020 17:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XqcOE2ZO9vBhalNHaDPH/+jBp+wmXVdPzjAn7T0eNKo=;
        b=V7iwBDMLoJauvWL48iys1WSq2n/Pm2ha4W1DnVbc7X5y8VE4uQh1mAugq9ETNFTDR4
         As5mcSMgaQWL3CaYJHl3+Uik7nli+A2/n1ycnxfSlihajVPs/Z0H36g1sHkyZe5ni8ch
         BGtPH6jHu+ZUvU9yJTiUBm9tvnrO8+k17PiVH4xTNcCa1ind1qRiGrVVihfStpHhzOeg
         eQFJbDSVNQmjgycdZw8+K7xK1fHiU8zE7ENsuIcL2Wo6ANfkqGuatbzyCO5qRnn4gkys
         9+kaqgfbxVZm0V7h6CjHKGkE0krHCxW2vgvuaL/WyGEK/1947qLP3MUcbMr/eizicxa7
         dp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XqcOE2ZO9vBhalNHaDPH/+jBp+wmXVdPzjAn7T0eNKo=;
        b=XOHuFCY1pTwzx/fCcpIT+pvg+FYyQPnE3nZGbMJ+ihJniqFEe7DIdkMP4b9Mp/Aind
         Un9jb4cNuv6bG95HMFwoClbT0wsjVMxJ7liHxBAStAquSkA7DBYaZ1q1eRBeBYWRCyoD
         tqZOBW07eOExkXE26/3XYRZPEOJzQxzrEgYiCFaBazQOIyjBKyEBaAw5S6YwXAq7xmr9
         cRE0s1B0DutQWAHb9xpIC/9esy4KHg3fmi6xyzENfI4xeiZiDJj2i934vdBdO0LT+0OC
         Hyfw1QPqeFPVQEk5X4gA20QvdUjf/dCI0gn75R/YRQxwpD6vccnH2Pkc6fehT2HjysSr
         oSjg==
X-Gm-Message-State: AOAM532s1Llr9XIvyZP9UaoROv+C9iR27Ce2Gv+kkQtAo2QkNfq9HWI9
	E/Zt9RjQAhzKQHIxYSyMkJVz2Jc8d1k=
X-Google-Smtp-Source: ABdhPJwgzeJqWGog6MqM8cqJIE0N23ZvP5IpHPpW80b3Xofo5Rf3zSbCdeXHg90DAkoBlV6X1xxXXA==
X-Received: by 2002:a17:90b:696:: with SMTP id m22mr15454756pjz.59.1593562074516;
        Tue, 30 Jun 2020 17:07:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:c85d:3ce:5443:9164])
        by smtp.gmail.com with ESMTPSA id z2sm3940544pff.36.2020.06.30.17.07.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2020 17:07:54 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfel 29/32] openh264: upgrade 2.1.0 -> 2.1.1
Date: Tue, 30 Jun 2020 17:07:14 -0700
Message-Id: <f9776de3a1d0d97825ddcd2687ad54445ab48657.1593561840.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1593561840.git.akuster808@gmail.com>
References: <cover.1593561840.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

>>From [1]
* release x86 and x64 libraries for android platform
* Bug fixes

[1] https://github.com/cisco/openh264/releases

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 69716e959bddb3b56dffb07bc308cfb6e1e80bb6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openh264/{openh264_2.1.0.bb => openh264_2.1.1.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/openh264/{openh264_2.1.0.bb => openh264_2.1.1.bb} (94%)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
similarity index 94%
rename from meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
rename to meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
index 3c65ef2479..3988cfff86 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
@@ -11,8 +11,8 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
 S = "${WORKDIR}/git"
-SRCREV = "a60e28efe227ea8ea760b1e29a8943e371ebe4b3"
-BRANCH = "openh264v2.1.0"
+SRCREV = "50a1fcf70fafe962c526749991cb4646406933ba"
+BRANCH = "openh264v2.1.1"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
            file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
            "
-- 
2.17.1

