Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7291179265
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 18:28:11 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id s12-v6so5354733wmc.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=JODCjEdAcc2/6hJtAPD6yttOyGqHH1yjUSE11lPduDo=;
	b=FohveqEDXxQfWMp1LkiniqZS6hed7MbmNbzuJaZeuFswK3OeVYGqfwE+2q/EQRawy3
	Ls4Ildzl1ni5ioZJfbN3r1ajIADkOmsPc1KybRbYHSzeJaI/XvgRjBYAhDcVCVH4AtFJ
	zE6mtB607X9sL1C4md9r1M3UVmD6aKLlr8vaIyQ6SI8FE0CsPsx/uXV9OlJaAktjFuTf
	UIpa0BPFyJvHY6Zluaer4tjHlSkQSBVdkGHjCv7vJsx0eTK8EBDP2LtGmeBI4XgffqKr
	omr4viSu+jLe1xeVA/IpZOpoOSrZ8HMmF/PrL7F672wMi9xf38Rb4MefBFkG3jjJNEHb
	G9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JODCjEdAcc2/6hJtAPD6yttOyGqHH1yjUSE11lPduDo=;
	b=mgV6R1pi7uX8vt1kOjMLNlGW2NeQRegDCrcXtbp67ZOApVESfpA0NOg3u1O8SGoFNl
	qyMnlaNy/GYIooLfmLIbjZJim9ts33OSg5PEY1iygjXEeBEokjVKEcL825e+E+sGpOeV
	b7vCh7qIiQc0te0Z5xJkgItQRhtisIA7vIgHC3l61fiC1A8LLBDCcOUwUxtlivIYL0FM
	xX+NGHT+eYLEXlvuCQ3djjaVS6ZKxSHQ2QlfFYLRNdCLSBxHi8mPOR4hDgLYXiLc0Luy
	tjNsniHbATNPPms9n4q/d8HXz+8KeYoa+2krcSnsG6RAtDqmafb+WcLdt9EF65VY0rgt
	p2SA==
X-Gm-Message-State: AOUpUlEeYafjpLrlTy5A85sgkpXlr/mvbr0cnh/j1Z1fVME4EsL8wd72
	gS0Fh7fDjqwd/qcXZZTJohf30DBo
X-Google-Smtp-Source: AA+uWPyHy6X00z/OCtrn8nldnmlhC7fxHtt37Q1uTXcX1raFZd74WmRd2qS3ViW5XdH8+D+sIm5dQw==
X-Received: by 2002:a1c:a401:: with SMTP id
	n1-v6mr17743504wme.125.1534444091835; 
	Thu, 16 Aug 2018 11:28:11 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC4D1601E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc4:d160:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm26040224wrv.90.2018.08.16.11.28.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 11:28:11 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Aug 2018 20:27:47 +0200
Message-Id: <20180816182748.2400-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180816182748.2400-1-schnitzeltony@gmail.com>
References: <20180816182748.2400-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/16] move all libsdl recipes in one folder and follow oe-core's folder for libsdl
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
X-List-Received-Date: Thu, 16 Aug 2018 18:28:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libsdl-image => recipes-graphics/libsdl}/libsdl-image/configure.patch | 0
 .../libsdl-image => recipes-graphics/libsdl}/libsdl-image_1.2.12.bb       | 0
 .../libsdl-mixer => recipes-graphics/libsdl}/libsdl-mixer/configure.patch | 0
 .../libsdl-mixer => recipes-graphics/libsdl}/libsdl-mixer_1.2.12.bb       | 0
 .../libsdl}/libsdl-ttf/use.pkg-config.for.freetype2.patch                 | 0
 .../libsdl-ttf => recipes-graphics/libsdl}/libsdl-ttf_2.0.11.bb           | 0
 .../libsdl-image => recipes-graphics/libsdl}/libsdl2-image_2.0.1.bb       | 0
 .../libsdl-mixer => recipes-graphics/libsdl}/libsdl2-mixer_2.0.2.bb       | 0
 .../libsdl}/libsdl2-ttf/automake_foreign.patch                            | 0
 .../libsdl}/libsdl2-ttf/use.pkg-config.for.freetype2.patch                | 0
 .../libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf_2.0.14.bb          | 0
 11 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-multimedia/libsdl-image => recipes-graphics/libsdl}/libsdl-image/configure.patch (100%)
 rename meta-oe/{recipes-multimedia/libsdl-image => recipes-graphics/libsdl}/libsdl-image_1.2.12.bb (100%)
 rename meta-oe/{recipes-multimedia/libsdl-mixer => recipes-graphics/libsdl}/libsdl-mixer/configure.patch (100%)
 rename meta-oe/{recipes-multimedia/libsdl-mixer => recipes-graphics/libsdl}/libsdl-mixer_1.2.12.bb (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl-ttf/use.pkg-config.for.freetype2.patch (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl-ttf_2.0.11.bb (100%)
 rename meta-oe/{recipes-multimedia/libsdl-image => recipes-graphics/libsdl}/libsdl2-image_2.0.1.bb (100%)
 rename meta-oe/{recipes-multimedia/libsdl-mixer => recipes-graphics/libsdl}/libsdl2-mixer_2.0.2.bb (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf/automake_foreign.patch (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf/use.pkg-config.for.freetype2.patch (100%)
 rename meta-oe/{recipes-support/libsdl-ttf => recipes-graphics/libsdl}/libsdl2-ttf_2.0.14.bb (100%)

diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image/configure.patch b/meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch
similarity index 100%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl-image/configure.patch
rename to meta-oe/recipes-graphics/libsdl/libsdl-image/configure.patch
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl-image_1.2.12.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl-image_1.2.12.bb
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/configure.patch b/meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch
similarity index 100%
rename from meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer/configure.patch
rename to meta-oe/recipes-graphics/libsdl/libsdl-mixer/configure.patch
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb b/meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/libsdl-mixer/libsdl-mixer_1.2.12.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl-mixer_1.2.12.bb
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-graphics/libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl-ttf/use.pkg-config.for.freetype2.patch
rename to meta-oe/recipes-graphics/libsdl/libsdl-ttf/use.pkg-config.for.freetype2.patch
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb b/meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl-ttf_2.0.11.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl-ttf_2.0.11.bb
diff --git a/meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.1.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.1.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/libsdl-image/libsdl2-image_2.0.1.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.0.1.bb
diff --git a/meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.2.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.2.bb
similarity index 100%
rename from meta-oe/recipes-multimedia/libsdl-mixer/libsdl2-mixer_2.0.2.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-mixer_2.0.2.bb
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/automake_foreign.patch
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf/automake_foreign.patch
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/use.pkg-config.for.freetype2.patch b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf/use.pkg-config.for.freetype2.patch
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf/use.pkg-config.for.freetype2.patch
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf/use.pkg-config.for.freetype2.patch
diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
similarity index 100%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
-- 
2.14.4


