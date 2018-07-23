Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 18F5874D6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jul 2018 10:08:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6NA8bC9012028
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jul 2018 03:08:37 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 23 Jul 2018 03:08:36 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Mon, 23 Jul 2018 03:08:35 -0700
Message-ID: <20180723100836.12809-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH v3 0/1] perfect support for musl
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
X-List-Received-Date: Mon, 23 Jul 2018 10:08:40 -0000
Content-Type: text/plain

Hi Raj,
    I fix the error about musl.
    But the error about glibc, "No libelf found", is not reproduced
    on my side. And I check some argument(e.g. LD) passed to Makefile
    and the dependency, elfutils. It seems everything is OK.

    So, could you build your project with the new recipe and check the
    relevant dependency if you have time.

Thanks,
// Hongzhi

v3:
    add support for musl when build bpf and modify the recipe

Hongzhi.Song (1):
  kernel-selftest: add support for musllibc and perfect the recipe

 .../kernel-selftest/kernel-selftest.bb             | 30 ++++++++--------------
 ...bpf-test_progs.c-add-support-for-musllibc.patch | 25 ++++++++++++++++++
 2 files changed, 35 insertions(+), 20 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/0001-bpf-test_progs.c-add-support-for-musllibc.patch

-- 
2.11.0


