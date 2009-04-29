Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LzEAq-0007xQ-8V
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 20:06:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id C3BF91409729
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 19:35:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUWIVhC5ZNsK
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 19:35:08 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id A72BF1416BA5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 19:34:46 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090429164500.GE18788@smtp.west.cox.net>
References: <1240945982.12505.23.camel@utx.utx.cz>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7A7@hiob.intern.dresearch.de>
	<49F8463B.7040102@balister.org>
	<20090429141544.GZ18788@smtp.west.cox.net>
	<1241022375.4064.21.camel@hammer.suse.cz>
	<20090429164500.GE18788@smtp.west.cox.net>
Date: Wed, 29 Apr 2009 19:32:25 +0200
Message-Id: <1241026345.4064.45.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1.1 
Subject: Re: [PATCH] gcc_4.2.4.bb: QA Issue: No GNU_HASH in theelf binary
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
X-List-Received-Date: Wed, 29 Apr 2009 18:06:24 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Tom Rini wrote:
> > +	sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.in ${S}/Makefile.tpl

> I'll pull this in locally, and build everything today.  Just need to
> have the buildbot finish the failure on everything first.

Well, without "if test -f" it will fail for gcc-4.4.0. This one would be
safer for the final commit. Patching each gcc version separately would
be even more safe, but also more work.

Note: gcc-4.4.0 already contains exactly this fix.

diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index e88cee5..f468a6b 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -74,6 +74,9 @@ do_configure () {
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
 	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
+	# gcc before 4.4.0 ignores LDFLAGS:
+	if test -f ${S}/Makefile.in ; then sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.in ; fi
+	if test -f ${S}/Makefile.tpl ; then sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.tpl ; fi
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 
 	# splice our idea of where the headers live into gcc's world

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



