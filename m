Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BB2D77888
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:02:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.122.1769187754519695843
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FBvvKmha;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4801bc328easo27954905e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769187753; x=1769792553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIcPUPA5ewHW3FVc5dtfnr2MFGg8ZJ1cRTub1dMXOTA=;
        b=FBvvKmhavTTieQls7Yk7ONcXi02sWY5KVAcJ4QAbQD+RTCiAJIQlXo2kw2x3znFy/V
         e0rwvM81j1regp3VvQldTDjmVjgxikw+GKVoHCI8EFDXzMrsZPfjkW8HZmx7wri3ENCP
         jkEffkI4o+8X1EY0amSHV+r+DMTf5kZvm5brGJTKTp+I8E91X15dceXDS6cS35+dOLEH
         Qql/PdRN2R7Om8QocGLiQ+chmY73seXvCuAtTGRx1c5g3H5KbjH7wRTcpuP71U6aTBP7
         KgWpNw8gZdfFS5bWD5XNkX4RGAMTTa0rDScq/PkNUtyo5uhUdHF2hUraPbOavAhSsE47
         u8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187753; x=1769792553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iIcPUPA5ewHW3FVc5dtfnr2MFGg8ZJ1cRTub1dMXOTA=;
        b=Qo3Qv5/zQ1/xrNYExRApqZdv2C+COQwyvjIY3IPzmGwLz7wdnlfwEpZpOo2C761roj
         cMwKvQgmEIviKRpdzrtFBbwpXQLRDtDSAPUmDOdzetDHsQfPqxqG2rqVH+wFfHfHAU+h
         F0PQi/QZjoVr61Djv6D/LUm1a6im3uhN7Br7LPqOnj53P4VhRgeDhOVrbjwL6ehsDHqy
         FF7N9zZ57fTEyQ7bx+Z+VTMGSwHaqZ0afX9Tk2Nn5+0SR6ewmFwn/ZTcWo3/t695eq0i
         c+KygpDr8ibL7iZLWkkshZo+bWtD78QaLX3+RMldMtvCZ1++CMbAdxG3s/MTaFYo+UTE
         PBgQ==
X-Gm-Message-State: AOJu0YzYyVEEqC6Y0MLLNXfPqKvuNpDjDzzV/Kh0Wj0LK+TW+jf1N218
	oNd9YnXxG78RXg4iTEjG434q0dbP1770tQxUnZKCdXJ426qxSd7z3bXpJAzgJQ==
X-Gm-Gg: AZuq6aK/T09u2YDuxINpms9oE6L3k+tglk25/l4dHAoFfzL6OApOSe4Sf9+t2CEYoC9
	y+ZAj7YavZkFpn1BSQymPOqJHOMTeAX96bwZG7E8P1PplwkgTRtmng7IRIBexVvROsqiQbEHfUS
	OInEi6Yg1+0ca5t670ibAI8UB7gZrtGd8koB9yNBh4Parg+EbhMu2uEzfjPBxA/cHw6DaaWAhID
	A1/GNwrsfTBXiOnQSvnZd5422W90wnpuWfH3NRetzSaEAPb3YkV7uvGpwOT8pmgutIhVe/xB6+h
	siR8kue1U5HN+Es2MhZKacAW3IfmxVOCgHLmbRI1uqiRX21/BSdcykYoqscLV+1xuf68hFs71GX
	2eyjmx9S9qnmz+j4sj6S0IrJ9d8gUErAK6QRLfmgrCJwfAQ2tMB8eubLHvYoClxZ6hn0fMI/puv
	kBaUDlkXrZ
X-Received: by 2002:a05:600c:609b:b0:47d:403e:4eaf with SMTP id 5b1f17b1804b1-4804c9596bcmr67030175e9.10.1769187752671;
        Fri, 23 Jan 2026 09:02:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm25455165e9.17.2026.01.23.09.02.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:02:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 10/10] libmad: ignore CVE-2017-11552 and CVE-2018-7263
Date: Fri, 23 Jan 2026 18:02:21 +0100
Message-ID: <20260123170221.671471-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123170221.671471-1-skandigraun@gmail.com>
References: <20260123170221.671471-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123795

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for mpg321, not libmad.
See Debian assessment:
* https://security-tracker.debian.org/tracker/CVE-2017-11552
* https://security-tracker.debian.org/tracker/CVE-2018-7263

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fee86a312fbcaef7aaad66fe2f6756bd7e57d585)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index e70c8e3ed1..060fde0403 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -34,3 +34,6 @@ do_configure:prepend () {
 }
 
 ARM_INSTRUCTION_SET = "arm"
+
+CVE_STATUS[CVE-2017-11552] = "cpe-incorrect: this CVE is for mpg321, not libmad"
+CVE_STATUS[CVE-2018-7263] = "cpe-incorrect: this CVE is for mpg321, not libmad"

