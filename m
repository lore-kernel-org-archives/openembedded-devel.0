Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F90960DD7
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 03:16:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s823GhxN003873
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 20:16:46 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 20:16:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Tue, 2 Sep 2014 11:16:35 +0800
Message-ID: <cover.1409626676.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] proftpd: fix integer overflow CVE-2013-4359
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
X-List-Received-Date: Tue, 02 Sep 2014 03:16:48 -0000
Content-Type: text/plain

The following changes since commit b45472a29b60d46cca313bd629561e674befe386:

  at: rename bbappend to match any version from oe-core (2014-09-01 12:49:00 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-proftpd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-proftpd

Hongxu Jia (1):
  proftpd: fix integer overflow CVE-2013-4359

 .../proftpd/files/proftpd-sftp.patch               | 140 +++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   3 +-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch

-- 
1.9.1


