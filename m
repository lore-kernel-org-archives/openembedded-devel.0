Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F98371210
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Oct 2014 03:22:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9A3Mlx6000865
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 Oct 2014 20:22:47 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 9 Oct 2014 20:22:46 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Oct 2014 23:22:44 -0400
Message-ID: <cover.1412910727.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-networking] ntp: fix path to driftfile
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
X-List-Received-Date: Fri, 10 Oct 2014 03:22:55 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Default path to driftfile is "/etc/ntp.drift", that doesn't work since
ntp daemon is always started with "ntp" user. It should be created at
the home directory of "ntp" which is "/var/lib/ntp/".

The following changes since commit 17ff23b4a4a0e5ed7efde107fb00296f1ebd5fdd:

  xf86-video-geode: fix build with new glibc-2.20 (2014-10-06 01:07:53 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/ntp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/ntp

Wenzong Fan (1):
  ntp: fix path to driftfile

 meta-networking/recipes-support/ntp/ntp.inc |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
1.7.9.5


