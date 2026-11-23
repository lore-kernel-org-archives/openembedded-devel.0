Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48558.1795411911691752602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=deYAdMdv;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-380c28f9e35so3962944eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411911; x=1796016711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lVutp6bTG3FijqOSiMy2C33Q8I7bUJI5o5kjuqvJbUY=;
        b=deYAdMdvM3N0SLMU47hKcp4iuYwOVJBpInzY4E7vf4/+GW6bu/GqiVYY1ITpeG6sRf
         kPUCLJ5EfAGk5rVoRqutyKfWqjynxjiZbU/VBqpvxmZdjPJthAu7fkftlvZeyNmq1oGj
         vAscULOgjqB8PvQzx8rn6X6lRdZAx9/fqv7KWpuHAvxH0Ph7kLKOnqVLVf5dGk5CBXj9
         Rif9wr8z7uA3yOCxPVYJ35yO8KAUvy11BQ6g1PtDP3IPjj/1x3Dr8+8wDnCqZpaeh05y
         RqJQKny/G2KLlktMyX3UI2yyZ5lo+DJL/MjAXlzxYyg8Nat2/gZ4dR5FPO0z39JDJF70
         r1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411911; x=1796016711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lVutp6bTG3FijqOSiMy2C33Q8I7bUJI5o5kjuqvJbUY=;
        b=UGgAgmxvMU8e327BAI+yonla4WzyuwsTrAaVj4lIZ2pnT6ykeqNRfIf81pISXmsPct
         XAKIXk4dbkARq5qgAY3aYUFy72ISRxloLW9pUGlFX+ikTtRnXZ+YpXGdxy4ek4stp9Zh
         Wyrf5aSwk9Ja7PPwEevF87Cbg8SK7OlZeUPLzishSFYTqakOSJw0dO2eqZQahEBM1jG1
         Mq7u2YGB5fUMsG9wz4zBDTtXW43dt+sir8Q002iI5uvUQYZiJVXvrslH/bY2CGnr+WaB
         k5RDogIKnGFqXGdRutEYoO3cQeetrQVFTXvl3Otr8I9FfYhIxxE0vryF3xnZYorfyhnw
         at3Q==
X-Gm-Message-State: APuU4Z92pvNLL5E/bUYWMQlPfeQH9yrGu9v6ylattC8epLVDE4je9dEo
	gletEQ0/J15Go0z2dkOYxY/+sS3T06HcOzMQ5gdgdPfvHTitu7pPFa3rZoZtySqVoL0=
X-Gm-Gg: AZFdTZcX7XT0mhGO3pAdaCBE6BGnDDr6DqWE+FL96QSGwINQlVDY+VSJNS3hJGq4HRV
	8/Kmf4D0wgJ/VO+fdzGFkjE4Ha1VxJ/ZBi1HAinjP+pWL67FVOWntPC9w85fQMgtdXFiE15rwON
	FBeOWCtLBevkUe/D7to2iB9EWPDJ2ZvYOOkFOX3Z+7szgiuzvBBtuHASHW9vEgckowArqgaJ171
	7bkZmblKBKtZzbSpAKrjsYASg2SCShfb03qyHLRZ3WH3TLTw0EBGqo0xxjIVckwJSinDeKqRGJe
	Ku6uplLdI2/k/qKYdR70qi1/RVc3+afTW9P+1rL4p27Jeo10KGY9VYZNGBkqyrrR5FXjW8+gRk0
	p/kxU5AriK+JvBfOEnjzT7Dheto1xnaJerjPDoCDwSJF2v/EKlNXfY3srKVdpF8iJeGTkOBhmyL
	Fn0IOCgpBwVnoV361JkF3xzXeelZPxjuFNfpkKqsUx8d5oqa3996COf/Vjgz1yME9O0DzhMnSQo
	Q3jTKPsE5VN9oGKOgQjZ7DMTrxkK68rcM5ffwGLRr1nLbuEMWkGdZuTYcaVTppJvMBWoER0rKi7
	aaj9Oxb57P/9j5LwlDWYU+IBq/76+z0I47oShhUnJuQg7IVAgUPLIB5/34F1VJIMVeWF1pcwsZQ
	RHeOK4dBvhaqrgyAlyfX3Gv32n5Cp6/M9hteTY7r+Q6HAnc7/u7IT1vqEwu5q3MG6roMVjzTP1p
	4uh2+g8wLk0RaE3+5ROhllqrgoWZPb9sG/ZrVmxH9+sUX58W/eYi4rtPcexm7uCJBMQB74sazHe
	MCtg199//HTQCnGapHpENMSXsb7M5jYSz1eBv/U81Wk1Pgbc2yoI9hcUPDqigsuXNg3+7Krl53j
	BOtqQMovJH4+4BV69WTzSNAAVg==
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr13428812eec.6.1795411910970;
        Sun, 22 Nov 2026 21:31:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 3/3] xdebug: upgrade 3.5.3 -> 3.6.0alpha1
Date: Sun, 22 Nov 2026 21:29:50 -0800
Message-ID: <20261123052953.3658549-94-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132881
Content-Type: text/plain; charset="utf-8"

First alpha of the 3.6 series:
- Add support for PHP 8.6; drop support for PHP 8.0 and 8.1
- Remove INI entries for changed and removed Xdebug 2 settings
- Code coverage overhauled to fix inconsistent branch/path data
- Reinit debugger per request in FrankenPHP worker mode
- Fix multiple_sessions DBGp feature, a potential crash with
  breakpoint line tracking, and the reported systemd private /tmp path

3.5.3 refuses to build against PHP 8.6; 3.6.0alpha1 is the first
release that supports it. Use 3.6.0~alpha1 as PV so that the final
3.6.0 release sorts higher.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../xdebug/{xdebug_3.5.3.bb => xdebug_3.6.0alpha1.bb}  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.3.bb => xdebug_3.6.0alpha1.bb} (76%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.6.0alpha1.bb
similarity index 76%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.6.0alpha1.bb
index 6d18d7efe8..e7c996662d 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.5.3.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.6.0alpha1.bb
@@ -5,9 +5,15 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=afd6ce4aa04fdc346e5b3c6e634bd75c"
 
 DEPENDS = "php re2c-native"
 
-SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
+# 3.6.0alpha1 is the first release that supports PHP 8.6
+PV = "3.6.0~alpha1"
+XDEBUG_VERSION = "3.6.0alpha1"
 
-SRC_URI[sha256sum] = "f073de91bea046106abf4d6071c963ea71e58571df6ce58948ceca89d121cb2d"
+SRC_URI = "https://xdebug.org/files/xdebug-${XDEBUG_VERSION}.tgz"
+
+SRC_URI[sha256sum] = "5f464dfbba2f2aec384f9a10cb42cbfb2b3c07274b70491c46080b707271fcde"
+
+S = "${UNPACKDIR}/xdebug-${XDEBUG_VERSION}"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
