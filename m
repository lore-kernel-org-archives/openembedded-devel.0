Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JNurG-0004GS-SI
	for openembedded-devel@openembedded.org; Sat, 09 Feb 2008 19:55:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m19Itegk029302;
	Sat, 9 Feb 2008 18:55:40 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29014-04; Sat,  9 Feb 2008 18:55:36 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m19ItYCc029295
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 9 Feb 2008 18:55:34 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <20080209134850.13fe8d93@widy.localdomain>
References: <20080129014117.60ed9f77@widy.localdomain>
	<1201565225.4687.98.camel@localhost.localdomain>
	<20080209134850.13fe8d93@widy.localdomain>
Date: Sat, 09 Feb 2008 18:55:33 +0000
Message-Id: <1202583333.7981.17.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Setting default IMAGE_FSTYPES to tar.gz in	bitbake.conf
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
X-List-Received-Date: Sat, 09 Feb 2008 18:55:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Paul,

On Sat, 2008-02-09 at 13:48 +0200, Paul Sokolovsky wrote:
> > On Tue, 2008-01-29 at 01:41 +0200, Paul Sokolovsky wrote:
> > This has been discussed before and I'd like to see that changed. The
> > complication is that "bitbake image" is meant to give a sane default
> > image for a given machine without any tweaking by the user and a load
> > of machines depend on the jffs2 default. 
> 
> Unfortunately, this is not achievable and not sustainable goal. It's
> not achievable because there's no single criteria for "sane", it
> depends first of all on user's needs. So, trying to make adhoc choices
> instead of user would mean that for some group of users they will be
> unpredictable and thus insane. So, it would make more sense to use "not
> insane" criteria instead and use some neutral, well-known format, which
> is why this RFC is being made.

Often there is an obvious format which makes sense for a given machine.
For qemu, its ext2, at least in Poky where the scripts to run the images
expect that. For my c7x0 its jffs2 for spitz its a tgz etc.

I agree that not everyone is going to want these formats in every case,
thats why its a "soft" ?= setting and not a hard set one.

> And those above is why it's not sustainable - now it comes that to
> achieve that goal it takes to be a machine expert, etc. etc. Of course,
> noone is expert in all machines, some people are not experts in the
> machine they add/hack on, all people can not know something, make
> mistakes and wrong choices, etc. In the end and overall, presence of
> jffs2 in specific machine's config turns out to be rather random
> matter. 

No, its not random. jffs2 is the default image format that makes sense
on say a c7x0 or akita since thats what its reflash utils accept and
what the Angstrom install notes assume is used on that device.

> We may want to rethink that to be based on more firm grounds.
> One possible way:
> 
> 1. IMAGE_FSTYPES is not a machine config variable.

No, I want it to have a sane value for machines where it makes sense. It
doesn't make sense in all cases but where it does, it hurts nothing to
set it.

> 2. IMAGE_FSTYPES is a top-level parameter specified by user. User needs
> specific format, user requests it. There's a default though offering
> least surprise as integrated over user base - i.e. neutral, well-known
> format.

This "neutral" offering being a tgz? Thats useless to boot my c7x0. I
want OE to produce something usable, I don't want to have to change my
IMAGE_FSTYPES every time I change machine.

> 3. Alternatively, a *distro* may constrain a way in which images are
> used, and thus force a particular image format. So, for a dumb headless
> router machine, one distro will try to follow vendor's way and generate
> images in an adhoc format. Yet another for the same machine will assume
> that bootloader was replaced with some generic one and will use generic
> flash image format like jffs2. And yet another will be intended for the
> people who soldered few wires at the appropriate place and use bit-bang
> to boot from SD.

The DISTRO can override the machine if it wishes now with no change to
OE, that is up to the distros concerned. That doesn't stop machines from
having sane defaults.

> Well, as usual, thoughts aloud. I'm going to add 
> IMAGE_FSTYPES ?= "jffs2" to the machines from your 1st list to get
> matter going.

ok.

Cheers,

Richard





