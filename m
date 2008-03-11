Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JZ1kw-0007DR-Ga
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Mar 2008 11:30:53 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id BED7E6280C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Mar 2008 11:28:53 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200803110959.59702.zecke@selfish.org>
References: <200803051942.12586.mickey@vanille-media.de>
	<1204748132.8110.165.camel@dax.rpnet.com>
	<200803110959.59702.zecke@selfish.org>
Date: Tue, 11 Mar 2008 11:29:00 +0100
Message-Id: <1205231340.4210.10.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.21.91 
X-SA-Exim-Connect-IP: 82.119.242.94
X-SA-Exim-Mail-From: utx@penguin.cz
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: sysroot vs. finding header files
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
X-List-Received-Date: Tue, 11 Mar 2008 10:30:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> On Wednesday 05 March 2008 21:15:32 Richard Purdie wrote:
> > Hi Mickey,
> >
> > On Wed, 2008-03-05 at 19:42 +0100, Michael 'Mickey' Lauer wrote:
> > [...]
> >
> > > With pkgconfig now pointing to /usr (and friends), this no longer finds a
> > > keysymdef.h until you have X on your buildhost.
> > >
> 
> > b) I've not seen any other package do anything that insane
> 
> aeh? finding a certain header file is quite common.. let us see how things 
> work here. also I'm just slowly groking sysroot. It would be nice to know 
> when and where certain path's get mapped away from /usr/include to something 
> else...

Here is a small difference:
Most configure.in authors are happy with AC_CHECK_HEADER and
AC_CHECK_HEADERS. These works with sysroot out of the box, as the check
uses compiler flags.

But here it is searching for the exact location of keysymdef.h, not
supported by AC_CHECK*. It actually needs to process it by a different
tool than C compiler to generate custom header. So they need own check.

I see few clean fixes:

1) Do some cpp magic and preprocess the output. Such approach will not
need any notice about sysroot, but looks like an overkill.

2) Tell them that sysroot is a good feature and they should support it
in this check.

3) Introduce official support of sysroot in autotools. For example for
AC_CHECK_FILE it is the only solution. Ideally, all configure files
should have --sysroot option automatically and should be aware of
SYSROOT (or similar) variable in exactly the same way it is now aware of
CFLAGS et co.

-- 
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus




