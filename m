Received: from mail-pb0-f54.google.com ([209.85.160.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UDcxi-0001PX-Ne
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:42:35 +0100
Received: by mail-pb0-f54.google.com with SMTP id rr4so446317pbb.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Ha23vtZzXipAMI+BIYWlbKt+6VknP5gyi5t07GTv30Y=;
	b=z+t9NhOKcWYMIFRiurx3Lx2v2kHKKO5t9csw9RtcUsrrBmi7NtxfxNR3HBZjZEVcFe
	mITPcpe1cVTSY3wG2AkiPKZ8G7hn7ez5CHdkkJjSuLjt7z0YIOT5C3j20fl3MvOrMfqf
	ZtFxZQRzTKqX8qae8Gt9tGUldjk20MRxmx/mnCr7P4KdcOTuPupAKQOnHB/FZGR7kebo
	07djnG6fo9CAUhuM9ap/0IpNhQqilmVq6+NxCQuD+ZCSW5jfXqM9HA7yywNiV0ndNh08
	Ztw9zX7R6+QvlXJzhtR1XmK+z757O6E7RbpTnkx6yGorDQqCpgg542Vmg5CITj0CrX2X
	dpXA==
X-Received: by 10.68.234.100 with SMTP id ud4mr53213871pbc.8.1362669957849;
	Thu, 07 Mar 2013 07:25:57 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ag10sm2578299pac.4.2013.03.07.07.25.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:25:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2013 16:25:51 +0100
Message-Id: <1362669951-22508-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-oe][PATCH] krb5: Fix .debug packaging warning after debug striping was fixed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2013 15:42:42 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index 1edf6bb..d71339a 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -7,7 +7,7 @@ DEPENDS = "ncurses util-linux e2fsprogs e2fsprogs-native"
 
 inherit autotools binconfig perlnative
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar"
 SRC_URI[md5sum] = "1a13c53899806c4da99a798a04d25545"
@@ -25,6 +25,7 @@ LDFLAGS_append += "-lpthread"
 
 FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN} += "${datadir}/gnats"
+FILES_${PN}-dbg += "${libdir}/krb/plugins/*/.debug"
 
 krb5_do_unpack() {
     # ${P}-signed.tar contains ${P}.tar.gz.asc and ${P}.tar.gz
-- 
1.8.1.5



