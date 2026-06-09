Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B394CD8CBF
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:32:43 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74583.1780993953222877137
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:32:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QmGL/NE9;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36ba0ae0daaso522315a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993953; x=1781598753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7ZZCdKKvq3+XPt8ecj713zNrLjMOk+mZNXf2m+aFKg=;
        b=QmGL/NE9Bj9BKI9SnRyzoBBUA08cixPcsqiwf/dUpOLxH9/mBmR5KonkJDI5BFid29
         A0IOmetaDxlmi8m4cQBi0mT+vUPnyCgaNsQN0067M0h1QAszQo19GwXifSEaMYoPrzZ3
         jllWgJoW8kZrV/K28pYeFRwzpbu9kYHZvr3nxMVrue09fp7Y4jJiQRqic7QhVGvdppGJ
         arcBlnzC3ZcVJqMG6skqbBNXerPtunvBvpucXXVqPZwRAOnqgzqpKHQjWxc9pvTD8eo0
         NUPfRyDrzzd8a1nxrkASQUxExtKRPKgTX/odi8N033uNF7Mlg7aV/idZT321c9Cf1h5K
         r7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993953; x=1781598753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7ZZCdKKvq3+XPt8ecj713zNrLjMOk+mZNXf2m+aFKg=;
        b=GrBIA4ge6XOfOjvZYoD1CpMdCCG8za3tJLyK5VlMHNU/mJpd9Vn8u6PWPUdX2zdENK
         nvRAgC+qAi5c+2T9hM4RH7T/ZQQIDnWR7Gv9DL4iKqzL6wp/2awpYKGSi3YFeZlsPxKt
         HGULn838Og1wAE1fJ2UlKKoQM08QbSnST/AwXiOfCPdy2qIZcATdAofEkEauQ4BMC8C8
         /WKO0DkKPSsJylcZOc1hMIWKTeLkeRwY++3tOGWtggWchMwvLv0l3bKf8T80j5x2Dnlx
         oaUFsU84hlrjvN3nB6CjuquCKUu0YZIN1bfckBbLrwybEIsSJ6BGFizM02SmGnMkhiIJ
         QXBg==
X-Gm-Message-State: AOJu0YyTHasFbQjCV9ZlAAjDwbAPeGHbZOFmDaAL1/y8y5Ehf9ky6D6G
	RinBYYEZ5XChYAd+wlvx44zaCK5d4PZdvQKd/0PTbyGKnOzs1D5fspPMkui2CW5BX0hjcg==
X-Gm-Gg: Acq92OEftYud1oa+guYPepeEhfdoJQ4fw4zwXk9edPdZ0uhIEacLQGgMCjC8c2K77MZ
	tm2BtMtH7lngB/Ozs6RDQL3ITAuzgMPdOfS0os5jcKmNq60Dr3LCn/thlDcMoRZUv/3dqGkmoFy
	9XzObUPYzePEiGc94FoucFKYJ/mhF55dfTz2DzusV+jxeBhyf82RGsIsZV0fuFhon2FcLRTgMOR
	6ulGjdX6GnQ543SMrDRdj30QB+x4kA4cu1QJP6joYulr1zywLSlzd+mWiRtOYiDqu8iHJdfPFgd
	TaawLDmKAHWR+SUcWbtP2ZQUeA3JY896hxotEFf3UcEeiHJZ/gEH2onH8xjeNy37ZXvhcJvmuhQ
	S5j09Mgex1Ype75F/yq4cxa1gLC3BP7xX58f140ip6cAxoX/AI6K7tz64GqMHYgKYQzWbNLIAY7
	ptbcvf09HmnCDuwphA3Q23CjwvFxnslK2nZDsdcb/BbiQH4T15zT+KktE1UQZ6VRwGguerqk0w
X-Received: by 2002:a17:90a:e70f:b0:364:be8f:1d86 with SMTP id 98e67ed59e1d1-370f0e4b6ecmr10853060a91.8.1780993952560;
        Tue, 09 Jun 2026 01:32:32 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18196212a91.2.2026.06.09.01.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:32:32 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH 3/6] strongswan: Fix CVE-2026-35330
Date: Tue,  9 Jun 2026 14:01:01 +0530
Message-Id: <20260609083104.869512-3-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
References: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:32:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127440

Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...-Reject-zero-length-EAP-SIM-AKA-attributes | 54 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes

diff --git a/meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes b/meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes
new file mode 100644
index 0000000000..fdb60d0e55
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes
@@ -0,0 +1,54 @@
+From: =?utf-8?q?Lukas_Johannes_M=C3=B6ller?= <research@johannes-moeller.dev>
+Date: Wed, 11 Mar 2026 16:07:10 +0000
+Subject: libsimaka: Reject zero-length EAP-SIM/AKA attributes
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+
+parse_attributes() accepts hdr->length == 0 in the AT_ENCR_DATA,
+AT_RAND, AT_PADDING, default branches. The code then subtracts the
+fixed attribute header size from the encoded length, which underflows
+and exposes a wrapped payload length to later code.  In particular,
+for the cases where add_attribute() is called, this causes a heap-based
+buffer overflow (a buffer of 12 bytes is allocated to which the wrapped
+length is written).  For AT_PADDING, the underflow is irrelevant as
+add_attribute() is not called. Instead, this results in an infinite loop.
+
+Reject zero-length attributes before subtracting the attribute header.
+
+Signed-off-by: Lukas Johannes Möller <research@johannes-moeller.dev>
+
+Fixes: f8330d03953b ("Added a libsimaka library with shared message handling code for EAP-SIM/AKA")
+Fixes: CVE-2026-35330
+
+CVE: CVE-2026-35330
+Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libsimaka/simaka_message.c b/src/libsimaka/simaka_message.c
+index 6706568..4862048 100644
+--- a/src/libsimaka/simaka_message.c
++++ b/src/libsimaka/simaka_message.c
+@@ -416,7 +416,7 @@ static bool parse_attributes(private_simaka_message_t *this, chunk_t in)
+ 			case AT_ENCR_DATA:
+ 			case AT_RAND:
+ 			{
+-				if (hdr->length * 4 > in.len || in.len < 4)
++				if (hdr->length == 0 || hdr->length * 4 > in.len || in.len < 4)
+ 				{
+ 					return invalid_length(hdr->type);
+ 				}
+@@ -439,7 +439,7 @@ static bool parse_attributes(private_simaka_message_t *this, chunk_t in)
+ 			case AT_PADDING:
+ 			default:
+ 			{
+-				if (hdr->length * 4 > in.len || in.len < 4)
++				if (hdr->length == 0 || hdr->length * 4 > in.len || in.len < 4)
+ 				{
+ 					return invalid_length(hdr->type);
+ 				}
+@@ -932,4 +932,3 @@ simaka_message_t *simaka_message_create(bool request, uint8_t identifier,
+ 	return simaka_message_create_data(chunk_create((char*)&hdr, sizeof(hdr)),
+ 									  crypto);
+ }
+-
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index ac4bc5380b..85fd95d6b8 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-35334.patch \
            file://tls-server-Prevent-infinite-loop-if-supported-versio.patch \
            file://pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch \
+           file://libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


