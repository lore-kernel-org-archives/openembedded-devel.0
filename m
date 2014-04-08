Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BFC9D65D5D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 09:07:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s38971gv029614
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 02:07:01 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Apr 2014 02:07:00 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 8 Apr 2014 17:07:47 +0800
Message-ID: <cover.1396947706.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 0/3] collectd: three fixes
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
X-List-Received-Date: Tue, 08 Apr 2014 09:07:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comment:
"collectd: explicitly enable/disable libsensors support":
changed the config option to be a PACKAGECONFIG option

---
The following changes since commit bc969d3705c45928de8525ef3d2d9d2867311864:

  inetutils: add -dbg packages for tftpd, telnetd and rshd (2014-04-02 11:18:54 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_collectd_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_collectd_1

Ming Liu (1):
  collectd: explicitly enable/disable libsensors support

Wenzong Fan (2):
  collectd: enable/disable libpq explicitly
  collectd: fix init status

 .../collectd/collectd/collectd.init                |   13 ++++++++++++-
 .../recipes-extended/collectd/collectd_5.2.2.bb    |    6 ++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
1.7.9.5


