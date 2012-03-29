Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SD96O-0000IB-Ip
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Mar 2012 08:44:56 +0200
Received: by eekc1 with SMTP id c1so625836eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 23:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=MkIdLct27NtNXpCTZNHtkNZFcpLnRBiazrUy7+4GX2Y=;
	b=EqvxicgHPpt5hnfoo/X7c4Tz4q7px5R0nu2Dq4zTR0rYcJ5MFv69NDBg9H3Ua/7EuZ
	cNhH+hd38H6P09wlo57LFHO/xaNFacP4SliiYBdNtdV0Po93I1PzgLxHaobvClv71Rnc
	E/7QbbpBoBmamTNYzjBqs5NQrhly0U5vJWDl/HhImGQtDu79w3ThJNYOEyIQ+fi/W/wS
	XaXoYPfcSDqO/RdjAVlQUql/6784T1dFFfDBhTb/mcB69WCsvkeUdiyqKCbA1xXQ/LMi
	1EqLIlCDHNkVA377vM1DcB8/mB3jONnwD2PHQ5k7I4e2oxrxt9COFdZoocj2hM2KARc3
	fGpA==
Received: by 10.180.82.132 with SMTP id i4mr2501779wiy.12.1333002953823;
	Wed, 28 Mar 2012 23:35:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 17sm2995053wis.0.2012.03.28.23.35.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Mar 2012 23:35:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Mar 2012 08:35:45 +0200
Message-Id: <cover.1333002899.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-handheld][PATCH 0/2] kernel cleanup
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
X-List-Received-Date: Thu, 29 Mar 2012 06:44:56 -0000

The following changes since commit 1cbe2f0aa8e051f256792701da1bb8ca0fbbfac9:

  formfactor, keymaps, udev: use better form of PRINC (2012-03-28 21:47:00 +0100)

are available in the git repository at:
  git://gitorious.org/shr/meta-handheld jansa/pull

Martin Jansa (2):
  linux-git: drop setversion fix, it's fixed in kernel.bbclass now
  recipes-kernel: use shared linux.inc from meta-oe

 recipes-kernel/linux/linux.inc             |  130 ----------------------------
 recipes-kernel/linux/linux_2.6.29.bb       |    2 +-
 recipes-kernel/linux/linux_3.0.1.bb        |    2 +-
 recipes-kernel/linux/linux_3.1.bb          |    2 +-
 recipes-kernel/linux/linux_3.2.bb          |    2 +-
 recipes-kernel/linux/linux_git.bb          |   11 +--
 recipes-kernel/linux/openezx-kernel_git.bb |    2 +-
 7 files changed, 6 insertions(+), 145 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux.inc

-- 
1.7.8.5



