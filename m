Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OZQJv-0008W5-1L
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jul 2010 17:25:56 +0200
Received: by fxm12 with SMTP id 12so507284fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jul 2010 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=xXFTPwVM9A843rSi3OJ7WmBo5zf/C+3DLNYndnwh50s=;
	b=hIX05F0tS5pj69rQtewQDaIrYEdYmx8rqgsgtxmCtwsFd2VDa5SWlkx8Whfkpi0Pkv
	suVhAYdcCJQveBi2LrVwM0VDJ4WP7EDATn3PWVyXg4YUYgeY8RYQrIbWt3zvj4zAbeBs
	ERoi9eP7X6tqDq2UMmnSc+ghZNd5l6YsiL/O8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=DmwWbSHzFB3WtYHnhFDyX69DxCFu8895QsgqMqkTvilH2brExI+T2gxwsFxJnxt83T
	7dX8qQJieGYqY/inIYMoiL7see7oaUHqkOz6FIMbdxNVPoX8+uyfe+66iW77sFEiZTFV
	alRleUyLJC8hvF4ORDu8ftGvBFsWxUBP0H4LE=
Received: by 10.223.105.129 with SMTP id t1mr788295fao.12.1279207550428;
	Thu, 15 Jul 2010 08:25:50 -0700 (PDT)
Received: from s42.loc (85-127-92-50.dynamic.xdsl-line.inode.at [85.127.92.50])
	by mx.google.com with ESMTPS id a9sm361406faa.27.2010.07.15.08.25.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 15 Jul 2010 08:25:49 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OZQJj-0001Oy-BX; Thu, 15 Jul 2010 17:25:43 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Jul 2010 17:25:39 +0200
Message-Id: <1279207542-5277-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 0/3] misc fixups
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
X-List-Received-Date: Thu, 15 Jul 2010 15:25:56 -0000

Hi,

The last patch (gcc-cross) asks for comments if and how the package
version number should be improved or look like.
Please apply the rest as-is (omit that PV-touching hunk if in doubt).
thanks,

Bernhard Reutner-Fischer (3):
  minimal: commentary typo fix
  micro: get PREFERRED_BINUTILS from sane-toolchain
  gcc-cross: fix PV and make it compile

 conf/distro/micro.conf                             |    1 -
 conf/distro/minimal-uclibc.conf                    |    2 +-
 recipes/gcc/gcc-svn.inc                            |    8 +-
 recipes/gcc/gcc-svn/gcc-flags-for-build.patch      |   26 --
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   99 +++++---
 .../powerpc32-c++-pch-long-double-128.patch        |  255 ++++++++++++++++++++
 6 files changed, 323 insertions(+), 68 deletions(-)
 create mode 100644 recipes/gcc/gcc-svn/powerpc32-c++-pch-long-double-128.patch



