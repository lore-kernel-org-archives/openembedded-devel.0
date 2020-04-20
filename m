Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.6624.1587402430028118411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 10:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NJyxF+1h;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: andrea.adami@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id g13so11086429wrb.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 10:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3TLLHFYCe/e97cg6gZaOQ3eN7TDsG8kkANWTrIJo+sU=;
        b=NJyxF+1hWSQqPvcUglBL5RVxl2gslgxJwedb/5uynFTwly+Kwh+irfZkNeayfO2gww
         QfiXVvMg4aiTb7bNRhhmFSjEX8V2hnq28dWAjernfQcSO2w4qzkDJwrxT8ucill3fc91
         h4J7zlRSfjLYdYWgL8R9rFsTYj+0H/SYpJImgiLITRDwWGW1sNv6qI2/nHQDkfMX+vWx
         0vta6HKBbutEfJjOGJTAKUjXQYFu8VETgGGBagUy1Ngk8JHmARkYo4lIvExmMS6kIkI8
         YRaGhbbyVRaW0jTrgJYA1tf2gHjWnoQ5DNv606DaKs7JrPaqKcfQBPrQdPsH5xPzFRkE
         KtaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3TLLHFYCe/e97cg6gZaOQ3eN7TDsG8kkANWTrIJo+sU=;
        b=tIROB6w1zBvYrLdHhvramyPxU7JoU3jsXpdDYun0VU3yDaVhMfpKgFVU3kclRRaOeW
         +waovBpbCIZd9YhO1qcbljHP69ix0YHkrQcGGe4nJbtLCgeVBIkdb9DJQGiLjreCjl9L
         PZ3lOLMPcLIwZSfZpMSkoy7j3Lyi735jqH8JQE3kHre/GfBh7fUO3I17aIHNjHpVIWtW
         ikLin6N4wvSgrrU6o6wZ517839usSmeZ4mxNpPw4w6H7d9dftxYCSG9ShCIkEPZYbXhw
         dBiE6fkmQTTDDZlPXNaE/6Q7WWuSfXvHTgopGEugNhnl38AStzPEzGZenC+MyI36Hjic
         ttgg==
X-Gm-Message-State: AGi0Pua+wcC+kZrsATP3vLq69lSy4J8KBne7K+jiYubQWOMYam8k/mmo
	9PBzApPjENExRUw6Q5tJpOBTF5+w
X-Google-Smtp-Source: APiQypKtCelQ4I1lMKY3gAuSMaMbx3185k18yzfu6ISCXXQXgRSgIe6A9IP0c89GXIQLEGp8kLDncg==
X-Received: by 2002:adf:8162:: with SMTP id 89mr18979217wrm.387.1587402428169;
        Mon, 20 Apr 2020 10:07:08 -0700 (PDT)
Return-Path: <andrea.adami@gmail.com>
Received: from andrea-ThinkPad-T520.homenet.telecomitalia.it (host220-224-dynamic.250-95-r.retail.telecomitalia.it. [95.250.224.220])
        by smtp.googlemail.com with ESMTPSA id c10sm140366wru.48.2020.04.20.10.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 10:07:07 -0700 (PDT)
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrea Adami <andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/4] zaurusd: fix build with kernels < 4.16 and newer libc headers
Date: Mon, 20 Apr 2020 19:06:53 +0200
Message-Id: <20200420170656.10895-1-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.17.1

The Y2038 changes broke the build for older 32bit devices using
older kernels.

As seen on: https://sourceware.org/glibc/wiki/Y2038ProofnessDesign

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../zaurusd/zaurusd/add_64bit_time_t.patch    | 43 +++++++++++++++++++
 recipes-bsp/zaurusd/zaurusd_git.bb            |  3 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch

diff --git a/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
new file mode 100644
index 0000000..5f9587a
--- /dev/null
+++ b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
@@ -0,0 +1,43 @@
+From d15b20fd9e8927db5dc4303f2e6c11cfa8d6fe95 Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Mon, 20 Apr 2020 16:21:22 +0200
+Subject: [PATCH] tskeys.c: add support for 64bit time_t
+
+Upgrade the recipe to cope with the 64-bit time changes introduced in 4.16
+
+Fix:
+
+| tskeys.c: In function 'press_key':
+| tskeys.c:141:4: error: 'struct input_event' has no member named 'time'
+|   141 |  ev.time.tv_sec = time(0);
+|       |    ^
+| tskeys.c:142:4: error: 'struct input_event' has no member named 'time'
+|   142 |  ev.time.tv_usec = 0;
+|       |    ^
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ apps/tskeys/tskeys.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/apps/tskeys/tskeys.c b/apps/tskeys/tskeys.c
+index 264dfb7..36e3bfd 100644
+--- a/apps/tskeys/tskeys.c
++++ b/apps/tskeys/tskeys.c
+@@ -138,8 +138,13 @@ void press_key(int fd, int key, int pressed)
+ 	struct input_event ev;
+ 	int r;
+ 
++#if !defined(__USE_TIME_BITS64)
+ 	ev.time.tv_sec = time(0);
+ 	ev.time.tv_usec = 0;
++#else
++	ev.input_event_sec = time(0);
++	ev.input_event_usec = 0;
++#endif
+ 	ev.type = EV_KEY;
+ 	ev.code = key;
+ 	ev.value = pressed;
+-- 
+2.17.1
+
diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/zaurusd_git.bb
index d69805b..1f8e40b 100644
--- a/recipes-bsp/zaurusd/zaurusd_git.bb
+++ b/recipes-bsp/zaurusd/zaurusd_git.bb
@@ -24,7 +24,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://01-check-toggle-portait \
            file://use-ts-symlink-instead-of-hardcoding.diff \
            file://0001-zaurusd-add-support-for-collie.patch \
-           file://allow-newer-tslib.patch"
+           file://allow-newer-tslib.patch \
+           file://add_64bit_time_t.patch"
 
 
 S = "${WORKDIR}/git"
-- 
2.17.1

