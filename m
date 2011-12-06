Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RXjs6-0000Jf-9A
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Dec 2011 02:31:02 +0100
Received: by ghrr13 with SMTP id r13so5011060ghr.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 17:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	bh=xiOzPbK3VR9JjdjT0G9aamFRR/2F4aal+vNfshBdy6Q=;
	b=fXxsk6THlFGG6GMXDNHF9qLeTX/fyZ7HaIluUH+lyoEzUdtmk4bp82Y0ES74xvnsrp
	ffRvn+ZlzZtwcetfWZHO+pJsD6Tqh8CQkFu34yIcH4dbArr2L1WeUkxUJMWGqKzq3eVi
	wUm+wZmtYVvbfcFGLHL4VUru+e5MoaS7whoFo=
Received: by 10.50.163.97 with SMTP id yh1mr12686614igb.37.1323134654834;
	Mon, 05 Dec 2011 17:24:14 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id z10sm82990746ibv.9.2011.12.05.17.24.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 17:24:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Dec 2011 17:24:10 -0800
Message-Id: <1323134650-3111-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [meta-oe][pull-request] GCC 4.5 and 4.6 updates
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
X-List-Received-Date: Tue, 06 Dec 2011 01:31:02 -0000

I have build angstrom-gnome-image for all qemu architectures
both with 4.5 and 4.6 gcc. Please consider pulling

The following changes since commit a2fbb83f951a522f3a1eb2b627847f549a0c245a:

  nmon_13g: add -ltinfo linker flag (2011-12-02 10:11:27 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib kraj/gcc-linaro-update

Khem Raj (2):
      gcc-4.6: Bring in latest linaro patches
      gcc-4.5: Backport with-linker-hash-style and backports from FSF & linaro

 meta-oe/recipes-devtools/gcc/gcc-4.5.inc           |   13 +-
 .../gcc/gcc-4.5/gcc-with-linker-hash-style.patch   |  212 +++
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch |  309 ----
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch |   22 -
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch |   80 +
 .../gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch |  460 +++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch    |   80 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch    |  528 ++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch    |  387 ++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch    |  290 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch    |  105 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch    |  436 +++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch    |  378 ++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch    |  240 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch    |  124 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch    |  362 ++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch    |  628 +++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch    | 1951 ++++++++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch    |  147 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch    |  304 +++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch    |  123 ++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch    |   24 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch    |  453 +++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch    | 1505 +++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch    |   61 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch    |   23 +
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch    | 1400 ++++++++++++++
 .../gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch    |  515 ++++++
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |   22 +
 meta-oe/recipes-devtools/gcc/gcc-common-4.6.inc    |    2 +-
 30 files changed, 10847 insertions(+), 337 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/gcc-with-linker-hash-style.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99491.patch
 delete mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99541.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99548.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.5/linaro/gcc-4.5-linaro-r99549.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106814.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106815.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106816.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106817.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106818.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106819.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106820.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106821.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106825.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106826.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106827.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106828.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106829.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106830.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106831.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106832.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106833.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106834.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106836.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106839.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106840.patch
 create mode 100644 meta-oe/recipes-devtools/gcc/gcc-4.6/linaro/gcc-4.6-linaro-r106841.patch


