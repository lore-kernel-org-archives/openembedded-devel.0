Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDBBE81BCB
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 14:05:29 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47928.1770645920795238199
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 06:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dHBPLJsL;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-658ad86082dso4239590a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 06:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770645919; x=1771250719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu/sl/Cb4gkZ7lqzN9+ytuSRmFxsDljFd57ah0QDXzI=;
        b=dHBPLJsLtqmcg8bweOY+sAdjCJ21NLqVx8cgspkEpViBn5lW1ZX7iBeLiVXwi4yWOY
         k+x4KbIQAruiTH8QccHqP0XG6RwSQKDNHlsAd/RyM/1xofCE2pD9w9X9/AWaV2cJxS/e
         CSMLkM4PuqtQZ36Po6KHS9y5fdvRi/+A9g/19C3A/mPjM0CJZpErdpBdeD2rP/6Qf8v3
         TcRb5pI3n+/xiXWVqlbjbKPPjfrtAzlz7oaqAPFkwe9km+o3nRfQrxMErtfz/aSe47Cv
         Tpx300xffB3nwv0wTKzMCJH948esEu+WqXk8K8vm/XM5E03SyRKXll6wyQTDpLNa4/+c
         KJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770645919; x=1771250719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu/sl/Cb4gkZ7lqzN9+ytuSRmFxsDljFd57ah0QDXzI=;
        b=K+FRSuN2vRY8+E4HyqsiD5/Q5gdQou6R252TDvNRBHoPcYvm5FVpmI6XOFmurVLHYK
         Tf647vez1ATdNAus3TX6wqOmCNT9sWaSheIMXwhBqEn2ejxJinEQFCkjPyhk87WWVmcW
         nwmzWQ960aIXNowzCAq/1poHqj/pFRf2Hqd5nP1OqWv4r/JZMPPBB0ec+PZZbEFxBCkU
         M7hEkPKMurLF6AFOpAEboeYpfZ4U8IKxQncZYibXnEY098NzAdcCi8R91n+JcBdXaIZv
         mEAbQ5c5UdK4xZjTmaCMqkIw9M+QjLVsLMRho838uALvlL6rnudIc9pOklrequPHbki2
         9bCA==
X-Gm-Message-State: AOJu0YyqcDup1TOukUst62TPyNqM15U60eiZkenAxBDYD3URE0mPK/SR
	M4i4RJBWde9L31+edt8Y64PQrBr4hn5a7o46+38qxeqVLMxTCN2HKACQWfu/ZejL
X-Gm-Gg: AZuq6aL89DuWTAuhthg6rmjBsqwU4smgbniGUnXEp0Yny/S4DcSzOZ7N2nYFDJGwI9n
	ilPvvtMWfn/7DT+zNJCWGnTo/NGiTO9TwvL4MO8Vo6uutZFzIVWqvzIa8agLXvbeRRSgQqh3Sq2
	CBIY3wD3vXV8V0xHKdTM7ZzPCNEl58mHBZYBbQBvFDr4xThKIThv9vd0fTGWrSu7RRBVRtk3+zS
	9ci0HCDcKJ274RqVbZcZTbHlV6ckN2ZMgMUKl4pz0N+wxl5Lc2ki3CudC9Z/c66l3nqSYOjiHlx
	Uea0YJU3CKKeeyrJfg8+1MWLv9funlEKawEtzWpXN1HzFxjV5wSSAztr3XG4Dw0BeeK+47l3iay
	bAVgO34+2tPrNCyMZ9L4XcQ1ND2bdx7EgjjG5vnRrxSRO0bCnWXyipt+EKmTu306Mi5E4IY5ubK
	+TEIDUrDtuPS1wr7rpCVd1CgzO3ZMlFBzXEFbG+KlGZSh0dITMhd9u0L/0Ouei0M/Ezpxb4w==
X-Received: by 2002:a17:907:c11:b0:b83:1326:7d45 with SMTP id a640c23a62f3a-b8edf2faa5dmr668690366b.32.1770645918654;
        Mon, 09 Feb 2026 06:05:18 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.38.mobile.3.dk. [77.241.128.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a578sm392462366b.6.2026.02.09.06.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:05:18 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH] drm-framebuffer: new recipe
Date: Mon,  9 Feb 2026 15:04:53 +0100
Message-ID: <20260209140452.2446837-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 14:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124312

Signed-off-by: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
---
 .../drm-framebuffer/drm-framebuffer_git.bb       | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb

diff --git a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb
new file mode 100644
index 0000000000..faffca2059
--- /dev/null
+++ b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb
@@ -0,0 +1,16 @@
+HOMEPAGE = "https://github.com/embear-engineering/drm-framebuffer"
+SUMMARY = "A simple application which can be used to test a Linux DRM device"
+SECTION = "graphics"
+
+LICENSE = "GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7702f203b58979ebbc31bfaeb44f219c"
+
+SRC_URI = "git://github.com/embear-engineering/drm-framebuffer;protocol=https;branch=main"
+
+PV = "0.1+git"
+SRCREV = "a560c2b810c8f677aaaaa9e9e8b1d13854718aba"
+
+inherit cmake pkgconfig 
+
+DEPENDS = "libdrm"
+
-- 


