Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 19946603FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 18:09:51 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id q4-v6so4328319ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 11:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=K3uPh4lJJ+Gif0QlBr3T92KaRKvpcJqG7vhqqlp3eWs=;
	b=tatxj6jlGb9VZPNDCVkyYVmw7InmQyXpdAtsFHVPfn1gMRQLRTIJ3yoEycOLw1lvC3
	2p5Bpqakn8Ep8GkUXhEJ6f53QzDhia0TQiC0vt+EBtxYKCJF/C5K9tZp287sLjVgT2Xd
	TGJAxZkBhKJFFQrMyA4166A/sahIza5Irxd5iMThYTUa2CGhfoo1OCaTqiOx4q4cLs2Q
	RMMDQBFZdwLMCWRdayJpNjn0euyKpAoAJh8c3vjQMuS9R4p+jfIWjIew15vNvPFVUpU+
	2pag9ut8jy9l2Rorgp7x99iMn8p0gTtBHIC4MDxVWzMh6J5sbFkhAEqCOr3GHCquku+6
	eEQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=K3uPh4lJJ+Gif0QlBr3T92KaRKvpcJqG7vhqqlp3eWs=;
	b=EzKdBKZ8NjVeEW0D7DBByKk0bdYZBpNEt+92dmCbRTxpd0ay5cPSLXK148pVuH6+tX
	ZgPnMncBX/Gl/hrwsArRbM8ay5f3SB7djEPC5Ir70wVQ2uISw0JCz5nPjKXjOOOaYeqX
	nCYH/xgo3QKNgMPpd3Q8Poqsf2Dr+GK0oZ8DFp81gcABXcrIltnUgDmhZ5bLFag/No24
	ZaWcITi5vx40zQMZCUTpZKlJEWpkG0751VMHKZZXzqrhJofp7EFpQFYHQeK+8kUjO9v8
	E0JbJ/mY8NNyGzVylTwoedNNfviY7mdsRpIDt9RaOE4LZWiV3bt+DoG2zXUr8CqN9owm
	ZAlQ==
X-Gm-Message-State: ALKqPwe+nyb8x91jSdkVDC8nAMu8qPnLrgQNRrGOHdO8m/CigllkcHGL
	g8Je9VC3/ZecclfvjmVpIySpFZ8b
X-Google-Smtp-Source: AB8JxZpzK7n64TD/7Hl7hqeoe1EvLqh8Ot5ZUcObOuHb0G9vqg1I0UvKXAeSIXXyxJi4iuQO5EM3WA==
X-Received: by 2002:a24:ad2c:: with SMTP id
	c44-v6mr2096197itf.107.1526494192661; 
	Wed, 16 May 2018 11:09:52 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	y14-v6sm1571003ioc.52.2018.05.16.11.09.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 11:09:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 14:09:43 -0400
Message-Id: <20180516180944.29303-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH v4 1/2] openh264: fix build for 32-bit intel arch
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
X-List-Received-Date: Wed, 16 May 2018 18:09:52 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes since v3:
- v3 does not exist, the previous v2 was supposed to be v3

changes since v2:
- switch += to _append

changes since v1:
- v1 does not exist for this patch, but as patch 2 of 2 for updating SRC_URI
  away from automatically-generated github archives
---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index a7aaab3623..bf56ea1d84 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -3,9 +3,8 @@ decoding. It is suitable for use in real time applications such as WebRTC."
 HOMEPAGE = "http://www.openh264.org/"
 SECTION = "libs/multimedia"
 
-DEPENDS = "${@oe.utils.conditional('TARGET_ARCH', 'i386', 'nasm-native', \
-              oe.utils.conditional('TARGET_ARCH', 'x86_64', 'nasm-native', \
-             '', d), d)}"
+DEPENDS_append_x86 = " nasm-native"
+DEPENDS_append_x86-64 = " nasm-native"
 
 LICENSE = "BSD-2-Clause"
 LICENSE_FLAGS = "commercial"
@@ -17,14 +16,14 @@ SRC_URI[sha256sum] = "9c07c38d7de00046c9c52b12c76a2af7648b70d05bd5460c8b67f68957
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 COMPATIBLE_MACHINE_aarch64 = "(.*)"
-COMPATIBLE_MACHINE_i386 = "(.*)"
+COMPATIBLE_MACHINE_x86 = "(.*)"
 COMPATIBLE_MACHINE_x86-64 = "(.*)"
 COMPATIBLE_MACHINE_mips = "(.*)"
 COMPATIBLE_MACHINE_mips64 = "(.*)"
 
 EXTRA_OEMAKE_armv7a = "ARCH=arm"
 EXTRA_OEMAKE_aarch64 = "ARCH=arm64"
-EXTRA_OEMAKE_i386 = "ARCH=i386"
+EXTRA_OEMAKE_x86 = "ARCH=i386"
 EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
 EXTRA_OEMAKE_mips = "ARCH=mips"
 EXTRA_OEMAKE_mips64 = "ARCH=mips64"
-- 
2.17.0.rc2.3.gc2a499e6c


