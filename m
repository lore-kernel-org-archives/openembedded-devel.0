Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
 by mx.groups.io with SMTP id smtpd.web08.631.1628603821918864302
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 06:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.28, mailfrom: andrej.valek@siemens.com)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 17ADuw0Q009053
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Aug 2021 15:56:59 +0200
Received: from dev.vm6.ccp.siemens.com ([144.145.220.58])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id 17ADuwno017723;
	Tue, 10 Aug 2021 15:56:58 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id D2A9F950A87;
	Tue, 10 Aug 2021 15:56:57 +0200 (CEST)
From: "Andrej Valek" <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: sakoman@gmail.com, Andrej Valek <andrej.valek@siemens.com>
Subject: [dunfell][meta-oe][PATCH 0/2] thrift upgrade
Date: Tue, 10 Aug 2021 15:55:53 +0200
Message-Id: <20210810135555.12946-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0

Upgrade thrift to version 0.14.2 due to remote security
vulnerability.

Andrej Valek (2):
  thrift: drop unsupported features
  thrift: upgrade to 0.14.2

 ...llationPaths.cmake-Define-libdir-in-terms.patch |  8 +++----
 .../thrift/{thrift_0.13.0.bb => thrift_0.14.2.bb}  | 26 ++++++++++------------
 2 files changed, 16 insertions(+), 18 deletions(-)
 rename meta-oe/recipes-connectivity/thrift/{thrift_0.13.0.bb => thrift_0.14.2.bb} (72%)

-- 
2.11.0

