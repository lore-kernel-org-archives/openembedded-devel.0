Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IufOr-0007cv-Dv
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 03:33:13 +0100
Received: by ug-out-1314.google.com with SMTP id m3so14882ugc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 18:31:01 -0800 (PST)
Received: by 10.67.115.19 with SMTP id s19mr1258487ugm.1195611861944;
	Tue, 20 Nov 2007 18:24:21 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id p39sm905481ugd.2007.11.20.18.24.20
	(version=SSLv3 cipher=OTHER); Tue, 20 Nov 2007 18:24:21 -0800 (PST)
Date: Wed, 21 Nov 2007 04:24:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <156157209.20071121042421@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <47436CEE.9020407@kernelconcepts.de>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<4743201F.8000202@am.sony.com> <47436CEE.9020407@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Wed, 21 Nov 2007 02:33:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Florian,

Wednesday, November 21, 2007, 1:25:34 AM, you wrote:

> Hi,

> Tim Bird schrieb:
>> This is nice.  Can someone tell me why this isn't
>> the default behavior of bitbake now?  (I'm honestly
>> not trolling :-)   There must be some good reason
>> to allow bitbake to be used outside of a build
>> directory.

>> Make (which bitbake resembles
>> in some aspects), is sensitive to it's starting
>> directory.  Why not bitbake?

> that's a pretty good point. In my opinion the fact that you need to set
> environment variables in addition to your configuration files is a pain anyway.
> I would expect bitbake to search for all configuration information in
> $PWD/conf/*.conf and that's it.

  Your expectations are wrong, as instead bitbake searches only for a
single file called "conf/bitbake.conf" under list of paths specified by
envvar BBPATH. Anything else happens as directed by that file, and
that's application-level configuration, not bitbake's per se.

  And there're good reasons it does that, which become obvious when
you start to think about it. After all, bitbake.conf is *master*
config, so how are you supposed to get that in *your* $PWD? We don't
talk manual copying here, no? Because it's one thing is to set one
well-defined envvar, and quite another is to shuffle pristine files
around just to get stuff started - the latter is rather non-scalable.

  Also, do you really think such complex system as OpenEmbedded would
allow user to source master config from his location instead of the
system's own? Nope, that would amount to letting user to shoot himself
not even in leg, but straight into head.
  
> That would reduce the initial overhead and makes
> it _much_ easier for new users to get along with OE.

#1

>> TMPDIR = "/OE/tmp/${DISTRO}"
>> No need for seperate build areas.
>> [And] If you use angstrom you can even
>> switch C library ([e]glibc vs uclibc), as outlined in
>> http://www.angstrom-distribution.org/building-angstrom
>> You can even have per distro tweaks using include statements, but I'll
>> leave that as an exercise to the reader. No need for seperate build
>> areas. At all.
> 
> as soon as you are working with multiple builds in parallel or you want to
> specify versions you need multiple build directories.

#2

  So, again conflicting expectations: on the one hand, you call for it
to be easy for users, and on the other hand, you argue with core OE
maintainer, who suggests a clean approach for system setup - you
ignore that, and instead tell that you're going to do it the way you
get used to, thanks to bitbake's flexibility.

  So, what people really want - be forced to adhere to best practices
or left with the easy choice of subverting them for their own
convenience?

  IMHO, where OpenEmbedded should head to is to promoting local.conf
to "advanced" features, left for the people who are able to setup
environment variables. Mere users should be forced to use repository
configs, with the only parameters to vary are DISTRO and MACHINE.

  And yep, those params are still to be passed via environment,
because it's easier to just run:

DISTRO=angstrom MACHINE=collie bitbake x11-image

than:
1. Edit some file somewhere
2. run bitbake

  (But for people who're really not familiar with Unix process environment,
bitbake switches --distro and --machine can be added).


> Greetings

> Florian




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



