Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6F5247840F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 07:20:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6S7KfUC003167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jul 2017 00:20:41 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 28 Jul 2017 00:20:40 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Jul 2017 15:20:15 +0800
Message-ID: <cover.1501226187.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] openl2tp: several fixes
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
X-List-Received-Date: Fri, 28 Jul 2017 07:20:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit a8b54e300be027fefe8a774ca1861d0fb8e80d99:

  pidgin-otr: unblacklist (2017-07-24 18:58:55 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_openl2tp_170728_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_openl2tp_170728_0

Jackie Huang (2):
  openl2tp: add LGPL-2.1 license
  openl2tp: add init script and systemd support

 .../openl2tpd-initscript-fix-sysconfig.patch       | 35 ++++++++++++++++
 .../openl2tpd-initscript-fix-warning.patch         | 32 ++++++++++++++
 .../openl2tp/openl2tpd-initscript-fix.patch        | 49 ++++++++++++++++++++++
 .../openl2tp/openl2tp/openl2tpd.service            | 17 ++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     | 40 ++++++++++++++++--
 5 files changed, 170 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-sysconfig.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix-warning.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd-initscript-fix.patch
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service

-- 
2.11.0


