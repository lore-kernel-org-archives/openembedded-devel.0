Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFD2FC9EDF
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 09:18:35 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6191.1772875111589699390
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 01:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U07OA1SK;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483bd7354efso132275045e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772875110; x=1773479910; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OTasFzxLwinCdkxKU/8THHDzZlnLgUV3BArGi2rMTKA=;
        b=U07OA1SKNu8IoFjY5Hh5816GPXuDXqAUvN0z2M/NrWOpZ9muvLNe9glo6e3rOZRU/l
         6tvE0N7Zz32wFTZf8FMQjG59lWJeSv62FwU+9sl8BqO0nscVm0HGfkkbPXT4MkOBxsYl
         SiVUmAMFnF1lnyT/BJKbVd48qucv5D6uT2Twl7Do1l4zF6HkKqfx23rYWg6SbKblVjls
         l9FQuGkPnTBbk5h1tiZEzgEVy4hJz9yw7bDxNNWlAFmy9Sg+V/X0ZIG3AzKvzxwYDNWn
         K+1K6hWPIPqTPnz05DHmTVnCYzWzHXTYcedZhGNd5mNyUshOFD1khZozCIKyPNRrG6CZ
         dbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772875110; x=1773479910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OTasFzxLwinCdkxKU/8THHDzZlnLgUV3BArGi2rMTKA=;
        b=n0pv1fVvxbmOV8nAK2OK6/BzPEKM9ZYHkP2U86rMxM+0ICWeL+Vl+HUAGFI2OjYU8p
         8AUdtGVCXegNMCZzKmdGYM3wl1hJyiJqXTflxxZFO9tHz8gumocDZC9zEbqFFopv60N5
         b6OkthO2/n48tUDGDSDIBTTT3iwya6dPN7iafEeh6uTUHyEVEOOWTK4y+vKJDBSD4ePD
         qVcrzOsQ/thqrgxvwpdq5aIxiGoxOy/jDOC0jPc0qzn4Nlr9PstzNSqqv69FWYPKrExY
         6slO/5WIypuzMSnOaP9VW3ECxeFJbkqn3v7gVaNxjJ/Py61qa7af7WOLbn8hUZAyXaBu
         Fw/Q==
X-Gm-Message-State: AOJu0YzQbhWHv7h4D8R0mnq2BhahLBm/b6jcdZloCQmZS2/PVILG/6+d
	ViV/kQ/SlsPlIvu8s4e4ovQXJGxyjs/UvKFAToBPv8s+gQa2xeAgwpZpZGcWZA==
X-Gm-Gg: ATEYQzzWCMZd+RrW36mv5w61Zpi8LX3yHOe8e7n+qFr1Yf3+DQ0CpzzadvqsA99aWNi
	khyyDG/+KTokBTrV0WWQxaJrzpIVbQOJuyYJ4Od8BWGw9DIU9ySfAb6OKDW71OXhg+oNlxMOQBo
	Un0mDHSDr0cdO/39FDt+UiOHp1yhpmOrG2SB+2+41H5ukV7vjc9qG8UvrVM9ZpLx3DBM0T3/Sop
	7KN4DdpQ7BLjgSQksRtOi0l/kcTJaPfcX1HFoHYPWIPC7YjTgtxP85k4wjSD0kLdDAkKCDxIelS
	KeP5ktDdPCp72Irp3Y+dsFeTpnTdjsYUom1kzWk1GoTpje/yxnGvQxr4f6zpi8DQ3yCNon/rbnl
	YrGzzbe7bwyYqNu95ZlM0GTEQjqlUvFz/kzZ5eNhSFfrp0XDkHLyEMlZyAy5nE243igM0aVC5kC
	AvsnnybuNiaj3mOgTBNERP
X-Received: by 2002:a05:600c:3b8d:b0:47e:e946:3a72 with SMTP id 5b1f17b1804b1-485269692e2mr81998085e9.27.1772875109745;
        Sat, 07 Mar 2026 01:18:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852381c61csm38353325e9.11.2026.03.07.01.18.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 01:18:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] wireshark: upgrade 4.6.3 -> 4.6.4
Date: Sat,  7 Mar 2026 10:18:27 +0100
Message-ID: <20260307091827.3928729-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 09:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124925

This is a bugfix release. Changes:

- USB HID dissector memory exhaustion. CVE-2026-3201.
- NTS-KE dissector crash. CVE-2026-3202.
- RF4CE Profile dissector crash. CVE-2026-3203.
- Wireshark doesn’t start if Npcap is configured with
  "Restrict Npcap driver’s Access to Administrators only"
- PQC signature algorithm not reported in signature_algorithms.
- Unexpected JA4 ALPN values when space characters sent.
- Expert Info seems to have quadratic performance (gets slower and slower)
- IKEv2 EMERGENCY_CALL_NUMBERS Notify payload cannot be decoded.
- TShark and editcap fails with segmentation fault when output format (-F) set to blf.
- Fuzz job crash: fuzz-2026-02-01-12944805400.pcap [Zigbee
  Direct Tunneling Zigbee NWK PDUs NULL hash table]
- Wiretap writes pcapng custom options with string values invalidly.
- RDM status in Output Status (GoodOutputB) field incorrectly
  decoded in Art-Net PollReply dissector.
- Wiretap writes invalid pcapng Darwin option blocks.
- TDS dissector desynchronizes on RPC DATENTYPE (0x28) due to
  incorrect expectation of TYPE_VARLEN (MaxLen)
- Only first HTTP POST is parsed inside SOCKS with "Decode As".
- TShark: Bogus "Dissector bug" messages generated in pipelines
  where something after tshark exits before reading all its input.
- New Diameter RAT-Types in TS 29.212 not decoded.
- Malformed packet error on Trigger HE Basic frames.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../wireshark/{wireshark_4.6.3.bb => wireshark_4.6.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.3.bb => wireshark_4.6.4.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
index baf3af925d..369adbe8bc 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.3.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.4.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "9fa6a745df8540899dc9d433e4634d6755371ff87bd722ce04c7d7b0132d9af3"
+SRC_URI[sha256sum] = "fbeab3d85c6c8a5763c8d9b7fe20b5c69ca9f9e7f2b824bedc73135bdca332e2"
 
 PE = "1"
 

