Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7F38B731A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jan 2016 09:23:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F9NvTF022916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Jan 2016 01:23:58 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 15 Jan 2016 01:23:57 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jan 2016 17:23:50 +0800
Message-ID: <cover.1452848802.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [meta-oe][PATCH 0/4 v2] host-user-contaminated fixes for meta-oe
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
X-List-Received-Date: Fri, 15 Jan 2016 09:23:58 -0000
Content-Type: text/plain

Changes from V1: 

Instruct the "cp" command to preserve ownership instead of using "chown". Thanks Mike Looijmans for the suggestion.
Rebase to lastest master branch

The following changes since commit 5ec0bd998e6fe4d7bf5f7ca30c431447adf5e8b5:

  gnome-desktop: don't try to copy omf.make (2016-01-14 11:30:16 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/4-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/4-fixes

Yi Zhao (4):
  debootstrap: fix host-user-contaminated
  espeak: fix host-user-contaminated
  orrery: fix host-user-contaminated
  logwatch: fix host-user-contaminated

 .../debootstrap/debootstrap_1.0.67.bb              |    1 +
 .../recipes-extended/logwatch/logwatch_7.4.1.bb    |    1 +
 meta-oe/recipes-navigation/orrery/orrery_2.7.bb    |    3 ++-
 meta-oe/recipes-support/espeak/espeak_1.37.bb      |    2 +-
 4 files changed, 5 insertions(+), 2 deletions(-)

-- 
1.7.9.5


