Received: from [209.85.128.191] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IfB50-0002Za-O2
	for openembedded-devel@openembedded.org; Tue, 09 Oct 2007 11:08:42 +0200
Received: by fk-out-0910.google.com with SMTP id 18so1626272fks
	for <openembedded-devel@openembedded.org>;
	Tue, 09 Oct 2007 02:02:56 -0700 (PDT)
Received: by 10.82.134.12 with SMTP id h12mr7388134bud.1191920576226;
	Tue, 09 Oct 2007 02:02:56 -0700 (PDT)
Received: by 10.82.120.13 with HTTP; Tue, 9 Oct 2007 02:02:56 -0700 (PDT)
Message-ID: <74d0deb30710090202i61cdd25n22f3519ebfd9147a@mail.gmail.com>
Date: Tue, 9 Oct 2007 11:02:56 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1191918523.470b3bbb10a47@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
	<f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
	<1191918523.470b3bbb10a47@dominion.kabel.utwente.nl>
Cc: openembedded-devel@openembedded.org
Subject: Re: oe for two target boards at the same time
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
X-List-Received-Date: Tue, 09 Oct 2007 09:08:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/9/07, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> Quoting Cliff Brake <cliff.brake@gmail.com>:
>
> > On 10/5/07, Cliff Brake <cliff.brake@gmail.com> wrote:
> > > On 10/5/07, Alex <mailinglist@miromico.ch> wrote:
> > > > Hi all
> > > >
> > > > How do I setup my directory structure to use oe for two target boards.
> > > >
> > > > I have an AVR32 board and an AT91 board and would like to use oe for
> > > > both of them with at less dublicated software as possible.
> >
> > > I'd be interested in hearing how others set up their build directory.
> >
> > After studying Marcin's build setup, and Koen's autobuilder script,
> > I've come up with the following which is very similiar to Marcin's
> > setup.  My needs are:
> >
> > - track several machines and distros, and possibly in the future
> > different OE trees, etc
> > - easily to automatically produce time-stamped snapshot builds (not done yet)
> > - easy for me to replicate on other machines
> > - easy for customers to replicate on other machines
> >
> > With the multimachine, you typically need one build directory per
> > distro, so the following is what I ended up with:
>
> If you only need to build one distro version you can do:
>
> TMPDIR = "/build/tmp/${DISTRO}"
>
> in local.conf
>
>
> > The downside of multimachine is you need to reparse the OE directory
> > every time you change machine, but the benefit of sharing tmp
> > directories for a bunch of machines in a distro more than makes up for
> > that.
>
> If you already built binutils you can remove MACHINE=<foo> from conf files and
> set it in env, e.g. :
>
> MACHINE=c7x0 bitbake mono ; MACHINE=fic-gta01 bitbake mono
>
> that saves you a complete reparse.

Isn't the binutils MACHINE environment variable issue fixed by now?
I only just noticed that I don't know because I have MACHINE?=magician
somewhere and always seem to do the first build without the MACHINE
envvar set...

regards
Philipp


