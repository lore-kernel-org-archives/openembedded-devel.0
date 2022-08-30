Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10D1C0502F
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web09.8758.1661843667798156048
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nwJxOczZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id x80so6311525pgx.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zaJ+FCFd79tbf1VXFOFJGJwWht1TG4tXBigmWx+1JgA=;
        b=nwJxOczZGt8eiqwO/I21et/iaBfi/F6u0vjBZBzKmvMpCbyrQrtNWyqNrd65pDk50N
         PY+qfngINio1jDcsvMUuk7lQA2oE7ZhXCGJ42i2itxLuSNhgkFD3f2cbySx75NVr+D6D
         1R7BEjLPI5WtWHvRee4TWYNc18PkmBPg2NxD/YlKXvjAPM5zp+R5SzjQ9CXMiZz2T/az
         MmBC1ynY6Nu+SDWCHrAV0qy/yjIonmqbN9dBJfEBkNHB8KqvQKVxAhvfDNgQRiQJhOvn
         4LFeH/1HziLliVa9nIQo0Mfrl4xbz5RFT+oWcXIlBbEFli2trqez3lTkAkwa8TPnF3ur
         y28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zaJ+FCFd79tbf1VXFOFJGJwWht1TG4tXBigmWx+1JgA=;
        b=PyWU916WBlaR/1SafBKy3bl/4wwStBsfO6rpdnKZja9Zmh3R6ZLLE9gT/AwMq/B9Ul
         TCS0ftLobtiyEJuSCLjVStPz+uuMkIqOE9jcKdZxZ2/6QaoijRTkC0uSMHYAwiiYLcsg
         LEVlwsE0w/h3j03y7pYb7VOGRVUvvFLlsRCF+ZW2xmwqWh6ZilwIpMDOVEyhZce9csIL
         V9sQl2uJx1WESXW6vkNixF3veVg7Y7Fm1XyqZIJ+p7gEy5ju4ASpQSt3W+e1Au8VZQiu
         mGbWWeIzjf36N96QDfO8Uu2FPrGm8nLlgsziq1+NVpzB8Q6iOC6DRh+6bFvxkAYogwVR
         7ckg==
X-Gm-Message-State: ACgBeo0kmWLiHgTHRqTMlJ9OhHmmYBQXMqQnL7RQUASWSVwwey/wriCg
	L+hcWwg4Uk0FLo8/HSIc9XUmyZfz68gEBA==
X-Google-Smtp-Source: 
 AA6agR5Xgx0KU+Yv7PWUyhikeiUl2NtHPz6xNmZ0+u8k+BfFjCDSEigEfx0iFoZw2W1IlvRqtwWZ6Q==
X-Received: by 2002:a05:6a00:174b:b0:52f:c4d1:d130 with SMTP id
 j11-20020a056a00174b00b0052fc4d1d130mr19805796pfc.23.1661843666777;
        Tue, 30 Aug 2022 00:14:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 13/21] iscsi-initiator-utils: Upgrade to
 2.1.7
Date: Tue, 30 Aug 2022 00:14:05 -0700
Message-Id: <20220830071413.3887189-13-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98550

Fix build on musl by using proper typecast for pthread_t

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Makefile-Do-not-set-Werror.patch     | 12 ++++-----
 ...uio-Use-pthread_t-for-INVALID_THREAD.patch | 27 +++++++++++++++++++
 ....1.6.bb => iscsi-initiator-utils_2.1.7.bb} |  3 ++-
 3 files changed, 34 insertions(+), 8 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.6.bb => iscsi-initiator-utils_2.1.7.bb} (97%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
index d5e0deb899..ab6ff6e131 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0001-Makefile-Do-not-set-Werror.patch
@@ -1,4 +1,4 @@
-From 31d88f46bfc67de2659991674253a5d5dfb92afc Mon Sep 17 00:00:00 2001
+From 6afdfbdf1ecf3e7e9158734a3994a57ea151d680 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 12 Aug 2020 12:00:29 -0700
 Subject: [PATCH] Makefile: Do not set -Werror
@@ -9,16 +9,17 @@ warning as errors
 Upstream-Status: Inappropriate [OE-Specific]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  usr/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/usr/Makefile b/usr/Makefile
-index 21bb154..0018605 100644
+index 3fc2248..2b5a234 100644
 --- a/usr/Makefile
 +++ b/usr/Makefile
-@@ -35,7 +35,7 @@ endif
- PKG_CONFIG = /usr/bin/pkg-config
+@@ -44,7 +44,7 @@ HOMEDIR ?= $(etcdir)/iscsi
+ PKG_CONFIG ?= /usr/bin/pkg-config
  
  CFLAGS ?= -O2 -g
 -WARNFLAGS ?= -Wall -Wextra -Werror -Wstrict-prototypes -fno-common
@@ -26,6 +27,3 @@ index 21bb154..0018605 100644
  CFLAGS += $(WARNFLAGS) -I../include -I. -D_GNU_SOURCE \
  	  -I$(TOPDIR)/libopeniscsiusr
  CFLAGS += $(shell $(PKG_CONFIG) --cflags libkmod)
--- 
-2.28.0
-
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
new file mode 100644
index 0000000000..02669e9c80
--- /dev/null
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/files/0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch
@@ -0,0 +1,27 @@
+From ef54a6f4a81da8ab653d352bfbd3b2521ce9eb7c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 15:55:32 -0700
+Subject: [PATCH] iscsiuio: Use pthread_t for INVALID_THREAD
+
+pthread_t is opaque, therefore avoid compiler errors on musl when
+compiling since pthread_t is not a plain old data type, like glibc
+
+Upstream-Status: Submitted [https://github.com/open-iscsi/open-iscsi/pull/363]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ iscsiuio/src/unix/options.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iscsiuio/src/unix/options.h b/iscsiuio/src/unix/options.h
+index 63b8635..873a98a 100644
+--- a/iscsiuio/src/unix/options.h
++++ b/iscsiuio/src/unix/options.h
+@@ -86,7 +86,7 @@
+ #define DEBUG_ON	0x2
+ 
+ #define INVALID_FD	-1
+-#define INVALID_THREAD	-1
++#define INVALID_THREAD	(pthread_t)-1
+ #define INVALID_HOST_NO	-1
+ 
+ struct options {
diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.7.bb
similarity index 97%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.7.bb
index 921f7d4883..63155b4811 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.6.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.7.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV ?= "ee575fd19429ec6dc24b49f2ce3822b4a01f57de"
+SRCREV = "7b53fcc502da8617110fd64d675b476772c28a6f"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://0001-Makefile-Do-not-set-Werror.patch \
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://iscsi-initiator.service \
            file://iscsi-initiator-targets.service \
            file://set_initiatorname \
+           file://0002-iscsiuio-Use-pthread_t-for-INVALID_THREAD.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.37.2


