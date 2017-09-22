Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AF51377D9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 12:32:24 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Sep 2017 05:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,427,1500966000"; d="scan'208";a="902897759"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.56.185])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Sep 2017 05:32:21 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapT7Hj4XjuJM_PzydckY=b+X5ok-p-k2MF3VYhywJ5mh5A@mail.gmail.com>
	(Trevor Woerner's message of "Thu, 21 Sep 2017 19:06:47 -0400")
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
	<CAHUNapT7Hj4XjuJM_PzydckY=b+X5ok-p-k2MF3VYhywJ5mh5A@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Fri, 22 Sep 2017 14:32:20 +0200
Message-ID: <87r2uydicr.fsf@rkubodac-desk.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 22 Sep 2017 12:32:24 -0000
Content-Type: text/plain

Trevor Woerner <twoerner@gmail.com> writes:

> On Wed, Sep 20, 2017 at 1:43 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>> When I compile chromium61 with pyro, I get a strange error. Every time the
>> python wrapper (gcc_link_wrapper.py) is called for a native compile (g++), I
>> get:
> ...
>> This happens with both qemux86-64 and raspberrypi3. Unfortunately those log
>> files are 18M and 19M each, so I won't be attaching them. Why can't my build
>> find 'ld'? That seems quite strange. Probably some kind of ld vs gold issue?
>> I'm not using gold anywhere and have not enabled it, are you using gold?
>
>
> Turns out, I had to install binutils-gold on my host for this to work.
> Which suggests a hiccup in the build. Maybe the build needs to tweak
> the python wrapper? (As if using ninja and gn weren't enough, the
> build also wants to use a wrapper to call the compiler?!)

I think I've fixed both the gold and the Breakpad issues, as described
in my other reply.

> This still leaves the problem with my builds against master. I tried
> downgrading the compiler to 6%, but that causes a build issue in mesa,
> so the build can't even get close to chromium to see if that compile
> can succeed with gcc-6 instead of the default gcc-7.
>
> The regular procedure is to add things to master, then backport them
> to various branches if appropriate. If we can't get master to work,
> there won't be anything to backport. In any case meta-browser
> currently doesn't have a pyro branch.

Can you try my recipe with master again? So far I've only tested pyro to
avoid having the ground shift under my as I work on the recipe; I know
that at least Chromium master builds fine with GCC 7, so any build
errors caused by the compiler version are easily fixed with one or more
backports.

