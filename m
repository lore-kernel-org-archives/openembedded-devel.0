Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B511577E4E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 09:43:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4O9hZuQ029904
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 02:43:38 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 24 May 2017 02:43:33 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 May 2017 17:38:52 +0800
Message-ID: <20170524093853.12828-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] Fix snort start error
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
X-List-Received-Date: Wed, 24 May 2017 09:43:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Please merge the patch after commit for oe-core "libpcap: add native package" is merged. Thanks.

Kai Kang (1):
  snort: enable static daq

 .../recipes-connectivity/daq/daq_2.0.6.bb           |  4 ++++
 .../recipes-connectivity/libdnet/libdnet_1.12.bb    |  1 +
 ...-host-contamination-when-enable-static-daq.patch | 21 +++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.7.5.bb     |  5 +++--
 4 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch

-- 
2.10.1


