Return-Path: <yao.zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 955107018F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 14:36:59 +0000 (UTC)
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.140.163])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s71Eb0vu024849
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Aug 2014 07:37:00 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Aug 2014 10:36:35 -0400
Message-Id: <1406903795-9767-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <20140801133505.GA702@windriver.com>
References: <20140801133505.GA702@windriver.com>
Subject: [meta-networking][PATCH v2] add support for opendataplane
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
X-List-Received-Date: Fri, 01 Aug 2014 14:37:03 -0000

changes v2:
1.change /usr to variable in 0.2 bb
2.replace AUTOREV with current HEAD tag(which works) 
3.add more descriptions for dpdk build in commit message
4.will send the 0001-linux-dpdk-remove-unnecessary-include-path.patch
  to upstream.

Yao Zhao (1):
  add support for opendataplane

 ...inux-dpdk-remove-unnecessary-include-path.patch | 29 ++++++++++++++++++++++
 .../opendataplane/opendataplane.inc                | 21 ++++++++++++++++
 .../opendataplane/opendataplane_0.2.bb             | 25 +++++++++++++++++++
 .../opendataplane/opendataplane_git.bb             | 14 +++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 meta-networking/recipes-support/opendataplane/files/0001-linux-dpdk-remove-unnecessary-include-path.patch
 create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane.inc
 create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane_0.2.bb
 create mode 100644 meta-networking/recipes-support/opendataplane/opendataplane_git.bb

-- 
1.9.1


