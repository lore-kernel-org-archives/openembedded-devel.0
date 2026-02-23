Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D3BEC1134
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2740.1771874337172661838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bVKZ9dEL;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48378136adcso28526505e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874335; x=1772479135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mZybY8ejKUJzuWmzbVMLFYqsVlFSkCmeDmW32np0/A=;
        b=bVKZ9dELbyQkIxMrRkcXJKIRR7mHpbIMlBXfVNAlit71Bgnwb/5I4ggwrHK0QtifP9
         AnmC5Ky9eJhJrGCL0eJgZY50EX7JFZSW2TGU6MxsenDnEtZLx0hVBs+REqrEh9pNfTU4
         Yp1dcf0jSISz4b4hhQv2M/1yv0mc7cRV4eaqxi6aRMSPANI4kusN36X96RxalCYUxTPH
         ZPwU1cDN2MpI1TA0Dmz8Br/20kG23wZJQRm5ksmNQR5YX0zkWbcc1KCvInbNy/pcSZIb
         m104OE2GYFICFe+9HKvhxyEdtRll1JIbat+aJCyiwYrRzhX9z+ksVxL+/Tak+YOKAQU8
         WuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874335; x=1772479135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0mZybY8ejKUJzuWmzbVMLFYqsVlFSkCmeDmW32np0/A=;
        b=PfzyJgNJR7RY1UB6AbmRNcURfp9YyIEIMoB/AotJS+cf5dyDsaRrbwNYHoIDKwaXT/
         d4N3kOA/AOmYhvMoYBBuwgPtApEXURL2pVF2mTucs80TqEfsoS7as+g9itDwTGymO0Lq
         VUAmdEHN4K99+h1DeAqQ5V4D0NNLbTuUNOlERlbItD843VD2sdPp9mwryQOi+VEgKgXQ
         rFlN0Hckfmk7doune5aRy4R2s9bWdJt/Ssg7XXwJ6MfQ1cs0jTCqA8bxhe5Kn4xrdGXI
         o0/liVNrSecUnglhvL9mpGuqgyamOqWOXui1mSVAPeTUtpqhNmnYXWyqG21MFIQfbudJ
         n79w==
X-Gm-Message-State: AOJu0Yzv1n5eEtTvAz48w7L/7FAoI25WiVdnspainguqFWbbIAV23dyx
	XpMSHJzPtkqycfITP8XhcVZSz1YiIF8XcTJp9Cx32iCbyL9+sufhD9kQcmdj0A==
X-Gm-Gg: AZuq6aLfZE+9tWS3xOsP+ri+uzbVwWAoEClQKGMvRPdK03BLAd7Qna8FGfrez23R1wH
	polAq+O8L2Cd10gvxHdcG8l97L/+VZJ9AgBK/xpxgaPER7uNE2cl68Zi/0zy5G0ky0jF+s5whr0
	aot4XBcBELEXVolV58eNOTpvlxM54jn2YZEYAfe1k8bAOJP8EmnLVVzAGcjZQtVtW08pfDizTaZ
	MtkfZy4xPwhjvANm2/cw3g7CNmB6VBJ5LfhRMSYnUTeF815eQRqLtbmT8crKdXulwGY3VRd1URu
	Y8pA/b4nx/kC2foUr/PJtxq2oI3+JTFQTPRACRaFhii6p8BB5hf+Q4unByNF7IvrzSo9adab/kd
	NAtR5uHB4foh6txmj6uHTAtM2xMwyJ3+LKupvbEfzOkJuMLKZgTR9I8gzuynW6fj33f64wyHxIT
	qqUPS+fG1dL0L3L7FG2HB6
X-Received: by 2002:a05:600c:8a16:10b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-483a9d95306mr101413065e9.3.1771874335459;
        Mon, 23 Feb 2026 11:18:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 06/13] minidlna: ignore CVE-2024-51442
Date: Mon, 23 Feb 2026 20:18:43 +0100
Message-ID: <20260223191850.1049304-6-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124560

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-51442

The description of the vulnerability says "attacker [...] execute arbitrary
OS commands via a specially crafted minidlna.conf configuration file".

There is no official fix for this CVE, and upstream seems to be inactive
for the past 3 years.

The reason for ignoring this CVE is that the referenced minidlna.conf
file is in the /etc folder, and the file is not world-writable. Which
means that this vulnerability can be exploited only when someone is
root - but if the attacker is already root, they don't need to resort
to minidlna config-file modifications to execute any command they want.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/minidlna/minidlna.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
index cb2a1865e8..0dd297098c 100644
--- a/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
+++ b/meta-multimedia/recipes-multimedia/minidlna/minidlna.inc
@@ -43,3 +43,4 @@ SYSTEMD_SERVICE:${PN} = "minidlna.service"
 INITSCRIPT_NAME = "minidlna"
 INITSCRIPT_PARAMS = "defaults 90"
 
+CVE_STATUS[CVE-2024-51442] = "not-applicable-config: vulnerability requires root access"

