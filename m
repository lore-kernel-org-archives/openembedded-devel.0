Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7E9C6FA8E
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 08:31:28 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.10288.1677745883655719010
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Mar 2023 00:31:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WnKcGDEV;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id a2so6340815plm.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 00:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27RFUtQVc+vtd2x38KWxDEqG26YgwS60vD5ZpAKc3kQ=;
        b=WnKcGDEVIEt49TpIgNghHrEn8BL2vFmNssmlPNxfYNmZXatetcNpkgrpOML1ZafF31
         VJGENc/Hf8m62YrAWY5sQpyd7JlqKnbwkZ2bCst2NoHh2/YWXH8jPJ6hnwJ0+GABVxux
         kGCht1SDaseCvo1k0jNDbyla5sjyNexExTcbDSSTWdqkjf5fesGd7QILuweIsHvKZrKx
         yBQAvldWDTaSxwhfftcD3s53NtHFN1ZCnOKMgPDe6gWXH+dyjXZ0+UwY82L9qoq6WVBV
         Ng2ASd8Q3eYqJSNBAzpdx3Qa6uFnm/bDK4hQKxc6UrltSgrKxMQp/uWAhYddtkj/K4V2
         DiCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27RFUtQVc+vtd2x38KWxDEqG26YgwS60vD5ZpAKc3kQ=;
        b=tGDH25JwdELpkwUxfxfSGU7ptWeNJP/mPcultGBLWVio3AhrVkLdt3kWRA/6h9EU3Z
         9b3hT8ihtIx8O+aVLixQScBpYCQx3ISCac+A5MxmG1FxFuL5eb3a97F+FxnR8MaNt5Xm
         1HdNyr0x6MjPd7lMGsvvXXRrqUchyeT9c6oWiK5a4OyUNYiE4eCC9iNlq5BUE2Y2N49m
         oJ5r8Eebjme9Bsv5m2ONcRqzxeB9q9zmq5Bhg/1ekqs2cbarrSCBTNX5dUHSQx3RZ+KP
         zStB5J0I1ej0Jgho84fMOo8sv5BWqeXnv9Qhy3/a0FK6cCEakcYRzBoeeqoFqddmTtnA
         GYmQ==
X-Gm-Message-State: AO0yUKUEsnSda3bjiIz/OAxwZ6n6A8rMhhK6WNEC2td3/d8fkcX4rn9L
	yPHeWrQdjeLcSrySsKZ0pEmbbQWLIV4=
X-Google-Smtp-Source: AK7set9kKZI+FCEdmQWm7slwJqQFiYYr6qjsZ29+P/qU5QIGtNIIE8XzxntivNQr+QWmxW51nJAgtg==
X-Received: by 2002:a17:902:cf0a:b0:19d:244:a3a4 with SMTP id i10-20020a170902cf0a00b0019d0244a3a4mr9506460plg.47.1677745882846;
        Thu, 02 Mar 2023 00:31:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902d70d00b0019aeddce6casm9670994ply.205.2023.03.02.00.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 00:31:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/5] gphoto2: Fix build with clang16 + musl
Date: Thu,  2 Mar 2023 00:31:16 -0800
Message-Id: <20230302083116.1332448-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302083116.1332448-1-raj.khem@gmail.com>
References: <20230302083116.1332448-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 08:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101331

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ototypes-of-callbacks-with-libgphoto.patch | 50 +++++++++++++++++++
 .../gphoto2/gphoto2_2.5.28.bb                 |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
new file mode 100644
index 0000000000..abe38e12ce
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2/0001-Match-prototypes-of-callbacks-with-libgphoto.patch
@@ -0,0 +1,50 @@
+From 366930ccc1a261c3eb883da2bf3c655162ccd75f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 1 Mar 2023 22:58:37 -0800
+Subject: [PATCH] Match prototypes of callbacks with libgphoto
+
+In https://github.com/gphoto/gphoto2/pull/535/commits/ccc4c1f092bd21ebc713f4d7b9be85be49f92f1e
+we tried to fix by using pthread_t but it also needs to make changes in
+libgphoto and these changes can be invasive, therefore lets revert to
+older types and to fix musl problem fix it via type casts
+
+Upstream-Status: Submitted [https://github.com/gphoto/gphoto2/pull/569]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gphoto2/main.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gphoto2/main.c b/gphoto2/main.c
+index 0dac947..cd3c990 100644
+--- a/gphoto2/main.c
++++ b/gphoto2/main.c
+@@ -1198,7 +1198,7 @@ thread_func (void *data)
+ 	pthread_cleanup_pop (1);
+ }
+ 
+-static pthread_t
++static unsigned int
+ start_timeout_func (Camera *camera, unsigned int timeout,
+ 		    CameraTimeoutFunc func, void __unused__ *data)
+ {
+@@ -1215,14 +1215,14 @@ start_timeout_func (Camera *camera, unsigned int timeout,
+ 
+ 	pthread_create (&tid, NULL, thread_func, td);
+ 
+-	return (tid);
++	return (unsigned int)tid;
+ }
+ 
+ static void
+-stop_timeout_func (Camera __unused__ *camera, pthread_t id,
++stop_timeout_func (Camera __unused__ *camera, unsigned int id,
+ 		   void __unused__ *data)
+ {
+-	pthread_t tid = id;
++	pthread_t tid = (pthread_t)id;
+ 
+ 	pthread_cancel (tid);
+ 	pthread_join (tid, NULL);
+-- 
+2.39.2
+
diff --git a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
index fe33940475..513845194d 100644
--- a/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
+++ b/meta-oe/recipes-graphics/gphoto2/gphoto2_2.5.28.bb
@@ -9,6 +9,7 @@ RDEPENDS:gphoto2 = "libgphoto2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=gphoto2 \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
            file://0001-gphoto2-Use-pthread_t-abstract-type-for-thead-IDs.patch \
+           file://0001-Match-prototypes-of-callbacks-with-libgphoto.patch \
 "
 SRC_URI[gphoto2.sha256sum] = "2a648dcdf12da19e208255df4ebed3e7d2a02f905be4165f2443c984cf887375"
 
-- 
2.39.2


