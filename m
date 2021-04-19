Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web09.5768.1618818868488555668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Apr 2021 00:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.kozemcak@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 13J7sPsU017017
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Apr 2021 09:54:26 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.50])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 13J7sPHP017544;
	Mon, 19 Apr 2021 09:54:25 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 38B24304E690;
	Mon, 19 Apr 2021 09:54:25 +0200 (CEST)
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][PATCH 0/1] proftpd update
Date: Mon, 19 Apr 2021 09:52:50 +0200
Message-Id: <20210419075251.21268-1-andrej.kozemcak@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I would like to apply this update also to dunfell branch, if posible.
Because there is lot of bugs which is not a posible fix with the easy
way.

Andrej Kozemcak (1):
  proftpd: Update to 1.3.7a release

 .../proftpd/files/build_fixup.patch           | 69 ++++++++-----------
 .../proftpd/files/contrib.patch               | 29 ++++----
 .../{proftpd_1.3.6.bb => proftpd_1.3.7a.bb}   | 12 ++--
 3 files changed, 47 insertions(+), 63 deletions(-)
 rename meta-networking/recipes-daemons/proftpd/{proftpd_1.3.6.bb => proftpd_1.3.7a.bb} (93%)

-- 
2.20.1

