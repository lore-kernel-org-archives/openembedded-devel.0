Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3A2D2786EE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:59 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id r78so13921624wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=GNlWDaKInpiExn8trkDey/6xu4uKPTJCDclNPyKBnvY=;
	b=Hv9+MBoAuWmgTJ47trZ9uqleiiB0Ctp7WUPGOcF1ZOpY5emvB0mmkgpeMjqq3V7pJz
	c1Fxjo06e9ktLQbmhATVqgAsNfQkE60uCDuJZ0Ssj1S3btL+71dA4UHGIq49i5Bnuqsu
	NOvBvxmygKvZNb6JyS1N6O/ANFK+lvjmGdSj7jTM1DF3mgNaoHtikH99KhCabmeuXeAt
	KOFCqNv4ozLtWocp6PK3P+Acf+EQxFdNGNwa5eug9f0b2N5tYmVpKYEhWCeLz8SpXkZe
	vcR0qhsFU+SqpQwNfKsTdKendoGOEx4do7LZSCLnQoSldzKeScnvltlqoC+1yqPFuFEC
	bxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=GNlWDaKInpiExn8trkDey/6xu4uKPTJCDclNPyKBnvY=;
	b=PB+6af6MQOJYnRHX/rz59DVb/0VLYQTIfuujw3vuOovG8wD45qrRD1MmOMkbLKtqGS
	tMqpln/rkXv85eXDApfva/RnoAkfCqEjHreufhRiMHDVJYquhg3TpEuiOPJzSGw8uoIY
	a0vv5yyXMWi3UAEaxC3Zz6PbJuSGVj0T0Jqj/E5PwosdPleyL2MAbrxRR9M8EVjV1PW1
	RZYL501u3Kn6Gs6WzsLtod3iu5rxTw6sAaDXbs44q2XOTYAWkm0PdowAipzJWBB7CgVN
	WeHOVv7wq5Ox8dqgdTrSIm3QwsnM/LpoEFDDeeH5gpVy6pbu2pT2aEOEwQhgu9sHSaaU
	pzdg==
X-Gm-Message-State: AKwxytd9mBlVpVTrD6gT+aLDIDN+giIX3rTZWEnoY8SDsWEzm0/l4gSH
	PizN/7g261oEKK9MG8ve76H31A==
X-Google-Smtp-Source: ACJfBosCCx/iNNab/iKCmejhax9AMMHnr5p8oToiqgAW4KJnqRcHBS8EMaNYEvsyJzCjpmfSbigOdA==
X-Received: by 10.28.52.132 with SMTP id b126mr1333119wma.144.1516178100543;
	Wed, 17 Jan 2018 00:35:00 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:17 +0100
Message-Id: <20180117083421.30233-11-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 10/14] jack: Update 1.9.12
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
X-List-Received-Date: Wed, 17 Jan 2018 08:35:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gcc7 build was fixed upstream [1]

[1] https://github.com/jackaudio/jack2/commit/f7bccdca651592cc4082b28fd4a01ed6ef8ab655

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...1-typecast-input-parameter-to-int-for-abs.patch | 32 ----------------------
 meta-oe/recipes-multimedia/jack/jack_git.bb        |  8 ++----
 2 files changed, 3 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch b/meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch
deleted file mode 100644
index c119f1981..000000000
--- a/meta-oe/recipes-multimedia/jack/jack/0001-typecast-input-parameter-to-int-for-abs.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 8ec6f75bf7a318a3a1e352df7c97630cfaba537a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Apr 2017 16:18:39 -0700
-Subject: [PATCH] typecast input parameter to int for abs()
-
-Fixes
-../tests/test.cpp:482:73: error: call of overloaded 'abs(jack_nframes_t)' is ambiguous
-
-because the signature is int abs(int) and its passing
-unsigned int to it.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tests/test.cpp b/tests/test.cpp
-index 8a8a8117..9655742e 100644
---- a/tests/test.cpp
-+++ b/tests/test.cpp
-@@ -479,7 +479,7 @@ int process4(jack_nframes_t nframes, void *arg)
- 	jack_nframes_t delta_time = cur_time - last_time;
- 
- 	Log("calling process4 callback : jack_frame_time = %ld delta_time = %ld\n", cur_time, delta_time);
--	if (delta_time > 0  && (jack_nframes_t)abs(delta_time - cur_buffer_size) > tolerance) {
-+	if (delta_time > 0  && (jack_nframes_t)abs(int(delta_time - cur_buffer_size)) > tolerance) {
- 		printf("!!! ERROR !!! jack_frame_time seems to return incorrect values cur_buffer_size = %d, delta_time = %d tolerance %d\n", cur_buffer_size, delta_time, tolerance);
- 	}
- 
--- 
-2.12.2
-
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index b85ba8a02..11da6b1be 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -14,11 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git \
-           file://0001-typecast-input-parameter-to-int-for-abs.patch \
-          "
-SRCREV = "2d1d323505585d406a7e64fb932953baefc5945e"
-PV = "1.9.10+git${SRCPV}"
+SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRCREV = "c1647819eed6d11f94b21981d9c869629299f357"
+PV = "1.9.12"
 S = "${WORKDIR}/git"
 
 inherit waf pkgconfig
-- 
2.14.3


