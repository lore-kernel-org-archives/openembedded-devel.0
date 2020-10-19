Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web10.10582.1603103338836603626
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 03:28:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.valek@siemens.com)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09JASth9000744
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 12:28:56 +0200
Received: from dev.vm6.ccp.siemens.com ([167.87.137.119])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id 09JASsAA001383;
	Mon, 19 Oct 2020 12:28:54 +0200
Received: from mail2.siemens.de (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id CE92F950AAA;
	Mon, 19 Oct 2020 12:28:51 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: andrej.kozemcak@siemens.com, Andrej Valek <andrej.valek@siemens.com>
Subject: [oe][meta-oe][PATCH 0/2] NSS and NSPR upgrade
Date: Mon, 19 Oct 2020 12:25:57 +0200
Message-Id: <20201019102559.19491-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

nss: upgrade 3.56 -> 3.57
nspr: upgrade 4.26 -> 4.29

Andrej Kozemcak (2):
  nss: upgrade 3.56 -> 3.57
  nspr: upgrade 4.26 -> 4.29

 .../nspr/{nspr_4.26.bb => nspr_4.29.bb}            |  4 +-
 ...a-configure-option-to-disable-ARM-HW-cryp.patch | 36 +++++++++++------
 ...01-pkix-Do-not-use-NULL-where-0-is-needed.patch | 46 ----------------------
 .../nss/{nss_3.56.bb => nss_3.57.bb}               |  3 +-
 4 files changed, 26 insertions(+), 63 deletions(-)
 rename meta-oe/recipes-support/nspr/{nspr_4.26.bb => nspr_4.29.bb} (97%)
 delete mode 100644 meta-oe/recipes-support/nss/nss/0001-pkix-Do-not-use-NULL-where-0-is-needed.patch
 rename meta-oe/recipes-support/nss/{nss_3.56.bb => nss_3.57.bb} (98%)

-- 
2.11.0

