Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6F02C60D2D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 11:30:43 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06BUTh6016148; Mon, 6 Jan 2014 11:30:30 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LqTJT1VtDCAB; Mon,  6 Jan 2014 11:30:29 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06BUPPo016141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 6 Jan 2014 11:30:26 GMT
Message-ID: <1389007821.6559.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 06 Jan 2014 11:30:21 +0000
In-Reply-To: <52CA8BFC.1000002@vollmann.ch>
References: <52C9DCCB.5070602@vollmann.ch> <2452646.bnugQMsZpK@helios>
	<52CA8BFC.1000002@vollmann.ch>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: ASSUME_PROVIDED += sqlite3-native doesn't work
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2014 11:30:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-06 at 11:57 +0100, Detlef Vollmann wrote:
> On 01/06/14 10:46, Paul Eggleton wrote:
> > Hi Detlef,
> >
> > On Sunday 05 January 2014 23:29:31 Detlef Vollmann wrote:
> >> Specifying "ASSUME_PROVIDED += sqlite3-native" doesn't work,
> >> as pseudo-native explicitely requires SQLite headers in
> >> ${STAGING_DIR_NATIVE}.
> >> Am I missing something or is this a bug?
> >
> > I don't think we'd consider this a bug. Basically, if you play around with
> > ASSUME_PROVIDED and stuff breaks, you're on your own.
> I agree that's my problem if my provided version doesn't have
> the same functionality as the one built by OE (as e.g. pseudo and
> fakeroot).
> However, if ASSUME_PROVIDED doesn't work just because a package
> that depends on it (here pseudo) hardcodes the location of
> sqlite3 to be in the OE staging tree, then that's really annoying.
> 
> > In most cases it's safer
> > to build our own versions of things rather than relying on them being
> > available on the build host, particularly if you want things to continue to
> > work on different host distributions.
> That's true.  But my case is different: all our developers use the
> same host distribution (otherwise a lot of other things will fail anyway).
> Building the standard meta-toolchain produces a huge number of
> packages, and it's hard to convince our admins that all those
> packages really need to go into our local package repo.
> So I'm trying to get down to a reasonable number of packages by using
> the standard packages provided by the common host distribution.
> This is, what ASSUME_PROVIDED is for.
> But this is not possible if recipes are written in a way that
> defeat the purpose of ASSUME_PROVIDED :-(

In an ideal world the recipe wouldn't do that I agree. In reality there
was probably some need to do it. We might be able to get away with a
pkgconfig call instead which would then better autoselect as you're
after it to. Feel free to send patches but they mustn't break the
default use case.

I would suggest that using ASSUME_PROVIDED like this is not really the
best way to use the system. You'd be much better off using something
like a sstate cache for the native recipes you want to provide. You
could even use the "locked sstate" patches I posted recently on the
OE-Core list to lock those to specific sstate checksums.

You could also use the buildtools tarball to install a set of natives
like pseudo which would be much more compatible with the system than
taking them from the host. The tarball is relocatable and can be
installed into your homedir so you don't have to involve sysadmins to
make it work.

We have done a lot of work trying to optimise out -native dependencies
where we can, and trying to optimise the process so they ones we need
first have as minimal dependencies as we can make them.

Cheers,

Richard




