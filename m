Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMOsX-0001Mq-9M
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 19:15:54 +0200
Received: by bwz14 with SMTP id 14so1788327bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 10:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=bhUqeCq9CiKh8Y7qA5TJBZOG3iEVstcze/SDtJLzgAY=;
	b=hh1sKFuHKFEY0+3Ld2c/KykaVTHj6AJyC9XI9E53X1uSpd1ONTTKuDsfKBdZtPwROU
	jW+fel8vF21T1Qdu4f5RxKGSDp/XYPdDtAd05XiuZQnCXMEYcR4ciSLHB/6Hc6WC/PgX
	lRGIk9wixeAEGTqOwPtWz58/vIjQsXmHLLA1s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=v5s+yx8M1toeMUcXoga1UuNyiTsKpY77S4zzxNXRjRjKjydlBEsyW3w/RZ66SXa11X
	fBT+06HgU6gIHYIzycOb8NBU28XhWebOluSkA1872h6pQhqI9aex5084dViqx22WUc9g
	k1ljprf/1SJ5fC0J3R1ubvCGJUHsvFSxotLhg=
Received: by 10.204.83.25 with SMTP id d25mr8797097bkl.56.1276103488945;
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id f13sm5201987bka.5.2010.06.09.10.11.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 10:11:28 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMOoS-0000kS-Ng; Wed, 09 Jun 2010 19:11:36 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: raj.khem@gmail.com
Date: Wed,  9 Jun 2010 19:10:34 +0200
Message-Id: <1276103437-2755-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/3] uClibc configury touchup; RFC WRT feature/dep picking heuristics
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
X-List-Received-Date: Wed, 09 Jun 2010 17:15:54 -0000

Hi,

These are independent.

1) uClibc: redo configuration
  improve configury of uClibc
2) uclibc_git: keep PV at "git"
  convenience
3) busybox: picking IPv6 per default is not up to the package
  first, busybox needs a better configury, like it's done for uclibc
  in 1).
  Second, who picks features and with what preference? packages? user?
  distro? machine? See FIXME in 1).
  This patchlet works around the real issue. Comments on how to tackle
  the underlying issue (or how it's solved elsewhere if it already is,
  i didn't see where/how ?) are _very_ welcome.

please install && cheers,


Bernhard Reutner-Fischer (3):
  uClibc: redo configuration
  uclibc_git: keep PV at "git"
  busybox: picking IPv6 per default is not up to the package

 conf/distro/include/sane-toolchain-uclibc.inc  |    7 +
 conf/distro/include/sane-toolchain.inc         |    3 +-
 conf/distro/include/uclibc.inc                 |    8 +
 recipes/busybox/busybox-1.15.3/micro/defconfig |    2 +-
 recipes/uclibc/bfin-uclibc_svn.bb              |    2 +-
 recipes/uclibc/uclibc-config.inc               |  110 +++++++++++
 recipes/uclibc/uclibc-initial_0.9.30.2.bb      |   12 +-
 recipes/uclibc/uclibc-initial_0.9.30.bb        |    5 +-
 recipes/uclibc/uclibc-initial_git.bb           |    6 +-
 recipes/uclibc/uclibc-old.inc                  |  186 ++++++++++++++++++
 recipes/uclibc/uclibc.inc                      |  246 ++++++++++++------------
 recipes/uclibc/uclibc_0.9.28.bb                |    2 +-
 recipes/uclibc/uclibc_0.9.29.bb                |    2 +-
 recipes/uclibc/uclibc_0.9.30.1.bb              |    2 +-
 recipes/uclibc/uclibc_0.9.30.bb                |    2 +-
 recipes/uclibc/uclibc_git.bb                   |    7 +-
 16 files changed, 448 insertions(+), 154 deletions(-)
 create mode 100644 recipes/uclibc/uclibc-config.inc
 create mode 100644 recipes/uclibc/uclibc-old.inc



