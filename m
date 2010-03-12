Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Nq8qj-0001ku-Aa
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 18:40:47 +0100
Received: by bwz20 with SMTP id 20so1240724bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 09:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=2vT+KDVP2SL/fwgGXdc/G9u+faMRpGp8BBd70vDdRnw=;
	b=bXYrq64yUVxdo5Bv9DabbObfe4o/Nv1tP5yTheqcwqnH9u+2+BOvgBEA286RkW3z2v
	Qjc3B3FdWSw9iagf95lzE9RDLNS2iRZzyJ8HhLybHuEXfhPRLO/63FNxInYEkVYCcRBr
	T/xO7dnd9/GhulzYICOSB8M5bEW0tFev2DaNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=l4Vx79Y1SK40hihmIkyy923zr/lb0JXh3pyNFkOxI2XdDhwe0eTDHyCW1jbdb0Lxnx
	6TWchNkUCjfL4N3/JqqpSLmDWyOAvjHcraX/TbHEPeR2TAMNJur7EOQYxik0aj7rNaDk
	10z4BYXrGqcjhmbsRxxXqBhQ8Rpr1HSOlUw8s=
Received: by 10.204.152.153 with SMTP id g25mr2979943bkw.158.1268415456966;
	Fri, 12 Mar 2010 09:37:36 -0800 (PST)
Received: from s42.loc (85-127-85-230.dynamic.xdsl-line.inode.at
	[85.127.85.230])
	by mx.google.com with ESMTPS id 14sm950896bwz.2.2010.03.12.09.37.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 12 Mar 2010 09:37:36 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Nq8wb-00056n-Gg; Fri, 12 Mar 2010 18:46:41 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Mar 2010 18:46:29 +0100
Message-Id: <1268415992-19603-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.0
In-Reply-To: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.220
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC, PATCH 0/3] uClibc recipe touchup
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
X-List-Received-Date: Fri, 12 Mar 2010 17:40:47 -0000

Hi,

This is whole series is an RFC.

I'd like to improve the recipe for uClibc a bit.
A few questions popped up, first and foremost how i can handle distro(?)
features (see uclibc-arch.bbclass).

Thanks in advance for your comments && cheers,
Bernhard

Bernhard Reutner-Fischer (3):
  uClibc: rename include file of old releases
  sane-toolchain: add PREFERRED_UCLIBC_VERSION
  uClibc: redo configuration

 classes/uclibc-arch.bbclass                   |  109 +++++++++++
 conf/distro/include/sane-toolchain-uclibc.inc |    7 +
 conf/distro/include/sane-toolchain.inc        |    3 +-
 recipes/uclibc/bfin-uclibc_svn.bb             |    2 +-
 recipes/uclibc/uclibc-initial_0.9.30.2.bb     |   12 +-
 recipes/uclibc/uclibc-initial_git.bb          |    9 +-
 recipes/uclibc/uclibc-initial_nptl.bb         |    9 +-
 recipes/uclibc/uclibc-old.inc                 |  186 +++++++++++++++++++
 recipes/uclibc/uclibc.inc                     |  240 ++++++++++++-------------
 recipes/uclibc/uclibc_0.9.28.bb               |    2 +-
 recipes/uclibc/uclibc_0.9.29.bb               |    2 +-
 recipes/uclibc/uclibc_0.9.30.1.bb             |    2 +-
 recipes/uclibc/uclibc_0.9.30.bb               |    2 +-
 recipes/uclibc/uclibc_git.bb                  |    1 -
 recipes/uclibc/uclibc_nptl.bb                 |    1 -
 15 files changed, 437 insertions(+), 150 deletions(-)
 create mode 100644 classes/uclibc-arch.bbclass
 create mode 100644 recipes/uclibc/uclibc-old.inc



