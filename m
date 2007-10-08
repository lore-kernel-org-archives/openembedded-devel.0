Received: from [209.85.146.182] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1IezAy-0001In-T2
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2007 22:26:16 +0200
Received: by wa-out-1112.google.com with SMTP id l24so1963800waf
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2007 13:20:14 -0700 (PDT)
Received: by 10.114.126.1 with SMTP id y1mr1659487wac.1191874814622;
	Mon, 08 Oct 2007 13:20:14 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Mon, 8 Oct 2007 13:20:14 -0700 (PDT)
Message-ID: <f96d234e0710081320s567bf1bfie56eebca83afb6b2@mail.gmail.com>
Date: Mon, 8 Oct 2007 16:20:14 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
MIME-Version: 1.0
References: <1191494488.2516.34.camel@toontown> <4704CC05.40206@klever.net>
	<B9AD73C2-790F-43EE-9FC4-96F1B1FA9415@selfish.org>
	<1191502502.2516.39.camel@toontown>
	<EB5E2840-5F10-45F9-8B97-9FCFDC7F5AAE@selfish.org>
	<D61182AC8012EA4EBC531B3AF23BE10947F630@tranzeo-mail2.12stewart.tranzeo.com>
	<4704F01B.70104@klever.net> <4705D99D.6070209@miromico.ch>
	<f96d234e0710050657lbbf7391tb2437588f9c93d31@mail.gmail.com>
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
X-List-Received-Date: Mon, 08 Oct 2007 20:26:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/5/07, Cliff Brake <cliff.brake@gmail.com> wrote:
> On 10/5/07, Alex <mailinglist@miromico.ch> wrote:
> > Hi all
> >
> > How do I setup my directory structure to use oe for two target boards.
> >
> > I have an AVR32 board and an AT91 board and would like to use oe for
> > both of them with at less dublicated software as possible.

> I'd be interested in hearing how others set up their build directory.

After studying Marcin's build setup, and Koen's autobuilder script,
I've come up with the following which is very similiar to Marcin's
setup.  My needs are:

- track several machines and distros, and possibly in the future
different OE trees, etc
- easily to automatically produce time-stamped snapshot builds (not done yet)
- easy for me to replicate on other machines
- easy for customers to replicate on other machines

With the multimachine, you typically need one build directory per
distro, so the following is what I ended up with:

|-- Makefile
`-- oe
|    `-- custom (bbcollections overlay)
|    `-- org.openembedded.dev
`-- bitbake
`-- downloads
`-- build
    |-- angstrom-2007.1
    |   `-- conf
    |       |-- local.conf
    |       |-- auto.conf
    |       `-- site.conf -> ../../conf/site.conf
    |-- angstrom-2008.1
    |   `-- conf
    |       |-- local.conf
    |       |-- auto.conf
    |       `-- site.conf -> ../../conf/site.conf
    |-- conf
    |   `-- site.conf
    `-- openmoko
        `-- conf
            |-- local.conf
            |-- auto.conf
            `-- site.conf -> ../../conf/site.conf


There is a common site.conf file that contains settings for my build
machine.  local.conf contains the DISTRO variable, and thats about it.
 auto.conf contains MACHINE and uclibc settings and is changed between
builds.

The downside of multimachine is you need to reparse the OE directory
every time you change machine, but the benefit of sharing tmp
directories for a bunch of machines in a distro more than makes up for
that.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


