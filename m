Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34A0AC44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:51 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75155.1782663765006838508
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HVoR2IeS;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13986d61b4fso3464851c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663764; x=1783268564; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7C4k9HaR3Jkm2wxbF86pyCSqwG6ib943Jh7tvV6ipvg=;
        b=HVoR2IeSsHajjYq7irxos7A1qX+COIO1DmDX0zEP8ZygSTqjjPf6zzT5TP44nB8QU6
         /7QwIDSzA74Sy4Gco9IJ27Xu23wDR5thAgg3vSWLH6ApARWrYRVRwPEOmdRoPgO/3+LU
         bPEYykQbzKH65iSF7IvhCwZF1wcuZUF85n6n8yLsxF73oIg7S0LxQ09UsZmoh3uC5LHK
         IUYE/+9Zo6rf/RZgzoS6umc/lscN5DNHU6LxN0VWRuBBb0NTY4ns9nWPSoFbWk3aW0eG
         Ixz6FHL3M2tOq8QmASncFfulendnwToRSKSmxPKGYq1TIMvH4x9YdjD9eChPdwVqhACZ
         NYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663764; x=1783268564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7C4k9HaR3Jkm2wxbF86pyCSqwG6ib943Jh7tvV6ipvg=;
        b=IDQVysrRDhiGm0CMzLEEmdO4sky6zzdLu6UkLvmiwgaRdy4lUvn9wy04yUs34XZjDL
         OabYNQCbj6e3lNMo5tCQ/PitL3BARO1tfgIjiofd5UT7HeazWbDKqu9MovSbwlzOaCiP
         KJRXxcyG1MWFtXQq+tnMPbkmr30B/RDgoA2mf3K/oGFP9wwCdM51vEMmhsOzkBM3vanO
         23nelyQvhn/Hc3ifarDyEYe6Cgs3sjULGCqO25suEzBIt2IVVSpUCBvdDjL3JCsx3J0M
         xQozj27I1qHkBHOwNn857pGsrIvj0VwbYsXX9KjpI1UgHygAvLQ51AF7seHGMLgV9Mr2
         SJgw==
X-Gm-Message-State: AOJu0Yw5Qiz6VHcE7ykqBhwUwODy3dQgtQOhE702g3+zJ73GvPqjwR7h
	u/8kwYp0cpSeBjbY0hkRHloRaNLszivdPxBqej+lbJcVJT+DYe7iGkuppRhOlIPyPtsWDg==
X-Gm-Gg: AfdE7clrh9RivVhY9/dBh4OlflTQ+sIFSTa44U8X3kVlk2KZOg1pyDpjQFsrs9nAxNr
	3nxrvYp189rPbSXS9ilImRqoHggqHNyiT3NUhBHRVB4sCnet1qoQvRfFRh7UPm5PjJJCi56a1Vi
	rpnBndkFchHcBjS0K+cBrUuagurFilyW4pbhozcurcWG2QT37M+1ej5PnqRm6M6wMjAW6lHCDGU
	bbhrY/3l6zr5PYKso4Ju1YP1Cjaz1yd1l8I1WdqTEvgYpz5x4J4/E5SzcEeDTa5WHSo+s/MOryw
	nNHPe/Ly3TAfP981mBX/3WyX+HRbLL0ocxH88DxcnMlDvM+PFcfN4G5NGqI+UwgUBunfXWAwzTT
	8O7t8P4vXIoGxP+agfySmEaiIxBjc99jslMVbwtzn736Cwwd9NVuXvEyGx5sGHapTExF7niP3m2
	FSxd9gWwXhBb02IQRKyeLY2knQYX7GZrnc25HjenCucCQ/+d1j5sWioJa3CwJwiiIf6Ho2BJm3L
	tJvmmce3boIiMtoMj5LkIq6FIUc5iq9dNXHrEwH/fDbvKah9A45dWVjXs+HKT2qbkipzRlTgxXw
	6FRUO13zlBDa490LkBjX+UeSAWUvZw==
X-Received: by 2002:a05:693c:88c4:10b0:30c:9ab8:da88 with SMTP id 5a478bee46e88-30c9ab8dd6emr6110158eec.8.1782663764297;
        Sun, 28 Jun 2026 09:22:44 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 119/128] libowfat: relax -Werror=incompatible-pointer-types for GCC 14+
Date: Sun, 28 Jun 2026 09:22:13 -0700
Message-ID: <20260628162222.4081517-19-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127929

GCC 14 promotes -Wincompatible-pointer-types to an error by default. The
buffer_init*.c sources pass read()/write() directly where a typeless op
function pointer is expected:

  buffer/buffer_init_read.c:6:18: error: passing argument 2 of 'buffer_init'
  from incompatible pointer type [-Wincompatible-pointer-types]

The existing gcc-15 patch only fixes the BUFFER_INIT macro, not these call
sites. Add -Wno-error=incompatible-pointer-types so the build completes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/ncp/libowfat_0.34.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/libowfat_0.34.bb b/meta-networking/recipes-support/ncp/libowfat_0.34.bb
index fa251f55a7..63782e8865 100644
--- a/meta-networking/recipes-support/ncp/libowfat_0.34.bb
+++ b/meta-networking/recipes-support/ncp/libowfat_0.34.bb
@@ -13,6 +13,10 @@ SRC_URI = "http://www.fefe.de/${BPN}/${BP}.tar.xz \
           "
 SRC_URI[sha256sum] = "d4330d373ac9581b397bc24a22ad1f7f5d58a7fe36d9d239fe352ceffc5d304b"
 
+# GCC 14+ promotes -Wincompatible-pointer-types to an error. libowfat 0.34
+# passes read()/write() directly where a typeless op pointer is expected.
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+
 EXTRA_OEMAKE = "\
     DIET= \
     CC='${BUILD_CC} ${BUILD_CPPFLAGS} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}' \

