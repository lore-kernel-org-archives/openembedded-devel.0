Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 451DC65DED
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:25:03 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so1261292ieb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GuqQZdj77y/A9eOIMb+ckn7+Al5UXK7yToAvTotPJBQ=;
	b=DZjuuZ+7xirwfLr28sdY7Ibp4f2vqznXc5C0Op8S1gNDbLOFBOkyxJ9x0oliPnJW4A
	eFHfoDzR+Z4757tT1j6a6LnvwTP33xWoUL4drcyy4x+/ujgAiYMMDehxv7Zx7MgDXVnM
	ZYZOnzCRk9tHpV136YP2bQBdXc4dNayNktgr0xGPyTWRWVEN2zMYXwxfs57GC7iYoWxl
	GFeHnFv3ZTESaj0c8yA70Wv4gbAEXxbASI9tsMb1sooGQphLxEACznTySNMQdymHale7
	SIHeFhsB8ASIyl+Eexu+7MrBeoSqXmBs2HVe2z7oiFeBOdA026P+zWQ5vLGN9v/9oysx
	JP5Q==
X-Gm-Message-State: ALoCoQnFry29pnrXWDsdqbPM2Z+tqlqiDM2FwMySxEjjBCie0jqm83vC3PAzwd67wSjH1RndA4uU
X-Received: by 10.50.82.73 with SMTP id g9mr27480436igy.0.1396977904378;
	Tue, 08 Apr 2014 10:25:04 -0700 (PDT)
Received: from openSUSE-i7.site (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id s8sm4624836ige.4.2014.04.08.10.25.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Apr 2014 10:25:03 -0700 (PDT)
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Apr 2014 13:24:47 -0400
Message-Id: <1396977887-26644-2-git-send-email-trevor.woerner@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1396977887-26644-1-git-send-email-trevor.woerner@linaro.org>
References: <1396977887-26644-1-git-send-email-trevor.woerner@linaro.org>
Cc: patches@linaro.org
Subject: [meta-multimedia][PATCH] libdc1394: disable building examples
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
X-List-Received-Date: Tue, 08 Apr 2014 17:25:06 -0000

Building the examples suffers from host contamination and therefore does not
succeed.

	| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-gcc -march=armv5te
		-marm -mthumb-interwork --sysroot=...
		-I/usr/include/SDL ...
		-lrt -L/usr/lib64 ...
	| /SSD/build/distroless/tmp/qemuarm-eglibc/sysroots/x86_64-linux/usr/libexec/armv5te-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/ld:
		warning: library search path "/usr/lib64" is unsafe for cross-compilation
	| /usr/lib64/librt.so: file not recognized: File format not recognized

Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index 7c6d2ab..5bc77f2 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -19,4 +19,4 @@ S = "${WORKDIR}/git/${PN}"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF += "--disable-doxygen-doc"
+EXTRA_OECONF += "--disable-doxygen-doc --disable-examples"
-- 
1.9.0


