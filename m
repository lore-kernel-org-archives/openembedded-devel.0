Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA2FD61024
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 21:22:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id s144so6010079wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 13:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=mp8W2iw+YvIdHE44VDb8bMlZHbqQ2rBHjEgzTjPnd0E=;
	b=SFkni3ozY9+WIjVocZIOmqPw5okM2TCY+ZWXYw9+AHCchL+lOCDsNAIBxH+oms4Wau
	X8IWuSKup/22K1E2WTFLTCsbAUC6Sg1KpPu75tiWodXkqqKCf/A6KOp8p4RuZWaYVhkN
	x6hMc4/wNtb5bc4SQQYZURSuFn/uebbz5LMT3GuWY904hQz+jy75cR68Sf2Di6eOLyz5
	a2NGaBHeW5B5BFn47snUCPrm0hsZeNO1ZOjSxKbEtPrb6VLaC88XiAJXpDFLSHaVz5aY
	xRLbqDMOx1Fnbp4797HOjzWCbCm9CvNuC8IB3LbNZddwc6vBQA8y1kOOUupFycYE4p57
	/+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mp8W2iw+YvIdHE44VDb8bMlZHbqQ2rBHjEgzTjPnd0E=;
	b=uOAx9nY7nECPodxjq43O3C4H2aLhViP/w16BuyAT3ZdBA7dTc9+ykf0Yrnl87+b7UU
	ZZ1HWb9l99VyheyeRKGcnjSJzlCt88x1YkXVwf4jkEnG555qyMh6jFf8UW1bpIkJoAPC
	J8XIZVMTVihWyvxbS9fCW5rORIqHZyxNsHVX9nBIWs0W5ueb86tftJewihJgw40nGYby
	+kCGBFJcUPlBNdMm+a/1q9Ar9iignMCCf8F608qaNtrGrtnYn7BgRXkdgoEgw864oK7A
	oroxnmjOVwCrlb6YTdRVPwDjc2oRndqCi8expuOSrZUKMFE7Re+/Hn/wJKBxx4WNF7TW
	I3nQ==
X-Gm-Message-State: APjAAAUkcwoTs5vetCo/sEIAwyMMGRd6pFkAPOEeQpuOfQl5tJuT1PGO
	HlvYBMoopMpRMo3jja8f18K6WoRC
X-Google-Smtp-Source: APXvYqzNEcIoq6dZ+gNoyrLX5SgpYccghDWJgPoLfEta/Txle1Y1op/Qn4a6R2SNGfc+Fa2rMdjOHA==
X-Received: by 2002:a05:600c:2c13:: with SMTP id
	q19mr18128531wmg.144.1581888174004; 
	Sun, 16 Feb 2020 13:22:54 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0689870B30080CC68E0727.dip0.t-ipconnect.de.
	[2003:f0:7f06:8987:b30:80c:c68e:727])
	by smtp.gmail.com with ESMTPSA id
	e22sm18296776wme.45.2020.02.16.13.22.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 13:22:53 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 22:22:43 +0100
Message-Id: <20200216212244.30653-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200216212244.30653-1-schnitzeltony@gmail.com>
References: <20200216212244.30653-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gnome-shell: upgrade 3.34.3 -> 3.34.4
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
X-List-Received-Date: Sun, 16 Feb 2020 21:22:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From announcement:

News
====

* Switch screen-recorder back to VP8 [Björn; #256]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{gnome-shell_3.34.3.bb => gnome-shell_3.34.4.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-shell/{gnome-shell_3.34.3.bb => gnome-shell_3.34.4.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.3.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.4.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.3.bb
rename to meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.4.bb
index 463fbf46f..33dd7e459 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_3.34.4.bb
@@ -30,8 +30,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
 
-SRC_URI[archive.md5sum] = "a0f7d78f57616076890f0e3b7f12196a"
-SRC_URI[archive.sha256sum] = "2474bef386c5a47d7be285aa22e24125c46ba5f860a25a1a36a90de4e456bd8a"
+SRC_URI[archive.md5sum] = "692181c1a98be9e5f5b7e8738fd428ce"
+SRC_URI[archive.sha256sum] = "e99cfb151307e1d5e5dff57b7026cf8aeace9d595a8c9e62537e934d0f14a366"
 
 PACKAGECONFIG ??= "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[bluetooth] = ",,gnome-bluetooth"
-- 
2.21.0


