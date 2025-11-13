Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A3BCD5BDE
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 12:06:17 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22279.1763035574912667059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 04:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SHfXYyhX;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so444401f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 04:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763035573; x=1763640373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4EsJqjXdMuu8W6PDoffbyPWJXeqckiJq1VsIqEt1AEc=;
        b=SHfXYyhX/dhOFaFgQ3jGUUTx5xG7xyeuhkHAe0XhTFNKH4tFURrcn9LMv+DBAYRHkZ
         Uakn7wDukNCyRTEULfsLzx7EGW3wToFY9dVe/g3vLoIbXAL5AH/fRyeYVVVqeCP5Gl4H
         pe5sHvJQw4UjlAB2xOI01vID6tnqoxbWlVmTVx5qzUgVjIVYIQuyp64VwdJg+R7IOI+q
         LqB1TUtBHD7rdhGBTjEHnvWXmdpA/xFoq4AwV6ZqYQEvqwBnRNgl8tXjeuccab3+yvn/
         eG9+1fPjsb4+cnNV7q+MTNztke/9lKRst4jxH1nY93umc9DG4w08kmmjROI4YzmMtI+g
         DZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763035573; x=1763640373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4EsJqjXdMuu8W6PDoffbyPWJXeqckiJq1VsIqEt1AEc=;
        b=BcYv2OU/3jdvw8xtiHyvmERK7BBr2Zvlch5QUNnap/5EQEqydXEaO4pDWrdhoKoDFq
         vY7sNcGyBYZVN4JhICd6TxF4IbcOJ1dsuq+G6IAj1XWIEduitYciBLM8CSpqwKK+/ZSw
         vkQ4bUTcZx4LwAC4dOnIev8R6Wtiqayk0viYuRCZr15NktxQXQKvYPQzxbpfWo3jCRNa
         pzF+YiHQJvjpxzgSfWaqG7hqsWi8JE2qp9LRhVWSsqXFqgKiZavBfMA2RulGShCK8aKp
         svjYg4lboUiQ+1bbC1uF9dMC81T5rfbtWldftDrGNKsy5Dwld6Mw7iMw/FlomDKDpiZD
         D9Wg==
X-Gm-Message-State: AOJu0YxuQvc8tK0lFMxnxyMuYGHm3EmXizOU3W1pAgQKe2rU/NEZbBYl
	SqrTEcLCrhv1ethsAo8jFH4Gjfu8VR+BtZpRYuVNTukgxow8O3xbX8smF8ci9gRG
X-Gm-Gg: ASbGncsnkREnA0PsNCjfHlCgq20U+U8vLMFm05SZGcLW+vKYptka+HXwVQL77L8jCNY
	FXandFYxgnHdW1DjqYD8xCk+DEOpKDjzQxkLllLkRJMJju8LJOnxGN+cSSNkxUTlCyOW5sP1S1e
	HKlDLjhm7ZdsnpzIk1MzxQdjFhUuqmf+UfIDYHdUCvu3Z91S5Rtzzg84bCr1+v6OKigRK1wzq9o
	+Yv6GsiD46fhW7542htuNMxuf+ITMAjWNTrTLTU3ljD3waugppUIrY6Fpdgkl+G3B83ngbyUWEp
	8a3WXrgDakG2bFsiKQJAMTUeqHULM2t9XQT7rLoEvbWTV1ciFAJKHSYAYd6DLmaWICayeauU0IS
	VWSQxyM59Ck9aDx+BkRbLZn6GB6s46ggow1IT0881XqJxZkqwjrpxIp04UUSY8FMSuWMeWtXOXg
	==
X-Google-Smtp-Source: AGHT+IFYBm9OS1mP6hlHmz4/lzVku7kaujT+HTvQmkLxgyVLRPOc27LxPn2IBhmZ6gcWv5imRb1Rqw==
X-Received: by 2002:a5d:5d0a:0:b0:429:d3c9:b889 with SMTP id ffacd0b85a97d-42b4bb8f18dmr5764570f8f.1.1763035572885;
        Thu, 13 Nov 2025 04:06:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85627sm3974561f8f.16.2025.11.13.04.06.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 04:06:12 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/4] audiofile: patch CVE-2019-13147 and CVE-2022-24599
Date: Thu, 13 Nov 2025 13:06:08 +0100
Message-ID: <20251113120611.2590707-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 12:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121645

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
https://nvd.nist.gov/vuln/detail/CVE-2022-24599

These patches are used by opensuse to mitigate the corresponding vulnerabulities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
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

