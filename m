Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C2756006E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 07:00:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8L70nOn022786
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 00:00:49 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Sep 2017 00:00:48 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Sep 2017 14:47:20 +0800
Message-ID: <20170921064721.17250-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [PATCH 0/1] lvm2: disable thin provisioning support if GPLv3 incompatible
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
X-List-Received-Date: Thu, 21 Sep 2017 07:00:48 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Test steps:
1 add layer meta-gplv2 to conf/bblayers.conf
2 echo INCOMPATIBLE_LICENSE += \"GPLv3 LGPLv3 GPLv3+ LGPLv3+ AGPL-3.0\" >> conf/local.conf
3 bitbake lvm2

Without the patch, lvm2 fails with:

ERROR: Nothing RPROVIDES 'thin-provisioning-tools' (but /buildarea2/kkang/Yocto/repo/meta-openembedded/meta-oe
/recipes-support/lvm2/lvm2_2.02.171.bb, /buildarea2/kkang/Yocto/repo/meta-openembedded/meta-oe/recipes-support
/lvm2/libdevmapper_2.02.171.bb RDEPENDS on or otherwise requires it)
thin-provisioning-tools was skipped: it has an incompatible license: GPLv3
NOTE: Runtime target 'thin-provisioning-tools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['thin-provisioning-tools']
ERROR: Required build target 'lvm2' has no buildable providers.
Missing or unbuildable dependency chain was: ['lvm2', 'thin-provisioning-tools']


Kai Kang (1):
  lvm2: disable thin provisioning support if GPLv3 incompatible

 meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.14.1


