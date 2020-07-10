Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.1974.1594404997210785499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06AIGFM1014812
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 11:16:26 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 10 Jul 2020
 11:16:05 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 20885)	id D16861FF65;
 Fri, 10 Jul 2020 14:16:04 -0400 (EDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH 0/4] python3-requests-toolbelt: add ptest
Date: Fri, 10 Jul 2020 14:15:51 -0400
Message-ID: <20200710181555.29809-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

These recipes are required to enable
ptest for python3-requests-toolbelt
and are brought in from meta-cloud-services.
  i) python3-mock_4.0.1.bb
 ii) python3-pep8_1.7.1.bb
iii) python3-mccabe_0.2.1.bb 

The original recipes remain in meta-cloud-services.
The .inc and .bb have been consolidated into
one .bb file.

Sakib Sajal (4):
  python3-mock: add recipe for v4.0.1
  python3-pep8: add recipe for v1.7.1
  python3-mccabe: add recipe for v0.2.1
  python3-requests-toolbelt: add ptest

 .../python/python3-mccabe_0.2.1.bb            | 15 +++++++++++++
 .../python/python3-mock_4.0.1.bb              | 17 ++++++++++++++
 .../python/python3-pep8_1.7.1.bb              | 17 ++++++++++++++
 .../python3-requests-toolbelt/run-ptest       |  3 +++
 .../python/python3-requests-toolbelt_0.9.1.bb | 22 +++++++++++++++++--
 5 files changed, 72 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-mccabe_0.2.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-mock_4.0.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pep8_1.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-requests-toolbelt/run-ptest

-- 
2.27.0

