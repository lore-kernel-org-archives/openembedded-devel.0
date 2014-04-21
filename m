Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92B3A65D2B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Apr 2014 06:21:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3L6L9wW024847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 23:21:09 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Sun, 20 Apr 2014 23:21:08 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 21 Apr 2014 02:21:03 -0400
Message-ID: <cover.1398061002.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/4] rsyslog: use update-alternatives and PACKAGECONFIG and two fixes
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
X-List-Received-Date: Mon, 21 Apr 2014 06:21:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

---
The following changes since commit 5ccedeb028c46a6b98335fedb16029c6f7f87022:

  sshfs-fuse: update to 2.5 (2014-04-20 16:10:21 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_rsyslog_noptest-2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_rsyslog_noptest-2

Jackie Huang (4):
  rsyslog: use BPN to fix multilib and add all licenses
  rsyslog: add PACKAGECONFIG for optional features
  rsyslog: Add config files and use update-alternatives for rsyslog,
  rsyslog: add DEPENDS on bison-native and flex-native

 .../recipes-extended/rsyslog/rsyslog/rsyslog.conf  |   84 +++++++++++++++++++
 .../rsyslog/rsyslog/rsyslog.logrotate              |   39 +++++++++
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb  |   88 ++++++++++++++++++--
 3 files changed, 202 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.conf
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate

-- 
1.7.9.5


