Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1CDCCA472
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:52:57 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.18615.1759326775364093473
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEKvv40F;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6366d48d8ccso2099618a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759326774; x=1759931574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=keARwMpNniqUg0/15ks8TA1e6Y2jbPpngOoLZ4km4Lc=;
        b=kEKvv40Fk78k2pEXCz2s/7oH+hVZOh+CGQUPG1k8ynLPRcU1Ap0jtK4TaRYeUj16Va
         0OUnTiWy6nTImc/qm1LVBhJiqe6F8tX7vzjaEN3SO2B+m+rsdwJKbq6LVHCnef4FbZrQ
         enTKmLiombdfr0K3E0+lH7WoAPSv1K3CKXsWxUc9WeTj//mvPwjEg6+WzyWHeSTkA1Tb
         isnz3S013aD3Tb7lRsbuNN4aAknsBf6LjL//9m1lr28vlMBvzH8DDZa9ufR4VENn9WJ6
         /Ec81pTjRG2S5w0KSq1h/fQRZBAvWdgW91e1OMvPLYss7igx99nTibanskIWvi/e9cQE
         SzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759326774; x=1759931574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=keARwMpNniqUg0/15ks8TA1e6Y2jbPpngOoLZ4km4Lc=;
        b=TZkLJCXXeDvDciSXT6C/fHyhVIWVz+TczeUXSqO/1o7Ueq866PVht9T7B5+kArWWKN
         fWEueCx2rGjlv7Iy0dGpjRzL8cWQ6XFaKZvagcx3VjclmDYltQJf8lSYymaEyqIeGox4
         o1GCCQx8O9k/XPZK2u3Dtl48/8Z7CO4xreW3ofppMVUYCoUu3F2y4akUvXOL5cvq3Qr1
         rryAxXuFEAS9Py3zABfKzEVpSiSIslVppXl1PbanJgupgxYqOTyvsdrvVqzyVresi2jK
         BQ7Jk27KrwU2POiiVllxoMQx0aR/bGjDiF+aPEskcdFeEEb7V9Y3KwoeeJyknALKlWCt
         85nQ==
X-Gm-Message-State: AOJu0YxuHE5VfhJIjPrF7gFPQylPPskeDE7/P3e7ls+Utm74bUf89kiZ
	Dg6fQ3QqsK27DEo+nZiKhm8pSce/xJn9KONbnjKojwNM7LNqNsfR3aAZkkRwSw==
X-Gm-Gg: ASbGncvUzgwATDaqpZCJY7sVcA5u9DqsN9x2A2akIJySHxWpi4eVVvEJ9YtLZ8/4+xG
	WLoc9MGbe7tTnjAPJQyD7H6rLPUwr1kyA4vFjyIA3IGOMYLNASz+Gt9XteG1dvuTqq9x3zRgG5C
	fLW2okybtQxgG3WGx3eihWQYx7vi92pH+0oy1jqOFTHfCRl28TxcHvu5g4Px2yev9uq8Tg4Ebvo
	7r0SN7PtbMiWzK2B/L6c0evmJFrlnDcJUBbP6kKmanuG8Bu1RaaSK6XifAn9XK78AqJ4nZn35nm
	s8RkRLhUnSSEIEXEEkUPUWs1UKQuR/ZU5+P7/O6pAJtwn8W88HdHSRRk23D2U2/nJPM+SmqiO01
	A0vvUPvyA1TJLMyF2md8Ge3cyuRhmchfXdAgwC11ulR++
X-Google-Smtp-Source: AGHT+IHHdAMM36A0Fp6mIUY79aBTGRGxc4GUibeWHagW3gRVaKHgajvFp6ZPXA1LC0bAOEiNTcwGKQ==
X-Received: by 2002:a05:6402:1e95:b0:631:b058:bef0 with SMTP id 4fb4d7f45d1cf-63678c7df79mr3837132a12.32.1759326773580;
        Wed, 01 Oct 2025 06:52:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3629badsm11507823a12.9.2025.10.01.06.52.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 06:52:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 12/25] x11vnc: Fix CVE-2020-29074
Date: Wed,  1 Oct 2025 15:52:30 +0200
Message-ID: <20251001135243.1490753-13-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001135243.1490753-1-skandigraun@gmail.com>
References: <20251001135243.1490753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 13:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120127

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit dbdea59838054f9c908533d486cf3c0c2897c791)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../x11vnc/files/CVE-2020-29074.patch         | 27 +++++++++++++++++++
 .../recipes-graphics/x11vnc/x11vnc_0.9.16.bb  |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch

diff --git a/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch b/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
new file mode 100644
index 0000000000..fbdb9123cc
--- /dev/null
+++ b/meta-oe/recipes-graphics/x11vnc/files/CVE-2020-29074.patch
@@ -0,0 +1,27 @@
+CVE: CVE-2020-29074
+Upstream-Status: Backport [https://github.com/LibVNC/x11vnc/commit/69eeb9f7baa14ca03b16c9de821f9876def7a36a ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+
+From 69eeb9f7baa14ca03b16c9de821f9876def7a36a Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Gu=C3=A9nal=20DAVALAN?= <guenal.davalan@uca.fr>
+Date: Wed, 18 Nov 2020 08:40:45 +0100
+Subject: [PATCH] scan: limit access to shared memory segments to current user
+
+---
+ src/scan.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scan.c b/src/scan.c
+index 43e00d20..12994d52 100644
+--- a/src/scan.c
++++ b/src/scan.c
+@@ -320,7 +320,7 @@ static int shm_create(XShmSegmentInfo *shm, XImage **ximg_ptr, int w, int h,
+ 
+ #if HAVE_XSHM
+ 	shm->shmid = shmget(IPC_PRIVATE,
+-	    xim->bytes_per_line * xim->height, IPC_CREAT | 0777);
++	    xim->bytes_per_line * xim->height, IPC_CREAT | 0600);
+ 
+ 	if (shm->shmid == -1) {
+ 		rfbErr("shmget(%s) failed.\n", name);
diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
index 5f7c0beb66..be9ef3cbaa 100644
--- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
+++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
@@ -12,6 +12,7 @@ PV .= "+git${SRCPV}"
 
 SRC_URI = "git://github.com/LibVNC/x11vnc;branch=master;protocol=https \
            file://starting-fix.patch \
+           file://CVE-2020-29074.patch \
            "
 S = "${WORKDIR}/git"
 

