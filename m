Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD55CEB2D8
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 13:11:08 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8209.1763212266519236958
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Nov 2025 05:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hdHONd3c;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so1817125e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 05:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763212265; x=1763817065; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m12JsSeHODu3bogd9/TsEVH1uCoC00CjHP7KaSYDoPI=;
        b=hdHONd3c6LtopEgrP46aqNEnEO3/l4a5IJKNakqh/FkGdvPf0IxnUGIM0C6iiit+g8
         OlCEPox3Q3mfs8/EPyBV/sVri3iNyKGU3Bt8A5IjiegOTP04+bsFsGY9eB2IOn1lwoU8
         9Z8rcbI6bhABsmDavniqWUrkZ4ElpjACnA4AKBdyedAvPs60YwBlbUES8FuOJL/W6bFT
         X9OuifXNtgQZiHldZ6tGlsVIGNbcRXsYwKkjwdN5ybSli3PyYA+MzvNA6kbtn9B/m7hG
         eiVWf2iM8mdZKLA/2wYtwLkB6FFwXX4X8K7NAES41WNienjgRZ4zC1+H0dKvZnNQkVIn
         MItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763212265; x=1763817065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m12JsSeHODu3bogd9/TsEVH1uCoC00CjHP7KaSYDoPI=;
        b=sOOiyPA3DwqChBL0vaRkM4sM/Zkw0AvOwcgMT/A1+Vk/CwgpkPkrJqAO17WI08eEGY
         wZAHFGX3OhjlBsFhs+wK7/qDm3BLsyuZNPH+GnSGqj5ZVgasx77+b9tWsIjuDlNf29mI
         W67jkDm3bPGjfMwcHZBkHPM2oBIq6vLUER24alQUl6uLY9lxyf44BbyzY94VRvn+bl5J
         2rbx4s7cU0VmeVJEsMkAtSKnAey9NSmPAlNjnMT+4ONI7PazjZzJ5iwIO2MGffoZLck/
         GnQqK8zke/d/HfpQ6j/4kUVRGEFcsIUrUuJycD+SRTfft9LNcZ6b0bvLL0DC3otvduhe
         D2/Q==
X-Gm-Message-State: AOJu0YzpgRnsg0Ze4wrtaOfpl2Ul/Md1jAX8sYKPBRqXUK32sl/ArjMX
	33z0/ud/GfBGL5TmSXoc7mKBgRQg9hrrMC8fS+ZWx3asyOzlA970K3pFboQ0bNQ9
X-Gm-Gg: ASbGnctp9ecEXmG29VZoCpbtc2BrTq5JwHrvCbJCkYVUdOhH6fPBq70t7VE937L7MAt
	qB2FJbrAjTDnzqyk514hvcfHOiKhFdqm/dnIVXOL1IbJX0VKfg+XDYKF5IXceedO5rC4P5cnbh2
	Futugbh/OLHdO1H7Upxs8ToxzbV9kdXrHT5W0b1b8izsHB6sZ54h0/4fjO/1gYhPpgo/BbQF0mA
	ElrwldUfDJd/XtDPQ8+TwEDC8Pz9kA92vIJbIIh+jwHKmpCvdCp3jes+fe2ya/KUTv3zuLvXl4o
	i/OgnQIsAP2V+AY3fvMD+PX34fWMXQx0hDR6wBm6XdU0B2cs5WXHx3c+tJLyQ8gtA7ql4sVBec3
	Blu7QOgtR16Vd+KjNgR2ohTvrx74KTYlLZkRJ/CD4IgGqH6scdEi9hkAbJm38lgLEUv1iTFL0TQ
	==
X-Google-Smtp-Source: AGHT+IEOThCaW6xFv43+ThUTo7HFE3ZBqQPp7hEmFRbZNxql4URP4LEQ2kYVUoXEoqXdtgTRQjdBYA==
X-Received: by 2002:a05:600c:354b:b0:475:da13:257c with SMTP id 5b1f17b1804b1-4778fea1239mr67840715e9.27.1763212264653;
        Sat, 15 Nov 2025 05:11:04 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47796a8a695sm42868995e9.13.2025.11.15.05.11.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 05:11:04 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/6] audiofile: patch CVE-2019-13147 and CVE-2022-24599
Date: Sat, 15 Nov 2025 14:10:55 +0100
Message-ID: <20251115131059.1146238-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251115131059.1146238-1-skandigraun@gmail.com>
References: <20251115131059.1146238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Nov 2025 13:11:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121731

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
index dd8784ae8e..4642b5e7be 100644
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

