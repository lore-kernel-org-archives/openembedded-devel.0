Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <lgirdwood@gmail.com>) id 1NYGof-0002UI-VB
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 11:32:41 +0100
Received: by ewy5 with SMTP id 5so1103764ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 02:30:20 -0800 (PST)
Received: by 10.213.109.88 with SMTP id i24mr3520887ebp.22.1264156219837;
	Fri, 22 Jan 2010 02:30:19 -0800 (PST)
Received: from ?10.200.221.6? (host81-136-218-57.in-addr.btopenworld.com
	[81.136.218.57])
	by mx.google.com with ESMTPS id 10sm3115321eyd.37.2010.01.22.02.30.17
	(version=SSLv3 cipher=RC4-MD5); Fri, 22 Jan 2010 02:30:18 -0800 (PST)
From: Liam Girdwood <lrg@slimlogic.co.uk>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ec1f3d401001212332i6062141ej86abe243cd7858d4@mail.gmail.com>
References: <ec1f3d400911270337wbbbcae8gab291075d242c9d9@mail.gmail.com>
	<19c1b8a90912100944g4b405319v6e121ebf03449f0b@mail.gmail.com>
	<ec1f3d400912110347x365c0873i9d03b58d02cbf735@mail.gmail.com>
	<19c1b8a90912110925k5e8063b7wdc160af7eb29fb2a@mail.gmail.com>
	<ec1f3d401001050143o2cdfb989x119ea3dd6352f4ed@mail.gmail.com>
	<19c1b8a91001050954m5f002c66s7a282c1382a2dcea@mail.gmail.com>
	<ec1f3d401001200350g9fb8480h1ed53a8ee4a90e0@mail.gmail.com>
	<19c1b8a91001201656g6fd1751bvc2a478b2d4c9ef8c@mail.gmail.com>
	<ec1f3d401001210353j1802eb6am9d931438e3db1302@mail.gmail.com>
	<1264075631.9743.178.camel@mill.internal.reciva.com>
	<ec1f3d401001212332i6062141ej86abe243cd7858d4@mail.gmail.com>
Date: Fri, 22 Jan 2010 10:30:16 +0000
Message-ID: <1264156216.3094.87.camel@odin>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 209.85.219.213
X-SA-Exim-Mail-From: lgirdwood@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: cortex-a9 build failure at glibc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
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
X-List-Received-Date: Fri, 22 Jan 2010 10:32:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-01-22 at 13:02 +0530, RK Raggit wrote:
> > That instruction is "ldcl 11, cr0, [fp, #-140]", which looks like a VFP
> > double precision instruction.  Do you have floating point hardware on
> > your platform, and is it enabled in the kernel?
> >
> > p.
> >
> >
> 
> You are right Phil. I have a Neon FPU but it was disabled in the kernel
> configuration.I am able to boot and get a shell now.
> 

Fwiw, I now have a console image building for cortex-a9 using glibc
instead of eglibc with the following conf :-

gcc -> 4.4.2
binutils -> 2.20
glibc ->2.10.1

I've pushed it here if anyone is interested :-

http://git.slimlogic.co.uk/cgi-bin/cgit.cgi/oe.git/log/?h=omap4

Liam



