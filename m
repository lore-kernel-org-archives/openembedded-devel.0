Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 629997827B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:00:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L60eEj001677
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 20 Aug 2017 23:00:40 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:00:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Aug 2017 02:00:35 -0400
Message-ID: <cover.1503295148.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/3] multipath-tools/python3-pykickstart/xmlrpc-c: fix file-rdeps QA issues
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
X-List-Received-Date: Mon, 21 Aug 2017 06:00:40 -0000
Content-Type: text/plain

The following changes since commit ac2a6d2b5d69937577effcb8bb2149651bac0176:

  json-spirit: Add -latomic to LDFLAGS (2017-08-13 13:21:04 +0200)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-qa-issue
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-qa-issue

Hongxu Jia (3):
  multipath-tools: add bash to RDEPENDS
  python3-pykickstart: tweak shebang to python3
  xmlrpc-c: add perl to RDEPENDS

 .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb   |  2 +-
 .../multipath-tools/multipath-tools_0.7.1.bb       |  2 +-
 .../files/0005-tweak-shebang-to-python3.patch      | 25 ++++++++++++++++++++++
 .../python-pykickstart/python3-pykickstart_2.35.bb |  1 +
 4 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch

-- 
2.8.1


