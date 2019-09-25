Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 815586D561
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 09:35:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8P9Zddx000771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Sep 2019 02:35:39 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Wed, 25 Sep 2019 02:35:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Sep 2019 17:35:33 +0800
Message-ID: <cover.1569403988.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/8] [meta-oe][meta-perl][meta-python] Fixes for native and nativesdk
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
X-List-Received-Date: Wed, 25 Sep 2019 09:35:38 -0000
Content-Type: text/plain

The following changes since commit 466fd78ac6a561ce7b47f2190f0aa3ea6aa3593e:

  protobuf: upgrade 3.9.1 -> 3.9.2 (2019-09-24 10:35:46 -0700)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib rbt/native
  http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=rbt/native

Robert Yang (8):
  python-asn1crypto: extend to nativesdk
  python-incremental: Drop broken nativesdk
  fuse: Fix installed-vs-shipped for nativesdk
  keyutils: Fix installed-vs-shipped for nativesdk
  libnet-ssleay-perl: Drop broken native
  libnet-dns-sec-perl: Drop broken native
  iperf3: Drop broken native
  spice: Drop broken native

 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb        |  8 +++++++-
 meta-networking/recipes-support/spice/spice_git.bb         |  3 +--
 meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb             |  2 --
 meta-oe/recipes-security/keyutils/keyutils_1.6.bb          | 12 ++++++++++++
 meta-perl/recipes-perl/libnet/libnet-dns-sec-perl_1.10.bb  |  2 --
 meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.85.bb   |  2 --
 meta-python/recipes-devtools/python/python-asn1crypto.inc  |  2 +-
 meta-python/recipes-devtools/python/python-incremental.inc |  2 +-
 8 files changed, 22 insertions(+), 11 deletions(-)

-- 
2.7.4


