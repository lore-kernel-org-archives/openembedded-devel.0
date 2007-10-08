Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1Ieo1a-0007Yg-0L
	for openembedded-devel@openembedded.org; Mon, 08 Oct 2007 10:31:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l988PwjM008862
	for <openembedded-devel@openembedded.org>;
	Mon, 8 Oct 2007 09:25:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08579-07 for <openembedded-devel@openembedded.org>;
	Mon,  8 Oct 2007 09:25:55 +0100 (BST)
Received: from [192.168.3.6] ([192.168.3.6]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l988PiGq008856
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Mon, 8 Oct 2007 09:25:51 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <c384c5ea0710051256k6d224986o6644f2e44918ed2e@mail.gmail.com>
References: <F38DEABE0E171746B133C1ABBD142D97071112B2@radmail.Radstone.Local>
	<1191601344.17230.22.camel@localhost.localdomain>
	<a7f8874a0710051002y3a6a4d83t9a9a008fff91532b@mail.gmail.com>
	<c384c5ea0710051256k6d224986o6644f2e44918ed2e@mail.gmail.com>
Date: Mon, 08 Oct 2007 09:25:42 +0100
Message-Id: <1191831943.25900.2.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: SVN fetcher behaviour
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
X-List-Received-Date: Mon, 08 Oct 2007 08:31:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-10-05 at 21:56 +0200, Leon Woestenberg wrote:
> On 10/5/07, Hans Henry von Tresckow <hvontres@gmail.com> wrote:
> > The default of "1" is set in conf/bitbake.conf. The reason for this is that
> > any svn recipe without an explicit SRCREV set will cause parsing to fail if
> > the build machine or the svn server is off line. If you can live with this
> > limitation, then you could comment that line out to get the default
> > behavior.
> >
> But I think what was asked if a default can be set that (a) does not
> break parsing when servers are unreachable; and (b) does fetch HEAD
> instead of revision 1.

The answer to this is that its not possible. We need to be able to
connect to the server to work out which version we're going to build and
set a sane PV value. Nothing else inbetween will work *properly* given
the way OE/Bitbake works.

Cheers,

Richard





