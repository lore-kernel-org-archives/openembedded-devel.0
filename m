Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <rpurdie@rpsys.net>) id 1GNHIe-0001V2-BA
	for openembedded-devel@openembedded.org; Wed, 13 Sep 2006 01:04:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8CN0eCe028349;
	Wed, 13 Sep 2006 00:00:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28201-05; Wed, 13 Sep 2006 00:00:38 +0100 (BST)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.6) with ESMTP id k8CN0Za5028343
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Wed, 13 Sep 2006 00:00:35 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <4506F6A1.2030201@am.sony.com>
References: <200609121228.26077.openembedded@hrw.one.pl>
	<4506F6A1.2030201@am.sony.com>
Date: Wed, 13 Sep 2006 00:00:39 +0100
Message-Id: <1158102039.5552.80.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Paid support offer
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
X-List-Received-Date: Tue, 12 Sep 2006 23:04:16 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2006-09-12 at 11:04 -0700, Tim Bird wrote:
> I am interested.  The CE Linux Forum is using OE for our Test Lab, but
> we have some difficulties with it.  Maybe you can help us solve some
> of these difficulties.
> 
> Here are some specifics:
>  * we wish to create our own distribution with fairly minimal footprint
>  but including a number of test packages.  Specifically, we have added an
>  LTP package to our system, but have not (to my knowledge) pushed this
>  upstream to OE.  We would like assistance with adding, modifying and maintaining
>  packages:
>   * would like an X11-less python package - to support test scripts on target
>   written in python (but where the target does not have any graphical support).

OE's python does not require X11. Some of the python sub modules need it
so a standard python build will build X11. Python itself will not
require it at runtime. Only the particular python modules which need X11
will have that dependency. If you don't install/use those particular
pyton modules, you won't need X11 and that won't get installed.

If you wanted to avoid building X11 at build time, that is slightly
different you could easily remove the X11 modules from the python build
but building a few extra things at build time hasn't been seen as much
of a problem when it doesn't affect the runtime dependencies.

>   * would like a drop-bear that supports root access with no password
>   (There's a patch for this, but we have not integrated it into our system yet)

As you note, that functionality already exists.

>   * would like to add several test packages (here are some candidates, in no particular order):
> aiostress  fio         kernbench  reaim     sleeptest  tbench
> bonnie     fsx         lmbench    scrashme  unixbench
> dbench     interbench  selftest  stress

I agree these would be very nice to have.

>  * we would also like to set up and maintain a source snapshot mirror.
> I have a sources fetch running nightly now on a dedicated machine in
> our test lab (grabbing the sources for a 'bootstrap-image' distro.  But I
> have not yet set up the rsync to move the snapshot files to a large server
> where I can publish them on the web.  I don't think much remains to finish
> this effort, but I don't have time to do it myself.

There have been several people working on different bits of that puzzle.
This functionality is something that will be discussed at OEDEM and I
will post a separate email with some thoughts on this subject. Recent
developments to allow concurrent task execution in bitbake should also
help with this. Hopefully, we can put something together quite quickly
to enable people to do this.

>  * an RPM package with minimal elements that can be used to begin working
>  with our OE-based distribution.  I have found that OE has a very large list of
>  pre-requisites, and is very difficult to set up on my local machine.  An installer
>  program which resolves these difficulties would be very useful.  Users of my testlab
>  will download and build OE software on their local machines, and this needs to be
>  turn-key if possible.

The issue is this is very distribution dependent. I know I could
relatively easily write a list of packages to apt-get on ubuntu but that
won't help your average redhat user. Are all your testlab users using
the same distribution?

With my company hat on for a moment, depending on your needs, I should
also mention OpenedHand (http://www.o-hand.com/) is available for
support of OpenEmbedded and/or Poky (http://projects.o-hand.com/poky).
Poky is basically a stabilised subset of the OE metadata which we offer
direct support on. Its currently undergoing development with a number of
new features that aren't on the website yet such an ARM development and
emulation environment through QEMU as well as x86 support. Its synced
with OE so OE gets benefits from poky and vice versa. 

Note that I don't want to poach work from Marcin, or be seen to be
trying to do that. Marcin is probably in a good position to help Tim but
perhaps there are other people out there Poky might appeal to. I think
the services on offer are different and will appeal to different people
with different needs and in a way the offerings more compliment each
other. This kind of information is something we really need to add to
the OE website.

I agree with some of the other posts about needing a plan for the future
and for communication between various parties to make sure we all know
where things are going and everyone's needs are accounted for.

Speaking personally, at present I do a lot more unpaid work in my spare
time on OE/bitbake/Zaurus Kernels than I do on paid projects like Poky
and with time I'm hoping that will change. I think the future is bright
and I have a lot of ideas of how things can grow but finding time to
implement them all is proving tricky! :)

Regards,

Richard



