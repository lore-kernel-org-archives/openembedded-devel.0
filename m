Received: from [128.131.95.14] (helo=belief.htu.tuwien.ac.at)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <jin@mediatomb.cc>) id 1JPgQh-0004KK-Au
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2008 16:55:19 +0100
Received: by belief.htu.tuwien.ac.at (Postfix, from userid 10004)
	id 937A183900; Thu, 14 Feb 2008 16:55:08 +0100 (CET)
Date: Thu, 14 Feb 2008 16:55:08 +0100
From: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080214155508.GA4163@deadlock.dhs.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15 (2007-04-06)
Subject: building uClinux using OE
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
X-List-Received-Date: Thu, 14 Feb 2008 15:55:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I'd like to be able to build uClinux using OE and I hope to gather some
pointers to the right direction.

I think it would generally be a nice thing to have, so I would like to do
the work in a way that it could be incorporated in OE, provided that you 
guys are interested.

According to the post below the toolchain should not be a problem:
http://mailman.uclinux.org/pipermail/uclinux-dev/2007-May/042993.html
"uClinux development on ARM now uses a standard arm-linux targeted tool chain. 
 We add the elf2flt tool, but it is otherwise a standard arm-linux toolchain."

As far as I know the uClinux/ARM kernel patches are already in the mainline:
http://opensrc.sec.samsung.com/

uClibc is also already supported by OE, not sure if I would have to add
an option for uC-libc.

So basically it seems that almost everything that is needed is already there.

What is missing?

- applying elf2flt processing to produced binaries

- have a way of knowing that the particular build is done for the uClinux
  targets (maybe for some tweaks in .bb files if required or to apply patches
  only when necessary, allthough ifdef __uClinux__ defines could be used)

- not sure what else?

I do not have any uClinux experience yet, and it seems to be quite difficult
to gather all the bits and pieces of information, so I'd appreciate comments 
and suggestions, especially if you see that I am missing something.

I'd also be interested in your thoughts on what would be the best way to
integrate it into OE.

Kind regards,
Jin




