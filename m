Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272C0CD8CA7
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:38 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75308.1780997136379072439
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:25:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=icYjT/nP;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c85a2981725so385480a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997136; x=1781601936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGHjVZuC4ahqLjyXH/jc/J6mqcuAJOP0QbXfuASM34c=;
        b=icYjT/nPc4PkMwQxi14DFaLpYFdxtWKV2n2owIdlJaI6rEUfZ8y1LV4ieS40rBGSDS
         gno+A/kL2TebIq5lTgNwZ/JRTf34iqrU8I2EF5HyRDmSz2MCqmSHvZoMD0q5kDuzgeok
         XfGqbfgSfYrBba7vYMaOsHzZbAigkZQMpthyhTGGTiBbsvBcL2rpC8eTIEwF06NotL8q
         rTYfhEtW91pAtgcrXS9tAkhCtHkX6M5+Z58dkgcqMB1AUjQQs2BiZDjGPpeYGn1QuLfr
         qOZXMLnFmjYCdPGeU6z/EY7n0XC7iI026IY2ek03a+58S2zYrwFMHPv8SIKZtPJu3YR2
         l/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997136; x=1781601936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xGHjVZuC4ahqLjyXH/jc/J6mqcuAJOP0QbXfuASM34c=;
        b=HxijSBrR/UuFws2ks892cPUaYKmDDyTGXvuI/tye8fOP+wxvSsGc/GyE2p29vFnnFS
         5HgebhdGrgfi26odyvT0xjQhteYPptnEsctA3WkfO6NRK842gsF+2AAKF/BnVW2RLiqg
         rsPhA2HbAmfrCXyVGBHUTSTTKPu0Tvr6RP3//9nJciavSVTdHw8IUXyhgfbp5Hk1J9zr
         KqSbA5mRTuO7sL4z8EHldm3v3dGDDxxffARBYEePZG6nQwvrHau1n46aMdjAiT3MdBrb
         eMtOOt4sqmC5dhKRRW3S16EEYYTsCHA7XN6Dbn49eZQ0W9eccdeQgCM1ydALFok1g2ij
         cJLQ==
X-Gm-Message-State: AOJu0Yzfv6AOpzZpNzOHCDcOtB7PyEd5R+HhJSX3H+IO8JNb7O5t4od7
	WjcolRogzR0KMfqDwSffoyEkt8tCdJvfy/ZdM4Y3fbmgd2f2UlURZnkY3bZVmaD6XKJOKg==
X-Gm-Gg: Acq92OG4wKXXDFrH4E6WM1AJRWLZ+UFpmj99yP/FS3LYHdImCDf8kL4lppWzB1lDxYq
	p7VLDkoivG9jzgDo3mD4Uy29Ep4lNtO/gGsJN3O8pLqujlN4R/x+9zlgGATPfjOThPw88xieLAL
	45S8NDozczmH57vMraEZYL0yIqHZ4hytQFn6XXh89KBmR6rSm/+FKMVGbHqNE9NNFXE3ER2xlvJ
	6a+nm609N1VF3Kg9666xYBnD12E49zXhKralYiMg1qBIBY5zAnpgoGpgEoyeWJLBi8sUCdJWOPX
	3OrFhWdCtvIc0sDdhtSfiyyoGxM6DNRmXWtY1wkS+IgS+4TJ/97tH52+TtpPmWmBDaH2fK/kJXq
	z/2KCe5j5dfSBFeRd2bKB1TMXU692ZsHI5j5oSNxoWgUCqsAXlm8bWLdoa4JqQmGxnZimvtU0E3
	iSvYeZGrn8NYowuH00Upsawvo/dQldSWfdiGII784hvS4+Qd5SfugI01w5JuSiIw==
X-Received: by 2002:a05:6a21:2d4b:b0:3b2:875c:9ccb with SMTP id adf61e73a8af0-3b4cd441678mr10040682637.3.1780997135660;
        Tue, 09 Jun 2026 02:25:35 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm16496633a12.8.2026.06.09.02.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:25:35 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH V2 3/6] strongswan: Fix CVE-2026-35330
Date: Tue,  9 Jun 2026 14:54:04 +0530
Message-Id: <20260609092407.893299-3-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
References: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127448

Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/aa5aaebc33e0f326d8a0dbe01b236f2bfa0e6ea1]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...-Reject-zero-length-EAP-SIM-AKA-attributes | 54 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes

diff --git a/meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes b/meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes
new file mode 100644
index 0000000000..c9f647048f
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
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/aa5aaebc33e0f326d8a0dbe01b236f2bfa0e6ea1]
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


