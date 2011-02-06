Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrew.smirnov@gmail.com>) id 1Pm1pT-00061M-Nb
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 11:26:51 +0100
Received: by bwz10 with SMTP id 10so3856671bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:user-agent
	:mime-version:content-type;
	bh=/JOkxQHe77dUZ59iOh4gmnUjYAqq6wJpBcL33MGOULM=;
	b=EloSPIusoUW21P55vKb67NlfMxFVTxhLO/QLjvcNZ5JvxugdV1791xtWCox6Igzgk6
	vH9r8IkxODUqazDOkcFPY0X1qE3t9PpMJmkJ/AGTqzQs6cxnARKkCA3jR5UM3goAwSD0
	KvnQ00wjaDnofxBKhFqxixYdZ8syA/qOqyqh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-type;
	b=IKb/V4/mgexbMVMwVTiYgcxH6rTsQOUo60rUAhq0yD7F3YvXxy4G9BGyqbOSuxLpfC
	zIVATZfHKf3wfO05tGyb2Ba5PdbSkjroU7pCIhDPlFJenRU7TB4vBGsyZaR1bolY8NW4
	q+emNLcxKoolhRxY39POg0CPX6v3zAbis/TTQ=
Received: by 10.204.46.210 with SMTP id k18mr13586393bkf.159.1296987949601;
	Sun, 06 Feb 2011 02:25:49 -0800 (PST)
Received: from bulbasaur (l49-9-169.cn.ru [178.49.9.169])
	by mx.google.com with ESMTPS id v1sm1390176bkt.17.2011.02.06.02.25.48
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 02:25:48 -0800 (PST)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: openembedded-devel@lists.openembedded.org 
Date: Sun, 06 Feb 2011 16:16:30 +0600
Received: from bulbasaur (l49-9-169.cn.ru [178.49.9.169])
	by mx.google.com with ESMTPS id v25sm1382914bkt.18.2011.02.06.02.16.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 02:16:32 -0800 (PST)
Message-ID: <87r5blzcgl.fsf@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.0.50 (gnu/linux)
MIME-Version: 1.0
Subject: Ada(GNAT) support in OE
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
X-List-Received-Date: Sun, 06 Feb 2011 10:26:51 -0000
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Hi, everyone!

Bitbake-1.10.2 and OE from git here and I am trying to add some
rudimentary support of Ada language(GNAT) to OE(for now it is just
building a cross compiler)

As of this moment I managed to build some semblance of a cross compiler
(it builds simple "hello world" executable) by creating a verbatim copy
of gcc-cross_4.4.4.bb, all files it depends upon to my local recipes
directory and making slight modification to gcc-configure-common.inc
(see modifications.patch) but this rises a couple of questions:

 - Would anyone be interested in adding such changes? If so, am I going
   in right direction or is there another more elegant and preferred way
   to add compiler support?

 - Ada compiler bootstrapping process requires host system to have
   working Ada compiler implementation, how can this, and should it all
   be reflected in the recipe?

 - Provided I am successful in my endeavor, writing BitBake recipe for
   Ada program would require gnatmake, gnatbind, gnatlink tools to be
   accessible through some variables(the same way C compiler is
   available via CC) how can this be implemented?

Thanks in advance for answering!

Andrey Smirnov

--=-=-=
Content-Type: text/x-diff
Content-Disposition: inline; filename=modifications.patch
Content-Description: Crude attempt to add Ada support to OE

diff -u -w /home/ndreys/Workspace/oe/sources/openembedded/recipes/gcc/gcc-configure-common.inc /home/ndreys/Workspace/oe/sandbox/recipes/oe-ada/gcc-configure-common.inc
--- /home/ndreys/Workspace/oe/sources/openembedded/recipes/gcc/gcc-configure-common.inc	2011-02-04 20:34:08.841641002 +0600
+++ /home/ndreys/Workspace/oe/sandbox/recipes/oe-ada/gcc-configure-common.inc	2011-02-05 20:39:08.857900000 +0600
@@ -15,6 +15,12 @@
 OBJC_mips ?= ""
 OBJC_mipsel ?= ""
 OBJC ?= ",objc"
+ADA ?= ",ada"
+ADA_arm ?= ""
+ADA_armeb ?= ""
+ADA_mipsel ?= ""
+ADA_sh3 ?= ""
+
 # disable --enable-target-optspace for powerpc SPE
 # at -Os libgcc.so.1 creates references into
 # hidden symbols in libgcc.a which linker complains
@@ -23,7 +29,7 @@
 OPTSPACE = "${@base_contains('TARGET_ARCH', 'powerpc', '', '--enable-target-optspace',d)}"
 # gcc 3.x expects 'f77', 4.0 expects 'f95', 4.1 and 4.2 expect 'fortran'
 FORTRAN ?= ",f77"
-LANGUAGES ?= "c,c++${OBJC}${FORTRAN}${JAVA}"
+LANGUAGES ?= "c,c++${OBJC}${FORTRAN}${JAVA}${ADA}"
 
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""

Diff finished.  Sun Feb  6 15:19:32 2011

--=-=-=--
