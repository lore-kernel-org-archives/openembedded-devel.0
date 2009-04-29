Received: from [84.21.108.25] (helo=ns.penguin.cz ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1LzCh3-0007ud-6X
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Apr 2009 18:31:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 8D0291409734
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 18:28:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jZe7mF84IMQA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 18:28:36 +0200 (CEST)
Received: from [10.20.1.86] (unknown [82.119.242.94])
	by ns.penguin.cz (Postfix) with ESMTP id 647EF1409731
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Apr 2009 18:28:36 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090429141544.GZ18788@smtp.west.cox.net>
References: <1240945982.12505.23.camel@utx.utx.cz>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF7A7@hiob.intern.dresearch.de>
	<49F8463B.7040102@balister.org>
	<20090429141544.GZ18788@smtp.west.cox.net>
Date: Wed, 29 Apr 2009 18:26:15 +0200
Message-Id: <1241022375.4064.21.camel@hammer.suse.cz>
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
X-List-Received-Date: Wed, 29 Apr 2009 16:31:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Tom Rini wrote: 
> On Wed, Apr 29, 2009 at 08:21:15AM -0400, Philip Balister wrote:
> > Sledz, Steffen wrote:

> >> Fix works for me. But it would be nice if some members of the core team could ack it.
> >
> > Does anyone see any downside for this patch? Have other people tested  
> > it? I hate blind acking things.
> 
> Khem has a patch for this issue too but wants to test it more.

I just tested another way to fix. It looks like a gcc bug - LDFLAGS nor
LDFLAGS_FOR_TARGET are not used in gcc/Makefile.

diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configure-common.inc
index e88cee5..9ede6a2 100644
--- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -73,7 +73,18 @@ do_configure () {
 	export CPPFLAGS_FOR_BUILD="${BUILD_CPPFLAGS}"
 	export CXXFLAGS_FOR_BUILD="${BUILD_CXXFLAGS}"
 	export LDFLAGS_FOR_BUILD="${BUILD_LDFLAGS}"
 	export ARCH_FLAGS_FOR_TARGET="${ARCH_FLAGS_FOR_TARGET}"
+	sed -i 's/^LDFLAGS = $/LDFLAGS = @LDFLAGS@/' ${S}/Makefile.in ${S}/Makefile.tpl
 	(cd ${S} && gnu-configize) || die "failure running gnu-configize"
 
 	# splice our idea of where the headers live into gcc's world


My previous patch built the whole feed. But I did not test it with
canadian recipes.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



