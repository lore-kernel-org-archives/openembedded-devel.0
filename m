Received: from esa4.mentor.iphmx.com (esa4.mentor.iphmx.com [68.232.137.252])
 by mx.groups.io with SMTP id smtpd.web11.1540.1617092031312229556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 01:13:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.137.252, mailfrom: awais_belal@mentor.com)
IronPort-SDR: VJk9jLhg46/mbmphBH6GG3ZxQ0FMaTd9BfgrWrehL7j3tkDPbhkUGp7Vmf6+OD59MjKTwGdZSt
 nwF+nvoKgX7TxPWVagzZvRqCd9+3OoxaFZedM93RBnjC4Zs+br3+nIbG71Ox8o0FprATCDgUzO
 pDE41d+yaxsuBzjO1sR6MbabE1SscSuTUO6V8DeJ+y8TnrmNc1rC1uM7W9QhgP3WqVmoru4X01
 5SccTHicnO2kRe4j3tgojeJxhDFO6s65ZpjSbDfsaJlBvCRhoTyF1GdnkTwD0S97DOlUMA0JMv
 wfo=
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="59748147"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 30 Mar 2021 00:13:49 -0800
IronPort-SDR: kipGMENouSgU780qlRXi0PuMxO8M04qBKj+RafNGpInE+waApqO/8HrM0o/P+Lb3+/YmKXrFb0
 1qyFUnlor9FGY6nwerF2RjmiBtylFtf7LKaot2SbSfLrmEsMHkI6OaTEqid7PIKaBVlF/TABcG
 9tScBcebJM9m73BJ52ZNUtj8WCOaVuWujfOFd+Ordbh2qAFuFpr2I0zC4aCD5H5DaPgBO+ETg4
 VqTqOtOnW8ipQKAeCEbU+WTpVaDpLFpYad700EmfzArP0+Hbuig1SY/txgygXqK8rTrZo6m1tc
 b/k=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-perl][PATCH] libnet-ssleay-perl: add rdep on perl-module-autoloader
Date: Tue, 30 Mar 2021 13:13:27 +0500
Message-ID: <20210330081327.2667-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

Without the autoloader module, doing a Net::SSLeay fails.
The Net::SSLeay package also does an

use AutoLoader;
Ref: https://github.com/rurban/Net-SSLeay/blob/master/lib/Net/SSLeay.pm#L26

so this is evident.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
index 50ab5af3a..93a0687b2 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb
@@ -19,6 +19,7 @@ RDEPENDS_${PN} += "\
     perl-module-extutils-makemaker \
     perl-module-mime-base64 \
     perl-module-socket \
+    perl-module-autoloader \
     zlib \
 "
 
-- 
2.17.1

