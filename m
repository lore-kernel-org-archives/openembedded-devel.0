Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.303.1597264907447967027
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 13:41:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=X3+bgeSi;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id y10so61528plr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5Icm5CkRBpp5dSD6cwi0JYlEc66lGfYmDmkREbjad10=;
        b=X3+bgeSi2Gs+rNeS0QfULGGHkYhHQCnU5NHHGdhl8S/pXm2LffWjpql7ZIoNt/Pwih
         PSQZay8hDXyvxFqeWI7DilrUhUvY4kgkGR1uzkMngkAZpl7OBnZMPYE94jd8JiVmQtq4
         Qah7w7wB1HmjYqJtufD3UXMPPqZGHQsWBeeoDymKZTG+jpmZreuOUTseUAvn2p8/htld
         j53rEzTcSWEQnrai2HjMiN3kGKU46IrcZUsTBYfJBNJC2g+qh3vE+uv++auRkJ2mCJpS
         mePTmB06bidKPIAWyggqmkzImd6/Yk7Sl8qBmCzF3W9q2g926cm/4hlaWGGxEoXMEBFc
         xXvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5Icm5CkRBpp5dSD6cwi0JYlEc66lGfYmDmkREbjad10=;
        b=ov3kO3/sfrMndqw6ir+H557YPIDUczRZHe8vSRr3sY8asb5dKPTJ+Uf8lf8D62JTOw
         O1lLZltmUMTNadVDqC1cu81ITVmYoaXb0qOKUeZA+C+YLsJ1f51x1+uQ7Qgc6rcnvcN8
         6npYRuRyUjp7Yl1jz4kDRD2pJqdQeVCTYFPsAAUhMGyp0HPpLf5ZwwzJtFg+1Rj80bq9
         tdGI4ZJExEVuV2nhCODzV4/FJrG9dxhU3j4dcXP+KAvCfVTw4a4UN0Qv9EYQlS+B7YeS
         waD7DW4aIFwzQ7n/jLYrmfhYosYoHhiSBuHB7DSfmU9rY7ohxGl7tcsD8crjdntfLWaX
         cPZQ==
X-Gm-Message-State: AOAM532nZR1XPWbgWeE5qBs8oxn+lAuQMPBkUwUmcpo0+tVCsY21AnJs
	wIRkzFdK0IY0pg+xJ0lNtf+pWdKqPsc=
X-Google-Smtp-Source: ABdhPJwgg5i2R0pfj9+HUoledQCze9w8VxlYvRjlrrISBlcKxjgEZV7wJjGcxR9e35KKYu+WC5d5eQ==
X-Received: by 2002:a17:902:523:: with SMTP id 32mr1054876plf.176.1597264905517;
        Wed, 12 Aug 2020 13:41:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id l22sm2984287pjy.31.2020.08.12.13.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 13:41:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][ 14/18] drbd-utils: Uphgrade to 9.13.1
Date: Wed, 12 Aug 2020 13:41:26 -0700
Message-Id: <20200812204130.1012160-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812204130.1012160-1-raj.khem@gmail.com>
References: <20200812204130.1012160-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix build with gcc10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-setup_options-definitions-as-extern.patch | 32 +++++++++++++++++++
 ...d-utils_9.12.0.bb => drbd-utils_9.13.1.bb} | 10 +++---
 2 files changed, 38 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
 rename meta-networking/recipes-support/drbd/{drbd-utils_9.12.0.bb => drbd-utils_9.13.1.bb} (86%)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
new file mode 100644
index 0000000000..6702f3bde4
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
@@ -0,0 +1,32 @@
+From d095caf6f8f77fe056fb90ccd5d89c207a7f346d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Aug 2020 12:59:38 -0700
+Subject: [PATCH] v84: Make setup_options definitions as extern
+
+This is already defined in drbdadm_main.c, therefore make this
+declaration to be extern for other modules
+
+Fixes compatibility with gcc-10 which uses -fno-common by default
+
+Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/7]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ user/v84/drbdadm.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/user/v84/drbdadm.h b/user/v84/drbdadm.h
+index ed63d78c..8469f1c4 100644
+--- a/user/v84/drbdadm.h
++++ b/user/v84/drbdadm.h
+@@ -251,7 +251,7 @@ struct setup_option {
+ 	bool explicit;
+ 	char *option;
+ };
+-struct setup_option *setup_options;
++extern struct setup_option *setup_options;
+ 
+ extern void add_setup_option(bool explicit, char *option);
+ 
+-- 
+2.28.0
+
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
similarity index 86%
rename from meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
rename to meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
index 5dabdd51d0..5b0979f961 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.12.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
@@ -8,13 +8,15 @@ SECTION = "admin"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
-SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils \
+SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=${PV} \
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers \
+           file://0001-v84-Make-setup_options-definitions-as-extern.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
           "
-# v9.12.0
-SRCREV_drbd-utils = "91629a4cce49ca0d4f917fe0bffa25cfe8db3052"
-SRCREV_drbd-headers = "233006b4d26cf319638be0ef6d16ec7dee287b66"
+SRCREV_drbd-utils = "b24b0f7e42d500d3538d7eeffa017ec78d08f918"
+SRCREV_drbd-headers = "c757cf357edef67751b8f45a6ea894d287180087"
+
+SRCREV_FORMAT = "drbd-utils_drbd-headers"
 
 S = "${WORKDIR}/git"
 
-- 
2.28.0

