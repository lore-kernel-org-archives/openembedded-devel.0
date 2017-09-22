Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2029877D1A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 12:22:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 05:22:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,427,1500966000"; d="scan'208";a="152200662"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.56.185])
	by orsmga005.jf.intel.com with ESMTP; 22 Sep 2017 05:22:18 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <20170920174336.GA19156@linux-uys3> (Trevor Woerner's message of
	"Wed, 20 Sep 2017 13:43:37 -0400")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	<87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
	<8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com>
	<87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
	<CALbNGRS1ywFbSNAoY976cPgJ4STQLqUEqzwq34XGaMH_CYhAaw@mail.gmail.com>
	<20170816160609.GA29490@linux-uys3>
	<87tvzylpvy.fsf@rkubodac-desk.ger.corp.intel.com>
	<20170920174336.GA19156@linux-uys3>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Fri, 22 Sep 2017 14:22:17 +0200
Message-ID: <87vakaditi.fsf@rkubodac-desk.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 22 Sep 2017 12:22:19 -0000
Content-Type: text/plain

Hey Trevor,

Thanks again for testing the recipe and providing great feedback.

Trevor Woerner <twoerner@gmail.com> writes:
> When I compile chromium61 with pyro, I get a strange error. Every time the
> python wrapper (gcc_link_wrapper.py) is called for a native compile (g++), I
> get:
[...]
> This happens with both qemux86-64 and raspberrypi3. Unfortunately those log
> files are 18M and 19M each, so I won't be attaching them. Why can't my build
> find 'ld'? That seems quite strange. Probably some kind of ld vs gold issue?
> I'm not using gold anywhere and have not enabled it, are you using gold?

You are correct. By default, Chromium will default to using gold (and
passing -fuse-ld=gold like it did above) in most situations for both
host and target builds (the error you posted is from building a native
tool), as that's what upstream uses and tests.

I've changed my recipe to respect the ld-is-gold DISTRO_FEATURE; the
downside is that this setting applies to both host and target, so if one
decides to use gold it also needs to be present on the host system:
<https://github.com/rakuco/meta-crosswalk/commit/e7cfbf616f0bc524f9487d98c6e39e30ef28a639>

> Compiling chromium61 with master gives a long error in breakpad. That log file
> is 73K so I've attached it (log.do_compile__qemux86-64__chromium61_master_breakpad).
> It appears to be a problem with the code itself. Here is the start:
[...]
> 	../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc: In static member function 'static uintptr_t google_breakpad::UContextReader::GetStackPointer(const google_breakpad::ucontext*)':
> 	../../breakpad/src/client/linux/dump_writer_common/ucontext_reader.cc:92:12: error: invalid use of incomplete type 'const struct google_breakpad::ucontext'

This is actually caused by glibc 2.26, which removed 'struct ucontext'
in favor of ucontext_t
https://sourceware.org/glibc/wiki/Release/2.26#Removal_of_.27struct_ucontext.27

meta-browser was fixed by Khem Raj with commit c2e44f94636 ("chromium:
Fix build with security flags"), but my recipe didn't have anything
similar.

It turns out upstream actually fixed this issue a few days ago, so I was
able to just backport their fix here:
<https://github.com/rakuco/meta-crosswalk/commit/e7cfbf616f0bc524f9487d98c6e39e30ef28a639>

