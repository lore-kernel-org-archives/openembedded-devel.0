Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 438D07F012
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 20:57:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45kWjD6bDszHg
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562792257;
	bh=F7mDhDAID3ZLIpcvhqomNEJKoaM5GBZFPcq+yCVQnYY=;
	h=From:To:Subject:Date:From;
	b=CyyKBoG8GsYu+N7RZp/+qXPMqFT2xOlsKSFN6auI9jwxzFCJ2yxhp9tG15kpukvRB
	ZZVz/6RlkrW2Om7U6pmfcTui/YBrI9qgkwG/hK9C/fqCcts/75MUMf/u25929S1qRh
	QUvu4r8uaYrB14bUDpylft8/zTCzakK7j7IDemyOBemscZKRjYDAtVt6OU+3TeaOjY
	mAsLIOM/pKbIrqvvr/tg+eKIO8bjQSEO+l8yKysA2+COVhGUIOhXW1x5FHvVG7bU/f
	sSbnUkdOCLyEwpsU8GY+GF+r6rbfeaNYX/+HEqzrkY9rnnXBRIlRn30mWWz6shSJNS
	gKy/58CPvdiM07tR2JF80TVc9N3XyUdCMHEjRuJq1akFmH2pTFas4TKXfCB5kEOCFr
	5ra0hun4xSa8tCczb2apTAgfLj9uhuFzFCutbItMq9z5lW4DlQ954sRJ+NJt//A/TZ
	1103ohTg+PcjYqQLuK/HzkLsvEdr+hYbiuM421uEH5bJFdDVvSvhlJZuPjmfYU8vqn
	w2zp0cCH8LlXb1du5O/p7KeyFc3YMSapFGKiRqYmZN6tajXGDFB9ED7dhSbRCNkiwb
	WJWMFVBQrsTIkVDt1+DTBfzdMlm7cbUaaDNo9rhHrc6/h2UP8pM6zQIHBm/OGu8EdS
	U66kw2NLLSdJJfVOj33JvPdg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Jul 2019 23:57:33 +0300
Message-Id: <20190710205734.12377-3-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] openobex: Drop bluez4 support
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
X-List-Received-Date: Wed, 10 Jul 2019 20:57:36 -0000

bluez4 was removed from meta-oe 2 years ago.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
index 3fb8cb190..879072396 100644
--- a/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
+++ b/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 "
 
 DEPENDS = "virtual/libusb0"
-DEPENDS_append_class-target = " ${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
+DEPENDS_append_class-target = " bluez5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}/${PV}/${BP}-Source.tar.gz \
 "
-- 
2.17.1


