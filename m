Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8A965D3C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 13:57:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XjqDo-0003hu-3w for openembedded-devel@lists.openembedded.org;
	Thu, 30 Oct 2014 14:57:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 14:57:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 14:57:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 30 Oct 2014 14:56:48 +0100
Message-ID: <m2tg30$5ot$1@ger.gmane.org>
References: <1414675462-19999-1-git-send-email-Hongjun.Yang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1414675462-19999-1-git-send-email-Hongjun.Yang@windriver.com>
Subject: Re: [meta-oe][PATCH V3] tree: Add a new package
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
X-List-Received-Date: Thu, 30 Oct 2014 13:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hongjun Yang schreef op 30-10-14 14:24:
> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> 
> Add tree command, some ptest cases need it.
> 
> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> 
> --- .../tree/tree-1.7.0/fix-cross-env.patch            | 36
> ++++++++++++++++++++++ meta-oe/recipes-support/tree/tree_1.7.0.bb
> | 16 ++++++++++ 2 files changed, 52 insertions(+) create mode 100644
> meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch create mode
> 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb
> 
> diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
> b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch new file
> mode 100644 index 0000000..d0118f6 --- /dev/null +++
> b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch @@ -0,0
> +1,36 @@ +From 945a5861bb19a34d31119bc38f813513296ce2ad Mon Sep 17
> 00:00:00 2001 +From: "Hongjun.Yang" <hongjun.yang@windriver.com> +Date:
> Thu, 30 Oct 2014 20:38:06 +0800 +Subject: [PATCH] Fix the cross-compiling
> issue + +Upstream-Status: Pending + +Signed-off-by: Hongjun.Yang
> <hongjun.yang@windriver.com> +--- + Makefile | 6 +++--- + 1 file changed,
> 3 insertions(+), 3 deletions(-) + +diff --git a/Makefile b/Makefile 
> +index e91f1f6..e496a52 100644 +--- a/Makefile ++++ b/Makefile +@@ -18,13
> +18,13 @@ + + prefix = /usr + +-CC=gcc ++#CC=gcc + + VERSION=1.7.0 +
> TREE_DEST=tree +-BINDIR=${prefix}/bin ++BINDIR=${DESTDIR}/${prefix}/bin +
> MAN=tree.1 +-MANDIR=${prefix}/man/man1 
> ++MANDIR=${DESTDIR}/${prefix}/man/man1 + OBJS=tree.o unix.o html.o xml.o
> json.o hash.o color.o + + # Uncomment options below for your particular
> OS: +-- +1.9.1 + diff --git a/meta-oe/recipes-support/tree/tree_1.7.0.bb
> b/meta-oe/recipes-support/tree/tree_1.7.0.bb new file mode 100644 index
> 0000000..c1c3a8b

This whole patch can be replaced with:

EXTRA_OEMAKE="CC='${CC}' CFLAGS='${CFLAGS} -DLINUX -D_LARGEFILE64_SOURCE
- -D_FILE_OFFSET_BITS=64' LDFLAGS='${LDFLAGS}'

[..]

do_install() {
	oe_runmake install BINDIR=${D}${bindir} MANDIR=${D}${mandir}/man1
}



> --- /dev/null +++ b/meta-oe/recipes-support/tree/tree_1.7.0.bb @@ -0,0
> +1,16 @@ +SUMMARY = "This is a handy little utility to display a tree
> view of directories." +HOMEPAGE =
> "http://mama.indstate.edu/users/ice/tree/" +SECTION = "console/utils" 
> +LICENSE="GPLv2" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833" + +inherit
> autotools-brokensep + +SRC_URI =
> "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz \

change that to tree-${PV}.tgz

> +	   file://fix-cross-env.patch \ +	  " + +SRC_URI[md5sum] =
> "abe3e03e469c542d8e157cdd93f4d8a6" +SRC_URI[sha256sum] =
> "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12" + 
> +FILES_${PN}-doc += "${prefix}/man"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUUkOgMkyGM64RGpERAl1xAJ9PiXKuZSheKeib1V/8N3UHKk1AtACgmVlS
au0DIDX3zHLlieCyAW550nE=
=Gh6Q
-----END PGP SIGNATURE-----


