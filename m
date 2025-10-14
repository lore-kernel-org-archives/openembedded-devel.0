Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548ECCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:39:29 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.6677.1760474365849079697
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 13:39:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cJnuYgZ6;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3476638b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 13:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760474365; x=1761079165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q95GyYUnAjW6T8UQwPbCosN6A9n6Vql2qJbaRpCzDzk=;
        b=cJnuYgZ65WJeaebnSD5s4OE7eJ6Uz5Y6mTrQEuhs0xd/HBTkFdDYsoddNcPPtRXu2E
         juXhqNRjyGPHMa8IZQTITEFCSpF2X9k/PjP4ZwkyjUAJ0o/yEYspJZv+5y1zIrIgmdhC
         lrgdFwTbr1Xfp8G2L+Uj2/809hsVV+6ixmgozMxPC6nwXfZGHTcKbYYqgKWovKXSKHb1
         gsiFYG5k3qCZ6heElhWOJi0VJGpL+IC7gzJq7dC7p1HualEQ7iI5/BjVTCvd8xHPxb0Z
         /QUXdlZ3DgIdUFogx0je8Rb5MMcMZ4Cg3ya1TdzDimlu7cSY+RGURFQm3vuqBsEe0282
         6o4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760474365; x=1761079165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q95GyYUnAjW6T8UQwPbCosN6A9n6Vql2qJbaRpCzDzk=;
        b=uEruWKjnpFYAMD6i0r02B+NZiL/iZb+NvAkwj1lOGEbQSE5uZoJQtBxw+3JXYquqAY
         WRGzUYMWs5hcIs0pQVKH1q8FSWQtxm5QadeJ3jzPnBrxh+XqSrc/HMdYTILW9BNgtryI
         5ig6E5nGswMU7VYE5YSUj9/PJJMwt4eq4ctSFmhynyz1yCpyNxcSZnu3BWg86BxPYdZN
         haIyHArXlp/ALAeC7t8DwjdlAqmDR/MSRHlu8Wd0ye2CS2GuNL2pgCI0vg0h0EbR5uhA
         NT0mQBvv7QeQVlH/O4uRpz80pp4dPiybPBSdYdG9ny3XQ3O/6GeNB9DK2jiwK8N6BnmI
         Cjlw==
X-Gm-Message-State: AOJu0Yyb3g964HjaoSC6bLJ626DREjHqnapuZdwdytau5ihCXMOkXdZ/
	VZUdaRySMFebO1XiAguisMpSMSFmBU9yvwnzRAe6uVvKFaijpmkUdp4ytrlpaw==
X-Gm-Gg: ASbGnctFO0aKA4wbrdbUc26qAJtUVvKPHE3sOdtD6s3NWkxfvWGlW+ozyv/jF9hJ3Kg
	/TffqMw+GF+1g+txZD9JL+h80zRKpMvVKk2qFIfAUWw4CzXT1zZWTZTurDMnDd0l2C+nXKFqLxi
	BIFgNJGtLvcDYW5T7+440PdtmYVOBt6bxV8fDvofiri/aMlsXLPtV+NXQ2uhzXJFbAUPra/ASiI
	ZGgMg3GDic1jo4O5BPMD33ysEjROxem7YXMLgDYUROZfcO8521gWp1zEoSj5jmrSMOBEZ9suC7q
	WYzBlDRMPWgrAc9eaJSBfUYvVkGyAkGoYC/QikPvOc4jbw4W7Bqp6sIXFYNiOupkrMuObj+QhFw
	yO31OWsoJkQBvEserIYMXSb3mkLOBlZ22+iVTt0AEKGRKdLlykNTq9Eg8znjvOQBEaQ==
X-Google-Smtp-Source: AGHT+IFa1hJpQymbVr5YVajAVBZWHGMDoY/n+4vgWUKdc6z9vQ1Stj4ynQ5/xuL4bjDjiiPxZip7PQ==
X-Received: by 2002:a05:6a00:21d5:b0:781:1b5a:95b2 with SMTP id d2e1a72fcca58-79387a212afmr34056441b3a.28.1760474364971;
        Tue, 14 Oct 2025 13:39:24 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b733355sm16009495b3a.26.2025.10.14.13.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 13:39:24 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 6/6] frr: patch CVE-2024-44070
Date: Wed, 15 Oct 2025 09:39:01 +1300
Message-ID: <20251014203901.1479326-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
References: <20251014203901.1479326-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 20:39:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120631

Details https://nvd.nist.gov/vuln/detail/CVE-2024-44070

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../frr/frr/CVE-2024-44070.patch              | 54 +++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
new file mode 100644
index 0000000000..87bd16efa6
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-44070.patch
@@ -0,0 +1,54 @@
+From 335dc7f0421dc5b59a50795f21f28bd92ed4ef12 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 31 Jul 2024 08:35:14 +0300
+Subject: [PATCH] bgpd: Check the actual remaining stream length before taking
+ TLV value
+
+```
+    0 0xb50b9f898028 in __sanitizer_print_stack_trace (/home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x368028) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    1 0xb50b9f7ed8e4 in fuzzer::PrintStackTrace() (/home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2bd8e4) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    2 0xb50b9f7d4d9c in fuzzer::Fuzzer::CrashCallback() (/home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/.libs/bgpd+0x2a4d9c) (BuildId: 3292703ed7958b20076550c967f879db8dc27ca7)
+    3 0xe0d12d7469cc  (linux-vdso.so.1+0x9cc) (BuildId: 1a77697e9d723fe22246cfd7641b140c427b7e11)
+    4 0xe0d12c88f1fc in __pthread_kill_implementation nptl/pthread_kill.c:43:17
+    5 0xe0d12c84a678 in gsignal signal/../sysdeps/posix/raise.c:26:13
+    6 0xe0d12c83712c in abort stdlib/abort.c:79:7
+    7 0xe0d12d214724 in _zlog_assert_failed /home/ubuntu/frr-public/frr_public_private-libfuzzer/lib/zlog.c:789:2
+    8 0xe0d12d1285e4 in stream_get /home/ubuntu/frr-public/frr_public_private-libfuzzer/lib/stream.c:324:3
+    9 0xb50b9f8e47c4 in bgp_attr_encap /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_attr.c:2758:3
+    10 0xb50b9f8dcd38 in bgp_attr_parse /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_attr.c:3783:10
+    11 0xb50b9faf74b4 in bgp_update_receive /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_packet.c:2383:20
+    12 0xb50b9faf1dcc in bgp_process_packet /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_packet.c:4075:11
+    13 0xb50b9f8c90d0 in LLVMFuzzerTestOneInput /home/ubuntu/frr-public/frr_public_private-libfuzzer/bgpd/bgp_main.c:582:3
+```
+
+CVE: CVE-2024-44070
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/21cd931a5f9303e12104c72ce31ca383c0c57514]
+
+Reported-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+(cherry picked from commit 0998b38e4d61179441f90dd7e7fd6a3a8b7bd8c5)
+(cherry picked from commit 21cd931a5f9303e12104c72ce31ca383c0c57514)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ bgpd/bgp_attr.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/bgpd/bgp_attr.c b/bgpd/bgp_attr.c
+index 797f05d606..cc63251cc8 100644
+--- a/bgpd/bgp_attr.c
++++ b/bgpd/bgp_attr.c
+@@ -2718,6 +2718,14 @@ static int bgp_attr_encap(struct bgp_attr_parser_args *args)
+ 						  args->total);
+ 		}
+ 
++		if (STREAM_READABLE(BGP_INPUT(peer)) < sublength) {
++			zlog_err("Tunnel Encap attribute sub-tlv length %d exceeds remaining stream length %zu",
++				 sublength, STREAM_READABLE(BGP_INPUT(peer)));
++			return bgp_attr_malformed(args,
++						  BGP_NOTIFY_UPDATE_OPT_ATTR_ERR,
++						  args->total);
++		}
++
+ 		/* alloc and copy sub-tlv */
+ 		/* TBD make sure these are freed when attributes are released */
+ 		tlv = XCALLOC(MTYPE_ENCAP_TLV,
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 7c1691259d..ce9876c79f 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://CVE-2024-31951.patch \
            file://CVE-2024-31948.patch \
            file://CVE-2024-31949.patch \
+           file://CVE-2024-44070.patch \
            "
 
 SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"

