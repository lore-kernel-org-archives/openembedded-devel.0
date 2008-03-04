Received: from [62.70.27.150] (helo=hoat.troll.no)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tcooksey@trolltech.com>) id 1JWW5W-0006gt-C7
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 13:17:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by hoat.troll.no (Postfix) with ESMTP id 8FBF5580AB
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 13:15:42 +0100 (CET)
Received: from hoat.troll.no ([127.0.0.1])
	by localhost (hoat.troll.no [127.0.0.1]) (amavisd-maia,
	port 10024) with LMTP
	id 02740-05 for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 13:15:41 +0100 (CET)
Received: from sx01.troll.no (sx01.troll.no [62.70.27.21])
	by hoat.troll.no (Postfix) with ESMTP id 1DB645812C
	for <openembedded-devel@openembedded.org>;
	Tue,  4 Mar 2008 13:15:41 +0100 (CET)
Received: from sx01.troll.no (localhost.localdomain [127.0.0.1])
	by sx01.troll.no (8.13.8/8.13.8) with ESMTP id m24CGNX9020099
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 4 Mar 2008 13:16:23 +0100
Received: from tomdev.troll.no (tomdev.troll.no [10.3.5.39])
	by sx01.troll.no (Scalix SMTP Relay 11.3.0.11339)
	via ESMTP; Tue, 04 Mar 2008 13:16:23 +0100 (CET)
Date: Tue, 4 Mar 2008 13:20:04 +0100
From: Tom Cooksey <thomas.cooksey@trolltech.com>
To: openembedded-devel@openembedded.org
Message-ID: <200803041320.04220.thomas.cooksey@trolltech.com>
In-Reply-To: <200803041247.39758.mickey@vanille-media.de>
References: <200803041240.17891.thomas.cooksey@trolltech.com>
References: <200803041247.39758.mickey@vanille-media.de>
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
X-List-Received-Date: Tue, 04 Mar 2008 12:17:50 -0000
Content-Type: text/plain;
	charset="US-ASCII"
Content-Disposition: inline

> > I am writing a recipie for Qt/Embedded 4.4 beta (using qt4 recipies as a
> > base). At the moment Qt's configure test fails on dbus. I have added
> > -I${STAGING_INCDIR}/dbus-1.0 to the configure flags so the configure test
> > now picks up dbus/dbus.h correctly.
> >
> > However, dbus.h itself includes dbus/dbus-arch-deps.h, which is not in
> > ${STAGING_INCDIR}/dbus-1.0/*, but _is_ in the dbus work dir. This means I
> > have to add the dbus work dir to the include list, which feels wrong.
> 
> Surely that's wrong. Actually dbus-arch-deps.h is where it belongs to, 
> ${libdir}/dbus-1.0/include/. On my favourite system this is:
> 
> tmp/staging/arm-angstrom-linux-gnueabi/lib/dbus-1.0/include/dbus/dbus-arch-deps.h

Ok, yes, I have this too. Why the two different include paths? Surely 
${STAGING_INCDIR}/dbus-1.0/ is useless without the other?

> > I have had the same problem with gstreamer too. I think something has
> > broken recently, as I've tried building the existing qtopia core recipies
> > and had the same failures.
> 
> Just rely on pkgconfig and it will do the job. The relevant excerpt for dbus 
> is:

Ah... we disable pkgconfig when cross-compiling. ;-) It usually uses the host's includes
and libraries due to most toolchains shipping with broken .pc files. We thought
the compiler spitting out "Can't find ..." is better than "... binary is incompatable".
It looks like OE runs .pc files through sed, is this to fix the same issue?

I'll add ${libdir}/dbus-1.0/include to the configure line. Is libdir or STAGING_LIBDIR
the best to use? Ideally this would go into the mkspec file for the cross-compiler.
Otherwise, it will be passed to the host compiler too (Not that the host compiler's
used much with qmake & friends built seperatly).

I might look into changing the current "patch the mkspecs/common/*" way of doing 
things to actually installing a proper mkspec for the OE cross compiler. Would you 
have any objection to this?

Also, as cross-compiling is supported on Qt/Embedded, I'm doing things "the qt way"
rather than using the cross-compile patch the other qt4 packages use. Don't want
to patch the source if I don't need to.


Cheers,

Tom



