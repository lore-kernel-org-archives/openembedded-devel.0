Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JWWf8-0003V4-Mr
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 13:54:35 +0100
Received: from localhost (localhost [127.0.0.1])
	by hoat.troll.no (Postfix) with ESMTP id DDA395815D
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 13:52:30 +0100 (CET)
Received: from hoat.troll.no ([127.0.0.1])
	by localhost (hoat.troll.no [127.0.0.1]) (amavisd-maia,
	port 10024) with LMTP
	id 09275-03-2 for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 13:52:29 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id 8D13B581A7
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 13:52:29 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m24CrBb6003873
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Mar 2008 13:53:11 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Tue, 04 Mar 2008 13:53:11 +0100 (CET)
Date: Tue, 4 Mar 2008 13:56:51 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803041356.51830.thomas.cooksey@trolltech.com>
In-Reply-To: <200803041325.12624.mickey@vanille-media.de>
References: <200803041240.17891.thomas.cooksey@trolltech.com>
References: <200803041320.04220.thomas.cooksey@trolltech.com>
References: <200803041325.12624.mickey@vanille-media.de>
x-scalix-Hops: 1
Organization: Trolltech
User-Agent: KMail/1.9.7
MIME-Version: 1.0
X-Virus-Scanned: Maia Mailguard 1.0.2a
X-SA-Exim-Connect-IP: 62.70.27.150
X-SA-Exim-Mail-From: tcooksey@trolltech.com
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
X-List-Received-Date: Tue, 04 Mar 2008 12:54:36 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Disposition: inline

> > > > I have had the same problem with gstreamer too. I think something has
> > > > broken recently, as I've tried building the existing qtopia core
> > > > recipies and had the same failures.
> > >
> > > Just rely on pkgconfig and it will do the job. The relevant excerpt for
> > > dbus is:
> >
> > Ah... we disable pkgconfig when cross-compiling. ;-) It usually uses the
> > host's includes and libraries due to most toolchains shipping with broken
> > .pc files. We thought the compiler spitting out "Can't find ..." is better
> > than "... binary is incompatable". It looks like OE runs .pc files through
> > sed, is this to fix the same issue?
> 
> Exactly. We think pkgconfig has a lot of value and rather attempted to fix it 
> (by sed'ing the .pc files) than to circumvent it. I advise you to do the 
> same.

Yup, we like pkgconfig too, saves us a lot of work. :-) Sadly, we have to support 
qt being built on 3rd party toolchains we have no access to and therefore no
way to modify. pkg-config caused a headache for support so we've dropped it
by default when cross-compiling. Hopefully we'll re-enable it in the future as
the pkg-config devs seem to be working on the problem, providing an env 
variable you can use to set a sysroot prefix (PKG_CONFIG_SYSROOT).

> 
> > I'll add ${libdir}/dbus-1.0/include to the configure line. Is libdir or
> > STAGING_LIBDIR the best to use?
> 
> This would be ${STAGING_LIBDIR}/dbus-1.0/include.
> 
> > Ideally this would go into the mkspec file
> > for the cross-compiler. Otherwise, it will be passed to the host compiler
> > too (Not that the host compiler's used much with qmake & friends built
> > seperatly).
> >
> > I might look into changing the current "patch the mkspecs/common/*" way of
> > doing things to actually installing a proper mkspec for the OE cross
> > compiler. Would you have any objection to this?
> 
> Not at all -- if it's done in a sane way that doesn't break our existing 
> applications using qmake.
Well, I'll try to bodge it into the configure line for now. If that fails, I'll dig deeper. Do
you have any examples of packages which use qmake I can test with? snes9x seems
to inherit from qmake_base?

> 
> > Also, as cross-compiling is supported on Qt/Embedded, I'm doing things "the
> > qt way" rather than using the cross-compile patch the other qt4 packages
> > use. Don't want to patch the source if I don't need to.
> 
> Sounds good. We disabled Qt/E thinking it cross-compiles because the configure 
> script was doing more harm than good in that case. If you can fix it, we are 
> happy.
Will do my best. :-)


Cheers,

Tom




