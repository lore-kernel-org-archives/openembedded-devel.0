Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7284979BA6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:56:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1K8uNe0011976
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:56:23 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:56:22 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:56:15 +0800
Message-ID: <1550652980-292761-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/5] Upgrade recipes
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
X-List-Received-Date: Wed, 20 Feb 2019 08:56:22 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>


Changqing Li (5):
  phoronix-test-suite: Upgrade 8.2.0 -> 8.6.0
  syslog-ng: upgrade 3.26.1 -> 3.19.1
  rrdtool: upgrade 1.7.0 -> 1.7.1
  multipath-tools: upgrade 0.7.9 -> 0.8.0
  udisk2: 2.7.8 -> 2.8.1

 ...suite_8.2.0.bb => phoronix-test-suite_8.6.0.bb} |  4 +--
 .../rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb} |  4 +--
 .../0021-RH-fixup-udev-rules-for-redhat.patch      | 24 +++++----------
 ...-the-property-blacklist-exception-builtin.patch | 31 +++++++++----------
 ...ds-from-kernel-cmdline-mpath.wwids-with-A.patch | 36 ++++++++++------------
 ...ath-tools_0.7.9.bb => multipath-tools_0.8.0.bb} |  2 +-
 .../{syslog-ng_3.16.1.bb => syslog-ng_3.19.1.bb}   |  4 +--
 .../udisks/{udisks2_2.7.8.bb => udisks2_2.8.1.bb}  |  4 +--
 8 files changed, 46 insertions(+), 63 deletions(-)
 rename meta-oe/recipes-benchmark/phoronix-test-suite/{phoronix-test-suite_8.2.0.bb => phoronix-test-suite_8.6.0.bb} (90%)
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.7.0.bb => rrdtool_1.7.1.bb} (98%)
 rename meta-oe/recipes-support/multipath-tools/{multipath-tools_0.7.9.bb => multipath-tools_0.8.0.bb} (98%)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.16.1.bb => syslog-ng_3.19.1.bb} (81%)
 rename meta-oe/recipes-support/udisks/{udisks2_2.7.8.bb => udisks2_2.8.1.bb} (89%)

-- 
2.7.4


