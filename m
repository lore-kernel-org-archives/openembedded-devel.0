Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiA7B-0006RY-8K
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 19:29:09 +0100
Received: by bwz10 with SMTP id 10so1581528bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 10:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=fJd5UPjGYHq0/6vq/JQIq06VhLdtF/Hs72LOtzrCiKI=;
	b=SHaidZVudgYPApgd/DWV/F95Sj+LQvHzJtik7trdE6gNAb076gD1WUIto64a3j9EbH
	mGKG6CLEssxB9eBx2a/QFtAxLGw9xdwyKJYaJ9vVcD821wLJ+Xlxj0RK7UYuWcG4Tzcg
	m7K7zp3WJ2cpHISCZYOGQ/v07hNWbXMfyfSeI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=UXTxa10ewHWSZwCa6n9UNkCI+sMu7zryxN768jExLJyzOk+bIHiNI0CMCPO5q+ovAW
	VGg9MOjF4m1NjmogSEB7w4/EC8jLj7A8lGlJkh16DgCLO6OZIjO+b2ylox9IBHWiYVtq
	tFnZ1JY/VVXCAiifZsPEq+85+sxdk7nMblbkU=
Received: by 10.204.71.20 with SMTP id f20mr709996bkj.139.1296065618452;
	Wed, 26 Jan 2011 10:13:38 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id f20sm7647939bkf.4.2011.01.26.10.13.35
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 10:13:36 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pi9s5-0002Vw-N5; Wed, 26 Jan 2011 19:13:33 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Jan 2011 19:13:23 +0100
Message-Id: <1296065612-9637-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 0/9] assorted independent pathlets
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
X-List-Received-Date: Wed, 26 Jan 2011 18:29:09 -0000

Hi,

Some independent patchlets. Ok for master?

Bernhard Reutner-Fischer (9):
  fakeroot: add 1.14.5, mv 1.12.4 to obsolete
  packaged-staging.bbclass: improve documentation
  IMAGE_CMD_ext4.xz: rm uncompressed image
  micro: get preferred binutils from sane-toolchain
  ltp: bump version
  uclibc: handle some more {machine,distro}_features
  kernel.bbclass: simplify "if image" condition
  image.bbclass: only insert feed uris if ONLINE_PACKAGE_MANAGEMENT
  util-linux: honour largefile distro feature

 classes/image.bbclass                              |    3 +-
 classes/kernel.bbclass                             |    2 +-
 classes/packaged-staging.bbclass                   |   12 +-
 conf/bitbake.conf                                  |    2 +-
 conf/distro/micro.conf                             |    1 -
 recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch  |   15 +
 .../fakeroot-1.14.5/quiet-getopt-check.patch       |   12 +
 recipes/fakeroot/fakeroot-native_1.12.4.bb         |   21 --
 recipes/fakeroot/fakeroot.inc                      |   16 +
 recipes/fakeroot/fakeroot_1.12.4.bb                |   26 --
 recipes/fakeroot/fakeroot_1.14.5.bb                |   10 +
 recipes/ltp/ltp-20100831/runalltests.patch         |  302 --------------------
 recipes/ltp/ltp-20101031/runalltests.patch         |  302 ++++++++++++++++++++
 recipes/ltp/ltp_20100831.bb                        |   39 ---
 recipes/ltp/ltp_20101031.bb                        |   38 +++
 .../obsolete/fakeroot/fakeroot-native_1.12.4.bb    |   21 ++
 recipes/obsolete/fakeroot/fakeroot_1.12.4.bb       |   26 ++
 recipes/uclibc/uclibc-config.inc                   |    5 +-
 recipes/util-linux/files/MCONFIG                   |    1 -
 recipes/util-linux/util-linux.inc                  |    4 +-
 20 files changed, 461 insertions(+), 397 deletions(-)
 create mode 100644 recipes/fakeroot/fakeroot-1.14.5/fix-prefix.patch
 create mode 100644 recipes/fakeroot/fakeroot-1.14.5/quiet-getopt-check.patch
 delete mode 100644 recipes/fakeroot/fakeroot-native_1.12.4.bb
 create mode 100644 recipes/fakeroot/fakeroot.inc
 delete mode 100644 recipes/fakeroot/fakeroot_1.12.4.bb
 create mode 100644 recipes/fakeroot/fakeroot_1.14.5.bb
 delete mode 100644 recipes/ltp/ltp-20100831/runalltests.patch
 create mode 100644 recipes/ltp/ltp-20101031/runalltests.patch
 delete mode 100644 recipes/ltp/ltp_20100831.bb
 create mode 100644 recipes/ltp/ltp_20101031.bb
 create mode 100644 recipes/obsolete/fakeroot/fakeroot-native_1.12.4.bb
 create mode 100644 recipes/obsolete/fakeroot/fakeroot_1.12.4.bb

-- 
1.7.2.3



