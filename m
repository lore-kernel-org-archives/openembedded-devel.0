Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66AD6769F8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 09:37:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I9bi4B014069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 02:37:44 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Thu, 18 Aug 2016 02:37:43 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 18 Aug 2016 17:37:38 +0800
Message-ID: <cover.1471512743.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [meta-oe][PATCH 0/2] fix GNU_HASH QA warnings
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
X-List-Received-Date: Thu, 18 Aug 2016 09:37:44 -0000
Content-Type: text/plain


The following changes since commit 02a390b79bdc089eb583e443ee04f60bffd409eb:

  tnftp: tnftp20130505 -> tnftp20151004 (2016-08-16 21:26:15 -0400)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib yzhao/hash-fix
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=yzhao/hash-fix

Yi Zhao (2):
  libx86-1: fix QA warning for GNU_HASH
  wipe: fix QA warning for GNU_HASH

 .../libx86-1/libx86-1.1/makefile-add-ldflags.patch      | 17 +++++++++++++++++
 meta-oe/recipes-extended/libx86-1/libx86-1_1.1.bb       |  1 +
 .../wipe/files/makefile-add-ldflags.patch               | 17 +++++++++++++++++
 meta-oe/recipes-extended/wipe/wipe_git.bb               |  1 +
 4 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
 create mode 100644 meta-oe/recipes-extended/wipe/files/makefile-add-ldflags.patch

-- 
2.7.4


