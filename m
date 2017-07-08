Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A821A780A3
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Jul 2017 13:18:04 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id c73so29337177pfk.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Jul 2017 06:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GcTPLxzN/niybF/VRG5Bu15unW7XbPUPM+1qL0M8A4c=;
	b=kE8cWqlLcDdNq9KwLNhzqN9kCrrNENgMfV1ZXJeH9LeKTpJWITjqpbdtUJnsG0Tu0Y
	9VJGemfieM3gPDPMZiixAxrwu1x15cBpf7MVFpDmIjkp/JQsaBzPw9NjMHRnPS3vh594
	zRFMsKgw3RRIr+y7iGq71YU4GlChbdYr2LeuEsyTUtKRcV5FtTROLAC/GedCTkWm/A0W
	pOsLloC6aniAgRtmkXPj4T9sUm/3RcPDaHNhMHMQcRdeJQWyWEUFPW79+g7rGTrcR7so
	m81VCfAKMJaRRxeyNzsPA52lr4mySDehNyY4k0aWT9gcSt9gjgSPHu1D/cXne02PvThh
	7Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GcTPLxzN/niybF/VRG5Bu15unW7XbPUPM+1qL0M8A4c=;
	b=jUC093GFDMwCwiLd+yFgaku1/Oew1ralQeOB8K3K19hpRd39g1+GOZw1n/WY9mW1b9
	KlWDFlH3qQ0FJ7KWxiC//vLff1sbkM33CnBDSBnBfhyBq2yt5BkOeA6slHmJWrtFv+Tz
	K6E8uQHyfFLxVK5BYSoXVk9PhXBpW8ijqmaOtl2Yf3cNGUk19pxwqqoesi4T/Jj5XPZ+
	urCglmYBE3HWOVD34xU3Q/3PmjCzDCRd0h5TZx1fq8GB75jOWnV4jdyby9rD10nFwHQn
	IV85y0uzsdwRKDkbR6XqNBpfdQezLM+B68RaYb0BZpzPQfVUau17dNbH7IayMfS3PFGN
	xeSQ==
X-Gm-Message-State: AIVw113J65cCSPRt769OLaScUsKx8F5Fe+mVeIleXjWrw8OIs2iOkNq6
	V/TeQqxEKJnp+cu0
X-Received: by 10.84.133.73 with SMTP id 67mr8669836plf.125.1499519885727;
	Sat, 08 Jul 2017 06:18:05 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	o73sm13277185pfi.2.2017.07.08.06.18.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 08 Jul 2017 06:18:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Jul 2017 06:17:44 -0700
Message-Id: <20170708131744.33927-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170708131744.33927-1-raj.khem@gmail.com>
References: <20170708131744.33927-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 5/5] pptp-linux: Upgrade to 1.9.0
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
X-List-Received-Date: Sat, 08 Jul 2017 13:18:04 -0000

Fix build errors found when building for musl while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-missing-sys-types.h.patch         | 28 ++++++++++++++++++++++
 .../{pptp-linux-1.8.0 => pptp-linux}/options.pptp  |  0
 .../{pptp-linux_1.8.0.bb => pptp-linux_1.9.0.bb}   |  9 ++++---
 3 files changed, 32 insertions(+), 5 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch
 rename meta-networking/recipes-protocols/pptp-linux/{pptp-linux-1.8.0 => pptp-linux}/options.pptp (100%)
 rename meta-networking/recipes-protocols/pptp-linux/{pptp-linux_1.8.0.bb => pptp-linux_1.9.0.bb} (81%)

diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch b/meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch
new file mode 100644
index 000000000..804bf1234
--- /dev/null
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux/0001-include-missing-sys-types.h.patch
@@ -0,0 +1,28 @@
+From f6c4d2468ae0dadd2f35680d61b98b2a59077328 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 7 Jul 2017 10:31:03 -0700
+Subject: [PATCH] include missing sys/types.h
+
+Fixes errors seen on musl
+pqueue.h:21:3: error: unknown type name 'u_int32_t'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pqueue.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/pqueue.h b/pqueue.h
+index c37ba7b..ae4cc6a 100644
+--- a/pqueue.h
++++ b/pqueue.h
+@@ -3,6 +3,7 @@
+ 
+ #include <time.h>
+ #include <sys/time.h>
++#include <sys/types.h>
+ 
+ /* wait this many seconds for missing packets before forgetting about them */
+ #define DEFAULT_PACKET_TIMEOUT 0.3
+-- 
+2.13.2
+
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.8.0/options.pptp b/meta-networking/recipes-protocols/pptp-linux/pptp-linux/options.pptp
similarity index 100%
rename from meta-networking/recipes-protocols/pptp-linux/pptp-linux-1.8.0/options.pptp
rename to meta-networking/recipes-protocols/pptp-linux/pptp-linux/options.pptp
diff --git a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.8.0.bb b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.9.0.bb
similarity index 81%
rename from meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.8.0.bb
rename to meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.9.0.bb
index bc8b2cb2b..10c9170fb 100644
--- a/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.8.0.bb
+++ b/meta-networking/recipes-protocols/pptp-linux/pptp-linux_1.9.0.bb
@@ -9,14 +9,13 @@ SECTION = "net"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-PR = "r1"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/sourceforge/pptpclient/pptp-${PV}.tar.gz \
            file://options.pptp \
-"
+           file://0001-include-missing-sys-types.h.patch \
+           "
 
-SRC_URI[md5sum] = "4efce9f263e2c3f38d79d9df222476de"
-SRC_URI[sha256sum] = "e39c42d933242a8a6dd8600a0fa7f0a5ec8f066d10c4149d8e81a5c68fe4bbda"
+SRC_URI[md5sum] = "b2117b377f65294a9786f80f0235d308"
+SRC_URI[sha256sum] = "0b1e8cbfc578d3f5ab12ee87c5c2c60419abfe9cc445690a8a19c320b11c9201"
 
 S = "${WORKDIR}/pptp-${PV}"
 
-- 
2.13.2


