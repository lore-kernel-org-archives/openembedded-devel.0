Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11779.1795762889082522990
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zIocuLWW;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so12742665c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762888; x=1796367688; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TaM1hn9HLkJaeHNJCiM98ul/LcBpLlIT2XDDQJN1Cg=;
        b=zIocuLWWaejPdoWeCQhyp2Q3fPYqb8bZKt+Mbiq2ukRyQwwGhn29bwcxcQvkeUxVod
         0q531633m00Vixa7QY3uCEh1T9Wr+ZWXGdxvrWEubaKGV56JtUz445CLrrdb59uWKAtm
         c40/FkHGQGUM9chfoGuoE7XU37FcAo0g5oNsvAs3/F1Fx66ehZo9aHkhLC2rhB32J7TE
         a17tzyZwIAjFfwN6zfeXnjW0DV5HI+5S/Gq8ZK6l8rZjY6VfTrgTDIdob8qhYRgsHlr9
         xH3ouPCYCHUZT1E3LrBSJHuUbqpViP+STr8twiLDpCM123tOFeVpFdsC0yxNJUD7P8gz
         uTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762888; x=1796367688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TaM1hn9HLkJaeHNJCiM98ul/LcBpLlIT2XDDQJN1Cg=;
        b=J/qUqxKY0DZM32SdDREgS9ZbvZTCG2CTXlLXPZjhu6ut/4AFLkOCk6g/pa5VGLE0Ic
         hgLHNX/aBavaMumNAMv+NkjgsXnQbgyT75enmA4fmAcWs6GbBOcYtJxjp1GgW6IN4IgU
         CNRAAggMhYT6sBoi9Om/x5dc/lhCuQ8siQV0NgYgZxLilb8LCI+Ao0PZlKsSK9ih4t+X
         mI2DzDY6pa3/lY+D7DdHFagPSizX1AIL/fewMkOW5chXfSryHKsz8P5kWE/JFC3eNy+K
         H3+StvoG7+fXD0+A8JHGT2nVFLExNsKHh1gTIoBE67EhH4tn9jjmu8u/Ba2V8Ezgo3JB
         rqHA==
X-Gm-Message-State: APuU4Z+lHA6WYHpe1XZqQsqFhupRMrrXH++SPvM7vS+vW/RZimXXURTv
	lJFrMm+yNI4mLsS4DWxp8Zb355k/EyK8H/WHELE4G3wS0gglrrLQDeMH/yagECrf
X-Gm-Gg: AZFdTZfdv/NzxN5eY/fOU8zFIytBCMgDoLSA8BvNDn26LFNsUmp2wxxYJtz3jcNLBXp
	8eWVELwDK5x/SNnbu4ge5HdBuWgpSi+lqcgsvyXOo682i52PptRQ8bjvy3o8d6sCtWXxUlQHo3E
	fZQJGvlRLIAQEOAPQaL7F8qqKLs8NVv+5x3wU9msLrHrW5LrW7U25cnqJZGD111Sw4qjKBLsAdT
	ava9OR0oGegVTLm+vh9NHLRBPOxRjzWYVtLGOc/KTStZGSPZeskK9tuLlbeXifU6xHpXMTpqIim
	ZaAn4r5V/gssun6F/LoogeCzY6B14JtROH0heiVqBMeuh8Txm+VZCRXRGSI5VvK5wPrZYmiGZIl
	/wzoYlbq7KEYuDPlQvqmd9aXj0kcXOEzS4AJQ8MN49HlFpKX7ujLvefqzYxujxSIGiVQZmKAczz
	2t8TTofwz/hD+ii9fY0kvjbgQOwwA//R7OjyQsv/Rd7XtCba6U6qSSFqeR6dHHgBQdM6YqcYybB
	k+vQD8BVeJidVRP5nrvk0USDyCuEu6AAyFZPtun3Wg9rLFBZLKnVj6l/LZa6bC79amy182FfXom
	FpOIrt2kGD1TR6+jRA3vjUagiv1ncS7hJqDXMjN4OHCwYFC2OiQBoNHRBN8CpEtlPtxy7l8UwpQ
	/nJeQIULCz2e3X+7G4wnnL6C+kckbzY1qDbVLDIYjyWzUn+L+v5vsgNXMMsu9yg+VUXNVzbI7P3
	Qc4KLMDvUlYrge3InaX3l+XIvpfBV76svl+V9L2vX3YoXo/ZxRCK7DCD/1e0DePVkr2N65e4XT4
	kn0E2vZ72AopQXMQM5SlRsi6A/zqsogSQW03y25d2jm/dYqoGGIY5bQsqxkyXcrfTVhETnHxshB
	/WbKUQ==
X-Received: by 2002:a05:7022:4181:b0:1b2:42db:8a1d with SMTP id a92af1059eb24-1b5568c8f3dmr28764279c88.29.1795762888378;
        Thu, 26 Nov 2026 23:01:28 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm61309643c88.13.2026.11.26.23.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:01:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 12/14] webrtc-audio-processing-1: Restrict upstream check to the 1.x series
Date: Thu, 26 Nov 2026 23:01:10 -0800
Message-ID: <20261127070112.2273685-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
References: <20261127070112.2273685-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133317
Content-Type: text/plain; charset="utf-8"

The check reported 2.1, which is packaged as
webrtc-audio-processing-2. Match 1.x tarballs only.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
index 08104cbc62..c2aa5d3c9e 100644
--- a/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
+++ b/meta-multimedia/recipes-multimedia/webrtc-audio-processing/webrtc-audio-processing-1_1.3.bb
@@ -17,6 +17,9 @@ SRC_URI = " \
 SRC_URI[sha256sum] = "2365e93e778d7b61b5d6e02d21c47d97222e9c7deff9e1d0838ad6ec2e86f1b9"
 S = "${UNPACKDIR}/webrtc-audio-processing-${PV}"
 
+# 2.x is packaged as webrtc-audio-processing-2
+UPSTREAM_CHECK_REGEX = "webrtc-audio-processing-(?P<pver>1(\.\d+)+)\.tar"
+
 LDFLAGS:append:libc-musl = " -lexecinfo"
 
 inherit meson pkgconfig
