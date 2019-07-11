Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 86D247EDE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jul 2019 05:53:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6B5rB28022777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 22:53:12 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 10 Jul 2019 22:52:58 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jul 2019 13:52:54 +0800
Message-ID: <1562824377-198719-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] fix "Nothing RPROVIDES" when multilib enabled
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Jul 2019 05:53:11 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

These 3 recipe have similar problem, when multilib is enabled,
Eg, for satyr, PN is expaned to lib32-satyr, so packages will
name like lib32-python3-lib32-satyr, fixed by use BPN.


Changqing Li (3):
  volume-key: fix "Nothing RPROVIDES" when multilib enabled
  isomd5sum: fix "Nothing RPROVIDES" when multilib enabled
  satyr: fix "Nothing RPROVIDES" when multilib enabled

 meta-oe/recipes-extended/isomd5sum/isomd5sum_1.2.3.bb    | 8 ++++----
 meta-oe/recipes-extended/volume_key/volume-key_0.3.12.bb | 7 +++----
 meta-oe/recipes-support/satyr/satyr_0.27.bb              | 4 ++--
 3 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.7.4


