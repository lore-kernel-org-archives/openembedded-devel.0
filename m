Received: from [64.233.182.189] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IuWJA-0003pZ-9D
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Nov 2007 17:50:44 +0100
Received: by nf-out-0910.google.com with SMTP id h3so1784287nfh
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 08:48:34 -0800 (PST)
Received: by 10.82.112.3 with SMTP id k3mr16767408buc.1195549947210;
	Tue, 20 Nov 2007 01:12:27 -0800 (PST)
Received: by 10.82.120.17 with HTTP; Tue, 20 Nov 2007 01:12:27 -0800 (PST)
Message-ID: <74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
Date: Tue, 20 Nov 2007 10:12:27 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4742217C.9060506@whitby.id.au>
MIME-Version: 1.0
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl> <4742217C.9060506@whitby.id.au>
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
X-List-Received-Date: Tue, 20 Nov 2007 16:50:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Nov 20, 2007 12:51 AM, Rod Whitby <rod@whitby.id.au> wrote:
> Koen Kooi wrote:
> > David Farning schreef:
> >> $make setup
> >
> > nice
> >
> >> $make build-package-vim
> >
> > $deity just killed a few hundred kittens.
> >
> > At OEDEM we decided that we won't tolerate kindergarten-like,
> > hand-holding wrappers around bitbake. Typing 'bitbake vim' isn't rocket
> > science. To paraphrase Mickey: "If typing 'bitbake <foo>' is too hard,
> > you shouldn't be using OE".
>
> The challenge I put to yourself and a couple of other people from the OM
> core team in IRC a couple of weeks or months ago still stands:
>
> Show how you can use bitbake such that you can cd into a build area, and
> type a *single* bitbake command to do a build, then cd into a different
> build area (with a different distro and machine) and type a *single*
> bitbake command to do a build there.  No other commands are allowed.
>
> At the moment, you need to set many environment variables before bitbake
> can do it's job, and you need to reset them when you move into a
> different area to do a different build.  That's the reason why there are
> makefile wrappers around simple bitbake commands.

So why not provide a simple shell wrapper instead of setup-env and the
Makefile's build-package-% part? That way, at least people would learn
the correct bitbake syntax from the beginning.

$ cat ~/bin/bitbake
#!/bin/sh
export OEDIR=${OEDIR:-$PWD}
export BBPATH=${BBPATH:-$OEDIR/build:$OEDIR/openembedded}
/usr/local/bin/bitbake $*

> If we can fix the underlying problem (needing to type more than one
> command to build an image with bitbake), then I will fully support a
> move to get rid of all bitbake wrappers from all the Makefiles that I
> manage.

The question is how to fix this problem correctly.
One possibility would be that bitbake, if BBPATH is unset, issues a
warning and scans the file system (starting from the $PWD) for a
certain file (local.conf) in which BBPATH would be specified.

regards
Philipp


