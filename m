Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id D07866FF80
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 17:06:35 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id n202-v6so3750007ita.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=SsgwY4+GKRuI5zqrqDMwC0Yj1vBKbF+mm9vi6mTxZgo=;
	b=NsjvPIDAEjbbTKDk4HkntpwHbqbasIP6Wk5wp3hj3wEMcfj3JI9d1JMeg+TfIjTOmj
	IM5YGf5mtQMWJAA0ZWIgGH+B4IUBrcLpHmriKf4bPpAbxT0VoPQMd1CeKrncXE94B5Rw
	Q+tnKBr5FmU0eStj9R1Om2asPkzZ8ynetjWwLUgNm41jG6FCzETsuQY+EqWvrhbWkHrS
	PxBu86bMGa2QO2VpCCWQJbNlKdlf8wPN6nF+5d2A8N1qlBvmzsMfqQTnE+I/X+I7gm6g
	c33jDe9WjnJttFBwtDcPrpni49fzGK9ZdYxp/kJeD/vAALmJfaUgIyAKvC2n+WzPPK5F
	fiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=SsgwY4+GKRuI5zqrqDMwC0Yj1vBKbF+mm9vi6mTxZgo=;
	b=l8XT5QMB8YH8q9T7Ob1Qm1ezkqt7O7fB9ip7h+4rL1bvbBA902WEzT2IxtBsOq3hx2
	8FXuGl1887fAe4HtwJKYyUn3gGej7mc2XUqSNk+4nCq0PeRmNieSJGLMNi0Tu/NjjbXj
	KbRFsR9GGanzYE5k14qKuaSbdXb9egae3JF/FsZtJ2DNnltaIozaE9vwgxcALCgclOFV
	w9ISAk51HBqHCushXb1gQnYp2IuAh3V7EOw7wCHfGOW00ym4Q96PiknFN+1924ieqBKu
	tl3kRo8J4x9cOQ706CzJdl7qtSnPbTQO8BUDhBdD0PuA49HngKP02UfbjE2MpZvPMGqG
	1kOQ==
X-Gm-Message-State: ALKqPwdV/kCkQg5aGTG6+SgNeGwPrngmyXMYgKUoV07ykts1PMDFsoXz
	Oq7blXCdb9IFgUJtV7qA0Yc7hS71
X-Google-Smtp-Source: AB8JxZqeSPfAmN5zot38hSXe9qD3WIY/fqiduK15r5A0G52egjENhhhAKAlef9+Ltj7UD7to5F/xdg==
X-Received: by 2002:a24:2c0f:: with SMTP id
	i15-v6mr1864316iti.24.1526490396123; 
	Wed, 16 May 2018 10:06:36 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	r67-v6sm1573330iod.27.2018.05.16.10.06.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 May 2018 10:06:35 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 May 2018 13:06:31 -0400
Message-Id: <20180516170632.15614-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.rc2.3.gc2a499e6c
Subject: [meta-multimedia][PATCH v2 1/2] openh264: fix build for 32-bit intel arch
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
X-List-Received-Date: Wed, 16 May 2018 17:06:35 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../recipes-multimedia/openh264/openh264_1.7.0.bb        | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
index a7aaab3623..d77de2876b 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_1.7.0.bb
@@ -3,9 +3,8 @@ decoding. It is suitable for use in real time applications such as WebRTC."
 HOMEPAGE = "http://www.openh264.org/"
 SECTION = "libs/multimedia"
 
-DEPENDS = "${@oe.utils.conditional('TARGET_ARCH', 'i386', 'nasm-native', \
-              oe.utils.conditional('TARGET_ARCH', 'x86_64', 'nasm-native', \
-             '', d), d)}"
+DEPENDS_x86 += "nasm-native"
+DEPENDS_x86-64 += "nasm-native"
 
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


