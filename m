Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 744D265D1B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 05:53:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3L5rUYo013999
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 22:53:30 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 22:53:29 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 01:53:26 -0400
Message-ID: <cover.1398058983.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/2] some fixes for vsftpd and ntp scripts
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
X-List-Received-Date: Mon, 21 Apr 2014 05:53:34 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* Fix QA warnings to vsftpd that some files installed but not shipped;
* Fix hardcode path to perl for ntp scripts: ntptrace, ntp-wait

The following changes since commit 5ccedeb028c46a6b98335fedb16029c6f7f87022:

  sshfs-fuse: update to 2.5 (2014-04-20 16:10:21 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/networking
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/networking

Wenzong Fan (2):
  vsftpd: fix install warning
  ntp: fix hardcode to /usr/bin/perl

 .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |    9 ++++++++-
 meta-networking/recipes-support/ntp/ntp.inc        |    4 ++++
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
1.7.9.5


