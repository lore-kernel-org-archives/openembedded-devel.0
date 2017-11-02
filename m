Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5C0447822B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Nov 2017 10:31:56 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id k62so4515404wrc.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Nov 2017 03:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uAFDsdfrPx4u92Lojq68eQ0Wd4TQeWnrtNx973XO2BU=;
	b=PrgswHPEyFw6NBiiuP+ZYSu4QJUjIZ+72AXv8GFNOpCLoV9oFjAvmvEMT17RkIQjHq
	X95gBnnVO1yYKL6nawG8KSo9UDKX7By/FOGsSabIKjwiQ8VA9E6rLHm2rL2HvzgXLf/Q
	YjLhuZrFbSERhymFj3WGffFl9/Peoyymp7zx3DsAxZqkQFlzVtACKNiEyLoXzzXaG/ZF
	vBJe+XsK+Fr5Hrxff9SoYgsixk/rGygGak5mgKr33ITcaGL3qRzJQhQPgaOtdXsj6tRf
	a/K3KBavncSm6u5SW7jGGGKUSG2FJt2nTWzAU1wZ3MR/g0HiPjckvLr3FyMwPbiP9TDA
	1Tmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uAFDsdfrPx4u92Lojq68eQ0Wd4TQeWnrtNx973XO2BU=;
	b=f+DAoPmXYQoi+zeQnsDBS+P9yAGHL4Dmy3CW+rQ7I9Yi3wODcbRxlkkZcPu/86TXGQ
	ZdskUFirBF6dwEwUVCagU/FGXThkDEDlyRklK4ZTN3Jp+KQCDaWFWpFuolsQMBUDTRHD
	rej7EyPPsg1Xn1n9JLrrOqdLn9RGBgzzrr5O9TEThc0+x6iLh4NcklWeSj8hn+R3/omx
	8yudSGEbE5jIklLmc4QCxw0mV/mhRv+UqrOhbXVIlJbJT5mdGfy9wikjmiX5fCoe9PkU
	Z2TSdRwJVjU+dB58YyyTVvpkTcClFfHJ2IraJARD5MBQzT3MnMTEaksc6KXU6XiVaHNM
	5i9Q==
X-Gm-Message-State: AMCzsaVyT1cIM/fDllqaIAvnRsciBiR2hxgZ4HLRSseuTy8IgCOcXMYf
	Yzw7OJB6R9HDkQuTxJeXyvcxOQ==
X-Google-Smtp-Source: ABhQp+S/BZn180yFlOkU4UP4i7f4L8eL2jNv2AkXHxE8fAZvHIqDaraySFJijeIkEgqy1LJVUnoM8Q==
X-Received: by 10.223.139.145 with SMTP id o17mr2337127wra.107.1509618717200; 
	Thu, 02 Nov 2017 03:31:57 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.googlemail.com with ESMTPSA id
	g68sm340440wmc.22.2017.11.02.03.31.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 03:31:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Nov 2017 11:31:27 +0100
Message-Id: <20171102103129.3703-9-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171102103129.3703-1-schnitzeltony@googlemail.com>
References: <20171102103129.3703-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 08/10] xfce4-xkb-plugin: update 0.8.0 -> 0.8.1
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
X-List-Received-Date: Thu, 02 Nov 2017 10:31:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/xkb/{xfce4-xkb-plugin_0.8.0.bb => xfce4-xkb-plugin_0.8.1.bb} (75%)

diff --git a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
similarity index 75%
rename from meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
rename to meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
index 5e62c03..8ee3740 100644
--- a/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.0.bb
+++ b/meta-xfce/recipes-panel-plugins/xkb/xfce4-xkb-plugin_0.8.1.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=496f09f084b0f7e6f02f769a84490c6b"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "e4e897741ebe2827192971c2aaad835d"
-SRC_URI[sha256sum] = "3b0d3b9f4b7c3e3e7be668e2f7c845b89b16e0ed3db2bacb544a17272682ced0"
+SRC_URI[md5sum] = "72530bf59d7cd902326469e5a7a9892b"
+SRC_URI[sha256sum] = "c19ecf126201deb6148741c521124771ad396adc874471512ab5ffe1946567a1"
 
 DEPENDS += "libxklavier libwnck3 librsvg garcon"
 
-- 
2.9.5


