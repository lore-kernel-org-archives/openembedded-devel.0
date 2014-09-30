Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 794046FC68
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 06:02:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8U62npU020823
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 23:02:49 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Sep 2014 23:02:48 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 30 Sep 2014 02:02:46 -0400
Message-ID: <cover.1412056597.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1][meta-oe] rsnapshot: add new package
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
X-List-Received-Date: Tue, 30 Sep 2014 06:02:58 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

rsnapshot is a filesystem snapshot utility based on rsync.

rsnapshot makes it easy to make periodic snapshots of local machines,
and remote machines over ssh. The code makes extensive use of hard links
whenever possible, to greatly reduce the disk space required.

Homepage: http://www.rsnapshot.org/

The following changes since commit 0d01e1b72333f49c29d1a27ad844c4cd9f90341c:

  smartmontools: add systemd service file (2014-09-26 05:42:54 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/rsnapshot
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/rsnapshot

Wenzong Fan (1):
  rsnapshot: add new package

 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/rsnapshot/rsnapshot_git.bb

-- 
1.7.9.5


