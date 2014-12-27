Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4384372641
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:23 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id ey11so14844052pad.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Y8S+19Dy1OdNEqxOIAc+9WgQywjjgnbqty456O7LppY=;
	b=DqgZ6e+YFM2Otm69bCgeBwB7Mm/BLVn4m9BZRwbyYHzwj857AZ6jioc9+/nRX3jYiJ
	yiddotYaj2mTMZsiI3tnHXXw4ckGQ1GAJfbHD1ZXV8EX9igGcwRNY1pFpjNJ0jlDINFB
	fU0Envcicl0RJKhv4ScMXJI12sKa1+JF/42piS+npdIeOqFmuRicLUmPCBYwYtZjBVZf
	0t2M45sv3L7ohiIHY0Bydas5e5f/FJb9or8J+mpNE327/EbHWUxnnKKrOP1f1GgZzhv6
	ciRjpupdp1XT0ZZZ2S/RB5D2UGgTHZjaaE+T3fF6FNw/Yr29xNxLMhOEYeIT4XoXlSYI
	Xqkg==
X-Received: by 10.68.201.201 with SMTP id kc9mr77656531pbc.79.1419700944777;
	Sat, 27 Dec 2014 09:22:24 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:53 -0800
Message-Id: <4534f363651b332e611f1f3cd170e0e9379cfb52.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 06/27] dfu-util: Point to gitorious.org repository as gnumonks.org is down
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:24 -0000

From: Chris Morgan <chmorgan@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Chris Morgan <chmorgan@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
index aa2b84d..7f06f8f 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -4,13 +4,16 @@ AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
+S = "${WORKDIR}/git"
+
+SRC_URI = "git://gitorious.org/dfu-util/dfu-util.git \
     file://0001-configure.ac-Don-t-check-for-usbpath.patch \
 "
+SRCREV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
 
 inherit autotools pkgconfig
 
 DEPENDS = "libusb1"
 
-SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
-SRC_URI[sha256sum] = "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
+SRC_URI[md5sum] = "1de724551604bce1962960b7a301cc08"
+SRC_URI[sha256sum] = "5d253f924fd29bc13054b664bba9aa86b865299971195969478253c1775b7e56"
-- 
1.9.1


