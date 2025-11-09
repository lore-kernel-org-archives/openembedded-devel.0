Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C35FCCFA13
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 16:00:57 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27308.1762704052901834779
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 08:00:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NMNcM5PO;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429c48e05aeso1183545f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 08:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762704051; x=1763308851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ffyZGaPrCJ1Cn/rW8rpNQqfPS08uZuxrh1ksjPK02Cg=;
        b=NMNcM5POIgO1xT/MqGR1gx+9odQLoVut46xkeMLPOiDXjSQ/kQQc4TR7JWuKUj4Isg
         SP/8dVNf8ZSZzB5ulRShCrXJdbIx6iQqXAVXocQdskTzXX2yZcWCCMkCS3rSMYd7VH9k
         JjAtKbLAns0/8rpZnS3tsTv5BW2HVvNMRZAtaJXz/q1g5vDPvR0GU1iO6AbNQ3mYTqwJ
         w1pCw2ZZS2+vT8Q/9oPZuXsXfdAIGUG7VuKfExyKVBStUdKiZ+Aql5FB2Dpk8SlO2BX3
         T1tq73TDpCTpybHKcWUbCntF9UXTPPXQEe1lseF+LM6wknH7i2lGq/weE/5TcgeIcUz0
         9tXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762704051; x=1763308851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ffyZGaPrCJ1Cn/rW8rpNQqfPS08uZuxrh1ksjPK02Cg=;
        b=vaZEKbdVqEEkJkWl94rLJi2lBX9QqNhNHI1SUGwiaM4WaMgdWN7i4GZWrB9vzggyZw
         5DPnn/peVpBpLwbCq2UqRg+rRjF7hgVMStXupWQ8UVQTmIctLntaspGy1Ckn3bdJ9RpQ
         YgUDbI31B4MONm6oiHZUwYbmkpsaVAZnotfOQgkxF5vgskPAD1FTFIvp42X63kXimcBv
         X/+zjLd4bEbMU23yZS+Pf31E2lqHqPcnzHMPzYVSRCGxEEGj/cCTZQxfRmN4RPM0HN/k
         /Eg0Kae9lma0ZPBmMcK+c5hLsZu6uIizGpohwKv6LKKFrdwCjNLX+uHQ8X0pDOaZG5sq
         9c4g==
X-Gm-Message-State: AOJu0Yzaphz/uSScr4oQptcz4yWHKTfHayibTUPK+/isUzDzm/oKWGFU
	lmXgZneewHFyw6oY+nzIEPJsWnGqKdMeLYlATB05mPOphV6btqG3nm9q6XGJUhVy
X-Gm-Gg: ASbGncsieeUpaVrTSeDNcAsIwxYijTE6t9qWyjRAFysftlFCOUIvVogpAYbHLVpWkU8
	WO1yJSpAd2l/AzjnHh5A7GVzQOWBwCE4CXIfNswEFvSh00LjcEA6Df45u+QWPj5S/dfaiVZBcjz
	shZINF503IJxofe/r1PWvK6nGnW9LtBholclrUxZaR0B9bPAAoU/KKupXdi2/VXu7s47gEK3wEK
	EACI3UbwtnMN5UVQExSybSWnHYvcxoO3+YdaertLgMIkWqRelh91YtzGHszXMENL82xGZyDy85p
	TUhPfK6mCH+D76VvZr9FoEcXoL70JQKJd8jp+ltc4ih7EEOdHUbMoSgUBjitOE6lKSjS4WQtyqa
	Z5gMmR/raGsmFrTfzZVtS24/niuqSivfcdD9patxgjZXtGgTWD//OMrUyR0R2duNRgPqyMNxj3Z
	6Tka3KZIH9
X-Google-Smtp-Source: AGHT+IFaNJdJeLVyXJyE1afJKOcbBK2EF3N3/cCYSVFDDeJF7lOkSPTAebbFXS0E/oBxioddQ2LA7w==
X-Received: by 2002:a05:6000:26c9:b0:429:ef72:c33a with SMTP id ffacd0b85a97d-42b26f4be9dmr7126791f8f.3.1762704051116;
        Sun, 09 Nov 2025 08:00:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe63e131sm17406445f8f.20.2025.11.09.08.00.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 08:00:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 27/27] unicode-ucd: Rename the license.txt in DL_DIR to avoid conflicts
Date: Sun,  9 Nov 2025 17:00:19 +0100
Message-ID: <20251109160020.2522353-27-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251109160020.2522353-1-skandigraun@gmail.com>
References: <20251109160020.2522353-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 16:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121443

From: Khem Raj <raj.khem@gmail.com>

Since this file is downloaded and upstream does not version it on changes
we have to ensure that we store the versions in DL_DIR and also ensure they
do not step on each other

Fixes
stdio: WARNING: unicode-ucd-14.0.0-r0 do_fetch: Checksum mismatch for local file /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt
stdio: WARNING: unicode-ucd-14.0.0-r0 do_fetch: Renaming /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt to /srv/autobuilder/valkyrie.yocto.io/current_sources/license.txt_bad-checksum_f7830d126f59d83842565d3dddedc79db4ca978ed52aee0ebcc040ea76a85519

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 830535e5b6699d769b07c838fc5fecf0b5afbf0e)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
index a4952cf97d..b5ebf2fc7e 100644
--- a/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
+++ b/meta-oe/recipes-support/unicode-ucd/unicode-ucd_14.0.0.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Unicode Character Database"
 HOMEPAGE = "https://unicode.org/ucd/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/license.txt;md5=ea17640caddb659394df50e5db6efd69"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/ucd-license-v3.txt;md5=ea17640caddb659394df50e5db6efd69"
 
 SRC_URI = " \
     https://www.unicode.org/Public/zipped/${PV}/UCD.zip;name=ucd;subdir=ucd;downloadfilename=unicode-ucd-${PV}.zip \
-    https://www.unicode.org/license.txt;name=ucd-license \
+    https://www.unicode.org/license.txt;downloadfilename=ucd-license-v3.txt;name=ucd-license \
 "
 SRC_URI[ucd.sha256sum] = "033a5276b5d7af8844589f8e3482f3977a8385e71d107d375055465178c23600"
 SRC_URI[ucd-license.sha256sum] = "abf84f74dea2812799e1dbef7f0581adf7db244881e4febb8684f441568da0ad"

