Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id CE36F71A18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 16:06:12 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id m34so19247412iti.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 09:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=yge9MopHmvsCc5r0vLmLTKrpTl/TZoK2x+2TmQ9EEkQ=;
	b=phJmyqKPZvhB6HcdGcfObKzZvaXGfwDg9MyK+4qdO11w7weY14DmudQ47BpN+S1AiF
	2vhuTw2WaTC7MPKv8137/7cfHJHUECzqmVI6UHkTYNdVkK2CrQbzMGffubyE9pIPGnK0
	etRrPYdkYMKTQ4XhdU8j+/iTN7O16K4p3tp0ongMFF03NUhCazC4ulGZ1yYE6CMB2goP
	t44aCr9UQlLnKhs8TDK6kBgnBhJ0F99uRgfPTJrHRlBYNoQVDgp0gSO7oDN2XS5PfOLu
	rcEFFrOtqTaAIdoQKqs0+3H4UdTSkOVQpdv2v5J8RfD2e6tyRV2fkdToXenpEutogFKN
	r8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=yge9MopHmvsCc5r0vLmLTKrpTl/TZoK2x+2TmQ9EEkQ=;
	b=RMvpWR5KN6heAcsM38DCgTs6Vk5/GfQ0HJgrb0YJTg75gwuf9LXmclHbpnqV06lhn1
	1ySa8a55N4DIfd5OtUpxwfNP5MvgEG7GIsVBa31Kirkak7ENMCBGnqPj3jOU4G/uLLZA
	A9mFjmXk7DTdmEobpFLfu5NVWk+fYQ2TyOByfN5Gr3k0Qq5RnIoA/H91oM3J7Bikogo0
	JfnUlRa1vEG/HkDML4W+ZLotvxtLpwLTORfAgUm0YHWx//jvmONalMR01vmWDrjRKr40
	O+gjgJcy+hyGCEuMLdsRyHiCiWcF6imx7nkYtRSy/0+l1E8o4S1rwPCgtMVsEON6Us8Q
	kIjg==
X-Gm-Message-State: AHYfb5jWTjJ5vjcMeOmZmTpLd6giQPkDtN13aSBwRXVzDAJUTsUb/b/s
	11fCBB+laljSkjk9EAE=
X-Received: by 10.36.80.201 with SMTP id m192mr2422499itb.31.1502899573459;
	Wed, 16 Aug 2017 09:06:13 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id z84sm615349itf.39.2017.08.16.09.06.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Aug 2017 09:06:12 -0700 (PDT)
Date: Wed, 16 Aug 2017 12:06:09 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <20170816160609.GA29490@linux-uys3>
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
MIME-Version: 1.0
In-Reply-To: <CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
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
X-List-Received-Date: Wed, 16 Aug 2017 16:06:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue 2017-08-15 @ 11:53:42 PM, Andreas Müller wrote:
> On Tue, Aug 15, 2017 at 6:23 PM, Raphael Kubo da Costa
> <raphael.kubo.da.costa@intel.com> wrote:
> > Khem Raj <raj.khem@gmail.com> writes:
> >
> >> what are main architectures targetted with crosswalk ? I think scope is
> >> important, since meta-browser supports, almost all oe-core supported
> >> architectures. including x86/arm/mips/ppc, any cross build patches are
> >> required in anycase, but architecture patches will be additional if you
> >> were only considering a subset of architectures.

I was wondering the same thing myself :-) This recipe lists "armv7a" in
COMPATIBLE_MACHINE but the (32-bit version of) raspberrypi3, for
example, is armv7ve. Therefore I get:

	ERROR: Nothing PROVIDES 'chromium'
	chromium was skipped: incompatible with machine raspberrypi3 (not in COMPATIBLE_MACHINE)

> > There's nothing Crosswalk-related in my Chromium recipe; it's in
> > meta-crosswalk simply due to a historical accident and the fact that I
> > haven't found a proper home for it so far.

Okay, good to know.

> > With that said, I've tested my builds with x86, x86-64, ARMv7 (IIRC
> > Chromium doesn't support earlier ARM processors) and aarch64.

Can you provide a list of "MACHINE = ..." that were used?

> I think the update stopper for chromium on meta browser is the new
> build system (don't remember the name).

Maybe you're referring to "gn"? If so, it's not a show-stopper. The source
tarballs for chromium now include working sources for gn that can be built
prior to the configure step.

gn is a "makefile generator" much like the autotools. It's not the build
system itself. However, instead of generating makefiles for make (as the
autotools does), gn generates ninja files for ninja (which is the build
system, and remains unchanged from earlier versions of chromium).

> To take this step and have a
> more recent version of chromium in meta-browser would be really great!

The problem I was having was in trying to force the build system to use the
toolchain I wanted it to use. The Igalia people solved this problem by
tricking the build system to think it was building for CrOS, and then
redefining the toolchain for CrOS to use the toolchain generated by OE. This
worked for x86_64 (minnowboard) but would fail for the raspberrypi3 with
"illegal instruction". So somewhere in the build, the specified toolchain was
being ignored and the host's toolchain was being used instead.

I'd be happy to work on trying to integrate Raphael's excellent work into
meta-browser. However, it depends on nodejs, and nodejs is currently failing
to build (Martin's "State of Bitbake World" just exploded in the last
iteration). I'm looking into that now, somewhat. node hasn't been happy since
the switch to gcc7.

There are (now) a number of distros that make a distribution for the
raspberrypi, many of which include chromium. It would be great if it were
easy/possible to find the scripts/steps/setup they're using for comparative
reasons:
	- raspbian
	- suse
	- fedora
	- arch
	- (others?)

