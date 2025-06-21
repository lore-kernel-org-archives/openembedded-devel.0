Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C81DC71157
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 08:23:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.3764.1750494219883750177
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 01:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z8fdd4a4;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so2589270e87.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 01:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750494218; x=1751099018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ocFnJWS1KpJcqRP2uQvNyoKz1MJdwB9QxtgotlMHXRo=;
        b=Z8fdd4a48ehm/56O5xjVWmWZ1H5+b8/SLWW9Mn7lESOQca3tzSVyXwc8EpZ5jvQys6
         7ZyPmr0CnuoyeO1r17hhKy+azIQA4T3JNCnCexPS7WHMzEzMsHgxySyirH//UqKAlB0b
         fRXD62+4hXgMuo9jrGTBqekYscytSNJh+iweY381TwO+xNAfqXINdulB8p+zZCcqIyDU
         8TgFR1FGtrYF/aAEmUlK09+lU6x1+/NIbiZJ03z/zJuMCyniIKwR0K63JaY1PrmxbOZB
         wHmef+9d/8iqaPIO+pV38Ei0LbkC0ku+BgwA4JNw9NfZ17RGhqq9CWBFyYsHdE6AtTws
         36jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750494218; x=1751099018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ocFnJWS1KpJcqRP2uQvNyoKz1MJdwB9QxtgotlMHXRo=;
        b=fO1KFCvEZaMd5/L2UOiaqpBFMA81hPoN+B+l1bmExDFQsUtWEySBYIoaapg+g7Q9s4
         A0Y+msoAuZ+le8vOrDzc85+0jxr2C4x3O3UNiMZsYo87omxl0fUTskzFG866yZovDtGB
         OlJkNU/cxd+Lgr4TAP71a/EAHzCJ9ujC59/bO7i4AWRvgvmkC85uQXKivghEP/yRNzg8
         yPpwFs4kItKB9tn9PSSHo5NWv8sTA73PFBHPD0ynZwkozWCYvX8fFu12PuncV9jLXTl7
         9EHjLBxjgIWVf4cRIN+GnbRw4SX5Wf3mznRNGNMuqbLoqFt/Ix//+67xwKb//0RRyfRi
         ql7w==
X-Gm-Message-State: AOJu0YzBip5pkno+hN7PcuIHeO9QpipWKx1rd7Uayr5EZvh2Dfhr9mdU
	mETfSNtzk9PcORozmIK7dbqlnZw7nUSIyVonl8D7gaWlLRKV5j9/wiGmpVqchJ3O
X-Gm-Gg: ASbGncuK7DbtkUmWoZy95sdYSE9yZ2DHFwBA5j9K8BA3Qxl4l/Gc8bGjIVINh9TonEF
	WF9i8p+8i/1jj419TbI7FExqxq+ojoRrAv8NbAF9YnbNhzD9hbaAHuJ/2rp2g2RPt2g4zoaizxz
	CHCclY7c7bLNDvXqPv9iU36S4gyeeLGaFPpokFKRDfqt6koDn1neiAB16IYP1yhArsJPTWk0ZGH
	Zprq36YsEH18SB7kQA41qg6DZrNO4QHrx169UHX7vVBHBBZqknPRhu/XYPnG2fqJ7Ix4b0WVn7m
	I4st7/5d43eS/8UGLc1f78VjN3/oOlOU1cik7ZWhEvKn4N2cknSVAWeZJ94pEgMvGo2/TWQWpVG
	ui/o=
X-Google-Smtp-Source: AGHT+IF/V0w5Y1z35K9v/Y6iUG9wpiPB/dFqlWOx9IVTkV/7LQQIjb+iLRiqwewMvdnagjtPzDN0xw==
X-Received: by 2002:a05:6512:3c9c:b0:553:a311:3c1a with SMTP id 2adb3069b0e04-553e3cfd9d1mr1708259e87.37.1750494217268;
        Sat, 21 Jun 2025 01:23:37 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc252sm584565e87.228.2025.06.21.01.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 01:23:35 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-networking][PATCH] mdio-netlink and mdio-tools: Fix license file path
Date: Sat, 21 Jun 2025 11:23:25 +0300
Message-ID: <20250621082325.856798-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117988

Issue was related to latest UNPACKDIR changes -> https://git.openembedded.org/openembedded-core/commit/?id=46480a5e66747a673041fe4452a0ab14a1736d5e

WARNING: mdio-netlink-1.3.1-r0 do_populate_lic: Could not copy license file - [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/qemux86_64-poky-linux/mdio-netlink/1.3.1/git/COPYING'
ERROR: mdio-netlink-1.3.1-r0 do_populate_lic: QA Issue: mdio-netlink: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/qemux86_64-poky-linux/mdio-netlink/1.3.1/git/COPYING [license-checksum]

WARNING: mdio-tools-1.3.1-r0 do_populate_lic: Could not copy license file - [Errno 2] No such file or directory: '/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/mdio-tools/1.3.1/git/COPYING'
ERROR: mdio-tools-1.3.1-r0 do_populate_lic: QA Issue: mdio-tools: LIC_FILES_CHKSUM points to an invalid file: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-linux/mdio-tools/1.3.1/git/COPYING [license-checksum]

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 meta-networking/recipes-support/mdio-tools/mdio-tools.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
index b99ce82810..fc8161eb1f 100644
--- a/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
+++ b/meta-networking/recipes-support/mdio-tools/mdio-tools.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A low-level debug tool for communicating with devices attached to
 SECTION = "networking"
 HOMEPAGE = "https://github.com/wkz/mdio-tools"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/wkz/mdio-tools.git;protocol=https;branch=master"
 SRCREV = "f74eaf38dbda441df4fcaeb21ca4465957953a2f"
-- 
2.43.0


