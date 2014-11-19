Return-Path: <chmorgan@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id E53FE6AC93
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 18:14:03 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q108so864566qgd.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Nov 2014 10:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=12CAp4b/sFjKg5sT6qPK7cZnqlOVNVqqM38pL7AhZss=;
	b=ded8Sx4q28zczZqPeMZ3jX8YVB0kxFSMC6CMSXiHpc2IMLi6uY0XfqsuPhF7H6YUJt
	85fzO/4mXE96ufhJ6WK8hwg9K20Dv1ZdZ5r7mnVCoVxvovRUfG/WY4jAKf2DfUaXfiR4
	tJTPQ4yaykFW6Pl+a9lybXj5l5yRX/9ieXd7NgCwKJ+oLBQ14aggwjilnqp4xgSjfCkN
	uD7oBXCUHfFG5JAZkUUwbHESfQhLN7UDHi5lPabU13mRwoFrmKkDVz0vB5PUfQYr2Cr/
	fmQIRddRz763D6huFRrZ9uWMSCcQ1/NdXDRgwpY0RcWv+PAE4hrxYfwv69P4IoEVlVOK
	HyVw==
X-Received: by 10.140.28.101 with SMTP id 92mr4617249qgy.53.1416420843728;
	Wed, 19 Nov 2014 10:14:03 -0800 (PST)
Received: from localhost.localdomain
	(static-96-237-165-28.bstnma.fios.verizon.net. [96.237.165.28])
	by mx.google.com with ESMTPSA id i45sm2157153qge.8.2014.11.19.10.14.02
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 10:14:03 -0800 (PST)
From: Chris Morgan <chmorgan@gmail.com>
X-Google-Original-From: Chris Morgan <cmorgan@cybexintl.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 19 Nov 2014 13:14:00 -0500
Message-Id: <1416420840-2194-1-git-send-email-cmorgan@cybexintl.com>
X-Mailer: git-send-email 1.9.3
Cc: Chris Morgan <cmorgan@cybexintl.com>
Subject: [meta-oe]]PATCH] dfu-util: Switch from using a gitorious generated download to using the git repository to avoid potential checksum mismatches if the generated download changes
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
X-List-Received-Date: Wed, 19 Nov 2014 18:14:06 -0000

---
 meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
index c706fd1..7f06f8f 100644
--- a/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
+++ b/meta-oe/recipes-support/dfu-util/dfu-util_0.7.bb
@@ -4,12 +4,12 @@ AUTHOR = "Harald Welte <laforge@openmoko.org>"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-S = "${WORKDIR}/${BPN}-${BPN}"
+S = "${WORKDIR}/git"
 
-REV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
-SRC_URI = "https://gitorious.org/${BPN}/${BPN}/archive/${REV}.tar.gz \
+SRC_URI = "git://gitorious.org/dfu-util/dfu-util.git \
     file://0001-configure.ac-Don-t-check-for-usbpath.patch \
 "
+SRCREV="a0a3668e0571a9b007f7d62b01e7dcfd7754ce50"
 
 inherit autotools pkgconfig
 
-- 
1.9.3


