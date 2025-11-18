Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F89CED27F
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 10:31:39 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9420.1763461895033288508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 02:31:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LL8cAwch;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477563e28a3so36281225e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 02:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763461893; x=1764066693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T36cAy7La38mJmHQ3MJA2Li8IBUsidfc3+aBaj4VI/U=;
        b=LL8cAwchop1diU6T4ERa9NVYqxmeC+xjomrL0oDImsEEkV9UmgKeheO4NzX/PwSzK0
         44BXwpgMxG5qA1aE7al0OeG+uTB01nOeFPHqIy5bbKx7X4+4ZAM8DVPnXPwgTONmhw16
         zYyLIkQb4q5xsRCBhRsF4brwHaHSMVF/AUWnTAAWUOXMEBLREz/EdkD9iaRRMoOsLLIm
         0Nxd5zSyRCpuHcMjMCOhwMIWa9kFp+612DiB7quhpMP5lzZBA7Y37blbCpx8K49Fc9kM
         rUdBGFf+2UG6PBvvfK1jkV2TFFVnpUP76+IKZ0vZSvd8YvX4Rzxn4dmdTmgh6zA765cW
         gdIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763461893; x=1764066693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T36cAy7La38mJmHQ3MJA2Li8IBUsidfc3+aBaj4VI/U=;
        b=OBm68IqNoIO1+5RnvFonvtOS0hh+iUbDiucFXsftbXJUchKC+/M7uHRv9Z12BDx4Av
         7zHiMB4b1J3REcYeog8ih9/VxUtWuZWGFLyPOYnGJpK2JxQEbPx+ZV3kdApnk5fiOx3P
         jN5lftnvDMJgfy+Mfg+J2QSHLGtKmvpOepJgoilxEEUzs3u3wrGZ0L/BLtjZknFp+4SM
         pxOodclmoU5hbpg9MdLcCoHdsGKr1lVh8kt81QsOOEnTH6ytFiOkjhjmZjJALhHpfPMM
         ifBbDd6P3E7IIXn0Eg5USNPZ72tRDMC5l2mqMawlVcZ/u6TTIc11+Tcz56S59ZyLArYt
         7FiQ==
X-Gm-Message-State: AOJu0YxXbbgQCf8G2vtIASblKJtD/SkZBkX++g4C4W9bqJ/yaiXIvroc
	5YBbb9M2zBne9fE9ZfDPM6n+RJ9RjKpNLppiS+q02G6+kb057ZCIbUy3yLKi2F3y
X-Gm-Gg: ASbGnctgHKq7WRCi0YhHquP3TYLHGhMwDnumv8C3xEs86GksWFPH22mf/iIKphuP4Nv
	70XkE3lTdOUsMi9fodAvZMQb+EwiymRWo1tamb0gcd0pnFJcDlx9B0i/K6VcQEa1XBqXXI0PDPR
	Gp9XgrEHCnMfBxBub0iD+6ZY8uKVDrB3wfsC6pTc1GFF+rgdOR3xNCERUDmt/mr6vSShZoKXNzU
	q0QR13b3a+iQEQYqtuHuoGAr4TIRzZ05aXLF462iPe4PM3nPOuLJB6jlJ++hRbxhFgjpaXeRvvY
	LdgtSdMf2I97CgwXs03hNdczEbM8MfY0tA42gzZ9TWEY+PtA6OvOwKIWo3/Ceeb//r26B0miprF
	hEHBD7Iv4uUw18sbBQLlHhMd2ZrLoiRk57XhSHVtNDx+bLzEvPS9GIDo1a4epw09eqv5/xf/nwe
	vn77DM0lJ+6O5Ul9vHBBk=
X-Google-Smtp-Source: AGHT+IHQqx8x/rVKqs+2t//0+Q2VrAr9T8nHCb6DAwG7NkPhMMeaR8zV+ncTqyoxSpryLxrBPgFtrg==
X-Received: by 2002:a05:600c:19c6:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-477a94fc3eamr23193965e9.13.1763461893297;
        Tue, 18 Nov 2025 02:31:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a81c567bsm55743925e9.9.2025.11.18.02.31.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 02:31:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 5/6] libwmf: patch CVE-2015-4696
Date: Tue, 18 Nov 2025 11:31:27 +0100
Message-ID: <20251118103128.1471091-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251118103128.1471091-1-skandigraun@gmail.com>
References: <20251118103128.1471091-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 10:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121847

From: Gyorgy Sarvari via lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>

Details: https://nvd.nist.gov/vuln/detail/CVE-2015-4696

Pick the patch that mentions the vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libwmf/libwmf/CVE-2015-4696.patch         | 37 +++++++++++++++++++
 .../recipes-extended/libwmf/libwmf_0.2.8.4.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
new file mode 100644
index 0000000000..bd5fc4d85f
--- /dev/null
+++ b/meta-oe/recipes-extended/libwmf/libwmf/CVE-2015-4696.patch
@@ -0,0 +1,37 @@
+From f743ef455dfb1faade0ca5290994087ef8b12a98 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Caol=C3=A1n=20McNamara?= <caolanm@redhat.com>
+Date: Wed, 8 Aug 2018 14:00:49 +0100
+Subject: [PATCH] CVE-2015-4696
+
+CVE: CVE-2015-4696
+Upstream-Status: Backport [https://github.com/caolanm/libwmf/commit/f47cbdf96838c2daa7b8e489f59e62371d33352a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/player/meta.h | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/player/meta.h b/src/player/meta.h
+index 3e13688..f86c5f9 100644
+--- a/src/player/meta.h
++++ b/src/player/meta.h
+@@ -2585,6 +2585,8 @@ static int meta_dc_restore (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 			polyrect.BR[i] = clip->rects[i].BR;
+ 		}
+ 
++		if (FR->region_clip) FR->region_clip (API,&polyrect);
++
+ 		wmf_free (API,polyrect.TL);
+ 		wmf_free (API,polyrect.BR);
+ 	}
+@@ -2593,9 +2595,10 @@ static int meta_dc_restore (wmfAPI* API,wmfRecord* Record,wmfAttributes* attrlis
+ 		polyrect.BR = 0;
+ 
+ 		polyrect.count = 0;
++	
++		if (FR->region_clip) FR->region_clip (API,&polyrect);
+ 	}
+ 
+-	if (FR->region_clip) FR->region_clip (API,&polyrect);
+ 
+ 	return (changed);
+ }
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
index 364bf4b022..e1f94172ae 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
@@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wvware/${BPN}/${PV}/${BPN}-${PV}.tar.gz;name=ta
            file://0001-configure-use-pkg-config-for-freetype.patch \
            file://CVE-2015-0848-CVE-2015-4588.patch \
            file://CVE-2015-4695.patch \
+           file://CVE-2015-4696.patch \
            "
 
 SRC_URI[tarball.md5sum] = "d1177739bf1ceb07f57421f0cee191e0"

