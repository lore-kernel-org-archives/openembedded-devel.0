Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1912773180
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 23:01:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g62so13244413wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Rpr17rC0LuBFeQCgOuGdswh3oNIyeANhDVIDDm9FqmU=;
	b=rKrynPG1FYZ1bxSJXS2y55zzLTR32AUuySjeTWPRK3fzYvq53hv47vqFFSlL7xEPP9
	FQaCxzYJV/qto8z+LrtwIt91ywj9KtGIejhpepe/7Vz113g3L5EX5uuNlBd14Q7hwHfO
	7RTnvlz0ayj9agb3VxIMC/BHg1YqFT2Y53UEQ0eF7uZ0H9Bj0LV/Kyvz25I7pVGP/cTi
	OzRZyOM7F6yI7FOV1cx2MiGhYE7z9JyX8uwiTWpiMvEMjVLMohm1h08ZoJY6pKXpI6pz
	9ESHfnnaKY0jYCMR8uvf8SuTSLGBFr8/p59VElf9nSrds7Posd+4S66jnucYa1OW60Ox
	uHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Rpr17rC0LuBFeQCgOuGdswh3oNIyeANhDVIDDm9FqmU=;
	b=Om6Pmb4FOKSNQ3SAPNl5ub8rF50BGagseW6lBgLyFhGd3CznbXF+Ild9RQYKP7JhK6
	A0QAv/dppCf0QdYluSP2VNkr71kF5C45IogT4ahPAPoqUH621dYi1DUYIfoS5L90F0xR
	bAJe7vEUPlHWVKH3E3286cedB7cbGgppWsZDNA6TGbwpZY5bMISG2UaJ/olRG06txsYA
	EWOWYNWwEMo9QdSFHePDSnN5uuuF8z7hOiqn7DHQcFG/5bPnNqzgXGRyd11aSL69t89W
	CLnWChrMO9PhSA5/uW+h2P4K2UlBkCpqjKJ98SwIW7qcWz0drXVviacY3p0LoJSMNOwe
	tC5A==
X-Gm-Message-State: AG10YORuePi9vd6f6Jh0z5NSAx4VchCBTCRSfM6ees+/uk4kZuvY8W0I6R1SaGL48SIH5Q==
X-Received: by 10.28.9.67 with SMTP id 64mr1040365wmj.10.1455231696260;
	Thu, 11 Feb 2016 15:01:36 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host180-22-dynamic.15-87-r.retail.telecomitalia.it. [87.15.22.180])
	by smtp.gmail.com with ESMTPSA id
	yz5sm9520324wjc.36.2016.02.11.15.01.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 15:01:35 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Feb 2016 00:01:10 +0100
Message-Id: <3688491b0044d58c38bf5bd3952fe7f2b5243e01.1455230414.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1455230414.git.andrea.adami@gmail.com>
References: <cover.1455230414.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1455230414.git.andrea.adami@gmail.com>
References: <cover.1455230414.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 3/3] klibc_2.0.4: Silence Warning about klibc-xxx-so already stripped
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
X-List-Received-Date: Thu, 11 Feb 2016 23:01:37 -0000

Fixes:
WARNING: File 'usr/lib/klibc-HWWIvOaMdZy4N4-6rLLHAB2TjFQ.so'
from klibc  was already stripped, this will prevent future debugging!
WARNING: File 'usr/lib/klibc/lib/klibc-HWWIvOaMdZy4N4-6rLLHAB2TjFQ.so'
from klibc was already stripped, this will prevent future debugging!

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index 3f47587..33be23c 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -38,6 +38,7 @@ do_configure () {
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INSANE_SKIP_${PN} = "already-stripped"
 INSANE_SKIP_libklibc-dev = "dev-elf"
 KLIBC_ARCH = "${TARGET_ARCH}"
 KLIBC_ARCH_aarch64 = "arm64"
-- 
1.9.1


