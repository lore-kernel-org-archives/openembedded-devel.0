Received: from [141.2.4.18] (helo=mail.tm.informatik.uni-frankfurt.de)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <mickey@tm.informatik.uni-frankfurt.de>)
	id 1GNTKx-0007gM-So for openembedded-devel@lists.openembedded.org;
	Wed, 13 Sep 2006 13:55:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id A3A8D8A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2006 13:51:56 +0200 (CEST)
Received: from mail.tm.informatik.uni-frankfurt.de ([127.0.0.1])
	by localhost (mail [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 17331-09 for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2006 13:51:38 +0200 (CEST)
Received: from [141.2.14.64] (gandalf.tm.informatik.uni-frankfurt.de
	[141.2.14.64])
	by mail.tm.informatik.uni-frankfurt.de (Postfix) with ESMTP id A7FBF8A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Sep 2006 13:51:38 +0200 (CEST)
From: Michael 'Mickey' Lauer <mickey@tm.informatik.uni-frankfurt.de>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
References: <74d0deb30609122310t64dc8b51wecfa7749806be097@mail.gmail.com>
	<1158139503.5540.10.camel@localhost.localdomain>
	<74d0deb30609130352p4c1c38cdk5415c04d1e0d3035@mail.gmail.com>
Organization: VanilleMedia
Date: Wed, 13 Sep 2006 13:51:38 +0200
Message-Id: <1158148298.25907.5.camel@gandalf.tm.informatik.uni-frankfurt.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.7.2.1-3mdv2007.0 
X-Virus-Scanned: by amavisd-new at tm.informatik.uni-frankfurt.de
Subject: Re: machine-specific udev packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Sep 2006 11:55:28 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Am Mittwoch, den 13.09.2006, 12:52 +0200 schrieb pHilipp Zabel:
> On 9/13/06, Richard Purdie <rpurdie@rpsys.net> wrote:
> > On Wed, 2006-09-13 at 08:10 +0200, pHilipp Zabel wrote:
> > > I only recently noticed that udev packages are machine specific now
> > > due to the machine specific mount.blacklist file. It looks like most
> > > machines blacklist the same devices, namely:
> > >
> > > /dev/mtdblock*
> > > /dev/loop*
> > > /dev/ram*
> > >
> > > Only spitz and slugos differ significantly.
> > > (/dev/hda* on spitz, hd[a-z], sd[a-z] on slugos)
> > >
> > > I'd like to add /dev/mtdblock to the default mount.blacklist and
> > > remove the specialization for akita, amsdelta, c7x0, h2200,
> > > ipaq-pxa270 and tosa.
> > >
> > > Is there any good way to avoid spitz and slugos specific udev packages
> > > that are only due mount.blacklist? Maybe this could be part of
> > > base-files or some other package?
> >
> > Personally, I'd like to see several things happen. Firstly, if these
> > lists are going to be machine specific, lets move them to something like
> > base-files and make sure the scripts can survive without them. This
> > means udev stops being machine specific. Alternatively, we create a new
> > machine specific package if people don't want the extra file in
> > base-files.
> >
> > Secondly, I'd prefer to see this change to a whitelist approach.
> 
> I agree.
> It is certainly better to have udev not mount anything dynamically
> unless a mount.whitelist (provided by machine specific base-files)
> exists than the other way around.
> I'm all for including the whitelist in base-files, are there reasons
> not to do it?

Base-files already is concerned with filesystem issues (fstab etc.)
and is a required package, so it sounds like an appropriate place to me.

> Definitely. As mount.sh grows in size and functionality, aren't we
> starting to duplicate pmount?

Good point.

> btw,
> http://www.openembedded.org/repo/org.openembedded.dev/packages/udev/files/mount.sh
> returns a 403

D'oh. no .sh file is getting displayed anyway.

-- 
Regards,

Michael 'Mickey' Lauer | FreeLancer | http://www.Vanille-Media.de




