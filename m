Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB0277331
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 02:17:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u152HbYx009625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Feb 2016 18:17:37 -0800 (PST)
Received: from pek-jhuang0-d1.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 4 Feb 2016 18:17:37 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Feb 2016 10:16:56 +0800
Message-ID: <cover.1454638380.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH 0/5] Fix several license issues
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
X-List-Received-Date: Fri, 05 Feb 2016 02:17:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fixed the following license issues:
WARNING: jikes-native: No generic license file exists for: IBM in any provider
WARNING: cup-native: No generic license file exists for: CUP in any provider
WARNING: jacl-native: No generic license file exists for: JACL in any provider
WARNING: jlex-native: No generic license file exists for: JLEX in any provider
WARNING: classpath: No generic license file exists for: Classpath in any provider

--
The following changes since commit b7fe60a8e23664b3c637fa913ccdcfd0c122487e:

  cacao: remove invalid configure options (2016-01-29 11:37:51 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_java-licenses_160205-0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_java-licenses_160205-0

Jackie Huang (5):
  jikes: fix the license name
  cup: add the license file
  jacl: fix license and add license files
  jlex: fix the license and add JLEX license file
  classpath: fix the license

 licenses/AMD                         | 50 ++++++++++++++++++++++
 licenses/CDS                         | 83 ++++++++++++++++++++++++++++++++++++
 licenses/CUP                         | 20 +++++++++
 licenses/JLEX                        | 19 +++++++++
 licenses/SUN                         | 31 ++++++++++++++
 recipes-core/classpath/classpath.inc |  2 +-
 recipes-core/jacl/jacl_1.4.1.bb      |  5 ++-
 recipes-core/jikes/jikes_1.22.bb     |  2 +-
 recipes-core/jlex/jlex_1.2.6.bb      |  4 +-
 9 files changed, 209 insertions(+), 7 deletions(-)
 create mode 100644 licenses/AMD
 create mode 100644 licenses/CDS
 create mode 100644 licenses/CUP
 create mode 100644 licenses/JLEX
 create mode 100644 licenses/SUN

-- 
1.9.1


