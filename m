Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JpIuD-0007u8-Jv
	for openembedded-devel@openembedded.org; Fri, 25 Apr 2008 10:03:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3P83ShB020360
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 09:03:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20059-08 for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 09:03:23 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m3P83NZl020352
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Apr 2008 09:03:23 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <f96d234e0804241812le4cf88ekfb805351d61428f4@mail.gmail.com>
References: <f96d234e0804241613j604a4283ofe32c1a8b64ad940@mail.gmail.com>
	<1209079836.28694.1.camel@dax.rpnet.com>
	<f96d234e0804241807p41a127f7j418ae7f80d7408d3@mail.gmail.com>
	<f96d234e0804241812le4cf88ekfb805351d61428f4@mail.gmail.com>
Date: Fri, 25 Apr 2008 09:03:22 +0100
Message-Id: <1209110602.5056.2.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: xfonts, mapfile dir, and pkg-config issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Apr 2008 08:03:43 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit


On Thu, 2008-04-24 at 21:12 -0400, Cliff Brake wrote:
> On Thu, Apr 24, 2008 at 9:07 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> > On Thu, Apr 24, 2008 at 7:30 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
> >  >
> >  >  On Thu, 2008-04-24 at 19:13 -0400, Cliff Brake wrote:
> >  >  > This issue is that "pkg-config --variable=mapdir fontutil" returns:
> >  >  >
> >  >  > /usr/lib/X11/fonts/util
> >  >  >
> >  >  > which is correct if mapdir is used on the target system, but in this
> >  >  > case mapdir is used on the host system during the build, so it really
> >  >  > needs the path to staging.
> >  >  >
> >  >  > We can't modify font-util to put the staging path in fontutil.pc or
> >  >  > insane.class complains about tmdir's in a *.pc file.
> >  >  >
> >  >  > What is the correct solution in this case?
> >  >  >
> >  >  > 1) hardcode EXTRA_OECONF with the MAPFILES_PATH (would require
> >  >  > patching font packages -- bad)
> >  >
> >  >  If you can override from the commandline this may be an option,
> >  >  particularly if all font packages accept the same option and we can use
> >  >  a .inc file.
> >  >
> >  >  The alternative is to patch the configure.ac files so it uses something
> >  >  like:
> >  >
> >  >  $PKG_CONFIG_SYSROOT_DIR`pkg-config --variable=mapdir fontutil`
> 
> Is the the pkgconfig sysroot-support.patch going upstream, or is that
> an OE only thing?

Its gone upstream and was in pkgconfig 0.23. The patch they merged was
broken and I've given them one to fix it but thats a different kind of
problem ;-). So yes, upstreams should take this kind of fix.

Cheers,

Richard



