Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1B32378E34
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:28:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7DAS4Hj001069
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Aug 2018 03:28:04 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 13 Aug 2018 03:28:03 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Mon, 13 Aug 2018 03:28:00 -0700
Message-ID: <20180813102801.30262-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v5 0/1] Add a recipe about kernel selftest
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
X-List-Received-Date: Mon, 13 Aug 2018 10:28:04 -0000
Content-Type: text/plain

v5:
   compatible to latest kernel

v4:
   add the optimization level of compiler, when define _FORTIFY_SOURCE

v3:
   add support for musl when build bpf and modify the recipe slightly

Hongzhi.Song (1):
  kernel-selftest: Add a recipe on kernel selftest

 .../kernel-selftest/kernel-selftest.bb             | 105 ++++++
 ...bpf-test_progs.c-add-support-for-musllibc.patch |  25 ++
 ...-swap.h-micro-define-to-support-musl-libc.patch |  26 ++
 .../kernel-selftest/kernel-selftest/COPYING        | 356 +++++++++++++++++++++
 .../kernel-selftest/userfaultfd.patch              | 322 +++++++++++++++++++
 5 files changed, 834 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-swap.h-micro-define-to-support-musl-libc.patch
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/COPYING
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/userfaultfd.patch

-- 
2.11.0


