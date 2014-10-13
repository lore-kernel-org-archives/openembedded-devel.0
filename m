Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA4636AD01
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 06:17:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9D6HIgm027670
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:17:18 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 23:17:17 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Oct 2014 02:17:15 -0400
Message-ID: <cover.1413180347.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1 v3][meta-networking] ntp: fix path to drift file
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
X-List-Received-Date: Mon, 13 Oct 2014 06:17:22 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v3 changes:

* Update the drift file path in recipes-support/ntp/files/ntp.conf;
* Drop the logic for creating /var/lib/ntp, This addressed by Peter A. Bigot's patch:

  [oe] [meta-networking][PATCH] ntp: create and package ntp home directory

The following changes since commit a4bdcbdbca05bbb4a452e06982038f0a38bcb91f:

  openldap: use PN for PACKAGES_DYNAMIC (2014-10-10 12:47:35 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ntp-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ntp-fix

Wenzong Fan (1):
  ntp: fix path to drift file

 meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


