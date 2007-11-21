Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IuizT-0002OT-IR
	for openembedded-devel@openembedded.org; Wed, 21 Nov 2007 07:23:15 +0100
Received: from [192.168.2.90] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAL6Kv4t003463
	for <openembedded-devel@openembedded.org>;
	Wed, 21 Nov 2007 07:21:02 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl> <4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
Organization: Dore Development ApS
Date: Wed, 21 Nov 2007 07:20:57 +0100
Message-Id: <1195626057.11679.7.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 06:23:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Tue, 2007-11-20 at 10:12 +0100, pHilipp Zabel wrote:
> On Nov 20, 2007 12:51 AM, Rod Whitby <rod@whitby.id.au> wrote:
> > Koen Kooi wrote:
> So why not provide a simple shell wrapper instead of setup-env and the
> Makefile's build-package-% part? That way, at least people would learn
> the correct bitbake syntax from the beginning.
> 
> $ cat ~/bin/bitbake
> #!/bin/sh
> export OEDIR=${OEDIR:-$PWD}
> export BBPATH=${BBPATH:-$OEDIR/build:$OEDIR/openembedded}
> /usr/local/bin/bitbake $*
> 
> > If we can fix the underlying problem (needing to type more than one
> > command to build an image with bitbake), then I will fully support a
> > move to get rid of all bitbake wrappers from all the Makefiles that I
> > manage.
> 
> The question is how to fix this problem correctly.
> One possibility would be that bitbake, if BBPATH is unset, issues a
> warning and scans the file system (starting from the $PWD) for a
> certain file (local.conf) in which BBPATH would be specified.

Something like that would be nice. When bitbake finds BBPATH unset, it
traverses from $PWD to / to find a .bbenv (or some other filename, but
local.conf is probably not a good one), which can setup BBPATH,
PYTHONPATH, OEDIR or whatever env virables is used in the
conf/local.conf file. To guard against bad bitbake versions (as BBPATH
is unset, bitbake can be expected to be picked up from a generic PATH)
it might be smart to introduce a variable in local.conf stating specific
or minimum version requirements for bitbake.

Would there by any problems in extending bitbake calling convention in
this way?

/Esben

-- 
Esben Haabendal
Embedded Software Consultant, Dore Development ApS
Phone: +45 5192 5393  Email: eha@doredevelopment.dk



