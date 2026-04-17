Return-Path: <hfranco@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B7CF8DFFF
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 18:41:00 +0000 (UTC)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52219.1776451252477099787
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 11:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20251104.gappssmtp.com header.s=20251104 header.b=pLEdCg2M;
 spf=pass (domain: baylibre.com, ip: 74.125.82.176, mailfrom: hfranco@baylibre.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c156c4a9efso1266345eec.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 11:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776451251; x=1777056051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K60eBqvH/g1Z3nd4oychkE4cTCvxyByI3CtoQ4CK+KY=;
        b=pLEdCg2MizDWHzsWxu7arrmdY9HsqzPYKiGOppjGB2kHJ4Sk+dH5klcEcvmUcOhmcH
         33S8b8sdZwaT3cfdKzTvSs2+navg3aNBUEVna2Vq4R5mNLayA/fn6sDfQZ1oX11F6pO9
         c/8mlx/hUy4L3JmdMrRd3fMMs9QL8WSgbFMyUSzAyWJK4+Drrt0H7pb5bHpgi0dxsTRW
         BLvYVMQiMgSVeb67nFHaEKwx8fniujRYhpNY8yl52i8pkk/BKPRHHvgQ/k7uxqtN0o1v
         jR1S29oQswCltApkBXHky+Mzi+2P8/w6TZlGYcBq9L+pz3GvkNiAc2WNRQc1ud10AaUn
         R+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776451251; x=1777056051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K60eBqvH/g1Z3nd4oychkE4cTCvxyByI3CtoQ4CK+KY=;
        b=FB49LDTvbx+Y1LOyjZqZfAXJjKDXve2VptxYsPQ3/97XSLNrs/YX1hVdkFv58K0bEf
         3oOGd/z96WmmJ/dBi6DirSNZwMKFVytTcJIDH8hOnUIPwA83LE8oY5hwxwserF+YqXcX
         kz+3u7yobSCQFegs+p3F4ibv0m/vpIBwJKU1VJkFyjdnHmXrV/zit0kxseJitICcJ0HG
         dTg/SbY4FDapnyBVPGzKZueNANjgt5xQB3vhO154yJWsrCgMnLri9lKbxlNlE4XMzR3G
         /yuyC8G+TkJbRlTZbjGl3A0qumc1pBjuLqwvZjy7GTXHYlExp8INjCFkgzjrQxrnxmcE
         qiuw==
X-Gm-Message-State: AOJu0Yya4YmarWwTbqlWGNO5KWUdmdNQsHICH8je2CDoOWgDF5JVsMWL
	DGjU4oCXEfAdjXxz+ert8/HTSkcjNzFiYyIUkTlqBBeJMNAu6zjbMi95S8cwiWGCQGCvF5oUSsD
	eph3jshY=
X-Gm-Gg: AeBDievTemBhg4Et9/gPTyosgl/DoaE98EYQHTI+E5xTcWA4ngi9zNe8+lK4Jqx4PaX
	RPOIQAJCqCHC7arGezQaDmfsE4L8kvgblzj4XosdvCAumVTkMGtLsWPMzK1Kdlk5eM9dhldM4z5
	LusCWEzQ6qg9D0c1K1rJ2K4azg6tWdEBIr3tQpOdK1yiUeJ8xxR6hE7xxNMs6Z6NOAhrKV21WeP
	FkZnPeVQ2ghpN3IXz1lsMoFbFdbYQhvbmLnLDAzPn5tgaztZRQ0wSbQZVp79oPpZe9j0h80sWUS
	9GR0/Q76GVYILKFVyjhpQdyvbIFUdENVEmFF4lAzjnOgGhskmyojk4ZehUsSghFc3cVVrPYwTYC
	qAX1lo18p3rKwckfua7T9QP1lBEaOW9MuKsSqdCcvFTnuDbJ31XSCIO0mebMXb5f8zStFVt5S3n
	4WCBIVnZBXVeNMW/RNd+FhdSbEf69tBlN/2eubUNZ1TuE7QK8efaKLWI/khg8bYdUYgWkTP5Un0
	HgHOJZDblDBr/c=
X-Received: by 2002:a05:7301:4593:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-2e47883907fmr1817418eec.16.1776451251457;
        Fri, 17 Apr 2026 11:40:51 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c5:9534::d153])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm3201835eec.20.2026.04.17.11.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 11:40:51 -0700 (PDT)
From: Hiago De Franco <hfranco@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
	Gyorgy Sarvari <skandigraun@gmail.com>,
	majortomtosourcecontrol@gmail.com
Subject: [meta-oe][scarthgap][PATCH] uutils-coreutils: make selinux PACKAGECONFIG dependend on clang-layer
Date: Fri, 17 Apr 2026 15:36:02 -0300
Message-ID: <20260417183946.574761-1-hfranco@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 18:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126450

SELinux layer build fails if 'meta-clang' is not present, which
shouldn't happen, since 'meta-clang' isn't a dependency.

If 'selinux' is on DISTRO_FEATURES, PACKAGECONFIG calls 'clang-native'
even if uutils-coreutils is not being used (this is enough to make the
recipe fails on parsing time if meta-clang is not present).

Make 'selinux' PACKAGECONFIG dependend on clang-layer, and print a
warning if the user wants selinux support on uutils-coreutils but
haven't add clang-layer.

Signed-off-by: Hiago De Franco <hfranco@baylibre.com>
---
Hello,

This is the result of a dissussion from a patch I sent to the master branch [0].
On master, this issue is actually already fixed, but not on Scarthgap.

This patch will behave like the same as before, however it now trigers a warning
instead of forcing the user to have meta-clang layer added even if is not being
used at all.

[0] https://lore.kernel.org/openembedded-devel/20260416191754.3910026-1-hfranco@baylibre.com/

Regards,
Hiago.
---
 .../uutils-coreutils/uutils-coreutils_0.0.28.bb        | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
index 76cecac5a6..3d94d4c985 100644
--- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
+++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.0.28.bb
@@ -22,7 +22,15 @@ require ${BPN}-crates.inc
 PROVIDES = "coreutils"
 RPROVIDES:${PN} = "coreutils"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)}"
+python __anonymous() {
+    if bb.utils.contains('DISTRO_FEATURES', 'selinux', True, False, d):
+        if bb.utils.contains('BBFILE_COLLECTIONS', 'clang-layer', True, False, d):
+            d.appendVar('PACKAGECONFIG', ' selinux')
+        else:
+            bb.warn("selinux is enabled but clang-layer is not in BBFILE_COLLECTIONS, "
+                    "selinux support will be disabled. Add meta-clang to your bblayers.conf "
+                    "if selinux support on uutils-coreutils is required.")
+}
 
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
 
-- 
2.47.3


