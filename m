Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id B89717589F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jul 2015 21:05:46 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so61756404pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jul 2015 14:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P6fL1oFBR+6v0LCPwUHNa1h5d/jzcew/RZdmr3MfJss=;
	b=Iw41dWAof2LOBExnNQqy5Ms6RoF70YRO1VrDxt5H1QhX7lAEODhoLyX/jv/Y/Jl8zF
	q2maa9AXM1HEhXf0nEDhiJgjhdYf56IuOtiAmekZlrKPCf76hN8T58A9aFccQ0hsK8tl
	rLL+9CShRZACLaVebtYKrCChTZRMqCYuVWc8uxU9dTvgVvh3IHCryrY2xZ77EYrlQRy+
	zZlTY5PYFWTX336DdsKmxC5dqmcYJxSGYZh8zfsAi7kZeRs86IDkJyXU2IU3+0Mp1PZE
	17XedvDPk+P6+2O89SRoPIHEgN5ByXXoxcBU2IIstWGr8al0XGbw1O0SGcjcSjmIeXd/
	BRlQ==
X-Received: by 10.70.134.133 with SMTP id pk5mr22030368pdb.133.1435957546083; 
	Fri, 03 Jul 2015 14:05:46 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id y2sm10019674pdi.80.2015.07.03.14.05.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jul 2015 14:05:44 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 96570FC41B1; Fri,  3 Jul 2015 14:05:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jul 2015 14:05:39 -0700
Message-Id: <1435957539-8099-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] apache2: fix build warning.
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
X-List-Received-Date: Fri, 03 Jul 2015 21:05:46 -0000

WARNING: QA Issue: /usr/bin/apxs_apache2-dev contained in package apache2-dev requires /usr/bin/perl, but no providers found in its RDEPENDS [file-rdeps]

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
index 0712b4a..7306e88 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.12.bb
@@ -162,3 +162,4 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/modules/.debug"
 
 RDEPENDS_${PN} += "openssl libgcc"
 RDEPENDS_${PN}-scripts += "perl ${PN}"
+RDEPENDS_${PN}-dev = "perl"
-- 
1.9.1


