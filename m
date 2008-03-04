Received: from [78.47.116.26] (helo=drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1JWWDh-00035G-9K
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Mar 2008 13:26:14 +0100
Received: from andromeda (e180186093.adsl.alicedsl.de [85.180.186.93])
	by drlauer-research.com (Postfix) with ESMTP id 340E3584C5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2008 13:31:32 +0100 (CET)
From: Michael 'Mickey' Lauer <mickey@vanille-media.de>
Organization: Vanille-Media
To: openembedded-devel@lists.openembedded.org
Date: Tue, 4 Mar 2008 13:25:12 +0100
User-Agent: KMail/1.9.9
References: <200803041240.17891.thomas.cooksey@trolltech.com>
	<200803041320.04220.thomas.cooksey@trolltech.com>
In-Reply-To: <200803041320.04220.thomas.cooksey@trolltech.com>
MIME-Version: 1.0
Message-Id: <200803041325.12624.mickey@vanille-media.de>
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Missing includes in STAGING_INCDIR
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Mar 2008 12:26:20 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 04 March 2008 13:20:04 Tom Cooksey wrote:
> > > I am writing a recipie for Qt/Embedded 4.4 beta (using qt4 recipies as
> > > a base). At the moment Qt's configure test fails on dbus. I have added
> > > -I${STAGING_INCDIR}/dbus-1.0 to the configure flags so the configure
> > > test now picks up dbus/dbus.h correctly.
> > >
> > > However, dbus.h itself includes dbus/dbus-arch-deps.h, which is not in
> > > ${STAGING_INCDIR}/dbus-1.0/*, but _is_ in the dbus work dir. This means
> > > I have to add the dbus work dir to the include list, which feels wrong.
> >
> > Surely that's wrong. Actually dbus-arch-deps.h is where it belongs to,
> > ${libdir}/dbus-1.0/include/. On my favourite system this is:
> >
> > tmp/staging/arm-angstrom-linux-gnueabi/lib/dbus-1.0/include/dbus/dbus-arc
> >h-deps.h
>
> Ok, yes, I have this too. Why the two different include paths? Surely
> ${STAGING_INCDIR}/dbus-1.0/ is useless without the other?

Don't ask me, this is what upstream decided to do.

> > > I have had the same problem with gstreamer too. I think something has
> > > broken recently, as I've tried building the existing qtopia core
> > > recipies and had the same failures.
> >
> > Just rely on pkgconfig and it will do the job. The relevant excerpt for
> > dbus is:
>
> Ah... we disable pkgconfig when cross-compiling. ;-) It usually uses the
> host's includes and libraries due to most toolchains shipping with broken
> .pc files. We thought the compiler spitting out "Can't find ..." is better
> than "... binary is incompatable". It looks like OE runs .pc files through
> sed, is this to fix the same issue?

Exactly. We think pkgconfig has a lot of value and rather attempted to fix it 
(by sed'ing the .pc files) than to circumvent it. I advise you to do the 
same.

> I'll add ${libdir}/dbus-1.0/include to the configure line. Is libdir or
> STAGING_LIBDIR the best to use?

This would be ${STAGING_LIBDIR}/dbus-1.0/include.

> Ideally this would go into the mkspec file
> for the cross-compiler. Otherwise, it will be passed to the host compiler
> too (Not that the host compiler's used much with qmake & friends built
> seperatly).
>
> I might look into changing the current "patch the mkspecs/common/*" way of
> doing things to actually installing a proper mkspec for the OE cross
> compiler. Would you have any objection to this?

Not at all -- if it's done in a sane way that doesn't break our existing 
applications using qmake.

> Also, as cross-compiling is supported on Qt/Embedded, I'm doing things "the
> qt way" rather than using the cross-compile patch the other qt4 packages
> use. Don't want to patch the source if I don't need to.

Sounds good. We disabled Qt/E thinking it cross-compiles because the configure 
script was doing more harm than good in that case. If you can fix it, we are 
happy.

:M:

-- 
Dr. Michael 'Mickey' Lauer | IT-Freelancer | http://www.vanille-media.de


