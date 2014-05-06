Return-Path: <gizero@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5869665FB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 06:32:58 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c13so292324eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 23:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6nZF4pMjRHSJKIBkV4uAG6uoHMvgd5PMpia3OqmSiVg=;
	b=TF/Vu4cdVdzpJBBM4OtQprL9Sdyfia9zIL7O3oCdqJLOAKobOloLqLkI/gZ2h5802T
	2JzsOkztaCWXW5YIi7Cs6nqYMyufRW8g3lnBxmn0vFGO8Q5rnOq2cjEkQvG+Ejg1Fj88
	R9/tc+fVSZh1MRUaOOPwuYhXkfjNOPrRM6Q1IqfZqnfJvOcjvqvK5zoKhZYXkdRG6Ppi
	sesaEKvQMyHaWrg2Xw336mYpgTn0HwmlEpTR06zHxJZTyvo5KGUJVvFf8xcBzYBAfqGG
	rptyxAO4b8VUUuh4Nh6CY5eLb7f5XdkJSNtNqJZip1ukoVlORsSPCJET1+moqOrM5gS0
	6pIQ==
X-Received: by 10.14.37.134 with SMTP id y6mr4502361eea.32.1399357979335;
	Mon, 05 May 2014 23:32:59 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host168-65-static.12-87-b.business.telecomitalia.it. [87.12.65.168])
	by mx.google.com with ESMTPSA id w1sm35738713eel.16.2014.05.05.23.32.57
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 05 May 2014 23:32:58 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 May 2014 08:32:44 +0200
Message-Id: <1399357964-15638-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH] libconfig: inherit from autotools-brokensep
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
X-List-Received-Date: Tue, 06 May 2014 06:33:02 -0000

do_compile fails otherwise

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 .../recipes-extended/libconfig/libconfig_1.4.9.bb  |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
index c7d3cf7..22eecf8 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.4.9.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=fad9b3332be894bab9bc501572864b29"
 
 SRC_URI = "http://www.hyperrealm.com/${BPN}/${BP}.tar.gz"
 
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
 
 SRC_URI[md5sum] = "b6ee0ce2b3ef844bad7cac2803a90634"
 SRC_URI[sha256sum] = "09c8979252e60193e2969e9b0e1cd597f7820087867989b2f0939ad164473041"
-- 
1.7.9.5


