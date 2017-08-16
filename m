Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f176.google.com (mail-ua0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA9F78373
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 16:12:45 +0000 (UTC)
Received: by mail-ua0-f176.google.com with SMTP id r9so6255089uad.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 09:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qNrQBz5uBAiBXujPYbneqF58d+b8XuQeLRCOC/F2B60=;
	b=YGbEumu53gCHeUJ/r4qxqC1rz+iaGQGUQaqLMFN+uKYXwWlOeRXVaqKbQFKolO7ixn
	0YTsBvnNTTpp09Ucr8iXcGu/g7rpBkEz3ugm9vulmMynFYMtDW5a1iWNSHwSPa+3sM0z
	d5ngu6lYzESwNfUCQGRhOLuxEVMKJ5XH6X0WJ8WTIJeAOIdiuoxxuDgzqP0VeIVhWrRZ
	Dib2DA/0rRYU1dJXwVzvz0ToY1nMbO7pJ93x7u9cLrKa4ANdXFo1HSswkIvy1MvG9C/k
	WrB4Ru7Q0iyfl3WNKv4OU47/Cw91O4ab1k5779XvCPfH58XfyTr8MLjnG1DSF2+MALaa
	qTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qNrQBz5uBAiBXujPYbneqF58d+b8XuQeLRCOC/F2B60=;
	b=U3DYjkNNUx+f2F7MZaDWWV3Mne04KXK32/PS/Wjhpxsu25SCSWQ9LwNo/r3dhptHPx
	YkWJ+TGWYOQKMNVnuFjUrW6OyAiR7+PdH2T9onxf9PL//0dJst3Dfi2m/Mc3X+JeiAjp
	AezW4kMqdBQJa3f+IRTpOSFa+CUU5sSd22jTGacP8vgHxBtJ4DX1Wuvxt/fhg3vV46aQ
	q9B8FEsfmPC4fCfUFdKA5pJnDXbH1u9XgKmAz2GIRXIEdgxzwvNaYCwfzciEDh98oQAg
	YeN47ZaSWxnxvaus4U2U15Ics8a8YxelzYrFUBORJqajDBkc3NrNtNU/DwxN1PIuW4Ko
	Fv1Q==
X-Gm-Message-State: AHYfb5hctK4/W1FJ95CAuS6mJYTpWtHep9825m3PJP5XY3tzbhXpMyqv
	zyeK+qu5k9YhE3nb5KzmBT4TCVAozA==
X-Received: by 10.176.2.68 with SMTP id 62mr1473271uas.202.1502899967200; Wed,
	16 Aug 2017 09:12:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Wed, 16 Aug 2017 09:12:46 -0700 (PDT)
In-Reply-To: <20170816160609.GA29490@linux-uys3>
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Aug 2017 18:12:46 +0200
Message-ID: <CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: chromium detected as stripped
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Aug 2017 16:12:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think nodejs fails because of openssl-1.1 like most of the failures from
last report.
http://errors.yoctoproject.org/Errors/Details/150582/

it was building fine with gcc7 before openssl upgrade.

Regards,

On Wed, Aug 16, 2017 at 6:06 PM, Trevor Woerner <twoerner@gmail.com> wrote:

> On Tue 2017-08-15 @ 11:53:42 PM, Andreas M=C3=BCller wrote:
> > On Tue, Aug 15, 2017 at 6:23 PM, Raphael Kubo da Costa
> > <raphael.kubo.da.costa@intel.com> wrote:
> > > Khem Raj <raj.khem@gmail.com> writes:
> > >
> > >> what are main architectures targetted with crosswalk ? I think scope
> is
> > >> important, since meta-browser supports, almost all oe-core supported
> > >> architectures. including x86/arm/mips/ppc, any cross build patches a=
re
> > >> required in anycase, but architecture patches will be additional if
> you
> > >> were only considering a subset of architectures.
>
> I was wondering the same thing myself :-) This recipe lists "armv7a" in
> COMPATIBLE_MACHINE but the (32-bit version of) raspberrypi3, for
> example, is armv7ve. Therefore I get:
>
>         ERROR: Nothing PROVIDES 'chromium'
>         chromium was skipped: incompatible with machine raspberrypi3 (not
> in COMPATIBLE_MACHINE)
>
> > > There's nothing Crosswalk-related in my Chromium recipe; it's in
> > > meta-crosswalk simply due to a historical accident and the fact that =
I
> > > haven't found a proper home for it so far.
>
> Okay, good to know.
>
> > > With that said, I've tested my builds with x86, x86-64, ARMv7 (IIRC
> > > Chromium doesn't support earlier ARM processors) and aarch64.
>
> Can you provide a list of "MACHINE =3D ..." that were used?
>
> > I think the update stopper for chromium on meta browser is the new
> > build system (don't remember the name).
>
> Maybe you're referring to "gn"? If so, it's not a show-stopper. The sourc=
e
> tarballs for chromium now include working sources for gn that can be buil=
t
> prior to the configure step.
>
> gn is a "makefile generator" much like the autotools. It's not the build
> system itself. However, instead of generating makefiles for make (as the
> autotools does), gn generates ninja files for ninja (which is the build
> system, and remains unchanged from earlier versions of chromium).
>
> > To take this step and have a
> > more recent version of chromium in meta-browser would be really great!
>
> The problem I was having was in trying to force the build system to use t=
he
> toolchain I wanted it to use. The Igalia people solved this problem by
> tricking the build system to think it was building for CrOS, and then
> redefining the toolchain for CrOS to use the toolchain generated by OE.
> This
> worked for x86_64 (minnowboard) but would fail for the raspberrypi3 with
> "illegal instruction". So somewhere in the build, the specified toolchain
> was
> being ignored and the host's toolchain was being used instead.
>
> I'd be happy to work on trying to integrate Raphael's excellent work into
> meta-browser. However, it depends on nodejs, and nodejs is currently
> failing
> to build (Martin's "State of Bitbake World" just exploded in the last
> iteration). I'm looking into that now, somewhat. node hasn't been happy
> since
> the switch to gcc7.
>
> There are (now) a number of distros that make a distribution for the
> raspberrypi, many of which include chromium. It would be great if it were
> easy/possible to find the scripts/steps/setup they're using for comparati=
ve
> reasons:
>         - raspbian
>         - suse
>         - fedora
>         - arch
>         - (others?)
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

