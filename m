Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id CD30D798A2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 20:22:37 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id x24-v6so104318qtx.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xA3Al0GeOIEkgqX87GX0JZ38OS3+ANWE6An1mY+FIZo=;
	b=Yuaaajfpp2M7zEE2L/xCRStoJWb1VYJOQl9M5/jHwM+ZNZGuNBmQDXPRm6V2Yuu8oF
	okd7V7jfPR6ojScG5C0lv6hqk29VQSJogh5holncq4P3ZbrrXoBevkKNrvnX5N9kl6U5
	lclYjtgSSfHUnpbFLMyjR2faJzyss+crs+etCHwx3ZXzaKWrfFlscUmp1bhRPX1tSz1f
	gaexygIBmby8LtsjNDBWBE/mk5EEpPVnV093AjLR0IaAF86b73ra3a9uWeg1zCjPDLYT
	v8MWVcF2flhnk4mImkyq41lDOyiAqW3MFyXs0vlaSZ9h613GbnvnuQlnQrdunRYeCZTv
	j5hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xA3Al0GeOIEkgqX87GX0JZ38OS3+ANWE6An1mY+FIZo=;
	b=Aq8o04qDNfIFGPn9eDtbRzQX7h1RxkVV88GjKLyelzkgvsdgQSxHd8NZDZUr9Px4h+
	ppnXPrWBOQpVB0AHefJMe28oFT35eC8pz2pcvmmP83PqrIfuwN0+f1rqyJB4NCKCoFEF
	2PaH8r6aO+/j+7Aper+ltzyV9kqHN0bwFRkUnX36PF82GVeaF8OeLHuU5N+QqKIxrUN8
	gJfN3qrw5zJkkT+gcYh8lQCMWy6pL0r++uR5NqjU2cJpx3ilMV08hWVNaJCjW/XHz7mt
	eSnqYkOBrrkQy+3Ae4TPIb4H2sbALYcpeThrkK3ZgBr54HJ2ps1cTgwksRTUqRSVVKte
	epdA==
X-Gm-Message-State: ABuFfoipa2lihFxO7J14mR3ynxPHDgt5735C2cLklp5Mvag9YvK37mKC
	sM5dwNtyYKK7yV9FG3JvFiD9hnHx
X-Google-Smtp-Source: ACcGV60NJsMQfonrNSczUnjiwx5aejCy6mpfhk8ExGuculvJukg3Z/H2CGwp3YMQan81cHsCkMvyig==
X-Received: by 2002:ac8:471a:: with SMTP id
	f26-v6mr3673977qtp.157.1539807757811; 
	Wed, 17 Oct 2018 13:22:37 -0700 (PDT)
Received: from mbedesk.Sonatest.net
	(ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca.
	[174.94.156.236]) by smtp.gmail.com with ESMTPSA id
	y20-v6sm12360009qkb.46.2018.10.17.13.22.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 13:22:36 -0700 (PDT)
From: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?=
	<maxime.roussinbelanger@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2018 16:21:16 -0400
Message-Id: <20181017202116.18146-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libeigen: update to 3.3.5
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
X-List-Received-Date: Wed, 17 Oct 2018 20:22:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../libeigen/{libeigen_3.3.4.bb => libeigen_3.3.5.bb}  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/libeigen/{libeigen_3.3.4.bb => libeigen_3.3.5.bb} (65%)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb b/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
similarity index 65%
rename from meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
rename to meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
index 31a42a9d66..b6d125272a 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.3.4.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.3.5.bb
@@ -5,15 +5,15 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "http://bitbucket.org/eigen/eigen/get/${PV}.tar.bz2;downloadfilename=${BP}.tar.bz2"
-SRC_URI[md5sum] = "a7aab9f758249b86c93221ad417fbe18"
-SRC_URI[sha256sum] = "dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6"
+SRC_URI[md5sum] = "e83549a79d1b721da0f8899ab34edf95"
+SRC_URI[sha256sum] = "7352bff3ea299e4c7d7fbe31c504f8eb9149d7e685dec5a12fbaa26379f603e2"
 
-S = "${WORKDIR}/eigen-eigen-5a0156e40feb"
+S = "${WORKDIR}/eigen-eigen-b3f3d4950030"
 
 inherit cmake
 
-FILES_${PN} = "${libdir}"
-FILES_${PN}-dev = "${includedir} ${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
+FILES_${PN} = "${includedir} ${libdir}"
+FILES_${PN}-dev = "${datadir}/eigen3/cmake ${datadir}/cmake/Modules ${datadir}/pkgconfig"
 
 # ${PN} is empty so we need to tweak -dev and -dbg package dependencies
 RDEPENDS_${PN}-dev = ""
-- 
2.19.1


