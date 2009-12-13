Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1NJpJL-0000nU-LK
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Dec 2009 15:20:38 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id AF89E1D36078; Sun, 13 Dec 2009 15:18:49 +0100 (CET)
Date: Sun, 13 Dec 2009 15:18:49 +0100
From: Petr =?iso-8859-2?Q?=A9tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091213141849.GG17995@ibawizard.net>
References: <1260618520.3373.23.camel@mattotaupa.wohnung.familie-menzel.net>
	<20091212173311.GA3730@rhein.zuhause.netz>
	<1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
MIME-Version: 1.0
In-Reply-To: <1260711980.3110.21.camel@mattotaupa.wohnung.familie-menzel.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: package VDR for OE
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
X-List-Received-Date: Sun, 13 Dec 2009 14:20:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Paul Menzel <paulepanter@users.sourceforge.net> [2009-12-13 14:46:20]:

> Thank you! I tried this
> 
>         +-INCLUDES = -I/usr/include/freetype2
>         ++INCLUDES = -I${STAGING_INCDIR}/freetype2
> 
> but the `${STAGING_INCDIR}` was not expanded. The result is the
> following.
> 
>         INCLUDES = -I${STAGING_INCDIR}freetype2
> 
> Using an absolute path worked.
> 
> Could you please point out my mistake?

Maybe, it's because you don't have STAGING_INCDIR variable available in
do_compile() step. If I were you, I would grep for STAGING_INCDIR variable in
other recipes: grep -R STAGING_INCDIR recipes/* and you should get idea how to
use it. Hint, change :

INCLUDES = -I${STAGING_INCDIR}freetype2

to 

INCLUDES = ${CFLAGS}

and in your recipe do:

CFLAGS_append  += " -I${STAGING_INCDIR}/freetype2"

> Furthermore is there a better way for upstream to set things up so that
> no patching is needed? Or is autotools needed for this?

No for this hardcoded paths.

> +--- vdr/Makefile~fixpaths	2009-10-18 15:59:25.000000000 +0200
> ++++ vdr/Makefile	2009-12-13 12:28:22.000000000 +0100
> +@@ -21,7 +21,7 @@
> + BINDIR   = $(PREFIX)/bin
> + LOCDIR   = ./locale
> + LIBS     = -ljpeg -lpthread -ldl -lcap -lrt -lfreetype -lfontconfig
> +-INCLUDES = -I/usr/include/freetype2
> ++INCLUDES = -I/srv/oe/angstrom-dev/staging/armv7a-angstrom-linux-gnueabi/usr/include/freetype2

Maybe you've overlooked that, but it's unacceptable hardcoded path...

-- ynezz


