Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id C235760097
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 10:24:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Xgt5L-00086O-PX for openembedded-devel@lists.openembedded.org;
	Wed, 22 Oct 2014 12:24:07 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 12:24:07 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 12:24:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Oct 2014 12:23:58 +0200
Message-ID: <m280ju$50a$1@ger.gmane.org>
References: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1413971847-8154-1-git-send-email-Hongjun.Yang@windriver.com>
Subject: Re: [meta-oe][PATCH] tree: Add a new package
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
X-List-Received-Date: Wed, 22 Oct 2014 10:24:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hongjun Yang schreef op 22-10-14 11:57:
> From: "Hongjun.Yang" <hongjun.yang@windriver.com>
> 
> Add tree command, some test scripts need it.
> 
> Signed-off-by: Hongjun.Yang <hongjun.yang@windriver.com>
> 
> --- .../tree/tree-1.7.0/fix-cross-env.patch            | 32
> ++++++++++++++++++++++ meta-oe/recipes-support/tree/tree_1.7.0.bb
> | 16 +++++++++++ 2 files changed, 48 insertions(+) create mode 100644
> meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch create mode
> 100644 meta-oe/recipes-support/tree/tree_1.7.0.bb
> 
> diff --git a/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch
> b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch new file
> mode 100644 index 0000000..ccdf635 --- /dev/null +++
> b/meta-oe/recipes-support/tree/tree-1.7.0/fix-cross-env.patch @@ -0,0
> +1,32 @@ +From 7ad835ae0c2b2b311002fda0be2dbf8f17c5a3d5 Mon Sep 17
> 00:00:00 2001 +From: "Hongjun.Yang" <hongjun.yang@windriver.com> +Date:
> Wed, 22 Oct 2014 11:05:35 +0800 +Subject: [PATCH] fix the install path
> change the install path for cross + compile environment. + 
> +Upstream-Status: Pending + +Signed-off-by: Hongjun.Yang
> <hongjun.yang@windriver.com> +--- + Makefile | 4 ++-- + 1 file changed, 2
> insertions(+), 2 deletions(-) + +diff --git a/Makefile b/Makefile +index
> e91f1f6..776f1f3 100644 +--- a/Makefile ++++ b/Makefile +@@ -22,9 +22,9
> @@ CC=gcc + + VERSION=1.7.0 + TREE_DEST=tree +-BINDIR=${prefix}/bin 
> ++BINDIR=${DESTDIR}/${prefix}/bin + MAN=tree.1 
> +-MANDIR=${prefix}/man/man1 ++MANDIR=${DESTDIR}/${prefix}/man/man1 +
> OBJS=tree.o unix.o html.o xml.o json.o hash.o color.o + + # Uncomment
> options below for your particular OS: +-- +1.9.1 + diff --git
> a/meta-oe/recipes-support/tree/tree_1.7.0.bb
> b/meta-oe/recipes-support/tree/tree_1.7.0.bb new file mode 100644 index
> 0000000..b7fc43b --- /dev/null +++
> b/meta-oe/recipes-support/tree/tree_1.7.0.bb @@ -0,0 +1,16 @@ 
> +DESCRIPTION = "This is a handy little utility to display a tree view of
> directories."

This looks more like SUMMARY

> +HOMEPAGE = "http://mama.indstate.edu/users/ice/tree/" +LICENSE="GPLv2" 
> +SECTION = "console/utils" +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"

Please keep LICENSE and LIC_FILES_CHKSUM together.

> + +inherit autotools-brokensep + +FILES_${PN}-doc += "${prefix}/man"

FILES* and R* go below do_install

> + +SRC_URI = "http://mama.indstate.edu/users/ice/tree/src/tree-1.7.0.tgz
> \ +	   file://fix-cross-env.patch \ +	  " + +SRC_URI[md5sum] =
> "abe3e03e469c542d8e157cdd93f4d8a6" +SRC_URI[sha256sum] =
> "6957c20e82561ac4231638996e74f4cfa4e6faabc5a2f511f0b4e3940e8f7b12"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUR4W+MkyGM64RGpERAnKsAJ0UVS3WtlDbYJuvWRIeGGQ6kpP4tgCgu1sz
EpivpXj9lw0NN63JNPzvtB4=
=luch
-----END PGP SIGNATURE-----


