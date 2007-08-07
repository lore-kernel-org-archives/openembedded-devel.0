Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IIOCw-0005VG-Gh
	for openembedded-devel@openembedded.org; Tue, 07 Aug 2007 14:30:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l77CRxTk007820
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Aug 2007 13:27:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07605-04 for <openembedded-devel@openembedded.org>;
	Tue,  7 Aug 2007 13:27:56 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l77CRrFL007810
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Aug 2007 13:27:53 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <0cf301c7d8d3$4d422cb0$6e01a8c0@twilight>
References: <03d301c7d853$58ec39f0$6e01a8c0@twilight>
	<200708070822.03530.openembedded@hrw.one.pl>
	<1186476730.5653.6.camel@localhost.localdomain>
	<0cf301c7d8d3$4d422cb0$6e01a8c0@twilight>
Date: Tue, 07 Aug 2007 13:27:52 +0100
Message-Id: <1186489672.5653.28.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 07 Aug 2007 12:31:00 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2007-08-07 at 04:14 -0500, Mike (mwester) wrote:
> > On Tue, 2007-08-07 at 08:22 +0200, Marcin Juszkiewicz wrote:
> > Just to be clear, this is a problem with ncurses-native? If so,
> > STAGING_LIBDIR_NATIVE == STAGING_LIBDIR due to native.bbclass anyway so
> > we don't need the _NATIVE version?
> 
> No, this is a problem with ncurses, not ncurses-native. 

Ok, fair enough, I wondered but wasn't sure. its clear now :)

> > We'd only need a _NATIVE version if our cross compiled packages needed
> > to reference something there explicitly (like they do some of the
> > binaries). DoO we need to do that (and if so, which package and why)?
> 
> I think they do -- how else do the dynamically-linked executables in staging
> find their shared libraries?

I'm convinced, it make sense. Feel free to add STAGING_LIBDIR_NATIVE and
then use it in the ncurses bb file (maybe mention in a comment there is
a util used in do_install which needs to find libraries from
ncurses-native).

In fact this raises the question of whether that should be set globally?

Cheers,

Richard



