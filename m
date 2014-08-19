Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A74A970E6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 09:16:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7J9GK8T017703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 02:16:20 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 19 Aug 2014 02:16:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 05:16:15 -0400
Message-ID: <cover.1408438614.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/3] lmbench: three fixes
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
X-List-Received-Date: Tue, 19 Aug 2014 09:16:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 5f532a928c7df863a3f0d32db3918c8f7d227e2b:

  cyassl: add recipe (2014-08-15 17:07:45 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_lmbench_140818-3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_lmbench_140818-3

Jackie Huang (3):
  lmbench: Fix "make html" graph failure
  lmbench: fix lmbench memory check failure
  lmbench: fix doc install failure

 .../fix-lmbench-memory-check-failure.patch         |  206 ++++++++++++++++++++
 .../lmbench_result_html_report.patch               |   61 ++++++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |    8 +-
 3 files changed, 272 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/fix-lmbench-memory-check-failure.patch
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/lmbench_result_html_report.patch

-- 
1.7.9.5


