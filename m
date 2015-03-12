Return-Path: <ronan.lemartret@gmail.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB2173949
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 10:56:56 +0000 (UTC)
Received: by wesk11 with SMTP id k11so15411527wes.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ZVDLDaCAbsLQ5q+ZaGGtDmQ+rNItc1oFi5sz88OJlgQ=;
	b=Jgd3sJ5tDX4xxOzCk+rU1XeR6RM2on2Gn+qEFQjIZtHTufptNhJIdh2H1lzyJ2mxdy
	mGff8SZrb9K6xIM0bDdqXWH+8ngVu9K0ReiF+0K6p96bngl5QGe70S1hFKIQDCMppDr1
	vZiI9bKT0AEGxUwRdLL+6L4DDpJEOnriItbQ9P3oOyJG7OW4dhZNs/nXXmAkqDmbqOzL
	4QmCC5XeuGEStB5fH5doFZoYJUgyj3XqtbQyOyjZVYDmr1Ri2SUgxj+Uu59Z/LuYsxgz
	B9nQJsERWC34SBpzYTgaHm/LjPbtWr14G1yHOtqDTeSynu5eFGyBhPbF65xLzN60mUHG
	39Lw==
X-Received: by 10.194.93.165 with SMTP id cv5mr4464607wjb.24.1426157817985;
	Thu, 12 Mar 2015 03:56:57 -0700 (PDT)
Received: from eurogiciel-EURO-LINUX-V1.eurogiciel.fr
	(130.167.26.109.rev.sfr.net. [109.26.167.130])
	by mx.google.com with ESMTPSA id
	fo8sm10137968wib.14.2015.03.12.03.56.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Mar 2015 03:56:57 -0700 (PDT)
From: Ronan <ronan.lemartret@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Mar 2015 11:56:01 +0100
Message-Id: <1426157761-31744-1-git-send-email-ronan.lemartret@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] add libgcrypt-native to avoid host corruption
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
X-List-Received-Date: Thu, 12 Mar 2015 10:56:57 -0000

Signed-off-by: Ronan <ronan.lemartret@gmail.com>
---
 meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
index e3c833b..5c4c6b1 100644
--- a/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
+++ b/meta-oe/recipes-support/libmicrohttpd/libmicrohttpd_0.9.34.bb
@@ -3,7 +3,10 @@ HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
 LICENSE = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9331186f4f80db7da0e724bdd6554ee5"
 SECTION = "net"
-DEPENDS = "libgcrypt gnutls file"
+DEPENDS = "gnutls file"
+
+#libmicrohttpd uses the tool libgcrypt-config, so we need libgcrypt-native
+DEPENDS_append = " libgcrypt libgcrypt-native"
 
 SRC_URI = "http://ftp.gnu.org/gnu/libmicrohttpd/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "2947eee13c2c8affb95023a0cb6fda0c"
-- 
1.9.1


