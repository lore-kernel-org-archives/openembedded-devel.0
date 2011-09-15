Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R48Hi-0001wX-MV
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Sep 2011 11:31:06 +0200
Received: by bke11 with SMTP id 11so2253417bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2011 02:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=ZuytPLjEZup1y/aYrkk8HZG5cmuEwPSKtK+/cqo07Vw=;
	b=XVV9R99EN3+iwLdojDYqt7r1Rvfs5inRS1nsMTwI8u1vkxDk9/6eKw3RGdMqTF3s3f
	681GlblcRnH9Px+G0WKhQ3dZDzQ2NNnyZ+vNZQXE9rNi5ORCH/qKebhysFN6Np+K7qW3
	kCt1L8FCawRj/w2jG6AazUlZZPCtoWYbjUlXI=
Received: by 10.204.7.206 with SMTP id e14mr596907bke.127.1316078755030;
	Thu, 15 Sep 2011 02:25:55 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id af16sm2474565bkc.10.2011.09.15.02.25.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 02:25:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Sep 2011 11:25:44 +0200
Message-Id: <cover.1316078712.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <201109150050.33494.paul.eggleton@linux.intel.com>
References: <201109150050.33494.paul.eggleton@linux.intel.com>
Subject: [meta-handheld][PATCH 0/3] Pull request #2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2011 09:31:06 -0000

The following changes since commit 3dbd4d09733bde4f2029a7668dd5eb6ca34e6380:

  linux-kexecboot: move defconfigs to linux-kexecboot-2.6.39 (2011-09-15 11:24:58 +0200)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/linux-3.1

Martin Jansa (3):
  linux-kexecboot: move defconfig to linux-kexecboot-2.6.39
  linux(-kexecboot): add recipes for git version 3.1.0-rc6
  linux_git: set CMDLINE_DEBUG to debug for git version

 recipes-kernel/linux/linux-git.inc                 |   22 ++
 .../akita/defconfig                                |    0
 .../c7x0/defconfig                                 |    0
 .../collie/defconfig                               |    0
 .../poodle/defconfig                               |    0
 .../linux/linux-kexecboot-2.6.39/spitz/defconfig   |  133 +++++++
 .../tosa/defconfig                                 |    0
 .../linux/linux-kexecboot/spitz/defconfig          |    4 -
 recipes-kernel/linux/linux-kexecboot_git.bb        |    2 +
 recipes-kernel/linux/linux/spitz/defconfig         |  379 ++++++++++++++++++++
 recipes-kernel/linux/linux_git.bb                  |   10 +
 11 files changed, 546 insertions(+), 4 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-git.inc
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/akita/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/c7x0/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/collie/defconfig (100%)
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/poodle/defconfig (100%)
 create mode 100644 recipes-kernel/linux/linux-kexecboot-2.6.39/spitz/defconfig
 rename recipes-kernel/linux/{linux-kexecboot => linux-kexecboot-2.6.39}/tosa/defconfig (100%)
 create mode 100644 recipes-kernel/linux/linux-kexecboot_git.bb
 create mode 100644 recipes-kernel/linux/linux/spitz/defconfig
 create mode 100644 recipes-kernel/linux/linux_git.bb

-- 
1.7.6.1



