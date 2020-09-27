Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.9287.1601196216080578680
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2020 01:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08R8hVJb005327
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 27 Sep 2020 01:43:31 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Sun, 27 Sep 2020 01:43:29 -0700
From: "kai" <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>, <ticotimo@gmail.com>
Subject: [meta-python][PATCH v2 0/2] Update python3-pytest to 6.1.0
Date: Sun, 27 Sep 2020 16:43:18 +0800
Message-ID: <20200927084320.17334-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* add python3-iniconfig to packagegroup-meta-python
* make the link of python3-pytest 6.1.0 release changelog in commit
  message more specific

Kai Kang (2):
  python3-iniconfig: add recipe
  python3-pytest: 5.4.3 -> 6.1.0

 .../packagegroups/packagegroup-meta-python.bb |  1 +
 .../python/python3-iniconfig_1.0.1.bb         |  8 +++++
 ...he-setup_requires-for-setuptools-scm.patch | 35 ++++++++++---------
 ...ytest_5.4.3.bb => python3-pytest_6.1.0.bb} |  3 +-
 4 files changed, 30 insertions(+), 17 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-iniconfig_1.0.1.bb
 rename meta-python/recipes-devtools/python/{python3-pytest_5.4.3.bb => python3-pytest_6.1.0.bb} (89%)

-- 
2.17.1

