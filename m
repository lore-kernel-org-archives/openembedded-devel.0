Received: from mail-pz0-f177.google.com ([209.85.222.177])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NeWol-0003i2-Ts
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 17:50:39 +0100
Received: by pzk7 with SMTP id 7so5556160pzk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 08:48:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.66.26 with SMTP id o26mr4426667wfa.122.1265647682879; Mon, 
	08 Feb 2010 08:48:02 -0800 (PST)
In-Reply-To: <C791CD9B.22735%jgrant@vml.com>
References: <C791CD9B.22735%jgrant@vml.com>
Date: Mon, 8 Feb 2010 08:48:02 -0800
Message-ID: <18e217241002080848t193add2drd5603d0c252ee509@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.177
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Working with OEMs
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
X-List-Received-Date: Mon, 08 Feb 2010 16:50:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Jeremy,

I brought OE in as my employers build system to replace what was a miserable
set of make files and tarballs. we had several groups placed all over the
world and each location had their own build system and then a final build
system that was used to patch lots of tarballs together. For me (a kernel
engineer) to build the drivers and application stack was nearly impossible.

for us the reasons to use OE were these:
1) keep track of software runtime and build time dependencies.
(staging area is great at forcing developers to only publish the bare
minimum apis and libraries)
2) a consistent way of building and configuring ALL of the software used in
the distrobution
3) decouple the software source and the congiration meta data. helps in
developing portable or reusable code.

We build software for a pretty well known set top box. Since we were already
established with a large distro of software and configuration, we decided to
create a new distribution. we ended up creating 2 directories, one our local
recipes and classes, and one for the standard opensource recipes. (local and
openembedded). In the openembedded recipes, we used any recipes that existed
for versions of software that we were using, but created new recipes (i.e.
cut/paste) for unsupported packages or versions. We also (as Holger
mentioned) used overrides where we could to specify our own configuration or
patches that have to be applied. The intent is push this back out once our
development stablizes.

note that we trimmed down the openembedded directory to only those recipes
that we use so that it does not take so long to parse all the recipes which
takes too much time (though I've been thinking there's got to be a better
way of doing that.)

in our local recipes (those for our own code) we've made a very simple class
that creates a link instead of copying the source code into the work
directory (bypassing the fetch all together). This is a great help for
developers since we are not using a supported source control software and
even so, I don't think the way that the fetchers work wrt to source control
is very developer friendly.

I also recently made a hack to our bitbake to allow dependent recipes to
rebuild when a dependency was rebuilt.

> Holger writes:
> My general suggestion is to use OE only for the tasks it is good. E.g. if
you
> force a developer to use it for application development it can be pretty
> painful on both sides.

- I find it a bit dishartening that Holger does not recommend you to use OE
for software development. One of the main reasons we were in search for a
comprehensive build system was so that we could offer a consistent means of
buliding our entire distribution to all developers and Configurtion Mgmt,
Testing, Release teams alike with out everyone having to be an expert with
all parts of the system (and all different build tools that had cropped up
in the different locations we have engineers - india, US east coast, west
coast). It *is* difficult to make it work for devlopers and build teams
alike, but having a consistent means building software is a huge step
creating a really great build system. Further if people are discouraged from
using OE as a tool for developers, then it will never get any better and
this hole of support in OE will not be filled.

Holger, will all due respect to you and the rest of the list (they have been
the only way I would have been able to get our team switched over to OE -
thank you thank you to everyone on this list), I hope I am misunderstanding
that comment. Further, I wonder if there are others out there who also feel
this way? My understanding is that Monta Vista is using OE; are there voices
on this list from MV or others that use OE for creating a consistent means
of building for developers and Config/Release Managers? If so, what are your
tricks and complaints with respect to this issue.

On Fri, Feb 5, 2010 at 11:28 AM, Jeremy Grant <jgrant@vml.com> wrote:

>   I am currently working on project that we are planning on using
>   openembedded.  We will be using 6 ereader devices initially from 2
>   different manufactures.  One of the manufactures already uses open
>   embedded the other is not.  We are needing to explain to the other OEM
>   why they should be uses open embedded to build the images used on the
>   devices so that all devices are consistent and can pull from one feed
>   source for updates.
>   Here are a few of the requirements I have right now:
>   Must use qt-embedded 4.6.x
>   Would be nice if it can uses arora-e
>   I have a few question on what I should be doing.
>   Should I create my own distribution based on angstrom or just create
>   and image with preferred-versions for the ereaders and used angstrom as
>   the distro?
>   What suggestions does anyone have on working with the OEM that does not
>   uses OE already to help them see why using OE would be beneficial to
>   them?  I find information on why developers and distribution
>   maintainers should uses OE but not much information on how an OEM could
>   create machine.conf to be used with OE or use OE.  I may just have not
>   found the correct presentation or blog that has the information I am
>   looking for.
>   Thanks for any help you can give.
>   Jeremy Grant
>   VML | Lead Systems Administrator
>   2020 Baltimore, Kansas City, MO 64108
>   office: +1.816.218.1956
>   fax: +1.816.472.5234
>   mobile: +1.913.636.1112
>   email: [1]jgrant@vml.com
>
>   Before you print, please think about the environment.
>   Confidentiality Statement This transmission is confidential and
>   intended solely for the party to whom it is addressed. If the reader of
>   this email is not the intended recipient, you are hereby notified that
>   it may contain privileged, confidential and trade secret information,
>   and that any dissemination, distribution, copying or use of the
>   information in this transmission is strictly prohibited. If you have
>   received this transmission in error, please immediately notify the
>   sender at the email address above, and delete all copies of it from
>   your computer.
>
> References
>
>   1. file://localhost/tmp/jgrant@vml.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

