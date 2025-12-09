Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B84F0D3B981
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 16:36:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12112.1765298156714380952
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 08:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bDJwIsAS;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42e29739ff1so2467759f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 08:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765298155; x=1765902955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TuLBewOyYlHos3n0Bycuy+rnnFtdn9LQBtLETE4C9JI=;
        b=bDJwIsAS05ADwmBkIS6hSWSArFMD129yslpOwgcLhOUcE7dG57quBCnKEdQIHMfZbS
         Avj7l6OYnfWPyvx4nNFnACnO2ehy1IgiUeOVy7W591we1EC6xIymTX1VGqZdMklvkZ/A
         iPzUHuz110Ox8XpUe16lQRSYcr5gMpZT+K8yWHib/HVwoBqTP9FlqcoxaesgHk6e8T3o
         fTc5bikcM5asSU8H1UCBbywCkqPctipVg0TzdG0VXsI2lN6KWqg/L5xYRvi632coXIJ1
         xRt4ED7bA5IWBa/a+Ue4OGt2mz+RZMlTeKguxJYln6B9xGR9vGMJ4VUwfVrK+dWUjkZd
         8KiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765298155; x=1765902955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TuLBewOyYlHos3n0Bycuy+rnnFtdn9LQBtLETE4C9JI=;
        b=PO01Ft50eezjmPNLMnhA3A7A4r6SYJheO7WzK9xs96W4b+Sg1ZvTLxEYeYPWTTt6cI
         SM+wCxxzO/3HMg+wF+S738AYXT/6naGPYePD7Zd9sfO0oUDCt6s0ezAVPSb7ZTjpmzim
         0YBFM/cLpGtTDTqKm0n7FXZxIK75cnH8MJb0B2UmF2x7ieqVyrIzV04Mr6GZlkQKrUY6
         fmURBrAxFfpjZLSlY2totZE1qoQk10vOpcgQ+OW/lKKYjXFTYks+e/kuu3GirtFVxCp9
         8wmTau6XQcntzqitbBbcLECNeiqa+QvzVA2SEq5WraM5li7SnCZ8dTmmdDx3vzoSVNGl
         hMxw==
X-Gm-Message-State: AOJu0YzwtDz96tBe/LC1TxDKcGO7e53wDXb0/nkA4qlzz7lLLlrTAf0w
	lodgzpTcQLjsgTiaOdvMK3xhFbNfrDY0pDUiDEy/Azv6yuiF1asl2QNfDvJxxQ==
X-Gm-Gg: AY/fxX6Kzxksnp+EhlHpkMeRByGNXV5Xifs9QWRC6v9nIBDfC5EWCVkGibB0WfPBCRI
	6QLBC4q0cEu31oy0f7wPSVl5omry6gIC7R2q8upqpFTTKiE8stwsU4j2x7Ju2ROwcn8bmEfwgpy
	uaJi71DtROv33nz3sSgp1lj3/LKRFNOCu5/dipHIKlodgVPVOib7I7Qnin/QjuCdtLNiqZzjRw4
	ezbJ76tdr61L/NDvwo6iRau3JuLuFYALOi1pkMVs4pkBsw5Vo+zLjPbW4bi5yVWe0pyMC5kfA7l
	qo9hhCIqt9kOcHCFztvhRHocxkaPrx7wYZLyRbzY/eGjeV7bm9v7ZqY1C+ue5JF/wh2AedcOKkS
	LRZ1id9yDLivReQPGwEbyAlXiUEOCAJn97Km71c7sqvHjf7A0A6mu2wHZTOwzkm+RxA4DCAZbtb
	dwniNyUN+r
X-Google-Smtp-Source: AGHT+IGhAmchCqzx/lx161dKcYsh5BlJo4DrVH8QniWxaFLLAON3navJ+xEU/T48sPTxv2Uj4+773A==
X-Received: by 2002:adf:ce83:0:b0:42b:2eb3:c92a with SMTP id ffacd0b85a97d-42fa09049ccmr2296862f8f.12.1765298154994;
        Tue, 09 Dec 2025 08:35:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbff352sm33030154f8f.17.2025.12.09.08.35.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:35:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/4] dleyna-connector-dbus: drop recipe
Date: Tue,  9 Dec 2025 17:35:49 +0100
Message-ID: <20251209163552.1419590-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209163552.1419590-1-skandigraun@gmail.com>
References: <20251209163552.1419590-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 16:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122467

The recipe has been disabled for over two years, due to the application
being an abandonware, and it fails to compile with new versions of its dependencies.

There are no signs from upstream that it would be revived (repository
has been archived 4 years ago).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../dleyna/dleyna-connector-dbus_0.3.0.bb     | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
deleted file mode 100644
index 21a6613622..0000000000
--- a/meta-multimedia/recipes-multimedia/dleyna/dleyna-connector-dbus_0.3.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "D-Bus connector for dLeyna libraries"
-HOMEPAGE = "https://01.org/dleyna/"
-
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
-                    file://src/connector-dbus.c;endline=21;md5=0a1695cef53beefc36651de439f643b5"
-
-DEPENDS = "glib-2.0 dbus dleyna-core"
-
-SRC_URI = "git://github.com/01org/${BPN}.git;branch=master;protocol=https"
-SRCREV = "de913c35e5c936e2d40ddbd276ee902cd802bd3a"
-
-inherit autotools pkgconfig
-
-FILES:${PN} += "${libdir}/dleyna-1.0/connectors/*.so"
-FILES:${PN}-dev += "${libdir}/dleyna-1.0/connectors/*.la"
-FILES:${PN}-dbg += "${libdir}/dleyna-1.0/connectors/.debug/*.so"
-
-SKIP_RECIPE[dleyna-connector-dbus] ?= "Upstream is dead moreover needs porting to work with latest gupnp >= 1.2"

