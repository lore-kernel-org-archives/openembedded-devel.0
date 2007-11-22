Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IvI0y-0006Mm-JB
	for openembedded-devel@openembedded.org; Thu, 22 Nov 2007 20:47:09 +0100
Received: from [192.168.2.90] (0x55532124.adsl.cybercity.dk [85.83.33.36])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id lAMJietU012169;
	Thu, 22 Nov 2007 20:44:46 +0100
From: Esben Haabendal <eha@doredevelopment.dk>
To: Paul Sokolovsky <pmiscml@gmail.com>
In-Reply-To: <1496857094.20071121195713@gmail.com>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl> <4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<1195626057.11679.7.camel@localhost>
	<1496857094.20071121195713@gmail.com>
Organization: Dore Development ApS
Date: Thu, 22 Nov 2007 09:40:50 +0100
Message-Id: <1195720850.20614.13.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
Cc: openembedded-devel@openembedded.org
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
X-List-Received-Date: Thu, 22 Nov 2007 19:47:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Wed, 2007-11-21 at 19:57 +0200, Paul Sokolovsky wrote:
> Hello Esben,
> 
> Wednesday, November 21, 2007, 8:20:57 AM, you wrote:
> 
> []
> 
> >> The question is how to fix this problem correctly.
> >> One possibility would be that bitbake, if BBPATH is unset, issues a
> >> warning and scans the file system (starting from the $PWD) for a
> >> certain file (local.conf) in which BBPATH would be specified.
> 
> > Something like that would be nice. When bitbake finds BBPATH unset, it
> > traverses from $PWD to / to find a .bbenv (or some other filename, but
> > local.conf is probably not a good one), which can setup BBPATH,
> > PYTHONPATH, OEDIR or whatever env virables is used in the
> > conf/local.conf file.
> 
>   LOL. So, editing .bashrc is hard, while creating and editing some
> obscure file is easy?

No, they are very much the same. And that is not the issue here.

The issue is as Rod also describes, the possibility to switch between
different OE build setups by switching directory. Further on, my
proposal would not dictate you to be in a specific directory, ie. the
build dir, to make bitbake behave as expected, but allow you to go to
any subdir of the build dir and have the same behavior as with the
current .bashrc or ". ./setup-env" approach.

> > To guard against bad bitbake versions (as BBPATH
> > is unset, bitbake can be expected to be picked up from a generic PATH)
> > it might be smart to introduce a variable in local.conf stating specific
> > or minimum version requirements for bitbake.
> 
>   ... Ah, and it comes at the expense yet?

Nothing is free. And I am certain that if it turns out the be a real
problem that people depend on different specific bitbake versions (I am
sorry, I don't know if this is a common situation today...), then we can
find a solution.

> > Would there by any problems in extending bitbake calling convention in
> > this way?
> 
>   Yes. Occam's blade. There's nothing to extend for. "man bash" will
> make everyone who does it an expert not only in bitbake, but in Unix
> way of doing stuff at all. After that, it will be much easier to
> decide if something worth fixing, if yes, then why, and finally, how.

I really fail to see your point here. Are you meaning to say that the
current solution with setting environment variables in .bashrc or
setup-env makes anybody a Unix expert?  I believe that all the other
skills require to work with OE is more demanding, so that this is not a
good reason for any kind of in-convenience.

Best regards,
Esben

-- 
Esben Haabendal
Embedded Software Consultant, Dore Development ApS
Phone: +45 5192 5393  Email: eha@doredevelopment.dk



