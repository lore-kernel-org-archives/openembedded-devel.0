Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 80DD660B05
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:36 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so6729501wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TL9RUNEqfeHdsOFKH2DmSN38HeOmt+7eMArCu8+SRqo=;
	b=LMkQB4dAqckHtrsLVTY58xlVycFHGgGqPBlmQ4BMP2mvSas+eSGPbK8rcsh81Du/tb
	Cy4WqE4Cqt/sxMUcvZoK7LVizUnOonKxf80pdqqnRLsqJ5q7lQD7DdAUrBoMGyoN3MXm
	sc+KAZAfvvToh27LVA6CAzolOslnx5GqQAoASMwudJdI3Dcg+eNUUPidLxq4tx8V+C+L
	w3HFsFvw7yKpOunUOo+9+uKpIPm7tmF3M+IVHl13YWlbkwLuWKsP90xMdSyocSWCBrVr
	x1ZsCQBkE9vo45o9vfbUMteEOkCppUIbICNxdQqTTAsdS7y5702DdDTYpZ3KcOhm1UDa
	ybjA==
X-Received: by 10.194.122.6 with SMTP id lo6mr40001514wjb.17.1407600517198;
	Sat, 09 Aug 2014 09:08:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	z5sm25505332wje.49.2014.08.09.09.08.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:29 +0200
Message-Id: <1407600537-10857-8-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/36] libmikmod: add dependency on pulseaudio
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:36 -0000

* fixes following floating dependencies:
  libmikmod/libmikmod/latest lost dependency on  dbus-lib json-c libcap
    libice libpulse libpulse-simple libsm libsndfile1 libx11 libx11-xcb
    libxau libxcb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
index be06efc..2e1b9bf 100644
--- a/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
+++ b/meta-oe/recipes-multimedia/mikmod/libmikmod_3.3.6.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 
-DEPENDS = "alsa-lib texinfo"
+DEPENDS = "alsa-lib texinfo pulseaudio"
 
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/project/mikmod/${BPN}/${PV}/${BPN}-${PV}.tar.gz \
-- 
2.0.4


