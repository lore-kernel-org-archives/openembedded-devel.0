Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B441865E6C
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 08:05:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3A85wjY026916
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 01:05:59 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 10 Apr 2014 01:05:58 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <Openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Apr 2014 16:05:54 +0800
Message-ID: <cover.1397117000.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/2] fix mlock() on vectors vma for ARM and add explicit selinux support
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
X-List-Received-Date: Thu, 10 Apr 2014 08:06:01 -0000
Content-Type: text/plain

The following changes since commit 477ccd867cc71f8277f2670b7be34b3b15300052:

  klibc: restylize a bit the recipes (2014-04-06 13:36:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/lvm2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/lvm2

Chong Lu (2):
  lvm2: fix mlock() on vectors vma for ARM.
  lvm2: add explicit selinux support control

 meta-oe/recipes-support/lvm2/lvm2.inc              |  5 ++++
 .../lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch  | 31 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch

-- 
1.8.1.2


