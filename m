Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1L5lvl-0004Pb-Lh
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 Nov 2008 19:49:37 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 4A99D146C001
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2008 19:46:33 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200811271553.34260.valentin.longchamp@epfl.ch>
References: <200811271142.31596.valentin.longchamp@epfl.ch>
	<1227785234.15027.53.camel@hammer.suse.cz> <ggm16o$feq$1@ger.gmane.org>
	<200811271553.34260.valentin.longchamp@epfl.ch>
Date: Thu, 27 Nov 2008 19:46:32 +0100
Message-Id: <1227811592.15027.327.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
Subject: Re: sanity test problems at end of build
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
X-List-Received-Date: Thu, 27 Nov 2008 18:49:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Valentin Longchamp wrote:

> > > Could you comment TMPDIR out and then rebuild your image from scratch?
> >
> > That theory has already been debunked. Not setting TMPDIR opens up a
> > whole other can of worms.

> Well, maybe it has been debunked, but it did the trick for me ... but I really 
> don't understand why.

Do you have a copy of the build dir of ncurses of failed build? Can you
compare them? Are files in image and install subdirs correct (i. e. no
reference to staging dir)? Does temp/run.do_install correct code to fix
la files? Recipe seems to call autotools_do_install, which should fix
it.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



