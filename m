Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 794607826F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jun 2017 06:40:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v596eZSn009194
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Jun 2017 23:40:35 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 23:40:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jun 2017 14:40:29 +0800
Message-ID: <cover.1496990155.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 0/4] add new recipes: agent-proxy, enscript, logwarn and microcode-ctl
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
X-List-Received-Date: Fri, 09 Jun 2017 06:40:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 41cf832cc9abd6f2293a6d612463a34a53a9a52a:

  Revert "rrdtool: add gettext-native dependency" (2017-06-05 11:13:09 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib.git jhuang0/r_up_agent-enscript-logwarn-microcode_170609_0
  http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/r_up_agent-enscript-logwarn-microcode_170609_0

Jackie Huang (4):
  agent-proxy: add new recipe
  enscript: add new recipe
  logwarn: add new recipe
  microcode-ctl: add new recipe

 .../0001-add-support-for-other-distributions.patch |  27 +++++
 .../files/0001-fix-the-help-return-code.patch      |  57 ++++++++++
 .../files/fix-No-GNU_HASH-in-the-elf-binary.patch  |  30 ++++++
 .../microcode-ctl/files/microcode_ctl.service      |  11 ++
 .../recipes-bsp/microcode-ctl/microcode-ctl_git.bb |  62 +++++++++++
 .../enscript/enscript/enscript-autoconf.patch      | 118 +++++++++++++++++++++
 .../recipes-extended/enscript/enscript_1.6.6.bb    |  22 ++++
 .../recipes-kernel/agent-proxy/agent-proxy_git.bb  |  25 +++++
 .../files/0001-Makefile-Add-LDFLAGS-variable.patch |  43 ++++++++
 meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb  |  46 ++++++++
 10 files changed, 441 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-add-support-for-other-distributions.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/0001-fix-the-help-return-code.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/fix-No-GNU_HASH-in-the-elf-binary.patch
 create mode 100644 meta-oe/recipes-bsp/microcode-ctl/files/microcode_ctl.service
 create mode 100755 meta-oe/recipes-bsp/microcode-ctl/microcode-ctl_git.bb
 create mode 100644 meta-oe/recipes-extended/enscript/enscript/enscript-autoconf.patch
 create mode 100644 meta-oe/recipes-extended/enscript/enscript_1.6.6.bb
 create mode 100644 meta-oe/recipes-kernel/agent-proxy/agent-proxy_git.bb
 create mode 100644 meta-oe/recipes-kernel/agent-proxy/files/0001-Makefile-Add-LDFLAGS-variable.patch
 create mode 100644 meta-oe/recipes-support/logwarn/logwarn_1.0.14.bb

-- 
2.11.0


