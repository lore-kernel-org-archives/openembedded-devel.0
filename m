Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id D23DA71ABB
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 May 2017 03:28:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so7162417wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 May 2017 20:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=laeOFv3vSljKTGUqfzNXlsPC8R+INnLHH9q0LGpHLbs=;
	b=o9AAhO6vsU8laS6UiwZgSDwE8OgYmxaK5N6FgSGFgVk5EjwGJJFTG6OaDOcHLXbeiL
	XcJx2fAYoWeeTDHWyiukchOGzMGNiewR3XklEzd4gTGZgbbfYySMphS/UtIlx5gtYkM/
	ZVFE1mfBxYRl1duAPjDEcGm2kuY1S4kZYp8RRxIHGcGMCV6OQUYPBYfoMIgT83OznIar
	75ulNcM4U7gOg9o9p3QQFGONYljGiiAWJ/GJ3/lV8HaswG0Eo4Lw96RF9PGR0C4w+M+b
	DQNF8v+AIJu8dFRDdcrRYuHLg2YijQ3HBd1QJNeKM6KEfhNZv5Bh7+pPIjlkQeOHs60i
	z7Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=laeOFv3vSljKTGUqfzNXlsPC8R+INnLHH9q0LGpHLbs=;
	b=ok8veJPGQK+lM5sxWu4q4ZQKWZK+0K2/fPU9TLauo6fQx8w3pK5PCGXYDlR5/s3UEu
	41Cwh5VJvRVGreEMkeMGQkXeAsDuXsZm3srOSde2wJSWSuySWhnjTleb3dqo8mj8txs0
	S/x69aNdzMhLOU81nYFpNyIW3YOKrk5cHlCLpGPOPveUqX/5ADNJ9x7ClZ1cwrXG+BVb
	4exxwPZWimVo2SMHqqO0MTynkWXDGLstJPxzGIPxmdoyphgFbk/etDdglMT7+X1+sWDj
	ls/JEiPMTodyHnixSeIrldTSruJjzJuLjkNW72LhrR58gxLeyh1siduO+NeVLtsPC1m8
	r0NQ==
X-Gm-Message-State: AN3rC/59CKv01HVuzkSxQobc9Ppteup+NOxmhPiQC9CtUd/cgtcF5FSb
	tBC3HG3llV5bdg==
X-Received: by 10.28.57.6 with SMTP id g6mr3876549wma.63.1493954890389;
	Thu, 04 May 2017 20:28:10 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([106.116.230.128]) by smtp.gmail.com with ESMTPSA id
	v27sm4225363wra.19.2017.05.04.20.28.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 May 2017 20:28:09 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri,  5 May 2017 05:27:36 +0200
Message-Id: <1493954856-773-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-java/master-next][PATCH] openjdk-8-cross.inc: add pulseaudio PACKAGECONFIG
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
X-List-Received-Date: Fri, 05 May 2017 03:28:13 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Add pulseaudio PACKAGECONFIG and set it by default if pulseaudio is
being chosen in DISTRO_FEATURES.

Without this patch, there is no way to build a soundful jdk-8 and the
DEPENDS to pulseaudio is also missing.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 recipes-core/openjdk/openjdk-8-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
index ad3a44d..30f8587 100644
--- a/recipes-core/openjdk/openjdk-8-cross.inc
+++ b/recipes-core/openjdk/openjdk-8-cross.inc
@@ -34,10 +34,12 @@ PACKAGECONFIG ??= " \
     repack \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 cups', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
 "
 PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
 PACKAGECONFIG[cups] = "--with-cups,,cups"
 PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
+PACKAGECONFIG[pulseaudio] = ",,pulseaudio,"
 
 PACKAGECONFIG[jce] = "--enable-unlimited-crypto,,"
 
-- 
2.7.4


