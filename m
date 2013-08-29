Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 863D76BDC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:15 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so343951eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=6yICzLPUExo/QZa++neCvsj4BzW8PCHRHLAJE5VaaYI=;
	b=H6XKxRh4uqe5ccybbcN9zpFUWF9Q67UUdL56ccJrdM4ISBDGnrTPUXJiYCC2k2CxkC
	9GJdF9WMA2TjT+mKco25pyC9jpyMJ8BF/tchvfN2kOuktyH74ZL8cTNXaDMKNlNtmujL
	stzoj3j9+TNSaG+KdZSLxdCZny9bhNZA3Sq9YuuMng5yXCt/3HhgepjtiE6s/4Ksc6CI
	mynurD3h0tquGxtcN2SaIUcUodkYFJxYMf8HIRhsHyzvONflhaCowD6OLAnpkFFBRx4A
	DxmLd/nieSrByjnvWqmi+qYjyIPs+/2wsUEBtpHaf7HN5k13d/9CAJ+7MfvuAb0GXabO
	qpaw==
X-Received: by 10.14.103.69 with SMTP id e45mr5360724eeg.51.1377791475999;
	Thu, 29 Aug 2013 08:51:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a1sm47162946eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:13 +0200
Message-Id: <4a38ee0b49ea2d883d73677a4fd7c1070fa5351c.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 20/66] fluidsynth: Add PACKAGECONFIG for sndfile, jack, pulseaudio, portaudio and readline
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:16 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
index 80b2de9..9f6c351 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
@@ -11,3 +11,10 @@ SRC_URI[md5sum] = "0db3da78028d255026230809c6e21b44"
 SRC_URI[sha256sum] = "55638cb04f39f4df76c081e22ca7feeea58ddd20ebf779a7db2d38b1ff374cd6"
 
 inherit autotools pkgconfig lib_package
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
+PACKAGECONFIG[sndfile] = "--enable-libsndfile-support,--disable-libsndfile-support,libsndfile1"
+PACKAGECONFIG[jack] = "--enable-jack-support,--disable-jack-support,jack"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse-support,--disable-pulse-support,pulseaudio"
+PACKAGECONFIG[portaudio] = "--enable-portaudio-support,--disable-portaudio-support,portaudio"
+PACKAGECONFIG[readline] = "--with-readline,--without-readline-support,readline"
-- 
1.8.3.2


