Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D33872C02
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6E5HD024717
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:06 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:04 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:13:58 +0800
Message-ID: <cover.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] net-snmp: add ptest and several fixes
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
X-List-Received-Date: Fri, 16 Jan 2015 06:14:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested on qemux86-64 with both systemd and sysvinit, and ptest run pass.

---
The following changes since commit 2fbc57e10562a809e20a7be93c76d9f08a88ea5f:

  adduser: add new recipe (2015-01-15 16:37:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_net-snmp_150115_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_net-snmp_150115_0

Jackie Huang (7):
  net-snmp: have mib-modules=smux enabled
  net-snmp: move persistent dir to /var/lib/net-snmp
  net-snmp: fix "libtool --finish"
  net-snmp: add knob whether nlist.h are checked
  net-snmp: init script fixes
  net-snmp: move net-snmp-config to client package
  net-snmp: add ptest package

 .../recipes-protocols/net-snmp/files/init          | 53 ++++++++++----------
 .../net-snmp/net-snmp/fix-libtool-finish.patch     | 25 ++++++++++
 ...snmp-add-knob-whether-nlist.h-are-checked.patch | 35 +++++++++++++
 ...p-testing-add-the-output-format-for-ptest.patch | 37 ++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp/run-ptest  |  4 ++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb | 57 ++++++++++++++++------
 6 files changed, 172 insertions(+), 39 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/fix-libtool-finish.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-add-knob-whether-nlist.h-are-checked.patch
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
 create mode 100755 meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest

-- 
1.9.1


