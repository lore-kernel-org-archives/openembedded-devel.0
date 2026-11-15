Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10706.1794762015199022327
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 09:00:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hCuKaddz;
 spf=pass (domain: gmail.com, ip: 74.125.82.48, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1aefd1bf74aso1978937c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 09:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794762014; x=1795366814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf8nGvlgjIHRRiH+CyGZdbZrebgX8lavKp9iZ/21VEM=;
        b=hCuKaddzP2M9wqsCUU65XM+xGZInxkkEkiDVbvuRBHCRYdyPNbbN/AryzD+gIsvECj
         pgmKXLUX1K/gKHI7xULzVz0Ttjb5g1etWppUmb0Wpu1j5A2gj6RxiCjG0LFKrFJJWbf4
         IpQL/Ofa35eZMMapr7/hIWEmRLuizcz8MJUg795uIz7YlosZNDp0WtflaQawn2z6uAfY
         MEUd45HmAiyqAUOBccaizOg9z+SwpUXeRHNlP2futsvbA+xWOLtqbNZuh4EGpAlz4fMl
         d9EsDCiV0yQFc+OlJQO+Up9CUKu+8KEt5cCr5BAM37ZDB82iecUYHe/fWctWvayldqw1
         WlsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762014; x=1795366814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf8nGvlgjIHRRiH+CyGZdbZrebgX8lavKp9iZ/21VEM=;
        b=qZAxOaodzV1RWiiFXyD110T0IvwLvF6UKubuiWJnf8qeyInMeQ9MPgnCqykssvGArU
         AbCUnRlF+jeeaFAuIjU2YmN48pCvbiefNDuG+DvXbnWk9BjTxkav35XlgzVq3uIma5gC
         3gRj4B0a63Rfamd3UpdLfi6che+xieujukA1L8Fv0PTt5JdVXqLWQsvgdxNR9u7UPnrT
         7K9lq4U8av16foY7KH5vQJTkUd9SeSaidphJPzIGazSPS4CbU5f4s74NXorKzREyVX/x
         1JqRUAizY8tZaKhbgnAV99CX6p6xpyja6GmHCgJfed5aE+MX2NF3J+ciYk/SlsMQOldQ
         H+TQ==
X-Gm-Message-State: APuU4Z9OKQVtn9ExEgw4nDpSEvNOtD4dU77spDCTw2E+nqp+iu3msHZi
	3kMP/dhzajFcgktEGP5KcpkyLcBubQI2lKBeTqzkJv61T+0r62Ll1LZQXizVv/hF
X-Gm-Gg: AYBFou2+aA0fDo+BRZ1kxqZAKu0Z/2Hh7TwwlNqKB4HNrLQ2Esc+F4u9xjeaBOm9zIo
	z0W7RfjTVhvkR5uzsDD/wg9zdY5NdPyxaG6+NCkx7NSSW8KNJRabZCzzjF8GV4uz2s8FinGngW7
	DK1JhVtWf7/PM1kthQCYPSga42KXBvDFVWRsVykP1LGjYt6xIVNeJEZ80p1Vq5mAsZquinqZ4pz
	2rePjXstez+/vc5EScqevH66KyIL7YsXIkmKjK2GMDGH1+LbS6gJQwDKFu6M2mi0VdqsVCqhtP9
	0rfqAb4l9akiQipNLM/lPt1oj2JXh6YVPh3mUsX+XrUdZ30HkSeiVal9sTFFZvqcXCiW6RxIBVm
	jXG1TFFARMQuN3KTymqC3RDo6X/0AlMEAXl5bpJsyRLTxF76uk5qdxe2V5pg2gwj3HmqkreSrZg
	ViE7tx8olfKDwTMNch9JNT4aC0F7Fz2euvs/1T6oC6JnoMIXDdmoGSIUPn0JNN7rtVZNYE9bqhy
	zi+QPS7w2RCIcHuwfonp0GbhH7g4RFM+A6rtB3eIAiSIpXoI0x+beqYQwvTleohiL2tuBSII2Ph
	lzDHhVntcPGfPwQ08Y+KJqAPu1ZO73q3j3lYwdbQAIOgo5q3HjbvC92iOW/+thYyLlAbdBYRPSz
	59hmMWJ+uTH1eaLD6bLlqeH60erEzcU4hhlD8DwxmkCaoxefSbw4f8dGdSOvqHTPJxywmZlDEbt
	VQ+I325zF4ZbRHGvraCX5t6Xz8u7FmUL1A0M7SDfIuwojm8buC9aLcCxIfxhmRL+CsxdtIEAmpo
	KPL47FP2aIZ9d0y22CKrC0dtnp11agENibqGXnlTviWRuiH0RRVTAIEogoXxI2YogJIXKUxwk/D
	uMvI
X-Received: by 2002:a05:7022:f20f:b0:1a9:4d51:8c33 with SMTP id a92af1059eb24-1b5030b1230mr8467149c88.18.1794762014275;
        Sun, 15 Nov 2026 09:00:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm29442397c88.5.2026.11.15.09.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 09:00:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 10/15] svt-av1: upgrade 4.2.0 -> 4.3.0
Date: Sun, 15 Nov 2026 08:59:49 -0800
Message-ID: <20261115165955.3485789-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
References: <20261115165955.3485789-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 17:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132376
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../svt-av1/{svt-av1_4.2.0.bb => svt-av1_4.3.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/svt-av1/{svt-av1_4.2.0.bb => svt-av1_4.3.0.bb} (88%)

diff --git a/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.2.0.bb b/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.3.0.bb
similarity index 88%
rename from meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.2.0.bb
rename to meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.3.0.bb
index 826928fe4e..771d7b4c95 100644
--- a/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.2.0.bb
+++ b/meta-multimedia/recipes-multimedia/svt-av1/svt-av1_4.3.0.bb
@@ -8,7 +8,7 @@ inherit cmake
 DEPENDS = "nasm-native"

 SRC_URI = "git://gitlab.com/AOMediaCodec/SVT-AV1.git;protocol=https;nobranch=1;tag=v${PV}"
-SRCREV = "9292ec8e32bce26f781f277ec8739b53426c4300"
+SRCREV = "e3d63405f9ba8219913a7276c2c47d10e5d022fe"

 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"

