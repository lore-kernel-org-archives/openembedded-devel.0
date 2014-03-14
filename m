Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB4CE6EDF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Mar 2014 08:36:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2E8ao1q021647
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Mar 2014 01:36:51 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 14 Mar 2014 01:36:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 14 Mar 2014 16:36:46 +0800
Message-ID: <cover.1394785570.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH 0/1]netcf: fix offline rebuilding failed
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
X-List-Received-Date: Fri, 14 Mar 2014 08:36:53 -0000
Content-Type: text/plain

Test Step:
1. bitbake netcf
2. disconnect network
3. bitbake netcf -ccleansstate && bitbake netcf

//Hongxu

The following changes since commit 3cb58d800c5131bd0519a676a45c26f47b69745f:

  fbgrab: fix installed but not shipped warnings (2014-03-11 14:58:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-netcf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-netcf

Hongxu Jia (1):
  netcf: fix offline rebuilding failed

 .../recipes-support/netcf/gnulib_git.bb            | 35 ++++++++++++++++++++++
 meta-networking/recipes-support/netcf/netcf_git.bb |  5 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/netcf/gnulib_git.bb

-- 
1.8.1.2


