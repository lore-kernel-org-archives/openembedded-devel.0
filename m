Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0C2D173211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 12:56:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id f206so23337735wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 04:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jnRshmMZsRUfc6FGP5uxnbCihEH8c8feX22HXuETFs8=;
	b=U4djHMVPVsE/ncuZ+OWLj8rHSOH5Kwd2lIQJjX74O/fSnwE8eV9NZQeaeUlkqkF61X
	QgvUrQH2LJ5BYF/HSd9HLYhFfrUaVAo7sMk8/jrPUz+b+EFgyuDNv3p3DfXcM2vLE3te
	l7Q0dGIx7jVU4qdcuNQjJ5XrJ9bduuN4WeMKRk/u1e7hucjxLpNPgFBaWRMhyh6YF6nt
	TvznsTXecgOVcQklCq1HqkMCltWFOu0JzJo6H5+7uspmdUpVTlQobf+MkB/6HCPt0soC
	Aq8rA7VJB7Mt6qRSbPM1iyaznich1/OoPy+I5GrY+gfHaMuI672j7B9nKbnpkEduPJzf
	wjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jnRshmMZsRUfc6FGP5uxnbCihEH8c8feX22HXuETFs8=;
	b=ATXe0t4ZmFWULyc14cNRK0LT2TjasPMMOSg2QwMB2EQHZaJ/XbTOW4pW7nRa4vUW4Y
	REWBnGXEZSqjIWms4+sFRnKns32FFWhMh3RND/ZnXFvJ2UVVByh/7QoYB0Iq9h0wzT1s
	cpPQ0XxMFMf/g2CBTpwJCccRipO6xVn5XuWyirT4Eky2jdRMjsjnaBqH5rUjRk8UWHKz
	XhiFux0+Qvz1N0xuW6+87rnsXf5PU//3J9G4YdjfFdrV+bDubr9Bqw7qrSLBMn5UYvam
	SDDNqDiGoW2750PubIrv6muZcoIX7TkNiXXdENdkWX6L1qL1S+WoAPY+AgG+Z4g3xPea
	LpJA==
X-Gm-Message-State: ALoCoQmrWsh1S5w/LVNr+vBmnUcWG6s/tHirHXavKSFR5hgOHwfMC5mDVwLotlFjniIpwxz4FPQuHQuv48GtS9QZUQm+H4q21Q==
X-Received: by 10.194.120.226 with SMTP id lf2mr9677676wjb.108.1452862585632; 
	Fri, 15 Jan 2016 04:56:25 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u191sm2446630wmd.4.2016.01.15.04.56.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jan 2016 04:56:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jan 2016 13:57:20 +0100
Message-Id: <1452862640-13133-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][meta-oe] terminus-font: update perl-native-runtime dependency
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
X-List-Received-Date: Fri, 15 Jan 2016 12:56:26 -0000

* it was renamed in oe-core with:
  commit f4dade8e765a8c7bfd131728b9e0a34631e24950
  Author: Ed Bartosh <ed.bartosh@linux.intel.com>
  Date:   Thu Jan 7 13:39:39 2016 +0200

    meta: rename perl-native-runtime

    The code in native.bbclass adds -native suffix to the package
    names that don't have it. perl-native-runtime becomes
    perl-native-runtime-native because of this.

    Renamed perl-native-runtime -> hostperl-runtime-native to avoid
    mangling it and to conform with the naming convetion for native
    packages.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index a6bef10..337cde4 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -8,7 +8,7 @@ SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9cadb26f4c5c005618c5ae74f041ec54"
 
-DEPENDS = "perl-native-runtime gzip-native"
+DEPENDS = "hostperl-runtime-native gzip-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
-- 
2.7.0


