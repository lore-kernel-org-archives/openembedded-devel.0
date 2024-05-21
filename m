Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5129C27C41
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.3100.1716315044738958161
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DfwgA/ze;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6f693fb0ab6so1055285b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315044; x=1716919844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ks6615LooyR+fif0H2nKMBq9NzfNifcLbjamwPSKD+Q=;
        b=DfwgA/zel2PXG0ts5EEA9eJeraQx8z71DfSHyUKJQEwcwGLgWIfwCGox598gNXi+7v
         6ZfusyysoAqVPgmi16PNxjB6HrcdSxnhWWcVZbDP/3Tr6RBPklmPYVYuAcwA+xqFwH9A
         6jIT/4u57woKYHy2JCSmtKernLq4HLMwZ8t3ju+sQfgeZh0kxpBvdchHZuTGk1R97DO6
         6k8l7mnSQrz/2ozJh5jk8nM8mAu6mUekfrEHTA+RNDyg34FRiJXcP111TIhIPwUDLVwz
         ZxIGxC2UFTtYZoKejfw8S9vEUMs/9m7JBQgZ54tnMgutkVLqFGP5CDM8q2a5BbA/Cljk
         Y3TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315044; x=1716919844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ks6615LooyR+fif0H2nKMBq9NzfNifcLbjamwPSKD+Q=;
        b=a2aiWISqXog7Pvhi4pYZCpOrBCNXSqcufOxLlRLk2kYU5N5D1vWZkYSjEzijnBP42l
         dlUtfWO7LkHpgWnSGC/HAhqj2WVonzw2xQP7VQxJSWpreLFFZFfKBfqk6hVLYbk7fN7l
         PpLZD7xF3L1JSmq8OctpVrSrI6cd4lhpOPIcMcemuAYv7wNMdQZWCpYstvYI7Xtcw+fp
         tHZJ4z8jD6LubjzWsE4BxD2jjmQ7kCT5+61RiPKW8Di9OaSOjyhUQhdyoliSPOmnVVOw
         BSaCzeXm0SFbUP9p9cCAK3f0sYWQbeXeyAvR1zMIMzqyth3XyL1lvbOttaWptVYZ1LpB
         TFTw==
X-Gm-Message-State: AOJu0Yz3El7nSPltgBdLIX8oka1dOUJkH4O2FvaNRDq5VvoyiZM9wjAi
	+Mv4eJsXuRIeP4EqDZU4QE6w++bRV5QmX20TQAYKEY2/wtzmLZVHZ//67VRxpOI=
X-Google-Smtp-Source: AGHT+IFIn0AbvZOm9MSou4D11RoKukZb8JosomL70NDbEGJ9fIcrcSZg/DBdYqmu1mm0OA49YA96Yg==
X-Received: by 2002:a05:6a20:dd9d:b0:1ac:fd95:574e with SMTP id adf61e73a8af0-1afde0e2101mr29130310637.28.1716315043941;
        Tue, 21 May 2024 11:10:43 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][ 18/22] directfb: Fix build with musl+GCC14
Date: Tue, 21 May 2024 11:10:19 -0700
Message-ID: <20240521181024.426176-18-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110467

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-graphics/directfb/directfb.inc    |  1 +
 ...rect-the-signature-of-bind-call-on-m.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/directfb/directfb/0001-inputdrivers-Correct-the-signature-of-bind-call-on-m.patch

diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/recipes-graphics/directfb/directfb.inc
index 4d38632e25..54aeb06aa9 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -24,6 +24,7 @@ SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/DirectFB-${PV}.tar.g
            file://0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch \
            file://0001-os-linux-Fix-build-when-__NR_futex-is-not-available.patch \
            file://0001-include-libgen.h-for-basename.patch \
+           file://0001-inputdrivers-Correct-the-signature-of-bind-call-on-m.patch \
            "
 
 S = "${WORKDIR}/DirectFB-${PV}"
diff --git a/meta-oe/recipes-graphics/directfb/directfb/0001-inputdrivers-Correct-the-signature-of-bind-call-on-m.patch b/meta-oe/recipes-graphics/directfb/directfb/0001-inputdrivers-Correct-the-signature-of-bind-call-on-m.patch
new file mode 100644
index 0000000000..574bba0bc7
--- /dev/null
+++ b/meta-oe/recipes-graphics/directfb/directfb/0001-inputdrivers-Correct-the-signature-of-bind-call-on-m.patch
@@ -0,0 +1,36 @@
+From 18f4eca291cabf93d87e7c9051268d9c385b8f37 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 18:23:06 -0700
+Subject: [PATCH] inputdrivers: Correct the signature of bind() call on musl
+ systems
+
+Its flagged with GCC14
+
+../../../DirectFB-1.7.7/inputdrivers/linux_input/linux_input.c:1551:27: error: passing argument 2 of 'bind' from incompatible pointer type [-Wincompatible-pointer-types]
+ 1551 |      rt = bind(socket_fd, &sock_addr,
+      |                           ^~~~~~~~~~
+      |                           |
+      |                           struct sockaddr_un *
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ inputdrivers/linux_input/linux_input.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/inputdrivers/linux_input/linux_input.c b/inputdrivers/linux_input/linux_input.c
+index 03deebc..207f5a5 100644
+--- a/inputdrivers/linux_input/linux_input.c
++++ b/inputdrivers/linux_input/linux_input.c
+@@ -1548,7 +1548,7 @@ udev_hotplug_EventThread(DirectThread *thread, void * hotplug_data)
+              "/org/kernel/udev/monitor",
+              sizeof(sock_addr.sun_path) - 1);
+ 
+-     rt = bind(socket_fd, &sock_addr,
++     rt = bind(socket_fd, (struct sockaddr *)&sock_addr,
+                sizeof(sock_addr.sun_family)+1+strlen(&sock_addr.sun_path[1]));
+      if (rt < 0) {
+           D_PERROR( "DirectFB/linux_input: bind() failed: %s\n",
+-- 
+2.45.1
+
-- 
2.45.1


