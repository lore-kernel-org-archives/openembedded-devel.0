Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 926C976F9D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:43:43 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so120453933wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=fBzdB0Jnnmjg00emctvTCtmDy6IHV4XCth96ujoSaCM=;
	b=PReUFkZ070Lal3gRSD6Ciq/X/SoGJX34k8/olvs0iDW0OVQXZtPZuuxNqWRH2Wk8IO
	jOheuJC/9cBZTIIS9I7j9PxYBDQybCVAQ+tEaNAtiZEPo8jkFSe0PYWUDL7pUEq8q2Rj
	WkXqrO5quPxaL0Mmy1ZhIE9AtliB6p2dLXY5MtLIRANUlav9i9dm5n1Ft0fCBmp+jpsl
	EntAc4Sq3LDYZM88frYJ3zDpFMp/Uc5cXrB/wy8abeJkOFmo1PPMQdYwj25eMSopdJ1A
	fQSQgm2qvc0aEZrj9EH9J7PGCK2MN+Sm3Hu3WSPROOnT+3ZOV1VLB1+FOpaHK0aEOFSa
	y+kg==
X-Received: by 10.181.13.166 with SMTP id ez6mr47425547wid.24.1441727023191;
	Tue, 08 Sep 2015 08:43:43 -0700 (PDT)
Received: from localhost.localdomain ([5.147.14.94])
	by smtp.googlemail.com with ESMTPSA id
	lu5sm5496240wjb.9.2015.09.08.08.43.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:43:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 17:42:56 +0200
Message-Id: <1441726980-32656-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
References: <1441726980-32656-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] openbox: update to 3.6.1
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
X-List-Received-Date: Tue, 08 Sep 2015 15:43:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

run tested with lxqt on raspi2

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../openbox/{openbox_3.5.0.bb => openbox_3.6.1.bb}            | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/openbox/{openbox_3.5.0.bb => openbox_3.6.1.bb} (88%)

diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
similarity index 88%
rename from meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
rename to meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
index d9e58f1..de4d9f8 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://icculus.org/openbox/releases/openbox-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "00441b53cf14c03566c8e82643544ff9"
-SRC_URI[sha256sum] = "6fa90016530b3aa6102e254079461977439398531fb23e7ec076ff2c140fea0a"
-
-PR = "r2"
+SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"
+SRC_URI[sha256sum] = "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7"
 
 inherit autotools gettext update-alternatives pkgconfig distro_features_check
 # depends on virtual/libx11
@@ -44,6 +42,9 @@ FILES_${PN}-lxde += "${datadir}/lxde/ \
                      ${datadir}/xsessions \
                      ${datadir}/icons"
 
-FILES_${PN}-gnome += "${datadir}/gnome/"
+FILES_${PN}-gnome += " \
+    ${datadir}/gnome \
+    ${datadir}/gnome-session \
+"
 
 FILES_${PN}-config += "${sysconfdir}"
-- 
2.1.0


