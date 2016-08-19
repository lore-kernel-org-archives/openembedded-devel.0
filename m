Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBD0665CBF
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 10:04:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7JA4Kl3024263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2016 03:04:20 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 19 Aug 2016 03:04:20 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Aug 2016 18:04:14 +0800
Message-ID: <cover.1471600808.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-networking][PATCH 0/3] NO_GNU_HASH warning fixes
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
X-List-Received-Date: Fri, 19 Aug 2016 10:04:23 -0000
Content-Type: text/plain


The following changes since commit 02a390b79bdc089eb583e443ee04f60bffd409eb:

  tnftp: tnftp20130505 -> tnftp20151004 (2016-08-16 21:26:15 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/networking-hashfix
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/networking-hashfix

Yi Zhao (3):
  ifenslave: fix QA warning for GNU_HASH
  ipvsadm: fix QA warning for GNU_HASH
  iscsitarget: fix QA warning for GNU_HASH

 .../iscsitarget/iscsitarget_1.4.20.3+svn502.bb        |  3 ++-
 .../recipes-support/ifenslave/ifenslave_1.1.0.bb      |  2 +-
 .../ipvsadm/ipvsadm/makefile-add-ldflags.patch        | 19 +++++++++++++++++++
 .../recipes-support/ipvsadm/ipvsadm_1.26.bb           |  1 +
 4 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/ipvsadm/ipvsadm/makefile-add-ldflags.patch

-- 
2.7.4


