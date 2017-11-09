Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3F41277811
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 11:06:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA9B6SeI007064
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Nov 2017 03:06:28 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 9 Nov 2017 03:06:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Nov 2017 19:04:49 +0800
Message-ID: <cover.1510225386.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/3] iscsi-initiator-utils/open-isns: fix for sysvinit
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
X-List-Received-Date: Thu, 09 Nov 2017 11:06:27 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 5d6d21e98ed594809169d2b2f6964e90a3369a96:

  libreport: fix Nothing RPROVIDES 'lib32-python3-libreport' (2017-10-27 16:39:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_iscsi-openisns_171109_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_iscsi-openisns_171109_0

Jackie Huang (3):
  open-isns: add sysvinit support
  iscsi-initiator-utils: remove the distro_features_check
  iscsi-initiator-utils: check file existence before moving

 .../iscsi-initiator-utils/iscsi-initiator-utils_2.0.874.bb   |  8 ++++----
 meta-networking/recipes-support/open-isns/open-isns_0.97.bb  | 12 ++++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

-- 
2.11.0


