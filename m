Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1C82660232
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 19:13:18 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so2454560wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2015 12:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Nstp457nsOBCRCYV+MBGv2Hmfu5NwrbJyiQDd7N38xs=;
	b=X0TyTvxNWbmmFucu1AYStCy0IIm0A2q17qo+0iCcaraVx8rzhuwWKrsVgZ4fge7nHq
	0pMFyluHiZHcWeZLfnkwz2dpDXtZxpGdiREt1ES4f6IrQQHBbDW5tX6br63E79ri5hrP
	3tIecmnA6OGQOdoMTllC9rj4cynQRhy4p/l5ozFJ53b3W896xOiiZgSmqtAqmZgZsIeo
	DJQx9QEaBZnrmWM34vqxpW10xJWEudcs0sJ/LsoWRlqKz/61g+eiE5sP0vEeGAnT1kVg
	DCbzWywqng0STI29itZnnjqjCLUtgdAfQ6QFDQpKdirYKxiF8JmvAB+PG2dSPG+p0jQL
	Cvmw==
X-Received: by 10.194.190.47 with SMTP id gn15mr54182wjc.119.1445541198624;
	Thu, 22 Oct 2015 12:13:18 -0700 (PDT)
Received: from localhost.localdomain (p4FDF1181.dip0.t-ipconnect.de.
	[79.223.17.129]) by smtp.googlemail.com with ESMTPSA id
	h8sm203993wib.8.2015.10.22.12.13.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 12:13:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2015 21:13:06 +0200
Message-Id: <1445541189-13375-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH 1/4] poppler: update to 0.37.0
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
X-List-Received-Date: Thu, 22 Oct 2015 19:13:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/poppler/{poppler_0.35.0.bb => poppler_0.37.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.35.0.bb => poppler_0.37.0.bb} (91%)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.35.0.bb b/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
similarity index 91%
rename from meta-oe/recipes-support/poppler/poppler_0.35.0.bb
rename to meta-oe/recipes-support/poppler/poppler_0.37.0.bb
index 520aa6b..adbf896 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.35.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.37.0.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     http://poppler.freedesktop.org/${BP}.tar.xz \
     file://0001-add-manadatory-options-to-find-qt4-qt5-moc.patch \
 "
-SRC_URI[md5sum] = "561ef4454bfabe59ef1b8b9cd4aa4c4b"
-SRC_URI[sha256sum] = "e86755b1a4df6efe39d84f581c11bcb0e34976166a671a7b700c28ebaa3e2189"
+SRC_URI[md5sum] = "c635e1742202cbbd9182cb0255d95652"
+SRC_URI[sha256sum] = "b89f9c5eae3bbb1046b0f767714afd75eca102a0406a3a30856778d42a685bee"
 
 DEPENDS = "fontconfig zlib cairo lcms"
 
-- 
2.1.0


