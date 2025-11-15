Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82122CEB2CC
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:00:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8030.1763211603410848032
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ek5JlKgk;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso19583385e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763211602; x=1763816402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=X7+dUfS2GxGsVqo5JeeKL4CPa5Fa3E8+BxcGLJN8Qgs=;
        b=Ek5JlKgk0nVcDuaJmPNxAbFyyhF3NxpUtnIzi+2hDmCYefGPYJ784jK+NfPChoEg2b
         KxFwOUEn1C2/f+OZn/4iZ0XQ3ZCf8NJm2bYJdA5rFyg5LaZxjduqBJpWQsyfNQ4EMtEH
         xw1TZNO5f/UB4nCbCO1tHhLnsBXMmw9OZrGG3Q4XzpZox4Cj9NoEJXlcTCX1JO+bGjx+
         KyHQnCQUH52pCcEnNB+elqULIcOQoluBnL86XScjoJqXs6dsKXrnj/5ZD+QgFwLbGzmL
         4PfEaboaHhi4t21m2ZEuqWIPVS7nfIV4hLNZFP/0+ic/P7sBXR4GeVv8aEtDZ7LPADEk
         im0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763211602; x=1763816402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7+dUfS2GxGsVqo5JeeKL4CPa5Fa3E8+BxcGLJN8Qgs=;
        b=JkI0iX4blm+zbJvsIsli0pnpaeTmIk2XJ1cXTZ0h3O5CC/6TsJ8XVlggb5owigvsgh
         XSVtEyL2qL1ZpMz5j2Ho7a1YiMeWOfJ+ftNFmv2/TZtIzLmBaRqzl9+bqv0YrklTajl1
         jj8wSb7xGC1RnfjiaYKBdBj1cohyJPbEZ0ETCPb70BSBYTF8Vcfcb+wP7oBVlPj+G14J
         CrdRjsm3mQIv365yEZ5x7+yaKkMARWQq8zLqYScbQ78GHeX62v85uD+UHZ2PlOfM3Wy4
         DikOrIgXP1povdddzwi5uWkkdgcCOxRY2+hkinCnktbabJhAS40e1ih3SAbOv05HguaI
         iCkA==
X-Gm-Message-State: AOJu0YyUTjd8Fja9vezi7QBnxIduIyYkgIAiwxbpJ/VhUbWWuj/CuIoz
	m/8Bhk1PMDP75BUD5ApPKrCXdwdRJWl66IGbz6hpd1ZoiHHrc7xevZZsI30khJjX
X-Gm-Gg: ASbGnctA4rgmLEqRQekZXKvhc23JD2U/IcLNr2wOWthckTVjvdlI4RsQAndTSDG+Qvk
	bFQlzWhUMQWDRjGdYWzfN3cMtA0YpDbB6ltkPqeO+ocBhQSVOXEMv7coDPhAW1KTZkGWNxTCd5M
	Qzv67VCmKI0SmbNfX80C1D/g2RYpXVbHxOekox/DGsYm3FnwsHH6HoYQLGo9PIuliuUdi1c4yoE
	DF9i85jXv+AMebnJh9Wo3rG+OAfoTAE/TUrp1yUw2JPeuzQsVXr5T9i465YVoy1QjBb03IKYkSQ
	vv4Uw+AO6uA11PXbYzMH1SQeFZg7/x08JleeDmzJQLYF9g6HCZ0hmD+8CE+o+20F0VwHQhpLsAu
	obEiewvXeiXCt8j3//g3jIiwx+05RMsc4qlRmRfAS45C16lBFQmKq1vqm2B6arYpTQO4vlOJi8w
	==
X-Google-Smtp-Source: AGHT+IG8ypYAcPUtshIkLYny5XMY6B7QIGVxpErZaq9x/ZRyE0h8hV5IOdFYWtdMTxvdptJZSzSDRA==
X-Received: by 2002:a05:600c:4452:b0:477:8b2e:aa8f with SMTP id 5b1f17b1804b1-4778fe6a42fmr55698045e9.15.1763211601336;
        Sat, 15 Nov 2025 05:00:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e953e3sm198104075e9.14.2025.11.15.05.00.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:00:00 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/4] audiofile: patch CVE-2019-13147 and CVE-2022-24599
Date: Sat, 15 Nov 2025 13:59:57 +0100
Message-ID: <20251115130000.1121405-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121726

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
https://nvd.nist.gov/vuln/detail/CVE-2022-24599

These patches are used by opensuse to mitigate the corresponding vulnerabulities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8ef997336aec6f51318f1a7fa55d57e3990914e8)
---
 .../audiofile/audiofile_0.3.6.bb              |  2 +
 .../audiofile/files/CVE-2019-13147.patch      | 31 ++++++++++++
 .../audiofile/files/CVE-2022-24599.patch      | 50 +++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2019-13147.patch
 create mode 100644 meta-oe/recipes-multimedia/audiofile/files/CVE-2022-24599.patch

diff --git a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
index d10c7a8b49..d44ce5c004 100644
--- a/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
+++ b/meta-oe/recipes-multimedia/audiofile/audiofile_0.3.6.bb
@@ -18,6 +18,8 @@ SRC_URI = " \
     file://0006-Check-for-multiplication-overflow-in-sfconvert.patch \
     file://0007-Actually-fail-when-error-occurs-in-parseFormat.patch \
     file://0008-Check-for-multiplication-overflow-in-MSADPCM-decodeS.patch \
+    file://CVE-2019-13147.patch \
+    file://CVE-2022-24599.patch \
 "
 SRC_URI[md5sum] = "235dde14742317328f0109e9866a8008"
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

