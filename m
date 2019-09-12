Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail.openembedded.org (Postfix) with ESMTP id A75B57E58B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 22:54:01 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id u3so5537914lfl.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=5nm5ZrPmeuIlw7NqTGBG+t7kUAorgmr7GfmZgUrC7qA=;
	b=imlEYkF+q/qALWs+GGwKAogz2v2CFCKzuMc1J6ky1k2n0LP/UgS/MG+luOSKL7BQqN
	VWLdXgr3CG/ZRDrEZAEErcFqK88O0o6z6Pf7OXp+bnLbfyb6gmLlQc9AXhYtaWbNU4uN
	HDkGzYzbaEFfI5t8AT0/vEm5wLogwxKmjLRUbjNTYzFSEt8ba5gchyjSBi/T6YfRLooX
	CZHnq4ixp6K+m9hL7atnBe7ZxzKE2t413kL9Oj6G4w/thqp+yfEFxbf/68IMoy1LJzVw
	KXUUdEY+2BKjBeVl4YChixdYQ8zwTghFwo1sRtAztXZvUDfgybWC9NDrHAoo+IzghVZ4
	ac8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5nm5ZrPmeuIlw7NqTGBG+t7kUAorgmr7GfmZgUrC7qA=;
	b=DES3dW5ylHG+RzdQJcW1M1mZXRUc1Qi7zmR/t626Gg76r1wXiaMiAoRljDXY4+LVt1
	gtitG3NCq18tK6Q+1w14vS7RKw5fwo/D6S2m4lB7eRoAXrGA7KJWdc8VQMGwSH3/QHxY
	2f/PO1n4xaEUzc9V4AqIWv9J+p7yhg/i8GStXCztSDqA+zkrc65T9BmDB8JQ1KoG/9bq
	hkOuVKjlbyP83ZTxGBOjUVVOt18VjmLyt3OwY+f0Ydwon+jtHRfQnl/zZSlyBUaFkqvH
	zbvgMUWoziEAfA84tvH+blrfZMTTyQJKXPf1wqzdzy2BL10XQkQ+FMDqLqTpAUO+ffgp
	EYgQ==
X-Gm-Message-State: APjAAAUWa+6SB1E/aXJrAGzHy/jJi+D7IO0CkM3aJwt0zDtE6+BnfCBN
	GWXb3zcULE0aRQtjhRKJ8sS/+S3visA=
X-Google-Smtp-Source: APXvYqzxpHfOoorSEPPyd0RKLEin3gPt53x1SnJZbMVjzc1Iv+o0xZXYTPz94rB6xEJHSdgfSV3F1Q==
X-Received: by 2002:a05:6512:304:: with SMTP id
	t4mr30053319lfp.15.1568328842073; 
	Thu, 12 Sep 2019 15:54:02 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115]) by smtp.gmail.com with ESMTPSA id
	w77sm6587977lff.49.2019.09.12.15.54.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 15:54:01 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Sep 2019 00:53:58 +0200
Message-Id: <20190912225358.24258-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] xorg-sgml-doctools: update to 1.11
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
X-List-Received-Date: Thu, 12 Sep 2019 22:54:02 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{xorg-sgml-doctools_1.7.bb => xorg-sgml-doctools_1.11.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-doc/{xorg-sgml-doctools_1.7.bb => xorg-sgml-doctools_1.11.bb} (58%)

diff --git a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.11.bb
similarity index 58%
rename from meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
rename to meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.11.bb
index 80f1f008b..85687611e 100644
--- a/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.7.bb
+++ b/meta-oe/recipes-graphics/xorg-doc/xorg-sgml-doctools_1.11.bb
@@ -6,7 +6,7 @@ DEPENDS += "util-macros"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=c8c6c808cd3c797a07b24e443af1c449"
 
-SRC_URI[md5sum] = "2588efb3f49f7fc6ecf41ce42e0b2e5e"
-SRC_URI[sha256sum] = "84fd94e5c50556e6f77501485f8a48724cf3c95c6d58480bc280258ba14580c8"
+SRC_URI[md5sum] = "ee6dc0a8a693a908857af328b2462661"
+SRC_URI[sha256sum] = "e71ce1df82dcc51eb14be6f42171dcc6bdd11ef46c0c605d6da8af12bd73b74c"
 
 FILES_${PN} += " /usr/share/sgml/X11"
-- 
2.17.1


