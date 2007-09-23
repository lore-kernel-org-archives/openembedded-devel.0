Received: from [66.249.82.225] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1IZPZB-0004HP-VL
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Sep 2007 13:24:02 +0200
Received: by wx-out-0506.google.com with SMTP id h27so951923wxd
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Sep 2007 04:19:48 -0700 (PDT)
Received: by 10.90.53.16 with SMTP id b16mr4528399aga.1190546388818;
	Sun, 23 Sep 2007 04:19:48 -0700 (PDT)
Received: by 10.90.66.15 with HTTP; Sun, 23 Sep 2007 04:19:48 -0700 (PDT)
Message-ID: <c384c5ea0709230419n7542c911v27a389539421e454@mail.gmail.com>
Date: Sun, 23 Sep 2007 13:19:48 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46F587F7.4060501@balister.org>
MIME-Version: 1.0
References: <46F587F7.4060501@balister.org>
Subject: Re: How should OE be used?
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
X-List-Received-Date: Sun, 23 Sep 2007 11:24:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Philip, all,

On 9/22/07, Philip Balister <philip@balister.org> wrote:
> [...]
> For now, I'd like to focus on working out how people use OE and what
> issues they have. Once we understand what problems exist, if any, we can
> discuss solutions.
>


I became an OE user when I found that OE automated a lot more than
buildroot when I started adding packages. After that experience I
decided to use OE at work.

At work we create firmware, which is read-only embedded software which
the user cannot install to, or modify in any way (other than
overwrite) for 24/7 99.999% availability applications. Also, no build
dependency on target availability during build: No on-target
post-install scripts, the final image must be fully host-created. That
means, having full control of what happens, minimal cruft. Must build
on a multiple of (modern) Linux hosts distro's.

Bottom-line: paranoid control freak approach

I am the OE evangelist, that is, had to persuade to have my co-workers
see the benefits of using OE. That worked best when I showed them how
I could solve a problem more quickly than they could with buildroot,
or LFS. The problem often remains the steep learning curve, i.e.
people do often have some Makefile/autoconf experience but not
necessarely python/bitbake.

Bottom line: Show when OE works when the 'problem solving' leverage is highest.

How do we use OpenEmbedded:

- We cannot afford to follow the org.oe.dev. head developments. The
head is where fixes get fixed. Takes too much time away from the
developers.
- We cannot afford to follow head, but fix package versions. The OE
framework (bitbake, variables, behaviour) changes too much.
- We pick a fixed OE revision and stick with it during a project
(could be 2 years).
- I try to track OE head on several targets, to stay up-to-date when I
need to start a new project.
- Some of the packages have too much build and/or run-time
dependencies. Yes, both.
- We create a private overlay of minimal-configured packages and
discard redundant dependencies, we keep it in CVS (yes, I know...)
- We add our custom packages to our private overlay.
- I bring some new packages or fixes upstream, only for head.
- We do not use task-base approach, because it builds dependencies we
did not have before (a dependency regression).
- We have to keep good track of bitbake version, OE revision, private
overlay revision and host distro version, and know-good-combos'. We
need to be able fix a bug in the firmware in three years without any
regression. Virtual machines help.

Bottom line:

- OpenEmbedded works perfectly for our use, if we take very much care
in the way we use it. We might not do things the OE-way, simply we may
lack in-depth knowledge, or exposure to it.

Issues:
- Dependencies. The standard OE config seems targetted towards small
(handheld) computing devices, not necessarely with embedded software.
Everything with an installer is non-embedded software, IMHO.

-> I would like to see a OE group focus on minimal dependency distro.
I would join such a group, but cannot do that alone.

- Angstrom seems the de-facto distro OE is tested against, at least
upstream. Angstrom is excellent, but testing OE against Angstrom only
drives OE away from the embedded domain IMHO.

-> Unbitrot (Refresh) a distro other than Angstrom, preferably a more
minimal one.

- Documentation.
-> It's there, but you have to know what you are looking for. Most
people don't know, or don't look.

- I have yet to see a developer walk in with OE experience. Buildroot
knowledge is a big plus though.


The best thing I would envision (and I would propose as a OE vision),
is that OE would be funded by the semiconductor and board
manufacturers to support their silicon and boards,
so that in 3 years, everyone of them could mention "Enabled by OpenEmbedded".

My two cents,

Leon.


