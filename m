Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6A60574FB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:35 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f7-v6so4844220plr.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wS3qkfCy1NP5HxlVnDrBgL72zcQJ5GkP8YHUjP0C5zw=;
	b=ZZ3cFk4EBDD2ttpKPFamgf5GFmKrxFT8nuyqmxbETXqXD0BXTfQG4Xrhb2mINbHKvi
	Id96902o68qtlW/JUbuDhddiMeeTuu08znsoZ/jzFlAcx/5gayXTyapfrxSv5TKTaHVQ
	/U61L2R/wnU9VbSRaANeUd4vzEL52dwyrms4kfngkEvxbA5W8Vv8c2j4JJgUdzVOOUPc
	2q3uDhMIqd/nazgTpmc/gAVlo3hopZIUtNvjyZDtfQkBglwFuBVN681UONlncyI9iypv
	d/6KFv+uJRZyciBuAx0IeEYfVg/5uK7XeHYlnN0n4x9CQb++wAsgrcnyFSCoGV9Aqktb
	chuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wS3qkfCy1NP5HxlVnDrBgL72zcQJ5GkP8YHUjP0C5zw=;
	b=hDpoePcLJ/nqpJb/KCmeXYmW3fdf0qLZkJ1k+6bkSmOPuBEfgnQuR2YlNSR0kfAqiV
	Y5WXuPYdjF3590Oo8TKkYMlPUIS9C035Cv5CEntwVUW2WxZX0mVozpwbAW8Kpsi6y0GJ
	B4E9ljwYtBAu8JhYoobko6JwA5YMpbq5kN3iB3auUV4C20U4XYkGoWfCxhLnW7DYojK7
	1BPuxoU9T6YMHp2nyMtJCjxMd83whPqScmwQJdOUnqT23nTXEogzYYGDXN9PlT0ZFB7v
	dHJK6zAnvszGPc5TtrP9W9uZxIGOph7nRkwitsvrgB0ULBEWMkBk/NE1hRiA7f3tNo+n
	tNrQ==
X-Gm-Message-State: ALQs6tA1/Kjnin/Dv3/r/qahr3ePTJjbIwb/DU5Pr2P13rl4ziZm1L9r
	ISBmJvE2aFgq5qOr8u2l56X7qw==
X-Google-Smtp-Source: AB8JxZqwQjRR/VEpNr5g2Bqn1jg+g/IByv+GUBDOHcuLhzfDLhWDuSwp94reRc0qtdrCBjte7YkpIA==
X-Received: by 2002:a17:902:da4:: with SMTP id
	33-v6mr46351063plv.52.1525892436386; 
	Wed, 09 May 2018 12:00:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:11 -0700
Message-Id: <20180509190011.30006-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 16/16] upm: Fix build with gcc8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2018 19:00:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Replace-strncpy-with-memcpy.patch    | 49 +++++++++++++++++++
 meta-oe/recipes-extended/upm/upm_git.bb       |  3 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch

diff --git a/meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch b/meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch
new file mode 100644
index 0000000000..4b17087ef8
--- /dev/null
+++ b/meta-oe/recipes-extended/upm/upm/0001-Replace-strncpy-with-memcpy.patch
@@ -0,0 +1,49 @@
+From d314f26e024aaf15bf4ab22ceb98501148d0eac8 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 7 May 2018 19:53:33 -0700
+Subject: [PATCH] Replace strncpy with memcpy
+
+gcc8 detects that strncpy is overwiritng the null terminating character
+the source strings are already initialized to 0 so memcpy would do the same
+job
+
+Fixes
+rn2903.c:153:5: error: 'strncpy' output may be truncated copying 16 bytes from a string of length 511 [-Werror=stringop-truncation]
+     strncpy(dev->hardware_eui, dev->resp_data, RN2903_MAX_HEX_EUI64);
+     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ecezo/ecezo.c   | 2 +-
+ src/rn2903/rn2903.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/ecezo/ecezo.c b/src/ecezo/ecezo.c
+index 6a195fc1..56c6dab3 100644
+--- a/src/ecezo/ecezo.c
++++ b/src/ecezo/ecezo.c
+@@ -488,7 +488,7 @@ int ecezo_send_command(const ecezo_context dev, char *cmd, char *buffer,
+     // our write buffer
+     char writeBuffer[ECEZO_MAX_BUFFER_LEN];
+ 
+-    strncpy(writeBuffer, cmd, ECEZO_MAX_BUFFER_LEN);
++    memcpy(writeBuffer, cmd, ECEZO_MAX_BUFFER_LEN-1);
+     writeBuffer[ECEZO_MAX_BUFFER_LEN - 1] = 0;
+ 
+     int writelen = strlen(writeBuffer);
+diff --git a/src/rn2903/rn2903.c b/src/rn2903/rn2903.c
+index f30a33ae..01a011da 100644
+--- a/src/rn2903/rn2903.c
++++ b/src/rn2903/rn2903.c
+@@ -150,7 +150,7 @@ static rn2903_context _rn2903_postinit(rn2903_context dev,
+         rn2903_close(dev);
+         return NULL;
+     }
+-    strncpy(dev->hardware_eui, dev->resp_data, RN2903_MAX_HEX_EUI64);
++    memcpy(dev->hardware_eui, dev->resp_data, RN2903_MAX_HEX_EUI64);
+ 
+     return dev;
+ }
+-- 
+2.17.0
+
diff --git a/meta-oe/recipes-extended/upm/upm_git.bb b/meta-oe/recipes-extended/upm/upm_git.bb
index d742a5e461..478aa0db1d 100644
--- a/meta-oe/recipes-extended/upm/upm_git.bb
+++ b/meta-oe/recipes-extended/upm/upm_git.bb
@@ -7,11 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=66493d54e65bfc12c7983ff2e884f37f"
 
 DEPENDS = "libjpeg-turbo mraa"
 
-SRCREV = "cc7fec9ae0228add9011bf1c2cd5e0ca2ba0d4f0"
+SRCREV = "37642f3b0194f6ddd63f1e6b5d49b8cb689d5c81"
 PV = "1.6.0-git${SRCPV}"
 
 SRC_URI = " \
     git://github.com/intel-iot-devkit/${BPN}.git;protocol=http \
+    file://0001-Replace-strncpy-with-memcpy.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.17.0


