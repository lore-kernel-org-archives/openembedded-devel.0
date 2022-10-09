Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5410BC433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 21:56:00 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web10.36.1665352550920540129
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 14:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=Oh5BUvOv;
 spf=pass (domain: underview.tech, ip: 209.85.166.41,
 mailfrom: vince@underview.tech)
Received: by mail-io1-f41.google.com with SMTP id o65so7276569iof.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Y5YSoZMSQBSX9KkjgMp8VEjpUFdHa00tv/Sh5iiLOE=;
        b=Oh5BUvOvCiptUCS3fOIO1AD6W6znVeYD6gaQtfglnbln+Fs6hevJfKZK+aOloiuJ5O
         oCRVhp1WQQ16kjYN22uFcdwfnYZhjAwDrStxZZZzGqfgEhaSv+83gcyCcsZLkYh5rPX5
         KFY2mwxXGvqLYAMUFLhcOPfHcuKxZuPWwOF6LtnB5XxqAOBczZeBWDqdlORPcUnAG7px
         qmwLV3AhlPiGpnB4lz4FU0ospo2QjzgukLhipKeYu3zcdtNyBn5FrcvoqaVdT2SCcz9F
         CNOFuRl0e7rdgElnCCs/0S5yRtPMjVRWG/LadHE+1WV53qc//D4Bg+BW4HwCsP+epWW6
         9bvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Y5YSoZMSQBSX9KkjgMp8VEjpUFdHa00tv/Sh5iiLOE=;
        b=V0BoWJFDtR+pPL0cRj3WA5hDdz3aUuIWxIu0RSF7wgwUpSO7AqxjM29riPQ4EqkylB
         qfZ/MJyOhh7yDVUoEEG8VstaHr6zyGvw0zr0Sdl6PXFsTWvNa4Iql9UKD0crAgUVwFxr
         w3kzAFbvT6UGQms+bJIuqFPy4P+cAGq82efd/IblRjCGVxdLkSwscBKqFzUuz/dRslX8
         NYPKm5ufwZ7IiaJ5mFGRgXTx10dB7EdYszcw6dbBYEed8k9duW+OM0WEEWZ0bbd5OHDo
         LD5ABLnjHCDCn3ri7QktYYLjYPOW3ILcEYbUvdnhSUPL2Y2eVNbbRANyQfHw54VRHJpW
         lQbw==
X-Gm-Message-State: ACrzQf2vH0s5fm2nYe2gqWf0jsM8GoxG2EIXCz8TpuztBopNxCADgjyP
	gVFv+mzg8rkLHjQWG6fuX9nEH9MYb7+SUy61
X-Google-Smtp-Source: 
 AMsMyM6HQgQ/7LYoZXu1d2DBYBE4nbZEVRS423swasxcPp1SjSnyt5kY3D6cQR2AxpPGkhj4AVfEwA==
X-Received: by 2002:a02:b80f:0:b0:363:bad1:26fe with SMTP id
 o15-20020a02b80f000000b00363bad126femr619725jam.282.1665352549878;
        Sun, 09 Oct 2022 14:55:49 -0700 (PDT)
Received: from vince-ubuntu.attlocal.net
 ([2600:1700:1124:8090:d7ab:c569:33ff:ffc])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a02b14b000000b00346a98b0a76sm3374239jah.77.2022.10.09.14.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 14:55:49 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-devel@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH] cglm: New recipe for cglm-0.8.5
Date: Sun,  9 Oct 2022 16:53:37 -0500
Message-Id: <20221009215337.7867-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 21:56:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99111

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb | 25 +++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb b/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
new file mode 100644
index 000000000..5a437c102
--- /dev/null
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.8.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "OpenGL Mathematics Library for C"
+DESCRIPTION = "Highly optimized 2D|3D math library, also known as OpenGL Mathematics (glm) for `C`. \
+cglm provides lot of utils to help math operations to be fast and quick to write. It is community \
+friendly, feel free to bring any issues, bugs you faced."
+HOMEPAGE = "https://github.com/recp/cglm"
+BUGTRACKER = "https://github.com/recp/cglm/issues"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
+
+SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
+# Tag v0.8.5
+SRCREV = "7e5d1f435f628b873347eb052b7d6605b0b997f2"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG[build_tests] = "-Dbuild_tests=true,-Dbuild_tests=false,"
+
+PACKAGECONFIG ?= ""
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON += "--buildtype release"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


