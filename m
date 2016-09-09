Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5111660123
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 02:51:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u892pHl2027069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 19:51:17 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 8 Sep 2016 19:51:16 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Sep 2016 10:34:54 +0800
Message-ID: <cover.1473388166.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2 v2] samba: fix waf-samba and restrict the blacklist to ARM
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
X-List-Received-Date: Fri, 09 Sep 2016 02:51:20 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 80b2d4de0ee2a5e6a3302a527e3fcfd2b99c3e37:

  samba: blacklist, fails to build with new binutils-2.27 (2016-09-05 13:34:13 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/d_samba_160909_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_samba_160909_0

Jackie Huang (2):
  waf-samba.bbclass: Add PACKAGECONFIG_CONFARGS to CONFIGUREOPTS
  samba: restrict the blacklist to ARM only

 meta-networking/classes/waf-samba.bbclass                 | 1 +
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 6 +++---
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.8.3


