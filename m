Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id F1EDD7F7C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 19:12:22 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id x7so10362874pgl.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 11:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cJvkr1HH/VfflGusJavDtAdWc8ITYC45m56vH/8qS30=;
	b=J49mjwXxJa2gZ8KxX2ImmKP4R0Z0iz8Isx4z+qkqHSsA9P4EOKcqkiylEZUTt9roLk
	/FjjEZkltDeXnDTmoRGKNhTtKNxEV7Y/B3yhyiHupbMRYhFDNSo/zNHorBLAZl3pjE0j
	eQZnswhIRjjHouZIUXmAAYctMFNhc3AMLAL0ReUbTE+DpgNLPORKVUPoSyMLPcKziv9S
	mkv5+5726m9OaqZ8HsJJx0zwCxo8maQd7plG6zKhDWAC5KavJaJ+TwIDNoxQANbC18FW
	1wk1AL110PdyCopLTgMJKxyjOGQew8qOygqX/C0QxV+K2vK74VX7WPx0Yf46AW8Vfo+H
	EkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cJvkr1HH/VfflGusJavDtAdWc8ITYC45m56vH/8qS30=;
	b=rBPZEBiPWmxY4iTC2fSqEZW9RZ/onM6ArhOreFM1XePz6m3ktpr4o56EFvB1/GiYBn
	Gj6qrxMIcy+mA0hzdDEI/T6rkCOau4qe4y05hdT1yvi7xOLnouii8vD6Eo5qSmG8Qys9
	TLDxWZO9uZEVWC3eh8TpSlcjUK2KeKXlfTF0nRN6dHhEe4g9+ATMfPCo1sfbdvU0+CmU
	MUNlMtzj3mswKTgNZGxq2Vn1GGE3RkdBcBQe847KOxwIsa4nC0YR3487GdydTGd383Tg
	zLEGsAPSVBCrlIKSW37KKtBCnQOwnQXsGDUMjssVJTGyPMzGT+Qpvyfoo/2q1c3DawdA
	6Gpg==
X-Gm-Message-State: APjAAAXImaStTe7xx1JqpTf+PtWx3+OCBOVCdMAG7TOyqNlRttl3zea2
	PtEDoXgEwxAQASqTCR121cn8rVHJVXo=
X-Google-Smtp-Source: APXvYqx8yohLfKsZgKZpiZ+ZKOdQJspYT7Nf4Mnf+8cgcj9BwIlO1gAto3b/siym18JnD0AgftrMew==
X-Received: by 2002:a62:a206:: with SMTP id m6mr38180097pff.210.1579201943679; 
	Thu, 16 Jan 2020 11:12:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l10sm4539199pjy.5.2020.01.16.11.12.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 11:12:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Jan 2020 11:12:17 -0800
Message-Id: <20200116191218.2768160-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116191218.2768160-1-raj.khem@gmail.com>
References: <20200116191218.2768160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 4/5] fluentbit: Fix build on powerpc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Jan 2020 19:12:23 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-ppc-Fix-signature-for-co_create-API.patch | 38 +++++++++++++++++++
 .../fluentbit/fluentbit_1.3.5.bb              |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
new file mode 100644
index 0000000000..1f36c657ed
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-ppc-Fix-signature-for-co_create-API.patch
@@ -0,0 +1,38 @@
+From be4032079c931704f52e29f5da5c01cde24ac842 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 16 Jan 2020 10:44:58 -0800
+Subject: [PATCH] ppc: Fix signature for co_create API
+
+Upstream-Status: Submitted [https://github.com/fluent/fluent-bit/pull/1886]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/flb_libco/ppc.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/flb_libco/ppc.c b/lib/flb_libco/ppc.c
+index e6536d56..533256b3 100644
+--- a/lib/flb_libco/ppc.c
++++ b/lib/flb_libco/ppc.c
+@@ -279,7 +279,9 @@ static uint32_t* co_create_(unsigned size, uintptr_t entry) {
+   return t;
+ }
+ 
+-cothread_t co_create(unsigned int size, void (*entry_)(void)) {
++cothread_t co_create(unsigned int size, void (*entry_)(void),
++                     size_t *out_size) {
++
+   uintptr_t entry = (uintptr_t)entry_;
+   uint32_t* t = 0;
+ 
+@@ -325,7 +327,7 @@ cothread_t co_create(unsigned int size, void (*entry_)(void)) {
+     t[10] = (uint32_t)(sp >> shift >> shift);
+     t[11] = (uint32_t)sp;
+   }
+-
++  *out_size = size;
+   return t;
+ }
+ 
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index aad1499b94..d8cb8b5e85 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://fluentbit.io/releases/1.3/fluent-bit-${PV}.tar.gz \
            file://jemalloc.patch \
            file://cross-build-init-system-detection.patch \
            file://builtin-nan.patch \
+           file://0001-ppc-Fix-signature-for-co_create-API.patch \
           "
 SRC_URI[md5sum] = "6eae6dfd0a874e5dd270c36e9c68f747"
 SRC_URI[sha256sum] = "e037c76c89269c8dc4027a08e442fefd2751b0f1e0f9c38f9a4b12d781a9c789"
-- 
2.25.0


