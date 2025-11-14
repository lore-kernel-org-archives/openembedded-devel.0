Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977D9CDE01F
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 07:43:47 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12993.1763106223469720034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Nov 2025 23:43:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f7zRlPB1;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so811267f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 23:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763106222; x=1763711022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FjpKUuetYqUU4EhqCgwOTe5hYAIkkHVGnl6sre1uxe8=;
        b=f7zRlPB1wtR9BSwxzj+5ciyHFYirmrLdnOchj6pPv6OHwWN0ikD+v3lS0P8RpKFVVx
         QnD5ZfNyBd9YvuCTvhr94yaUInjKSBSLw4i95nGRl62lzr0kAz9PZZGaqS549rdlhkiv
         Hn36bm2c8CIpkdz5Q0Rw9ojCWnmq3OhH03fmnOqT5Fqm2jBEaKP+DYbnDRWG86qx7ScK
         aNspghYWaPD9DIDF/XjOwiBkasHeuYfUAFJgVJ1d0QgOb4hkxTOs8em8Me9L7SR/VRJ8
         ukjHvjZvWeMzjZ2F367XWY+2n+kfgPOs37rV8zINE+GuU10i+aXu4+eRnT8VH7k0f80+
         Pyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763106222; x=1763711022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FjpKUuetYqUU4EhqCgwOTe5hYAIkkHVGnl6sre1uxe8=;
        b=aNbrhkEIN6FApCrk3APrds3hQLi0T7uOsGQwtAaMp3uGSPg/IY/8axpTthzK+r0dx7
         aoLMWGzQ6Y/Eg47CY8Pt+3treAcYskm9ua/UK5wMO3ATFTBM2T0sLEgh0uBUWZZ5Ld/U
         MCc9Z0g82zAbIcJUKu2vbJuRpVpfJ8+paCOGn39/ccffxykQq8tm5/zm0xCyZZ+Kw2Z+
         jJMbsvjw188F3Ur8vK3KW7Bd2Ce7YNcpZd6U8MCdWlhyzcFWql5ybpf6u0Z/qmWQfNk7
         NJ9PSaI9AzH0M8koXOcYQouN3YGEJjPQPGj7Y5xq8PPbEiQThi+nmqdqypp83Oov14BB
         4imw==
X-Gm-Message-State: AOJu0YzLNdVPlB+8T8bPkWhVN+9QPJv0ynyMCgFKhQ2po1mv58trSOXz
	zChU8UQErs8RChjyRq/pQqYfFSNdoPXajVXN+7HzrFF3+r7bleLiYRIYHJntGykd
X-Gm-Gg: ASbGncuWwYQrXOUD9hgh/BAFsXM8ZCA5UiSPDMPJJaJifiF0SRMHbVM5vHQ2pE7XGmN
	2oeJnnBk3X0ZokBJZiA7A72xmGW+2+2yNWYsMmUi/uy1nYlbkKNScDJqjvv4x+EPjpc1ds/YyCb
	Qp5llsdcDkb8am09sUzDPcyA7NkVbO9a1enH8eoUinEnd1K0+wH+cg2uW6S3ILKyZUp3cUyyxLw
	YW5htJMMVSw8eaV77rba1/tv/3CWomh1+Y2bTmSLFdW9wdpLE/UMQwTFdRdKtcP3Fnx0oMm/nFX
	x96HNRnMqPVlaf9ZAXtiFiZoCLMS4Jc0g0m/IL3knYYZV/WhhNJmBxOWnsGvJ7X9WCn8kIQMmIG
	1//F+BLYX4S+IMk8AzZs+dGtIsIGoto2MrnYdWKWQPCOvvSgWHYiN5FepEURychnuQcFcU3PL1w
	==
X-Google-Smtp-Source: AGHT+IHf8zqMgFqxo7ffCuUBeLn3nMLS9/uS1Z5Qwpvk/RvP5852qm4yDdFfANwnQ2LZUhig4TglmA==
X-Received: by 2002:a05:6000:4029:b0:42b:4177:7139 with SMTP id ffacd0b85a97d-42b59374d6emr2010174f8f.46.1763106221445;
        Thu, 13 Nov 2025 23:43:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b622sm8090954f8f.29.2025.11.13.23.43.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:43:41 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/4] audiofile: patch CVE-2019-13147 and CVE-2022-24599
Date: Fri, 14 Nov 2025 08:43:37 +0100
Message-ID: <20251114074340.2716135-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Nov 2025 07:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121685

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
https://nvd.nist.gov/vuln/detail/CVE-2022-24599

These patches are used by opensuse to mitigate the corresponding vulnerabulities.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: no change

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

