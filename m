Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PdVPT-0001Vw-TL
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:12:47 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so2115873fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=7zQdxiCRkbZTyQ2W1N76pmiPn9g+vuC+WuWw6BX8qf0=;
	b=OwLazDpH3IRd4X+VsNjy1N1DJIlR08a/X8T4GiKrRbUlJ+HCWN4muxpZer46ECRDmY
	EKm9h9nEqPpIbytqEcU4DWtLrKofUKzzl//XYXJaGY4TLkzCMlOIOnhb3yTuRr2G7cCw
	2jYXzaAs5hfcKQUCUB0yKNnK9ihW9hrRw+Big=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=wM58KqRcScY2yP6PV16wyeONsvLPJC+4NPR3g/7f2u5DTDunmYoTewTIfDljJR0YSD
	909e+25XZryflVV6q2ydoKsSZq8m2bwdVx5NtdI4R4N3IcGmxMR7fpQ+0PvjWokYX4q2
	peDuvWLEjImMo9MXisx4+meQm8SU19V+VCs4Y=
Received: by 10.223.98.193 with SMTP id r1mr2912589fan.83.1294956732999;
	Thu, 13 Jan 2011 14:12:12 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n3sm266305fax.31.2011.01.13.14.12.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Jan 2011 14:12:11 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PdVOr-0008Qv-Rd; Thu, 13 Jan 2011 23:12:09 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 23:12:05 +0100
Message-Id: <1294956728-32390-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 0/3] tiny tweaks for sane-toolchain and a cherry-pick
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
X-List-Received-Date: Thu, 13 Jan 2011 22:12:48 -0000

Hi,
The redo is a cherry-pick from that other ever growing to-send queue.
The other 2 just trash my disc a bit less than before.

Bernhard Reutner-Fischer (3):
  sane-toolchain-uclibc: use -pipe
  sane-toolchain-uclinux-uclibc: use -pipe
  gcc-svn: redo patch: Handle uClibc locale

 conf/distro/include/sane-toolchain-uclibc.inc      |    3 +-
 .../include/sane-toolchain-uclinux-uclibc.inc      |    2 +-
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |  126 ++++++++++++++------
 3 files changed, 91 insertions(+), 40 deletions(-)

-- 
1.7.2.3



