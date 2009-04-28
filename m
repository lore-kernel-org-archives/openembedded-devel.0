Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1Lyson-0003lx-O5
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Apr 2009 21:18:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 77E981409730
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 21:15:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w3H5SoYHATVD
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 21:15:20 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 49BAF1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2009 21:15:20 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <69E6C70090A0A14498CC98FAE5E06B6E3CF796@hiob.intern.dresearch.de>
References: <49F59B68.1010208@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF793@hiob.intern.dresearch.de>
	<20090427134352.GE18788@smtp.west.cox.net> <gt4ekt$ba2$1@ger.gmane.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF796@hiob.intern.dresearch.de>
Date: Tue, 28 Apr 2009 21:13:02 +0200
Message-Id: <1240945982.12505.23.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.1.1 
Subject: Re: [PATCH] gcc_4.2.4.bb: QA Issue: No GNU_HASH in the elf	binary
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
X-List-Received-Date: Tue, 28 Apr 2009 19:18:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Sledz, Steffen wrote:
> > > It's in all gcc versions, really.
> >=20
> > No, it isn't:
> >=20
> > NOTE: package gcc-4.3.3-r0: task do_build: completed

I can confirm the failure in the default angstrom build for spitz from
the last week. Linking of gcc wrapper and few other utilities reported
the standard GNU_HASH QA error.

Here is a possible fix or work-around. It's tested and it works, but
maybe it is not fully correct.

It may be one of following problems. I did not search deeper which one
is true:
- Ignoring LDFLAGS passed to configure
- LDFLAGS x LDFLAGS_FOR_TARGET clash
- =EF=BB=BFLDFLAGS_FOR_TARGET are not set in cross builds of native gcc c=
ompiler
  (i. e. not canadian)

diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-confi=
gure-common.inc
index e88cee5..ef42210 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -73,6 +73,7 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD=3D"${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD=3D"${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD=3D"${BUILD_LDFLAGS}"
+	export CC=3D"${CC} ${LDFLAGS}"
 	export ARCH_FLAGS_FOR_TARGET=3D"${ARCH_FLAGS_FOR_TARGET}"
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
=20


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



