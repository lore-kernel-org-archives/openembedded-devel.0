Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 892036FF60
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Apr 2016 22:04:22 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ui10so54690967igc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 15:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Yz8MXUBuX4GIaC6tFYyvlSHZJorSqHoJLCIMwwZAEN4=;
	b=dxbf5T4+x2rMFPA+mnjME97OkCadiB5nnGhrqpvi9HDU3JYYJZ06vfLk1ueWxzHXT3
	cCGbaUukYFkULbwj6pCNphpXQ4cN7O8ycuMEsyXf0EV4m8N/F26KrAc24YQiFGwhrUF7
	Ch5TSPQiibw7tnHzH9uZ/pyMOkLH+siKAGJnOMdhyOdNFixYSKWG6Kjo6IHY8k9dBpk+
	DJsLNVaPEs4wwUSTmwh+UKmP6FOLpYM11xIEB35tnht5CstuAFWHgEbKtFrtptTusd3i
	ebOv0m1faruBV1ufkwU4OEFm5aoSWtTexyI2KXx3skk0OItFb50VXKB/jNTGHITaWC/Q
	YoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Yz8MXUBuX4GIaC6tFYyvlSHZJorSqHoJLCIMwwZAEN4=;
	b=GzxiXbJlL2KMMHPDJ7eNED4UP2yKyG8TulGcHZGL20sxr2EU68IDju5ijU9Uin/Z9t
	dmDwIVBwdvPASFhgARcjWUmql2B8Yj+KBdvSy9fB4ea8Jye+rThITRiMYH6Irrn5TTr+
	Pr5fNTYPjYGwug0baFkbxipUE2UQSaG7KFi8Hc9hvByTTX2QqyXqUFWBJPBkHR3AU/kO
	xL7MYMF+C+OA09KxOZ3Fbo6FcQtak/3oNLIfOdb8M+yhGqYfGfhMOOwwDT/h5KWi4n68
	XsPpbm2uFu9ZrpjBVdJwVc9S9GJgSkh5ls5hzCr1kou2ive27KrYlcSF+DmjJv9P3EBw
	N28g==
X-Gm-Message-State: AD7BkJIy4E64Zt0ePGWpo9boV0YSdgoS2Ogpxpy3RytDJ6ANtb89DNbAx5Ecf41NjSH2Uw==
X-Received: by 10.50.83.105 with SMTP id p9mr23188442igy.63.1459980257596;
	Wed, 06 Apr 2016 15:04:17 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	cy7sm2305959igc.17.2016.04.06.15.04.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 15:04:16 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 15:04:10 -0700
Message-Id: <1459980250-30874-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH] fcgi: update SRC_URI to match new path to fcgi-2.4.0.tar.gz archive
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
X-List-Received-Date: Wed, 06 Apr 2016 22:04:25 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb b/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
index ed718ae..48c5944 100644
--- a/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
+++ b/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.fastcgi.com"
 LICENSE = "OML"
 LIC_FILES_CHKSUM = "file://LICENSE.TERMS;md5=e3aacac3a647af6e7e31f181cda0a06a"
 
-SRC_URI = "http://fossies.org/linux/www/${BP}.tar.gz \
+SRC_URI = "http://fossies.org/linux/www/old/${BP}.tar.gz \
            file://Fix_EOF_not_declared_issue.patch \
            file://add_foreign_to_AM_INIT_AUTOMAKE.patch \
 "
-- 
1.9.1


