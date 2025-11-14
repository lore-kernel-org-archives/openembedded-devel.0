Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27FCCDE027
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 08:24:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13340.1763108692938912596
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Nov 2025 00:24:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XGyGeDQW;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4710022571cso16244745e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 00:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763108691; x=1763713491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIv/AQLux7cPUndlYw6C653mG7zEpYxpa16l/BL7F/k=;
        b=XGyGeDQWSgJJxb7/Ht08QCXMPjp5Vhb8zyQhkHxSZHQYs7LkLtc1NI7EZCTJ+b9j0L
         r4zYLt9TZmLYZh5wZyycU6HYta9HTW+SP+5h/85P1+kYtW///yUuhgRc4yh8/FmFwviN
         MvXpT/M7ErrZklp6fOAvebV6x6zBE+/QmXPsnfM6++6jkvecgyVJpNBQnBVIY4u2ldJy
         Ce2K6ptNF3uj/N7/XT3gY/Cor4f1TzVl176Hu4FUpkOMLGyc6MALZu5WfG3/+t3HtN0K
         Zqma1eFkvEKjNdgvZgf0KWqD+nv4ezGC2mQlDVd0SdPKwyP+kmkqrbdS3QXicxdkpfbz
         l6Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763108691; x=1763713491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZIv/AQLux7cPUndlYw6C653mG7zEpYxpa16l/BL7F/k=;
        b=BDXbhfp7JI7gFQ66aogSLf5DmXtWHRzDUkmR35Dr+28bIUtrFbH4zf9Fy2v/gwKPXA
         OpqWwuWsRyOBI90ZNYSaI+uZGIAZMw2cx9H5aqlY25izshXjxiAYF7UDaT3ZPwA6q2Iz
         l8YmJ37i/cnTVZkWKlXo8j/0iOOtVQ/iTkN3jex0lHnKxL3r6douwG2787POgFkzwmKm
         5xaJVKgEtJqzJLvg2axoDlLVjOYsUwi+Gx9ckzk0UCtk+XhkfqT1ZGcLOh0X1MBbWti6
         4/NhkVZIiACA2ew//+eRfVAobzsv3Jys63B3XK+quLBic3/8f4I8QhSyPJ4d3xgdTM1n
         EYdg==
X-Gm-Message-State: AOJu0YycYU6Is1BPcxeCa3qgVght5LrJXJxhxQ9Tn/i/tMRR88/XG4vZ
	eWMpVHkIVCwNn21CQY1rNsrL1OoL5IH0l855qBT9km8psFtjFn28NmvG0wxbXwRI
X-Gm-Gg: ASbGnctSHiuaKdF+jpAZ7P5EXYDku9JGJjmUD2LlzYG/Ql7jtlF9W2mcOQhXZgkJ8kx
	YdtwR9lUHkFJUJ4/63KT6H79xSFPMboLtfMSlqGTwrG9zYLihoCoUvRx5oZ4BS3HBWwNBvGsuUu
	xSlG0RG0WsnfvRg/bR6HOoYgk/m29o0PHI0Od0kxXCk7THuxKrpkkNn4+k1L9fgwbixUBuP+4PK
	A2sG72cPOLjiZsxhiQXpVKNFa0K9/1Nom6SEWEC1QoPPpSaQ+lWyQuapKSUitytcNiYiA0d+D4r
	8iqarpnnrxz976tsP73sf9NNp0OzZQgcFqfLDQ+Py+WxIklbdDFjA0AOP8m8wjnEb08tftRnPV7
	sQbIks/mAS1PLIw7/ojqGUok/Tx/a/0eApSdM+5BpimQeF+EVEN+IC138h3qgMLiOJR+mhMz3hA
	==
X-Google-Smtp-Source: AGHT+IHqiYve8X/HDOZHpI0euKNPcAU2gtc4iNtvXZwael/Iexv6NEgxUXs9fFghwGWPn8d4p9inZQ==
X-Received: by 2002:a05:600c:1d20:b0:477:7a1a:4b79 with SMTP id 5b1f17b1804b1-4778feaaeb3mr17934545e9.37.1763108691190;
        Fri, 14 Nov 2025 00:24:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778f247821sm53838325e9.5.2025.11.14.00.24.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 00:24:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v3 1/5] audiofile: patch CVE-2019-13147 and CVE-2022-24599
Date: Fri, 14 Nov 2025 09:24:46 +0100
Message-ID: <20251114082450.2720967-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 08:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121694

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
https://nvd.nist.gov/vuln/detail/CVE-2022-24599

These patches are used by opensuse to mitigate the corresponding vulnerabulities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change
v3: no change

 .../audiofile/audiofile_0.3.6.bb              |  2 +
 .../audiofile/files/CVE-2019-13147.patch      | 31 ++++++++++++
 .../audiofile/files/CVE-2022-24599.patch      | 50 +++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index 50df31c7b9..fd80729bd2 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -18,6 +18,8 @@ SRC_URI = " \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
     file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
     file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
+    file://CVE-2019-13147.patch \
+    file://CVE-2022-24599.patch \
 "
 SRC_URI[sha256sum] = "ea2449ad3f201ec590d811db9da6d02ffc5e87a677d06b92ab15363d8cb59782"
 
diff --git a/meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch b/meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
new file mode 100644
index 0000000000..19f6892f69
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
@@ -0,0 +1,31 @@
+This patch is taken from opensuse: 
+https://build.opensuse.org/package/show/multimedia:libs/audiofile
+
+CVE: CVE-2019-13147
+Upstream-Status: Inactive-Upstream [lastcommit: 2016-Aug-30]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+diff --unified --recursive --text --new-file --color audiofile-0.3.6/libaudiofile/NeXT.cpp audiofile-0.3.6.new/libaudiofile/NeXT.cpp
+--- audiofile-0.3.6/libaudiofile/NeXT.cpp	2013-03-06 13:30:03.000000000 +0800
++++ audiofile-0.3.6.new/libaudiofile/NeXT.cpp	2025-05-14 10:45:11.685700984 +0800
+@@ -32,6 +32,7 @@
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ 
+ #include "File.h"
+ #include "Setup.h"
+@@ -122,6 +123,12 @@
+ 		_af_error(AF_BAD_CHANNELS, "invalid file with 0 channels");
+ 		return AF_FAIL;
+ 	}
++	/* avoid overflow of INT for double size rate */
++	if (channelCount > (INT32_MAX / (sizeof(double))))
++	{
++		_af_error(AF_BAD_CHANNELS, "invalid file with %i channels", channelCount);
++		return AF_FAIL;
++	}
+ 
+ 	Track *track = allocateTrack();
+ 	if (!track)
diff --git a/meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch b/meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch
new file mode 100644
index 0000000000..9214d80172
--- /dev/null
+++ b/meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch
@@ -0,0 +1,50 @@
+This patch is taken from opensuse:
+https://build.opensuse.org/package/show/multimedia:libs/audiofile
+
+CVE: CVE-2022-24599
+Upstream-Status: Inactive-Upstream [lastcommit: 2016-Aug-30]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+diff --unified --recursive --text --new-file --color audiofile-0.3.6.old/sfcommands/printinfo.c audiofile-0.3.6.new/sfcommands/printinfo.c
+--- audiofile-0.3.6.old/sfcommands/printinfo.c	2013-03-06 13:30:03.000000000 +0800
++++ audiofile-0.3.6.new/sfcommands/printinfo.c	2025-04-30 15:18:24.778177640 +0800
+@@ -37,6 +37,7 @@
+ #include <stdint.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ 
+ static char *copyrightstring (AFfilehandle file);
+ 
+@@ -147,7 +148,11 @@
+ 	int		i, misccount;
+ 
+ 	misccount = afGetMiscIDs(file, NULL);
+-	miscids = (int *) malloc(sizeof (int) * misccount);
++	if (!misccount)
++	    return NULL;
++	miscids = (int *)calloc(misccount, sizeof(int));
++	if (!miscids)
++	    return NULL;
+ 	afGetMiscIDs(file, miscids);
+ 
+ 	for (i=0; i<misccount; i++)
+@@ -159,13 +164,16 @@
+ 			If this code executes, the miscellaneous chunk is a
+ 			copyright chunk.
+ 		*/
+-		int datasize = afGetMiscSize(file, miscids[i]);
+-		char *data = (char *) malloc(datasize);
++		size_t datasize = afGetMiscSize(file, miscids[i]);
++		if (datasize >= INT_MAX - 1)
++		    goto error;
++		char *data = (char *)calloc(datasize + 1, sizeof(char));
+ 		afReadMisc(file, miscids[i], data, datasize);
+ 		copyright = data;
+ 		break;
+ 	}
+ 
++error:
+ 	free(miscids);
+ 
+ 	return copyright;

