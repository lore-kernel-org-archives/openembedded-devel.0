Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49DF66C230
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 07:52:28 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id i11so25774708edq.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2019 00:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=116skGjtRYzMqBWAlNGXYhfBfj17lAQR4Zkyh5YU5To=;
	b=K2sBa2NjffBDkqp+FnEZpWfdd7Geor55XXeq7jjF6XGZUEJCfzrpQ++JWFy/3nY2tu
	yPEiUc4wUMGcMXJ/X1ys6eegTfPno90uL7D9dtePjB6b2LD1pDxDd75+HwWVTyy7mg6M
	qF+PMEV3kMza1rRDOhn1YGaL65lcSlosCYMkv/VvGSf3MncAQnr8F2k2bphCbGM7+dwu
	5Xv1BRltp7uGJXZv3C0OFF7wzrAZEHey1OpeU9xjdtcN7lm4TjIuzBABrGYT6sCNZtbX
	643kBcpxRAaFIpHoxk1hCnWh+5BDLzwJZMOlfritsu9na/cXYj13A6kGzmVmK9d0OjNS
	AHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=116skGjtRYzMqBWAlNGXYhfBfj17lAQR4Zkyh5YU5To=;
	b=DkaHe226Y0vzfG/BPHimWX4t7/NdttficWgEWT+SW3a+Ga6GyWV1lelzjnN2ic9iWr
	aoL34QwaGLGxkthzBtg2ERE3CAlt7PmL2QFcU0r0xztQ7Jux8wi7MPNf58rnNK3XORbc
	Jb6b5bodh1WOmZfh/lhAv5zVcylI8eoh8eNhsOYmHQo2i+AA2ans76cRTL98sZjjas5H
	9fjpVVujF+Ik+e2Y6aJJIPWlk6BCwOxHNpnL5HoqB8wWwKHxUr2LgFAgU9sxdCu0RJQw
	RDLiRvOaIixHjP+0HQacvWCK8XL+xECQhjzlWhx3qBA8OEDYjnzH8EzfjNjtaafRRG/3
	VTtg==
X-Gm-Message-State: APjAAAUh2eWz6XlNtKRc8/NrngttC4InwdlU81GHq6qpP0ydnY8m7V9e
	uXm+184rK+a92vIDFvlpe944pfo9T/Y=
X-Google-Smtp-Source: APXvYqzj2R1cY/cqL5lutjBBdV0/saMkh8VTmW4OZZenC8DDh4RD7ymefu5kduBTFILw1TeOgXGLPw==
X-Received: by 2002:a17:906:944f:: with SMTP id
	z15mr23574590ejx.137.1561449148609; 
	Tue, 25 Jun 2019 00:52:28 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	y22sm4308640edw.94.2019.06.25.00.52.27
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 25 Jun 2019 00:52:27 -0700 (PDT)
Sender: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo@ribalda.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2019 09:52:01 +0200
Message-Id: <20190625075223.13585-2-ricardo@ribalda.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625075223.13585-1-ricardo@ribalda.com>
References: <20190625075223.13585-1-ricardo@ribalda.com>
MIME-Version: 1.0
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: [meta-java][PATCH 01/23] icedtea7: Add x11 as default pkgconfig
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
X-List-Received-Date: Tue, 25 Jun 2019 07:52:28 -0000
Content-Transfer-Encoding: 8bit

Seems to be a basic dependency, not optional.

Fixes:
| checking X11/X.h usability... no
| checking X11/X.h presence... no
| checking for X11/X.h... no
| configure: error: "xorg headers were not found -
| 	try installing xorg-x11-proto-devel."
| NOTE: The following config.log files may provide further information.
| NOTE: /workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/config.log
| ERROR: configure failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at /workdir/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/log.do_configure.29594)
ERROR: Task (/workdir/repo/poky/../meta-java/recipes-core/icedtea/icedtea7-native_2.1.3.bb:do_configure) failed with exit code '1'

Signed-off-by: Ricardo Ribalda Delgado <ricardo@ribalda.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 69f5d25..747bb72 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -11,7 +11,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
 	   unzip-native make-native util-linux-native\
           "
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "x11"
 PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
 
 OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
-- 
2.20.1


