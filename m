Return-Path: <kirgene@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id D4A876B3B7
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Sep 2013 11:16:05 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so1756560eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 01 Sep 2013 04:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fEu+OdCf/81TaRiy0MdiSmtwmRXSpIEmMtyLuTq86Y0=;
	b=EGG7krksxqGq7lPYkMHFQ14082oC6vtHhnLgsfSr8fbNOKK7p5jfpX8h06lN73BbIv
	/oEiQ38cHI10/iiVa2x9dDPb3YWzV+lsn19sSS0mcRruvgbpoUVDn9zTmqByw0IxDgQy
	GPXeTqjlMPKWKneE5SjeAEf5pc1gWFiXBLS9Em1mrbuL47e3px4QWX7830YMQ43+0wo6
	RqZkbJ4XybnJvjJ1JaG86W3Jc76RwdNvNYiLhIk1MYPttWv7tRBXWIUjTvukUT1BDML1
	VH92tRpd14F8KEeiMg2Aza6GQHqVlonGeHlkkzVW5RGyu+tuRZU1Q/dCZLIMU3dbRZ5f
	oyng==
X-Received: by 10.14.210.8 with SMTP id t8mr27637190eeo.39.1378034165974;
	Sun, 01 Sep 2013 04:16:05 -0700 (PDT)
Received: from ubuntu.datv.net ([194.44.193.15])
	by mx.google.com with ESMTPSA id a6sm12491712eei.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 01 Sep 2013 04:16:05 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  1 Sep 2013 14:14:47 +0300
Message-Id: <1378034087-56622-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [meta-oe][PATCH] cryptsetup: Updated to upstream version.
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
X-List-Received-Date: Sun, 01 Sep 2013 11:16:07 -0000

Also build static libraries.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 .../cryptsetup/{cryptsetup_1.6.1.bb => cryptsetup_1.6.2.bb}         | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/cryptsetup/{cryptsetup_1.6.1.bb => cryptsetup_1.6.2.bb} (87%)

diff --git a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
similarity index 87%
rename from meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
rename to meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
index 95f7e8d..6c3418a 100644
--- a/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.1.bb
+++ b/meta-oe/recipes-support/cryptsetup/cryptsetup_1.6.2.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=32107dd283b1dfeb66c9b3e6be312326"
 DEPENDS = "util-linux lvm2 popt libgcrypt"
 
 SRC_URI = "http://cryptsetup.googlecode.com/files/cryptsetup-${PV}.tar.bz2"
-SRC_URI[md5sum] = "f374d11e3b0e7ca0f805756fd02e34ff"
-SRC_URI[sha256sum] = "baf36e663c03eb6440482d91c486d61ed47ce5c9268ad04c18ca09082755149c"
+SRC_URI[md5sum] = "cd834da49fbe92dd66df02cc5c61280f"
+SRC_URI[sha256sum] = "15723f0198303d4bcb99d480b7a773918e2d319f0348457988c063bdd03e109a"
 
 inherit autotools gettext
 
@@ -29,3 +29,5 @@ RRECOMMENDS_${PN} = "kernel-module-aes-generic \
                      kernel-module-cbc \
                      kernel-module-sha256-generic \
 "
+
+EXTRA_OECONF = "--enable-static"
-- 
1.8.1.2


