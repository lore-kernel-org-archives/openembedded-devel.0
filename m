Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IJo82-00062P-GH
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Aug 2007 12:23:34 +0200
Received: by fk-out-0910.google.com with SMTP id 18so957473fks
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Aug 2007 03:20:34 -0700 (PDT)
Received: by 10.82.174.20 with SMTP id w20mr4880233bue.1186827634678;
	Sat, 11 Aug 2007 03:20:34 -0700 (PDT)
Received: by 10.82.117.9 with HTTP; Sat, 11 Aug 2007 03:20:34 -0700 (PDT)
Message-ID: <74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
Date: Sat, 11 Aug 2007 12:20:34 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1186761021.6405.45.camel@localhost.localdomain>
MIME-Version: 1.0
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
	<1186761021.6405.45.camel@localhost.localdomain>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Sat, 11 Aug 2007 10:23:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/10/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> Hi,
>
> On Fri, 2007-08-10 at 15:22 +0200, pHilipp Zabel wrote:
> > while looking for the cause of several -dbg packages being included in
> > my latest angstrom-x11-image builds, I noticed that some task packages
> > have -dev, -doc and
> > -dbg versions in the deploy directories because they don't set PACKAGES.
> >
> > To improve consistency, I propose to add a small task.bbclass that does set
> > ALLOW_EMPTY="1", PACKAGES="${PN}" and PACKAGE_ARCH="all".
> > That way simple task recipes can just "inherit task".
> > (If needed, this could be enhanced later with a python script to automatically
> > add -dbg packages that RRECOMMEND the -dbg versions of packages that
> > the main package RDEPENDs upon.)
>
> Creating the -dev and -dbg packages for task packages is intentional.
> The python code to create the RRECOMMENDS you mention already exists in
> the form of depchains in package.bbclass.

Ah, great. I guessed something similar would have to exist, as the process would
be pretty much the same as for usual -dbg packages, right?

> I know this works in poky as its how we create development and debugging
> images, I can't remember whether it was enabled in OE.dev or not but the
> code is there...

I was just wondering because most of the packages that explicitly set
the PACKAGES variable in OE overwrite it completely, thus disabling
-dev and -dbg.
The code you speak of is not enabled for OE.dev as far as I can see,
for example all angstrom -dbg task packages have the same dependencies
as the main ones.
How can I enable this?

> Also, not all task packages are PACKAGE_ARCH = "all" although I guess
> they'll be explicitly marked anyway.

Yes, and in a few places PACKAGE_ARCH is set to "${MACHINE_ARCH}" although
it should be kept at "all" and only some subpackages should be marked
as machine specific. I think "all" is a sane default.

Now my question is, do you, too, like the idea of introducing another
bbclass for those defaults? :)
I guess it should to something like
PACKAGES = "${PN} ${PN}-dbg ${PN}-dev" or not touch packages at all,
if the code also works for -doc and -locale and enable that code,
however it is done.

regards
Philipp


