Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IILCh-0000zP-EQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2007 11:18:16 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 38858411D75
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2007 04:15:48 -0500 (CDT)
Message-ID: <0cf301c7d8d3$4d422cb0$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight><200708070822.03530.openembedded@hrw.one.pl>
	<1186476730.5653.6.camel@localhost.localdomain>
Date: Tue, 7 Aug 2007 04:14:04 -0500
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1807
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1896
Subject: Re: STAGING_LIBDIR_NATIVE needed in bitbake.conf
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
X-List-Received-Date: Tue, 07 Aug 2007 09:18:19 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

----- Original Message ----- 
From: "Richard Purdie" <rpurdie@rpsys.net>
To: <openembedded-devel@openembedded.org>
Sent: Tuesday, August 07, 2007 3:52 AM
Subject: Re: [oe] STAGING_LIBDIR_NATIVE needed in bitbake.conf


> On Tue, 2007-08-07 at 08:22 +0200, Marcin Juszkiewicz wrote:

> > It should be done in classes/native.bbclass not in ncurses-native. The
> > problem is wider as there are few distributions which have host versions
> > of stuff other then OE use as native. As a result building of native
> > stuff which depend on native libraries can fail - when you will set
> > LD_LIBRARY_PATH in native.bbclass then it should work.
>
> Just to be clear, this is a problem with ncurses-native? If so,
> STAGING_LIBDIR_NATIVE == STAGING_LIBDIR due to native.bbclass anyway so
> we don't need the _NATIVE version?

No, this is a problem with ncurses, not ncurses-native.  The issue arises
because ncurses-native builds a utility (dynamically linked), and stages
same along with it's library.  This staged utility is executed during the
do_install task of ncurses itself, and that's the point at which it fails if
LD_LIBRARY_PATH is not set.  It's gone unnoticed, I suspect, because up to
recently the utility has successfully dynamically linked to the host's copy
of that library instead of the one in staging.

So LD_LIBRARY_PATH needs only to be set for ncurses, not for ncurses-native
(but since ncurses-native includes ncurses, it ends up set (harmlessly) for
ncurses-native as well).

> We'd only need a _NATIVE version if our cross compiled packages needed
> to reference something there explicitly (like they do some of the
> binaries). DoO we need to do that (and if so, which package and why)?

I think they do -- how else do the dynamically-linked executables in staging
find their shared libraries?

Of course, using staticly-linked executables in staging will solve *this*
problem -- but it creates major headaches for utilities such as fakeroot,
which require that everything be dynamically-linked.

> Setting LD_LIBRARY_PATH for native.bbclass sounds like a worthwhile
> experiment...
>
> Cheers,
>
> Richard


Thanks,
Mike (mwester)



