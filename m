Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1IDQtk-00057Y-H1
	for openembedded-devel@openembedded.org; Tue, 24 Jul 2007 22:22:24 +0200
Received: from Powerbook-2.local (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l6OKL8j1010992; Tue, 24 Jul 2007 22:21:08 +0200
Message-ID: <46A65F33.9020808@dominion.kabel.utwente.nl>
Date: Tue, 24 Jul 2007 22:21:07 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 2.0.0.5 (Macintosh/20070716)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org, angstrom-distro-devel@linuxtogo.org
References: <HOECLKEKOHLAMMGDLLBHEEPLLLAA.skoroneos@digital-opsis.com>
In-Reply-To: <HOECLKEKOHLAMMGDLLBHEEPLLLAA.skoroneos@digital-opsis.com>
X-Enigmail-Version: 0.95.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [Angstrom-devel] Angstrom Core Team
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
X-List-Received-Date: Tue, 24 Jul 2007 20:22:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Stelios Koroneos schreef:
> I believe there is a need to formalise things, if we want to move to the
> next step, which IMHO is a "universal" acceptance of OE/Angstrom for
> embedded devices
> The last part is also something that has been puzzling me for sometime now.
> 
> What are the "core" targets of Angstrom as a distribution ?
> At the beggining it looked to me as a PDA targeted distro, the console image
> was bloated

You hit the nail on the head, the console *image* was bloated, not the DISTRO.

> and "unsuitable" for embedded targets with limited resources
> (i.e devices like the wrt, magicbox etc) but with minimal-image and the
> changes it introduced this "bloat" has been removed at a large extend.

Right, a problem was solved by creating a new *image*, not a new DISTRO.

> Still there are issues but now we can get an image that fits on a 4MB flash
> and is working

Don't confuse 'DISTRO' with '<foo>-image', a distro defines policy (e.g EABI for arm,
toolchain, etc), an image content[1][3]. Lots of people get this wrong, so you might see
it repeated a few times in this mail ;)
Historically machines, images and distros were putting random crap in task-bootstrap,
which is why we introduced task-base (and watch it like a bunch of hungry vultures) and
removed task-bootstrap. But that's ancient history now :)


> A lot of the "clone" distro's (and i include ours, OPLinux in that category)
> where created because although we would like to use OE/Angstrom, the bloat
> problem existed

The *images* were bloated, not the DISTRO.

> and also (and most importand) .dev was a fast moving target
> where changes happened at lighting speed

That is indeed a big problem, which we want to tackle from the OE side with regular
tarball releases and autobuilds[2]. See the guadec meeting notes on that.
Suggestions from commercial users are *very* welcome on this subject.

> and there was no control over them (at least from our side).

Do you mean approval-wise or time-wise? I mentioned http://review-board.org/ at guadec,
which would be an option for reviewing invasive changes.

> Having the latest/gratest/cutting edge version is good but a lot of the time
> it means breaking stuff that worked.

That's why anstrom features this:

koen@bitbake:~/OE/monotone/org.openembedded.dev/conf/distro$ grep PREFERRED_VERSION
angstrom-2007.1.conf | wc -l
56

The important stuff is locked down to reduce surprises. For the usual .dev breakage we
can't do much, except publishing changelogs and doing autobuilds.

> If that happens and you are hobbiest doing stuff/coding/hacking on your
> spare time its not a big deal, but if you are a company and need to ship
> things to your client at a certain date and  that happens, its a *big*
> problem.

That's why we need autobuilds for common platforms and targets so we can spot errors early
on. Once spotted we document them and try to fix them.

> There are also, a lot of different needs out there and people have different
> ideas of what "embedded" is, and from experience if you try to cover all of
> these needs you are bound to fail.

That's why we need people from each area to look after that.

> There are people that want OPIE others that want GPE and other that are
> looking for X + custom applications just to mention a few.

Again, don't confuse 'DISTRO' with '<foo>-image'.

> So i believe that among the other things proposed for the core team, would
> be to define what is the  Angstrom goal/targets are, get a stable version
> and define a release cycle.

Before worrying about a release cycle, I'd think about maintenance cycles. How are we
going to support a release? How will we introduce updates? Once the first release is out
we can argue feature-based versus time-based to death, but the maintenance issue needs to
get solved first.
Marcin and I realized that doing updates the familiar- or openzaurus-way is not going to
work for angstrom, so something new needs the be created (or stolen from other distros).

> Without these things clearly defined,people will keep creating "clone"
> distro's of Angstrom whatever you or me think about it and its going to
> spread the availiable resources even thinner.

Most people that create clone distros are confusing 'DISTRO' with '<foo>-image'. We can
solve that with education and dialog.
I'd like to encourage people to write more image recipes that suit their needs which we
can review and try to make more generic. Paul S is doing that for initrd/initramfs recipes
right now.

Currently there are a few situations where a clone is the way to go, e.g. for things
requiring gtk 2.6 like the LiPS/gpephone image. I think we can craft and image that does
exactly that or introduce a flag like ANGSTROM_MODE that automagically does the right
stuff when set in local.conf. But someone needs to figure that out first, so creating a
clone is a good intermediate solution, as long as all sides agree on that.

Personally I'd like to get angstrom running well on things like AVR32, blackfin, small
arm7 systems, etc and also ad-hoc toolchains like msp430, arm-wince-pe and friends. Other
people want it to run on PDAs and phone or routers or set top boxes or server or ... or
... I know angstrom can support all that as a *distro*, but people will need to invest
time and effort into writing reusable tasks and images for that.


I hope people will starting thinking 'images' and not 'DISTRO' from now on :) I know it
requires more effort in the short run, but it pays off in the long run.

One last thing: autobuilds, autobuilds, autobuilds

regards,

Koen

[1] More or less, you get the idea
[2] Depending on the manpower (read: funding of fulltime OE devs) a 'stable' branch is an
option
[3] Don't you love how I further the confusion by creating angstrom-<foo>-image.bb?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFGpl8zMkyGM64RGpERAhvSAKCkRt1dOeEF3qoKtnWxSTfj2NvjtgCfaubE
/dG1Jk3zO88XvD8gWrzMDb0=
=USKm
-----END PGP SIGNATURE-----


