Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1B8E67732A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 15:35:09 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g62so32981509wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Feb 2016 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=obUJOezEHiSm46rJ9+oZS2CMiGXW/EyCPpYRJnc6E58=;
	b=xNZLkqpBPuxqrY4+xuVWaficL9K2ZB/8bZUre1KXxaGP19tH700jRBnf/APfujitBB
	O1DyQ3P1wz9IoVAwbKyiL833pcotXr/sgmJ2wbO5e2/9nPJSriZbWhDhrpzLo7i0bPL1
	vo0MTekg7psGi/RLJYHDIBCJzifP43PYNCkkxFp8Jk5Tqq+8rDT1YkJ5JF8s9at76nPD
	mKgogRn3pIeQiosqQ9ZGe7xdhWSxHLXR/E6a04UzuPbXQid1bXnUW7OxSvcl3gNF279O
	+mGCizJr2vYVgONA4/YRZAQz0nD48D3nroiLnTHkDfALfpDPhddqoNvMlBz7huDibTqj
	8AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=obUJOezEHiSm46rJ9+oZS2CMiGXW/EyCPpYRJnc6E58=;
	b=Dh+6vq5T+lFezDjDsM9vXikjCot+tFtUivmi7I8/Ioc+CdfH7yhrNAryUGk24QKcae
	tQs9useAV/60pEZCIULKUfmdj+emJvZQlffHWAsjUiExaQptZOKnngFqrTI2vt1TyYh3
	SyFGoD2Q178McZfwg9zKJ+NpsO17W6yQqiVvvAlG17d8WUx8k5FruQ4Bdi29+1og/tF2
	PYu4P1RJPxcZWiZNPFgmkFrWD0ZD4E1Y7/4fwXAqQ0POp4kpBNOgZ0LQm0Ha0sNAjP8H
	wKs/pCVRnV55Bi09fRahih8sU4Xt1EcFgxli6x3pWQRpkwxd+VHQXtfoES8Wozahl/cW
	v9VQ==
X-Gm-Message-State: AG10YOS/G4AHg4BHqR+Qd47K0F/4fzbOcnj7MKjwFaFZkHS/cLg/9mNanli1viQ7CWaWYQ==
X-Received: by 10.28.9.19 with SMTP id 19mr4394438wmj.87.1456414509721;
	Thu, 25 Feb 2016 07:35:09 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	n131sm3740007wmf.9.2016.02.25.07.35.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Feb 2016 07:35:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Feb 2016 16:34:35 +0100
Message-Id: <1456414475-31462-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456414475-31462-1-git-send-email-Martin.Jansa@gmail.com>
References: <CALbNGRS8r8+dO9SVWoK88DrDwzxkLJ-tANBAx3fZiznwjjqT-g@mail.gmail.com>
	<1456414475-31462-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/2] geis: add missing dependency on virtual/libx11 libxext libxi libxcb dbus frame
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
X-List-Received-Date: Thu, 25 Feb 2016 15:35:12 -0000

* all these are checked by configure.ac with PKG_CHECK_MODULES
* add x11 to required DISTRO_FEATURES

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
index 9403bdf..bc88143 100644
--- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
+++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
@@ -13,9 +13,11 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.GPL;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
 "
 
-inherit autotools pkgconfig python3native lib_package
+inherit autotools pkgconfig python3native lib_package distro_features_check
 
-DEPENDS += "grail dbus-glib python3"
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS += "grail dbus-glib python3 virtual/libx11 libxext libxi libxcb dbus frame"
 
 SRC_URI = "https://launchpad.net/${BPN}/trunk/${PV}/+download/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "2ff9d76a3ea5794516bb02c9d1924faf"
-- 
2.7.1


