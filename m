Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198A8C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 13:14:16 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.174117.1783430049837636724
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jul 2026 06:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VLB6FKE9;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c12c22d0f86so102607566b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783430048; x=1784034848; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t+tP1UKkoUv5n8rjZoFFhVtbgcvkQredQhFGbN9RQNo=;
        b=VLB6FKE96G2l7go8/vcS54hwTuD0d7ln93Sk8ni8+3j6ydAOYQsPul5VH9SYKC6Hvl
         bkNrdSGex8VAEZ9CyXitLS78Z7TnVCrsIzZUUKohs9WCxTQHTukOEaw5pzCcPhOwJ/xk
         hI/ziQSA7OI2Fn8B5mL+LxHEwPTBN+UFnSPzR8FE+beZ12xE9RA23LxBdmltz2bBac4D
         baLArA1AWQSFBNc79qpTmMg/jMNeZ6u2s0vidRiPC1xKGPOefd8GAHOBjJpYHkB5Clvf
         SE7/4oq9QiHdf7l/45YEGyL1hmq55NmjS+z8kIKhgOYWl5h6px5LE4bY1+D3BuCtpnKR
         7ihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783430048; x=1784034848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+tP1UKkoUv5n8rjZoFFhVtbgcvkQredQhFGbN9RQNo=;
        b=MV9SYJ6etuDZR4DCjGGc440J4b6f5I8f1JeUhGR4YMUNKD2nv9FIRTMrDymZEPLUyq
         /W2ETrY7a3YeexMg4R97yJtO2Q7GAnlfkb7fXJqwzL80liJ8ZKnow+WMshKOQzwduvhk
         bGziKoIu3bHRJFkzhAprChVUqqFQT5Vvjb/GmLSK7lcST9bz9K8YIl9chgBEu2mRLqXv
         u3iQYkJ9V7Js7k9ENUKwyxL/b1uv8XmKmdP0Xg6v0Dt164hUqo1ADhFXxJhqiWUZKu0m
         qru+d1plQuRHhbS3PY9iONEOPw/j9u7lKLvwgxPtuBEDAuHL400qsSTzbOYIFYwsGjoE
         pzGQ==
X-Gm-Message-State: AOJu0YyktciIa17vSdPiRdpgyVUu9EVVqvuMT4dYXoBqdy9DLxVzLqb+
	c/A3HtW8+JvUALGKjsdUcntNHgAHIMavgN92/x2rMiNH/ASiDjcBKugmOX0Xng==
X-Gm-Gg: AfdE7cn/OKKwHAABM1Nx24VwUkgxhLMbQGZvuv8pAOgBwXehuwJRpES8WmNDDrt/dpl
	+98CBNjD9jqo8wun9RathcjTHpBgnlafgYB3PBhKzr+JRjHJM+ffGsJUqFmtAA9R0SJuT86CrLC
	qQkKj7xi3oAQ8IhRdYpCAG9LSrI1mMHi1PR7VrqNZODRPZmWuU+IgQ+4yOs2Cy42J51d8BuSkii
	muT2VmeZZ9aasbIk/k7dKy5CkeGaMT6jN+To6u8hYE0+sKX0NX6N2+UR8Tr0y2Z4UoUWDENWXgg
	/dYn4lUcdwGdRgSgpfNiLY7RzNb7SNElUQsjbcXvprCGb+WAMJFmDLOCeV0Puu2NIwFSfG612hW
	vqlF49ouYt0gtgeR1wt4kr/Gbbo6JN0CovRVRD+aUXbxgY0lmU3LEWaFsqJOm9u4uoo4t3Ak5gh
	8ZLTMooDJwC6kGL/C+1VOxNyxOsPE67FA8dz8P79ba8vQdiuliMk4v8+3p+QKrh6j2MEOrN9Xz
X-Received: by 2002:a17:907:ec81:b0:c10:10c9:6d8c with SMTP id a640c23a62f3a-c15aec05364mr134475666b.28.1783430047915;
        Tue, 07 Jul 2026 06:14:07 -0700 (PDT)
Received: from localhost.localdomain (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ae0bb618sm132836766b.20.2026.07.07.06.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 06:14:07 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] minisign: Add recipe
Date: Tue,  7 Jul 2026 14:13:54 +0100
Message-ID: <20260707131353.621346-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jul 2026 13:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128067

Dead-simple Ed25519 file signing tool.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../recipes-security/minisign/minisign_0.12.bb   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-security/minisign/minisign_0.12.bb

diff --git a/meta-oe/recipes-security/minisign/minisign_0.12.bb b/meta-oe/recipes-security/minisign/minisign_0.12.bb
new file mode 100644
index 000000000000..7fccda3de0dc
--- /dev/null
+++ b/meta-oe/recipes-security/minisign/minisign_0.12.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A dead simple tool to sign files and verify digital signatures."
+DESCRIPTION = "Minisign is a dead simple tool to sign files and verify signatures. It is portable, lightweight, and uses the highly secure Ed25519 public-key signature system. Signature written by minisign can be verified using OpenBSD's signify tool: public key files and signature files are compatible."
+HOMEPAGE = "https://jedisct1.github.io/minisign/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ae5258ce978a2a6df50571a88687b53"
+
+DEPENDS = "libsodium"
+
+SRC_URI = "git://github.com/jedisct1/minisign.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "b85e15d45ac9eab34e44596fd309f5b07db9545c"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DCMAKE_STRIP=''"
+
+BBCLASSEXTEND = "native nativesdk"

