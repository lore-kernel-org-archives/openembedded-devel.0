Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id DB8866B8BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 23:59:53 +0000 (UTC)
Received: by mail-pd0-f174.google.com with SMTP id r10so222123pdi.19
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 16:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aFTfEcmUiI5GUJTJCZgpkaqKQJirfcoUqc/hGLOnoEM=;
	b=SVSVKYWvACmcYymMO3vi/AZb3hEZg+eOYb8wQXcK3ZQRgdVlGh6CITu+kZdy0MKiWq
	Nnoj3bZ8l4dW76dk5+ZX64Ams5MAmRlC/RrWt1LJEcLJ85QBiju52tJeL6bxS7PwLuAU
	vfoSED5xbWVurkW0rkFKb3cLrEIkKthlv+zA71kTSuy+OE5W2spoWMFoUfqe0AnqiH3U
	B56CPi/9joGn9QYGLauOYS33conutz9dX87+wCpCnsFvLDHzoIFvk2eJxsLWgyK4079C
	RHUdpj6jX1X+g+oCkq1/OMdadhFDlbabBL50h+zbTH+64Yd7w22suesQZ06DX7TpGzOD
	fBJg==
X-Gm-Message-State: ALoCoQlywrtwj3ZYF3wE9bNG1fPevLT5DJ+3dUmZZ0Ys523FaY4csgtJnV5Il1opuzwO5ZOzaV70
X-Received: by 10.69.31.202 with SMTP id ko10mr64768531pbd.23.1401926394630;
	Wed, 04 Jun 2014 16:59:54 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	or4sm15138841pbb.17.2014.06.04.16.59.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Jun 2014 16:59:54 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 16:59:51 -0700
Message-Id: <1401926391-19770-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] V2 radvd: fix install issue for S!=B
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
X-List-Received-Date: Wed, 04 Jun 2014 23:59:59 -0000

Some files are in "S" that are needed for install.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-networking/recipes-daemons/radvd/radvd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/radvd/radvd.inc b/meta-networking/recipes-daemons/radvd/radvd.inc
index 9e19401..d8b3893 100644
--- a/meta-networking/recipes-daemons/radvd/radvd.inc
+++ b/meta-networking/recipes-daemons/radvd/radvd.inc
@@ -34,7 +34,7 @@ do_install_append () {
     install -m 0644 ${WORKDIR}/volatiles.03_radvd ${D}${sysconfdir}/default/volatiles/volatiles.03_radvd
     # Documentation
     for i in radvd.conf.example README; do \
-        install -m 0644 $i ${D}${docdir}/radvd; \
+        install -m 0644 ${S}/$i ${D}${docdir}/radvd; \
     done
 }
 
-- 
1.9.1


