Return-Path: <armccurdy@gmail.com>
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by mail.openembedded.org (Postfix) with ESMTP id 84D576B938
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2014 06:17:37 +0000 (UTC)
Received: by mail-pb0-f49.google.com with SMTP id up15so3003225pbc.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Feb 2014 22:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ddPp7SdBiCZUQYhkUOxlA/AtPUxtU0f04u4b5UJcwOs=;
	b=Tih8P7k5bgzxfkUuNXIeraiksUSZtd0RVXTChayK0fnwYTGdekMD2ubuxhlpraHyBl
	9rC6U8xUAWmr9krdusQm+snQmzirn26hBqpB/EXD6v3e85E8lSZa/Gj43/Ne+QVu6n1P
	d4erdWEEqnVe3J1TRni0hpeIJ2QeR9BQXgHwNhXUoLtdaCiolKy24sJMBlsObYQAoDNR
	qnQGnTpTc2yupljhRuKSJizz+Wh0gdqN82qvyy7ah3P7m/6eRbvrRvcbjg25y0iJ/Hvp
	T+nTgSTkl6aLmp416M5WSGf6PvnJywHDWNxMxP/WOQrOxY18usif5W9TRwhwJj16jQ8f
	KXDA==
X-Received: by 10.66.50.105 with SMTP id b9mr7168311pao.9.1392963458224;
	Thu, 20 Feb 2014 22:17:38 -0800 (PST)
Received: from t420s.entropic-communications.com ([12.199.200.26])
	by mx.google.com with ESMTPSA id y9sm42019938pas.10.2014.02.20.22.17.36
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 20 Feb 2014 22:17:37 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Feb 2014 22:17:09 -0800
Message-Id: <1392963430-16876-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-qt5][PATCH 1/2] qtbase.inc: configure with -openssl-linked instead of -openssl
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
X-List-Received-Date: Fri, 21 Feb 2014 06:17:38 -0000

Configure qtbase with -openssl-linked (instead of -openssl) to ensure
that run-time dependencies on libcryto and libssl are detected.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 recipes-qt/qt5/qtbase.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index f056393..ad5bb12 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -110,7 +110,8 @@ PACKAGECONFIG[kms] = "-kms,-no-kms,kms"
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


