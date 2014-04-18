Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3447865DFB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 10:16:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3IAGYCr005428
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Apr 2014 03:16:34 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 18 Apr 2014 03:16:34 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Apr 2014 18:16:29 +0800
Message-ID: <cover.1397816030.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/3] vim: add dependency and selinux and acl support control
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
X-List-Received-Date: Fri, 18 Apr 2014 10:16:34 -0000
Content-Type: text/plain

These patches based on "vim: Upgrade to v7.4.258"

The following changes since commit 91a4267823a6c3abf2eb5aa14549328e8868b7f5:

  vim: Upgrade to v7.4.258 (2014-04-18 18:00:28 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/vim
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/vim

Chong Lu (3):
  vim: add dependency and selinux and acl support control
  vim: don't check acl header if acl support disabled
  vim: add knob whether elf.h are checked

 .../vim/files/disable_acl_header_check.patch       | 27 +++++++++++++++
 .../vim-add-knob-whether-elf.h-are-checked.patch   | 38 ++++++++++++++++++++++
 meta-oe/recipes-support/vim/vim_7.4.258.bb         | 26 +++++++++++++--
 3 files changed, 89 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/vim/files/disable_acl_header_check.patch
 create mode 100644 meta-oe/recipes-support/vim/files/vim-add-knob-whether-elf.h-are-checked.patch

-- 
1.8.1.2


