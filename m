Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FC9D3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:40:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10702.1765294798820602215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 07:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K3Jd5Hpw;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so58768565e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765294797; x=1765899597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOSoSCvqY+rWlNqpBh1u40LA8q6mZpzdITV1UP2Bt7c=;
        b=K3Jd5HpwUzisXgwo1YCTGwH4EcPEcQrp7wakXpvyaWWMDKgk7C49jNfgvGqtkwbjNm
         b/7HrMzKRsEDZD14xDVhawrB0vIvpfZP0Vkl+Q1TF2RgLGBQwlXAw3JLifCgT2jgUSvc
         VOfLb/gHDk1YOk+iJFAcFbG2e5qEekHgYeBPMwWeYBysIGQWPfz/HnCxq7WQMY5edSd6
         obMAp6BzwzUvdmmkMrB8ZCk4tjwJoryPSE+MJrFsE/+Xyr4Md6EJ/B3jyeme+XfdbXbh
         zKSM4GLPBeKQpJwgb1O5BX7PqzPWTtmSulrzn5eoQBjQhgGj1zy7o0p5luAmUfVx6J86
         QweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294797; x=1765899597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOSoSCvqY+rWlNqpBh1u40LA8q6mZpzdITV1UP2Bt7c=;
        b=M7q0d2Z+fy6FYmkpTBFnA0JxIEdMqY+MD/wP9aOAAViN2dt8+tnj4KcpjIm1xxRE88
         ZqGHXJDG3iOKhAPPVmMuW9evSbe5VZeGalC6hfGEfSWAPFcc3bQGDybFOJRga7WBOV9G
         wIawDDdvc7z7nJP8q3qQiWlv9L9bDRt0Afm/0iinhIPP4NlnK1Mvy9usFimUT2o8/96s
         bcfVl051GO7yV0V++M4zqUOtMPPXezfReREvIMzif883AwgDS5crZeI0NfHcfrTnOSbN
         AtZaG2x+LmJNJSlRWBO/QSGdKscsn2RTCEnCilZOBujTs41DuOOZoTwxPIiBizpGY3kW
         Gv1g==
X-Gm-Message-State: AOJu0YzYvOmuTVwaG84IHCkX2gOFdZ7QoKSdGpzHffHi8NBYaXlzBeoV
	pUed9oQp2TW7uzJzcPtnB6rIOm2QQyawSmDhOmElzLA+WfmQnE4a6H/FaPIzrA==
X-Gm-Gg: ASbGnctFDbMoTAbCOTaAPWRBfYVCTh3QaEHpsODTTtziNSrAGpLlkkiS9lC43XzCEIO
	zTyWwy6i8fHDCppjzBKSJb7hhiOGmqhqPN5wA4D5Xz+CiWIHmLWaOGygUoplqgR04bBB7v5s8cS
	uXAfrVTxzZuvMAFyisLu4ym2m0yKXTqCK05knZxcVCjYNb7m9/KS4H7SyLRtrqet+dqoMznQn+J
	i+F6823G/bUlM57hHbT1aTJSN7KEN/egTlB0oEi74jkWfJcpS0vOiQQcLsUps5g0hbPKB886vAK
	TtGeVYxFrLF0m6Tk2MwNrkePuwVTQcgLPTZ1QMEMAUbtKFeJI7Ww/A6Zp5za8eydP4ZdDkxaOJx
	BQ0InwmmEAyE1lXYTIJiNpB2jOrtz1JpplmjBWQC+LBMzVogefEpzq9fWJi8Ip8fzxZZGDFvoDt
	oPxyEA55Uf
X-Google-Smtp-Source: AGHT+IG4LWA2IImHUc0VZOnb7oY2aRoYTAlXg9QfR+mEM65bRmwS4nu6pl+3002/ftjCuZ39qb53Aw==
X-Received: by 2002:a05:600c:548a:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-47939e45f7fmr106465675e9.28.1765294797083;
        Tue, 09 Dec 2025 07:39:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d632cebsm46375495e9.7.2025.12.09.07.39.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:39:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 5/5] fex: ignore unrelated CVEs
Date: Tue,  9 Dec 2025 16:39:53 +0100
Message-ID: <20251209153953.951218-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209153953.951218-1-skandigraun@gmail.com>
References: <20251209153953.951218-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122464

These CVEs were filed for "Fram's Fast File Exchange" application, which
has the same abbreviated name as fex. Currently this recipe has no historical
CVEs associated, so I couldn't set the correct CVE_PRODUCT. Rather ignore
these irrelevant CVEs explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/fex/fex_2511.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-devtools/fex/fex_2511.bb b/meta-oe/recipes-devtools/fex/fex_2511.bb
index 9c0748ac63..88dd48f953 100644
--- a/meta-oe/recipes-devtools/fex/fex_2511.bb
+++ b/meta-oe/recipes-devtools/fex/fex_2511.bb
@@ -54,3 +54,9 @@ LDFLAGS += "-fuse-ld=lld"
 
 FILES:${PN} += "${datadir} ${libdir}/binfmt.d ${libdir}/libFEXCore.so"
 FILES:${PN}-dev = "${includedir}"
+
+# At the time of writing this, this recipe has no historical CVEs associated, and couldn't
+# find a CPE to set. So ignore these unrelated vulnerabilities.
+CVE_STATUS_GROUPS = "CVE_STATUS_WRONG_CPE"
+CVE_STATUS_WRONG_CPE[status] = "cpe-incorrect: These vulnerabilities are for unrelated Fram's Fast File-EXchange application"
+CVE_STATUS_WRONG_CPE = "CVE-2012-0869 CVE-2012-1293 CVE-2014-3875 CVE-2014-3876 CVE-2014-3877"

