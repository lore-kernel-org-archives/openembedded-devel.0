Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67114CFD2F9
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 21:55:43 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3497.1763848534322350444
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 13:55:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hEcqlCyG;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so19645575e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 13:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1763848532; x=1764453332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iDoNl0XU/PtQvWrODTJ6zh3xpI9+3OQjqI1S1fOyvmY=;
        b=hEcqlCyG+wotwp91IvnD2D+tWZrkdY9PNe07FZFFOJx0gaf6sgHvh8gwXE+Gafd83n
         gDwva4qEDyxk3Xgaqwk/oJjBgqLatX5iIJfD3aCDHjsnGn2DTky3Q4GHDeCHXfWufbPj
         88U211btHv1MesWT5XSVGfSki3GgSpmA5J34I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763848532; x=1764453332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDoNl0XU/PtQvWrODTJ6zh3xpI9+3OQjqI1S1fOyvmY=;
        b=O19rcdK6O5so9R8euMD3mHjFLojmXkMY1DUjt5XDcbdyVW+N7Hrphm9R+GoHu6mRuQ
         veD8TA6kO4cTYjgOlefDl785QlkgZ1IAPtDguyknZHvefR/PrH7VJTsKxjn0uu9DucEI
         WctfTM+2C08KWUZixkveL5PsZyK7BWeeDjJLs6SrGSARZ26Sa27GNivwKJ0WgBKSjkgt
         7g0A3Fmg+QgQgfB8oc8fU/RJiJ5gmlp49tY+EiMXhb8c8ZXPIJvC/qnkQys4//fW+Ria
         FyGJjmfYoxQPE4GoAVAHKe3A/wUv3U6TtWQUw/fLcmQIA1PaRy5GcCtlciiq/BGYyFJn
         NM6A==
X-Gm-Message-State: AOJu0YzDtmQ5n2lveNjUyUdeqgwMEXKQFECGEcpzDhHhQ+4zehquXIS1
	yrPVzVIEyfROUCoICb8pBChJzQSMlMFf/q8oHE/V3BokrPibD6rVAGAzmgtKUe2kCi7PyzlmqsC
	lM41ctpY=
X-Gm-Gg: ASbGncvzOXuHG/OPj0rYBdKx8WtoGR9LX5sFsDjvtzxyN8a5C2J4BjPj2EIRT2hQd5J
	sblKE7iaEmTUHYg2DtZK/z3CekI2xTc31+nPF9J0Wo2vYCijp8wtOuevixxFq4v83PxtFFwvSOm
	T7N4NXvNA7O0qTQSA8omA3/9HSzgFZVln1FpvltzKZbNNLhsSoyMMhND7Qxuc+AueOX0W3Or9xK
	bTRqsvtHB2kdCj9mK50cHTimxuiiy39UJ02qfL4jc20C0oz0HlSDNGSEEa3L1dv6K37/QJPv4ql
	fgZfnJmEtHE4YKUe5s5AJETjLQye3yr9Q4z5omlDD7cZ509NqKqa+GeqQZbHw5sQTO0wd1aQDVA
	yf/yH+u7AStMqv1kSibRvEihPELNUHonZQ/PIVAM8DxKkBMdl8ldmBVDIMKYqmu0ri+8rVPlnVS
	IvHM+2oKCcXJCagyOLHvrhfWu7nDPP2ZFapCrZypLEqr+kobIp+I2VzAcgMmiid4y9u1i/1kaa0
	G8n9mT9ioqClUMwWk9Uadm5R8QSd4xa
X-Google-Smtp-Source: AGHT+IFs8gReVZuoKqEodqD25K6Ro/+Qw334M4f7THn/AfrGqjJM25m2lZy3Ra9xb+pLgLjnBNCuMA==
X-Received: by 2002:a05:600c:45cf:b0:477:8ba7:fe0a with SMTP id 5b1f17b1804b1-477c01c001bmr84807935e9.24.1763848532536;
        Sat, 22 Nov 2025 13:55:32 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3af0e1sm109237945e9.10.2025.11.22.13.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 13:55:32 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-perl][PATCH] libunix-statgrab: Put LD export in do_configure
Date: Sat, 22 Nov 2025 22:55:17 +0100
Message-Id: <20251122215517.3780607-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 21:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121989

From: Yoann Congal <yoann.congal@smile.fr>

Toolchains (gcc/clang) forcibly define LD (LD = ...), so, override it in
the do_configure task.

This fixes this build error (seen on AB[0]):
| Checking for pkg-config... .../tmp/work/x86-64-v3-poky-linux/libunix-statgrab/0.112/recipe-sysroot-native/usr/bin/pkg-config
| Checking for pkg-config package of libstatgrab... Unsupported compile language "C" at Makefile.PL line 39.
| -lstatgrab -lpthread
| Checking for library containing sg_get_process_stats_r... WARNING: .../run.do_configure.38403:154 exit 255 from 'perl Makefile.PL INSTALLDIRS=vendor NO_PERLLOCAL=1 NO_PACKLIST=1 PERL=$(which perl)'
| WARNING: Backtrace (BB generated script):
| 	#1: cpan_do_configure, .../tmp/work/x86-64-v3-poky-linux/libunix-statgrab/0.112/temp/run.do_configure.38403, line 154
| 	#2: do_configure, .../tmp/work/x86-64-v3-poky-linux/libunix-statgrab/0.112/temp/run.do_configure.38403, line 147
| 	#3: main, .../tmp/work/x86-64-v3-poky-linux/libunix-statgrab/0.112/temp/run.do_configure.38403, line 189
NOTE: recipe libunix-statgrab-0.112-r0: task do_configure: Failed
ERROR: Task (meta-openembedded/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb:do_configure) failed with exit code '1'

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/87/builds/77/steps/38/logs/stdio

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../recipes-perl/libstatgrab/libunix-statgrab_0.112.bb      | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
index be52caacf2..7cf4875e14 100644
--- a/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
+++ b/meta-perl/recipes-perl/libstatgrab/libunix-statgrab_0.112.bb
@@ -32,7 +32,9 @@ SRC_URI[sha256sum] = "16a29f7acaeec081bf0e7303ba5ee24fda1d21a1104669b837745f3ea6
 
 S = "${UNPACKDIR}/Unix-Statgrab-${PV}"
 
-export LD = "${CCLD}"
-
 inherit cpan pkgconfig ptest-perl
 
+do_configure:prepend() {
+    # Toolchains forcibly define LD, so override it in the task
+    export LD="${CCLD}"
+}

