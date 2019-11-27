Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id B6D557ED3D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 14:41:23 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z19so7802755wmk.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Nov 2019 06:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9SE4I/mwWyIl/0wISOMzEFGNiwvN8aQDHdWZIG+AZyE=;
	b=W5PwL3OcRJWzQK+5HpRKcmUX6/tYuWzX2G1Y/cRL2rz4r2wTRcG4qbKmq1Hs8EUIbC
	3YTxol3NCeHNmIHI2BkkYn3GUCKW1UeT9kiRV8jsfSc/XpCE9vEv455fLbGXTOHhe+Xe
	38W9jcGcOipXsc9HuVbdQSAWRa0cZ74KsEvN8vRNl7VcUuVYmVEaUVXkh0idzZxLGe8e
	QR28Cun1/SwMm3PchiFf8fbCk5ClIqJuTXXYmGj4YntH2ziIWYXO4f3KBa7V27ElA/uc
	odFp2Qsm2sbMsGIDTr/wXCg7P3E/emzodzJF8bMycVAgjkfa8Qwfz+R0PVMwGYubeeEm
	XUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9SE4I/mwWyIl/0wISOMzEFGNiwvN8aQDHdWZIG+AZyE=;
	b=NqGpC7a4YulwQf0wTKS0bQlKFgTf6DpkxucPTx4KgFrIyb2IyFTW3waykxMbW5TQWF
	q+06SO6scnzadZBPd4cgwhTqlWtOfXqeIt7NETdCotR9hjTzwFuG6gQK7g+++6Q/CGGt
	mpQki+ovVQFzflteygBurHGQ5Qs25Xv3kaz8lEDv9L5W8pRgB9ZwUaYxhJaXZrmjkeRl
	XnZwR/4IDI3ob7wQuYdywr/GC3ye2/ivCXylelUKj1wt1gSy38WKgDLxTAZPhqcDF2qs
	7xLVbNUX5mEkrqsJvHxLt464JF6PU4zjhh21gOIfZdcKcuy3EB6oTqQL/kG64LebnIWp
	G4pQ==
X-Gm-Message-State: APjAAAXj1XXtugj+6kyJu8q4bCl95mHlYJQu4xnS3JmtzV2koDtbgLDd
	SXjq2tnM2LHoScwvJRfVY3rfTCJr
X-Google-Smtp-Source: APXvYqy8Sd+UGA2Rqpe46xq6JeN30VivjMyfulnSFBzBywYJMkEruReKh7ESdzWKhsqNHL+NnEtYaQ==
X-Received: by 2002:a7b:c935:: with SMTP id h21mr4423639wml.173.1574865684044; 
	Wed, 27 Nov 2019 06:41:24 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local ([195.50.169.54])
	by smtp.gmail.com with ESMTPSA id
	q15sm19454409wrs.91.2019.11.27.06.41.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 06:41:23 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Nov 2019 15:41:15 +0100
Message-Id: <20191127144116.18751-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 1/2] networkmanager: Upgrade 1.18.2 -> 1.18.4
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
X-List-Received-Date: Wed, 27 Nov 2019 14:41:23 -0000
Content-Transfer-Encoding: 8bit

From: Adrian Bunk <bunk@stusta.de>

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 1db745db41e31c61448743842104d92a61e7ddfb)
---
 .../{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.18.2.bb => networkmanager_1.18.4.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
index 0d6e1a0b0..085807c4c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.2.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
@@ -31,8 +31,8 @@ SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
     file://musl/0002-Fix-build-with-musl.patch \
 "
-SRC_URI[md5sum] = "ca1e6175c6ba97ca1adf65a67861ccd9"
-SRC_URI[sha256sum] = "4dd97ca974cd1f97990746527258f551f4257cbf011fecd01d10b7d74a6fa5c3"
+SRC_URI[md5sum] = "fc86588a3ae54e0d406b560a312d5a5d"
+SRC_URI[sha256sum] = "a3bd07f695b6d3529ec6adbd9a1d6385b967e9c8ae90946f51d8852b320fd05e"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.21.0


