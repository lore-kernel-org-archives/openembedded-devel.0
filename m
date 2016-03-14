Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 952E970178
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 10:32:27 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id x1so232581328lbj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Mar 2016 03:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xQC19gdp0aR1YERBrM7zwaJ2q4PkDKjV4Pt7AWr9UrQ=;
	b=dKH17I2iXO2AFu0DBSIiuMkchjttNiCqdQ6GvniRLb4io+ldlISRIvze8AcWCOWxqu
	34PJKJtJM6i+9n52MXq53lJF8OZsoYQxyxmMJ/cn1o5iLznRFQyp5wJ7dQegcYmsm795
	l08mpiQnk4EM747rR/WtiAYsbjRNu0/TUOSENlwd9gbZBs7fN/DwrirdAp+Gz/Ew486v
	A/KFnb6dyrClUgeF7R9JOVfxt65nKqi639yHGCuRtrQcMeCMb1e0vCByFpQhW6qh1f85
	jgmKdgc4sU74Nkp6r25m76jnuzGsTN22XP+5M3p+3Xc+1udTervOSrlvkqKDgAm2b+S6
	dt4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xQC19gdp0aR1YERBrM7zwaJ2q4PkDKjV4Pt7AWr9UrQ=;
	b=DYa4Mj0R0cDJvX/srnx+oLsX3PG+VUtlh2uYvYYRF1pNx/pEcMvsuqzlG29I4DZHA7
	dy5t9+twvw3ITVSj1BDFYD7u60E+h2t+1H68cNqwXm7r7kUz2Rlk7NweAaGL+m/LYeCh
	VCnV/hZv6p/70Vzxrv5nNrfFtwsHcrcpHOcvMG8gIaRrRCWsKxfKasHJhvsvOOUxcI49
	u5OnYWKk31Zfp00NCIH2erLs1vO39hfkSY8dwqqPfBfRgJiiZ4f7Q32zbF7+D0fgDvZg
	rdfOMuHwwviDhIWZTNCEGezVEqHZvGSTeaF2NYXjPwIJc0yC3zRKtB8kXBJLylnL22zi
	8Anw==
X-Gm-Message-State: AD7BkJJ84/mTZX6cWhirqys6cK9XTppeHLKdWpezvhMp4fEao7Bi5R9WsylBI8hMVs4xhg==
X-Received: by 10.112.168.194 with SMTP id zy2mr7592477lbb.102.1457951546979; 
	Mon, 14 Mar 2016 03:32:26 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	h134sm3561944lfh.3.2016.03.14.03.32.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Mar 2016 03:32:25 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>, Andre McCurdy <armccurdy@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>,
	openembedded-devel@lists.openembedded.org
Date: Mon, 14 Mar 2016 11:32:21 +0100
Message-Id: <1457951544-23279-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [meta-oe][PATCH 1/4] opencv_3: Fix use before set error on meta package
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
X-List-Received-Date: Mon, 14 Mar 2016 10:32:28 -0000

This bug was introducing a loop dependency of opencv->opencv that was
confusing dpkg.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.0.bb b/meta-oe/recipes-support/opencv/opencv_3.0.bb
index 99ca8b35727d..f6c4ca8fac16 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.0.bb
@@ -86,8 +86,8 @@ python populate_packages_prepend () {
             metapkg_rdepends.append(pkg)
     d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
-    blacklist = [ metapkg ]
     metapkg =  pn
+    blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') :
-- 
2.7.0


