Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id B231773D46
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 19:13:20 +0000 (UTC)
Received: by wikq8 with SMTP id q8so46369836wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=a9ymj11Y990lBRG1tDy4tYLa8SSf9eNh+ji196U+304=;
	b=fB7kIFxQMnMISnk1f1YqJp3aVGRs73iFTwwqnrk2IRVi5rVU/xpQTyLUuWFNqmvOlK
	8pHlbDQiG3Xf3VLpXFRsphJ+CuxS6mxZahEc3Ad9RnmYuG+Rn68eJce+KOphZK9EBPpN
	L8yTPaeYWeXb4PEXGPMIAhAtnSRiwsDCf6TFWDLlyErr4c4a20j0jiMscWE2e12MSoBW
	6LwgPJDesIcZEAI5shLZ3qJycRb8uDn1RTuxvrp4fDc0wvoCT2w8WYQyafAvFyG/F1/6
	+kbMCOrcmRcOI3ttvuOB3dU6C7czfRaS8iMC9BZH9pJQNV1Ho202vcPaPCcyBCoOrFd2
	9IEw==
X-Received: by 10.194.77.146 with SMTP id s18mr145790wjw.122.1445541200442;
	Thu, 22 Oct 2015 12:13:20 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1181.dip0.t-ipconnect.de.
	[79.223.17.129]) by smtp.googlemail.com with ESMTPSA id
	h8sm203993wib.8.2015.10.22.12.13.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 12:13:19 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 21:13:08 +0200
Message-Id: <1445541189-13375-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
References: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] efl: fix build by adding -fPIC to CFLAGS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Oct 2015 19:13:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

on armv7/cortexa8 efl fails with:

| ld: error: modules/evas/image_loaders/png/bin_evas_evas_cserve2_slave-evas_image_load_png.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
| ld: error: modules/evas/image_loaders/png/bin_evas_evas_cserve2_slave-evas_image_load_png.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-efl/recipes-efl/efl/efl_1.15.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-efl/recipes-efl/efl/efl_1.15.1.bb b/meta-efl/recipes-efl/efl/efl_1.15.1.bb
index aaebf90..9f18531 100644
--- a/meta-efl/recipes-efl/efl/efl_1.15.1.bb
+++ b/meta-efl/recipes-efl/efl/efl_1.15.1.bb
@@ -23,3 +23,7 @@ PARALLEL_MAKE_class-native = ""
 #Makefile:2163: recipe for target 'all-recursive' failed
 # autotools-brokensep
 B = "${S}"
+
+#ld: error: modules/evas/image_loaders/png/bin_evas_evas_cserve2_slave-evas_image_load_png.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
+#ld: error: modules/evas/image_loaders/png/bin_evas_evas_cserve2_slave-evas_image_load_png.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
+CFLAGS += "-fPIC"
-- 
2.1.0


