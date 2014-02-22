Return-Path: <armccurdy@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 686A4617AA
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Feb 2014 05:31:13 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id un15so4321756pbc.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 21:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PfbIh/om5mv11EYcNzlRQU+FuXQevruwtOoXx+baDbI=;
	b=y85uoP1GVzgIWgHhwlOF2WciC2TlJsSOeeLM5vdLEQ/CNmYXhr0NIfCMMZxumckPb+
	ESjQk0R5m/HtC9Gs01B0Avj7eSxDcd/ggYpZR10+QUpi8O1gHU/gDPNqStJXvZJyl7Aj
	26kHaoxTOelmxroUala4ksvuryTLG/Me3V4KOUvAUhEe6n328hgpYlZMRhzPd1H1xz5n
	yFtlY+BQE54NceZOTBXn4TNeowvMVF4/V7NIXykPy1TWyc5GSw1NantWOZ50kFOXB6E9
	kofuQL9n8Ofx7zv0BlgbCLL7YXTIyLI9lC596jT9U9pccCwyzgg/EQONQJiv+nH1fxn1
	qmKg==
X-Received: by 10.68.244.229 with SMTP id xj5mr13357998pbc.108.1393047074595; 
	Fri, 21 Feb 2014 21:31:14 -0800 (PST)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id
	yg4sm64397153pab.19.2014.02.21.21.31.13 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 21:31:13 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2014 21:30:06 -0800
Message-Id: <1393047007-20507-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCH v2 1/2] qtbase: configure with -openssl-linked instead of -openssl
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Feb 2014 05:31:17 -0000

Configure qtbase with -openssl-linked (instead of -openssl) to ensure
that run-time dependencies on libcryto and libssl are detected.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 116c86f..6a0149a 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -112,7 +112,8 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
 # needed for qtdeclarative (qtdeclarative.do_configure fails to find quick module without)
 PACKAGECONFIG[icu] = "-icu,-no-icu,${ICU}"
 PACKAGECONFIG[udev] = "-libudev,-no-libudev,udev"
-PACKAGECONFIG[openssl] = "-openssl,-no-openssl,openssl"
+# use -openssl-linked here to ensure that RDEPENDS for libcrypto and libssl are detected
+PACKAGECONFIG[openssl] = "-openssl-linked,-no-openssl,openssl"
 PACKAGECONFIG[alsa] = "-alsa,-no-alsa,alsa-lib"
 PACKAGECONFIG[pulseaudio] = "-pulseaudio,-no-pulseaudio,pulseaudio"
 PACKAGECONFIG[nis] = "-nis,-no-nis"
-- 
1.8.1.2


