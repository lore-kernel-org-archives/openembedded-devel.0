Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IIVjA-0007U4-77
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2007 22:32:28 +0200
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id 98FBA412343
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2007 15:29:58 -0500 (CDT)
Message-ID: <0d9701c7d931$7b8e0b80$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight><200708070822.03530.openembedded@hrw.one.pl><1186476730.5653.6.camel@localhost.localdomain><0cf301c7d8d3$4d422cb0$6e01a8c0@twilight>
	<1186489672.5653.28.camel@localhost.localdomain>
Date: Tue, 7 Aug 2007 15:28:14 -0500
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
X-List-Received-Date: Tue, 07 Aug 2007 20:32:28 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

----- Original Message ----- 
From: "Richard Purdie" <rpurdie@rpsys.net>
To: <openembedded-devel@openembedded.org>
Sent: Tuesday, August 07, 2007 7:27 AM
Subject: Re: [oe] STAGING_LIBDIR_NATIVE needed in bitbake.conf


> I'm convinced, it make sense. Feel free to add STAGING_LIBDIR_NATIVE and
> then use it in the ncurses bb file (maybe mention in a comment there is
> a util used in do_install which needs to find libraries from
> ncurses-native).
>
> In fact this raises the question of whether that should be set globally?

It seems logical to me that it should be global -- if something lives in
STAGING_BINDIR_NATIVE, it stands to reason that it should prefer to link to
shared libraries that have been staged along with it.  Making this global
(by manually setting LD_LIBRARY_PATH before a build) has been tested by a
number of folks on different distros, and works fine.

Just to satisfy my own curiosity, I did a bit of checking with ldd on the
contents of STAGING_BINDIR_NATIVE, and it reveals that for SlugOS, only the
ncurses build is affected at present.

So we could go either way.

I edited bitbake.conf and added:

    export LD_LIBRARY_PATH_prepend = "${STAGING_LIBDIR_NATIVE}:"

but that doesn't seem to have any effect.  :-(  I presume that the logic is
missing to handle this variable.  Using:

    export LD_LIBRARY_PATH = "${STAGING_LIBDIR_NATIVE}"

works fine, though.  However, that line ignores the existing
LD_LIBRARY_PATH, and I've not found the magic incantation to make bitbake do
the shell equivalent of
LD_LIBRARY_PATH="/new/prepended/path:$LD_LIBRARY_PATH".  Everything obvious
I've tried with my limited bitbake skills has resulted in something
complaining about the expansion in some way.

  I would prefer to leave ncurses.bb alone, and fix it globally -- how
should we do that, then: pursue the "_prepend" approach, or just explicitly
set it in bitbake.conf?

  Or is there a nice class somewhere that we can add some logic to do this
(I didn't find it yet!)?

Thanks,
Mike (mwester)




