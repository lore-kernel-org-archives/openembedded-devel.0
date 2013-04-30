Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UXDlf-00017Q-VF
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 18:51:10 +0200
Received: by mail-da0-f45.google.com with SMTP id v40so317772dad.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=xtXQSvJ9M+l1zo9auE5zTx7eXCVhaBTMpIvAe80kqV4=;
	b=A1m3SsEy1q5/6cWyoOr3LCy68vbLnAEec3ZGPsOVY6vOObZNIWQLS/oxTkFzJK2g/3
	BxoSe3Oys55SKBUGNKvUBLZy6eoINOvXAkkk2WWPcc4NOHc4bO8uVwGhCGAhk8djJSw7
	dav1Wb+sYFYY8LxAipgshW1+L0vgt9Sxh9UTp+FNV6Ynju04WcB1FfORJEfU4P55DvR+
	w59qigEh4K/sCIs3Xgc5KZvAS4LHwyOWH1SYi8T8WYU1X5ez06iDSjUMCXIYTmgdICO8
	kKSp1HFJerSpMJNzqZ+LYl0eq2RPDtbL1TTb/+TQLXpBn8XBWn+1X+2b3ZJvJ18Cb2A0
	+ZhA==
X-Received: by 10.68.97.130 with SMTP id ea2mr75579717pbb.129.1367339592341;
	Tue, 30 Apr 2013 09:33:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	aj2sm29133210pbc.1.2013.04.30.09.33.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 30 Apr 2013 09:33:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:32:50 +0200
Message-Id: <cover.1367339449.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 00/12] README and llvm2.9 changes for dylan
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
X-List-Received-Date: Tue, 30 Apr 2013 16:52:05 -0000

Some changes from master I would like to get in dylan

The following changes since commit 8a350e3b4d3431f68d440f9d6ec079fdd1366617:

  update README to dylan (2013-04-23 18:52:43 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/for-dylan
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/for-dylan

Martin Jansa (12):
  llvm2.9: Import from meta-java
  llvm2.9: fix build with gcc-4.7
  llvm2.9: try to fix thumb build and disable it after failure
  llvm2.9: remove X86 from LLVM_TARGETS_TO_BUILD
  llvm2.9: add LLVM_EXTRA_ARCH to enable X86 unless building for x86
  e-wm-0.17.2.1: Update checksums, tarball was repackaged upstream :/
  meta-gnome: add README file
  meta-ruby: Fix subject-prefix
  README: add -M to git send-email example
  toolchain-layer, meta-networking: README: add dylan to subject-prefix
    and update branch in depends
  meta-multimedia/README: add dependency on meta-ruby
  README: show github mirror URL in layer dependencies

 meta-efl/README                                    |  7 ++--
 meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb          |  4 +-
 meta-gnome/README                                  | 16 ++++++++
 meta-gpe/README                                    |  7 ++--
 meta-initramfs/README                              |  5 ++-
 meta-multimedia/README                             |  8 ++--
 meta-networking/MAINTAINERS                        |  4 +-
 meta-networking/README                             |  2 +-
 meta-oe/README                                     |  5 ++-
 .../recipes-core/llvm/llvm2.9/0019-issue6065.patch | 35 +++++++++++++++++
 .../recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch   | 16 ++++++++
 .../llvm/llvm2.9/arm_fenv_uclibc.patch             | 14 +++++++
 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb           | 44 ++++++++++++++++++++++
 meta-ruby/README                                   |  9 +++--
 meta-systemd/README                                |  7 ++--
 meta-webserver/README                              |  4 +-
 meta-xfce/README                                   |  7 ++--
 toolchain-layer/README                             |  7 ++--
 18 files changed, 168 insertions(+), 33 deletions(-)
 create mode 100644 meta-gnome/README
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9/0019-issue6065.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9/0035-gcc-4.7.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9/arm_fenv_uclibc.patch
 create mode 100644 meta-oe/recipes-core/llvm/llvm2.9_2.9.bb

-- 
1.8.2.1



