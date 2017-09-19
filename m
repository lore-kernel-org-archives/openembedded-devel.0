Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 299A6781D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 14:33:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2017 07:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,418,1500966000"; d="scan'208";a="901851522"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.28.77])
	by FMSMGA003.fm.intel.com with ESMTP; 19 Sep 2017 07:33:22 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <20170816160609.GA29490@linux-uys3> (Trevor Woerner's message of
	"Wed, 16 Aug 2017 12:06:09 -0400")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
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
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Tue, 19 Sep 2017 16:33:21 +0200
Message-ID: <87tvzylpvy.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 19 Sep 2017 14:33:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Trevor,

Trevor Woerner <twoerner@gmail.com> writes:
> On Tue 2017-08-15 @ 11:53:42 PM, Andreas M=C3=BCller wrote:
>> On Tue, Aug 15, 2017 at 6:23 PM, Raphael Kubo da Costa
>> <raphael.kubo.da.costa@intel.com> wrote:
>> > Khem Raj <raj.khem@gmail.com> writes:
>> >
>> >> what are main architectures targetted with crosswalk ? I think scope =
is
>> >> important, since meta-browser supports, almost all oe-core supported
>> >> architectures. including x86/arm/mips/ppc, any cross build patches are
>> >> required in anycase, but architecture patches will be additional if y=
ou
>> >> were only considering a subset of architectures.
>
> I was wondering the same thing myself :-) This recipe lists "armv7a" in
> COMPATIBLE_MACHINE but the (32-bit version of) raspberrypi3, for
> example, is armv7ve. Therefore I get:
>
> 	ERROR: Nothing PROVIDES 'chromium'
> 	chromium was skipped: incompatible with machine raspberrypi3 (not in COM=
PATIBLE_MACHINE)

I've just pushed a change to my chromium61 branch that adds support for
armv7ve. I've also completed a full Chromium build there with
MACHINE=3D"raspberrypi3" (I didn't run it though).

I also pushed some other GN-related fixes for ARM platforms to ensure we
don't end up passing incompatible -mcpu and -march values to the
compiler.

>> > With that said, I've tested my builds with x86, x86-64, ARMv7 (IIRC
>> > Chromium doesn't support earlier ARM processors) and aarch64.
>
> Can you provide a list of "MACHINE =3D ..." that were used?

If I still recall everything correctly, I've tested different versions
with the following MACHINEs (with either Yocto Pyro or previous releases):

* intel-corei7-64
* qemuarm (I had to change the tune file to avoid using ARMv5).
* qemuarm64
* qemux86
* qemux86-64
* raspberrypi3

> The problem I was having was in trying to force the build system to use t=
he
> toolchain I wanted it to use. The Igalia people solved this problem by
> tricking the build system to think it was building for CrOS, and then
> redefining the toolchain for CrOS to use the toolchain generated by OE. T=
his
> worked for x86_64 (minnowboard) but would fail for the raspberrypi3 with
> "illegal instruction". So somewhere in the build, the specified toolchain=
 was
> being ignored and the host's toolchain was being used instead.

I think I solved this early on in my recipe. In general, in the GN world
Chromium works with 3 different toolchains: a host one (equivalent to
OE's build host, for tools that are supposed to run on the system
building Chromium), a target one (for the target platform) and one for
producing V8 snapshot files (what snapshot files are is not relevant
here). The V8 snapshot toolchain runs on the host system, but must have
the same "bit-width" as the target system (so a x86-64 host targeting
ARMv6 must produce and run an i586 binary during the build).

In my recipe, I've worked around the need for the V8 snapshot toolchain
by pointing it to the target toolchain and then running the required
binaries with qemu-wrapper. The host and target toolchains are specified
as GN files, and they also set the right compiler/linker options etc.
Part of the process will be simplified once M62 reaches the stable
channel, as one of the Chromium developers (who also happens to be a
Gentoo packager) landed a change that simplifies setting up custom
toolchains.

> I'd be happy to work on trying to integrate Raphael's excellent work into
> meta-browser. However, it depends on nodejs, and nodejs is currently fail=
ing
> to build (Martin's "State of Bitbake World" just exploded in the last
> iteration). I'm looking into that now, somewhat. node hasn't been happy s=
ince
> the switch to gcc7.

I've got some time to work on this again. I've taken a look at the
meta-browser recipes and checked how they differ from mine; help merging
the recipes will certainly be appreciated :-)

