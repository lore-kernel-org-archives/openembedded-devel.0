Return-Path: <cliff.brake@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6220B7023B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 19:32:26 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id w8so1079023qac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=w4rTYzDtWLbTWq5TUP/Ych1Ub+hV+U89CbqELG1AyBs=;
	b=waAmZYh7VLoa9s0rQCnRHBoczSAFxeqVKlS3y8z4jaBN8u31hSGcKS7IkRq8217bjT
	1CJNENCKYf//s/hggZ2KPjIV2T+osahtNFJnfChJQPDMILmDieEE7DqfZXeMStw0RNHH
	z9IdKZ0281BeoicfDOKtmt7/SZ1qzUZB4KbN4Dg0UFYtmKw4UrfrS5X2J4/aBEW4htVN
	3QKuP/XxbWMFQohzSo+800ZliewWQGuGGBN35OhpX2NPvg850RfuIC6oHz2ujko3QB91
	VULHTjdUq4S+gV6JKOR/lY/UqC2IXiFAIzpjQ2ZcW2EsSHDQ5GWeWloueT+hAS1OOsjL
	jDHA==
MIME-Version: 1.0
X-Received: by 10.224.87.130 with SMTP id w2mr48332498qal.5.1405539147222;
	Wed, 16 Jul 2014 12:32:27 -0700 (PDT)
Received: by 10.140.17.19 with HTTP; Wed, 16 Jul 2014 12:32:27 -0700 (PDT)
Date: Wed, 16 Jul 2014 15:32:27 -0400
Message-ID: <CAOd_LFzaYUmCQB0vq_bxi0bWDRvEX8mGb7gFV7YQfRckTzKacQ@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][diasy] pull request, cpuburn-neon, v4l-utils, zeroc-ice
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
X-List-Received-Date: Wed, 16 Jul 2014 19:32:28 -0000
Content-Type: text/plain; charset=UTF-8

The following changes since commit ee24939c4c70b63a9fb7e93a58889a3231d3d367:

  rng-tools: Update rng-tools version to 4 (2014-07-01 15:08:41 -0400)

are available in the git repository at:

  https://github.com/cbrake/meta-openembedded.git 2014-07-16_merge-to-daisy

for you to fetch changes up to d85b01997ce8cc354ccc53f97fdffc79cf2277d5:

  v4l-utils: Add virtual/libx11 dependency only if X11 is available
(2014-07-16 15:28:40 -0400)

----------------------------------------------------------------
Lauren Post (1):
      cpuburn-neon: Upgrade to version 20140626

Otavio Salvador (1):
      v4l-utils: Add virtual/libx11 dependency only if X11 is available

Philip Balister (1):
      zeroc-ice : Add recipe.

 .../cpuburn/{cpuburn-neon_20120610.bb => cpuburn-neon_20140626.bb}  |   9 +-
 .../zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch    |
292 ++++++++++++++++++++++++++++++
 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb           |
 77 ++++++++
 meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.0.1.bb              |   3 +-
 4 files changed, 376 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-benchmark/cpuburn/{cpuburn-neon_20120610.bb =>
cpuburn-neon_20140626.bb} (69%)
 create mode 100644
meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice-3.5.1/0002-Modify-Makefile-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb

-- 
=================
http://bec-systems.com

