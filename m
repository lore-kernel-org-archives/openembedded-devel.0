Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB4IT-0002Zz-Sw
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Mar 2012 14:12:49 +0100
Received: by wibhj13 with SMTP id hj13so1776233wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2012 06:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0S45m0fTdhcQ1JqBkUJG6GNI/ZThx9x4QzGW0DFoQao=;
	b=d9FEEEhj3Rku7LpIA0+X3T4Ufd13Bp1BOjBjCSrS17LbVpbB/e52IqxYbfnGml0lTW
	xXHtqtsMyPxot+iqrk4ng8L/Yq4IANRT3fS/seTafTK/7LOYEVltcsVMH8roY2G67H0E
	LzS8yKEn+3lRJp0oklODx8lS0MNOxi9mie3xAGS5SRfsMfIhpFJOJMGp+fPsaIsM82cV
	cnS7HtTBae9fJAAIzQ2wC0ye+jcYx20NRUNt/+HmTAM06Hbqu4FJ+aP6rrZJVyg5MZc8
	txNMej6Joa5QyA8PF6SM4YuIWZ0UxW5Miq0Mb2AQUKRScZ9HL9LBeGBVDUqMCEPMzdUc
	AU5g==
Received: by 10.180.107.101 with SMTP id hb5mr6466161wib.7.1332507834049;
	Fri, 23 Mar 2012 06:03:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id df3sm13738890wib.1.2012.03.23.06.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 06:03:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Mar 2012 14:03:48 +0100
Message-Id: <cover.1332507730.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [meta-oe][PATCH 0/5] kernel.bbclass update
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
X-List-Received-Date: Fri, 23 Mar 2012 13:12:50 -0000

Similar patchset was sent to oe-core copy, but only last patch depends 
on it (on update-modules update).

The following changes since commit 6b22bd198a87b5f113971d8fcd0e7211cd143c7d:

  systemd-serialgetty: sync with upstream (2012-03-23 07:57:19 +0100)

are available in the git repository at:
  git://git.openembedded.org/meta-openembedded-contrib jansa/kernel
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/kernel

Martin Jansa (5):
  kernel.bbclass: use better number for KERNEL_PRIORITY
  kernel.bbclass: fix extra + in kernelrelease
  linux: import shared linux.inc so we have just one copy
  kernel.bbclass: use symlinks for modutils files
  kernel.bbclass: don't create /etc/modutils/*

 meta-oe/classes/kernel.bbclass         |   24 +++---
 meta-oe/recipes-kernel/linux/linux.inc |  131 ++++++++++++++++++++++++++++++++
 2 files changed, 144 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/linux/linux.inc

-- 
1.7.8.5



