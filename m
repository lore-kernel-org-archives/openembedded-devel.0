Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id F3FC16B05F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 09:21:16 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id hr1so1524177wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jan 2014 01:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xZLdJMUOySfqvQ7xl0wRg974sF1hjA2Y/hC8nIF02ew=;
	b=A/enWGum//X1Sr12nYq2Zt2xOdowuLGnW+UhKFSC6Tla3gm+SnwN3PT/zvVxn3le4i
	+sB62gFqjxueBflNbzbB7lVi1zq61sDsT4sINXcML2cBaZzYG/ZzjT2i8+3k1gkv+W+9
	Ql4g/uF3ounO0j0qAIBeh/Yt4O9Htvpk/UBMbsidN9UgckTSxHKlnOJULBlNq9O4s20a
	L8fwdy4uOkzT0yE44xpeiXIJK0Y+UZ7mVqnVidPMA1m7noWmb5N18Ex2lZ1Xa+WVAfZ2
	tSfUzjlJq2NGbHqwCjxAmrQzLSDQHO2rfm1uFRL7IUfde+Yj+GUtBc/8gM+x0L0FIUsk
	/pvQ==
X-Gm-Message-State: ALoCoQm/OIo+XRXASF4TbzwOvQUV3P/Fx4OqZu8agP6Y0aIUCTVgBhFJK25Fwg6p6NKL8Z/2QA3i
X-Received: by 10.180.11.36 with SMTP id n4mr7055897wib.4.1390468877599;
	Thu, 23 Jan 2014 01:21:17 -0800 (PST)
Received: from localhost ([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id p1sm26127288wie.1.2014.01.23.01.21.16
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 01:21:17 -0800 (PST)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jan 2014 10:21:11 +0100
Message-Id: <1390468871-32144-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-initramfs][PATCH] klibc: ensure package strip logic stays the same after oe-core package.bbclass changes
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
X-List-Received-Date: Thu, 23 Jan 2014 09:21:17 -0000

See http://patches.openembedded.org/patch/65311/

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta-initramfs/recipes-devtools/klibc/klibc.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-initramfs/recipes-devtools/klibc/klibc.inc
index bf37c0e..da9d994 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://usr/klibc/LICENSE;md5=d75181f10e998c21eb147f6d2e43ce8
 
 # Prevents do_package failures with:
 # debugsources.list: No such file or directory:
+INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 KLIBC_ARCH = '${TARGET_ARCH}'
-- 
1.8.4.2


