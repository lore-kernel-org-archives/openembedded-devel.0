Return-Path: <chmorgan@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id A46AA65CED
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 18:46:43 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id j7so5854749qaq.30
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 10:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=w22icaka0KjVaYxuIIEYLSHVvLi4i30OPMEQ8g7hV00=;
	b=jlDIoUprfsfhm5kLJHQG9WTFVE3ULmDqx7C1WzhHKJoWcxIwij5lDbRNK4vhbRSuG3
	cLlhJkxdC+0euZ91SFhbrBDwk9EA9PwulVOTxkgLGopQ/n87IPMU60m4LB1qkgKaWGyI
	T87NmZiTeKlfCfVNoNCKnQ2AJJs3xYx/mlvorTfSDcdIQ8hmAo4TbngGQ9bNJib8n8lD
	/wjAslBM/3n7ObCHYdRyciXMkmn3RIBFm7k/oxbzX1qLzFW988N8dHrTVXzcpjbdrMON
	3XUoS7xXRi4g2v8YWdHx5j64yQzSmvr6t2fj4tySbFdug1lgYOFX0EV56MHfs/WaXEAB
	/7ZA==
X-Received: by 10.229.104.3 with SMTP id m3mr46231071qco.0.1415645202463;
	Mon, 10 Nov 2014 10:46:42 -0800 (PST)
Received: from localhost.localdomain
	(static-96-237-165-28.bstnma.fios.verizon.net. [96.237.165.28])
	by mx.google.com with ESMTPSA id
	u14sm16201910qag.32.2014.11.10.10.46.41 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Nov 2014 10:46:41 -0800 (PST)
From: Chris Morgan <chmorgan@gmail.com>
X-Google-Original-From: Chris Morgan <cmorgan@cybexintl.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Nov 2014 13:46:33 -0500
Message-Id: <1415645193-14565-1-git-send-email-cmorgan@cybexintl.com>
X-Mailer: git-send-email 1.9.3
Cc: Chris Morgan <cmorgan@cybexintl.com>
Subject: [meta-oe][PATCH] dfu-util: Point to gitorious.org repository as gnumonks.org is down
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
X-List-Received-Date: Mon, 10 Nov 2014 18:46:49 -0000

---
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
index aa2b84d..c706fd1 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -4,7 +4,10 @@ AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-SRC_URI = "http://${BPN}.gnumonks.org/releases/${BP}.tar.gz \
+S = "${WORKDIR}/${BPN}-${BPN}"
+
+REV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
+SRC_URI = "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \
     file://0001-configure.ac-Don-t-check-for-usbpath.patch \
 "
 
@@ -12,5 +15,5 @@ inherit autotools pkgconfig
 
 DEPENDS = "libusb1"
 
-SRC_URI[md5sum] = "56844020177d4db4c1ea2e926fe9d588"
-SRC_URI[sha256sum] = "f52a2a5489fbf9f3204a6ada05e0b47ee322e19d81c712e0c58a332d80ec3eab"
+SRC_URI[md5sum] = "1de724551604bce1962960b7a301cc08"
+SRC_URI[sha256sum] = "5d253f924fd29bc13054b664bba9aa86b865299971195969478253c1775b7e56"
-- 
1.9.3


