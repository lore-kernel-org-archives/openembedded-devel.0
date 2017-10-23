Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 42C0D70016
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Oct 2017 11:06:19 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP; 23 Oct 2017 04:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,422,1503385200"; d="scan'208";a="326512784"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.17.104])
	by fmsmga004.fm.intel.com with ESMTP; 23 Oct 2017 04:06:19 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <20171020153307.GA6636@linux-uys3> (Trevor Woerner's message of
	"Fri, 20 Oct 2017 11:33:08 -0400")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
	<874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
	<87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com>
	<87shefnm1g.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171020153307.GA6636@linux-uys3>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Mon, 23 Oct 2017 13:06:19 +0200
Message-ID: <87lgk2nmxg.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-browser] Modern Chromium with GN
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
X-List-Received-Date: Mon, 23 Oct 2017 11:06:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Trevor Woerner <twoerner@gmail.com> writes:

> On Thu 2017-10-19 @ 06:24:11 PM, Raphael Kubo da Costa wrote:
>> Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
>> > Work on Chromium 62 has started, but updating is a bit slower now that
>> > I'm trying to test GCC 5, 7, pyro and rocko.
>>
>> I've pushed a new branch called "chromium62". It's been test-built
>> against Yocto's pyro (with GCC 5) and rocko (with GCC 7) for x86 and
>> x86-64.
>>
>> Additional testing is appreciated!
>
> It looks like something in the chromium62 build is calling my native g++ =
and
> expecting that this native g++ will be recent enough to support c++14:
>
>
> 	| g++ -MMD -MF base/base_paths.o.d
> 	| -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62=
.0.3202.62-r0/chromium-62.0.3202.62/out_bootstrap/gen
> 	| -I/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62=
.0.3202.62-r0/chromium-62.0.3202.62
> 	| -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-nat=
ive/62.0.3202.62-r0/recipe-sysroot-native/usr/include
> 	| -O2 -pipe -DNO_TCMALLOC -D__STDC_FORMAT_MACROS -O2 -g0
> 	| -D_FILE_OFFSET_BITS=3D64 -D__STDC_CONSTANT_MACROS
> 	| -D__STDC_FORMAT_MACROS -pthread -pipe -fno-exceptions
> 	| -isystem/z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-nat=
ive/62.0.3202.62-r0/recipe-sysroot-native/usr/include
> 	| -O2 -pipe -std=3Dc++14 -Wno-c++11-narrowing -c
> 	| /z/chromium/crosswalk/build/tmp-glibc/work/x86_64-linux/gn-native/62.0=
.3202.62-r0/chromium-62.0.3202.62/base/base_paths.cc
> 	| -o base/base_paths.o
> 	| g++: error: unrecognized command line option =E2=80=98-std=3Dc++14=E2=
=80=99

Ouch :( That's a new kind of issue I was not expecting.

> [...]

> Is there any way to intercept these calls and have it call OE's gcc-native
> instead?

Do you have an example of that being done in another recipe?

