Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id DAA8C60B9B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:41:56 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id cc10so5093728wib.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 02:41:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=73pcJ981uhoMV8e+0ZT6qpkKvmuyM9mfUSzUcUipdt0=;
	b=h8AnxMfwjz5B7IWXnFzEzvtvjxovex1Za0D9y20e+aFEXdpDuEacD84qkTUrllTKat
	XOoMVGzXN9YIcfIiLssSiOI8NOsZjP3AoCWLzBoZl5y4ZDvuA8iuveBl9sR1ABD9ITit
	Y8mYHgH2O2TYlXYiGlSSMhG811u7V9KzhvydDZhbcWd0rKoCSzQorA2LQyMxETpPjstv
	hPaSZ0RCNDg/JTE/BqpmJCBi0Wa7sdG36C76MrKc7ZZozWbc3Z92KRJCzEVMFzSuJ1yg
	kYx2aO/ZNrgl/S7c3DXm2ooS5wBKCQxbPn3Sqt5DQrxT9Aet9Z0W25BWpeU7SvcrKV9A
	EOFQ==
X-Gm-Message-State: ALoCoQlDTJJvxkcUlWSQv+Avmc/ayJWCfsUbERx74erHSje5Z92pUK8kTpaVKf0EzyhfFv8G3RX0
X-Received: by 10.180.10.74 with SMTP id g10mr18790264wib.11.1386672116221;
	Tue, 10 Dec 2013 02:41:56 -0800 (PST)
Received: from localhost (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id q19sm3936051wiw.4.2013.12.10.02.41.54
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Dec 2013 02:41:55 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Dec 2013 11:41:41 +0100
Message-Id: <1386672101-30510-2-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1386672101-30510-1-git-send-email-koen.kooi@linaro.org>
References: <1386672101-30510-1-git-send-email-koen.kooi@linaro.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-initramfs][PATCH 2/2] klibc.inc: add mapping for 64-bit ARM builds
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
X-List-Received-Date: Tue, 10 Dec 2013 10:41:59 -0000

Klibc is following the kernel naming ('arm64') instead of the toolchain naming ('aarch64').

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index d8af666..24ece9c 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -13,6 +13,7 @@ INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INC_PR = "r1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
+KLIBC_ARCH_aarch64 = 'arm64'
 KLIBC_ARCH_armeb = 'arm'
 KLIBC_ARCH_mipsel = 'mips'
 KLIBC_ARCH_x86 = 'i386'
-- 
1.8.4.2


