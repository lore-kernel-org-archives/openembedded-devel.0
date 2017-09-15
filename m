Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4D59C78604
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:05:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Sep 2017 05:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,396,1500966000"; d="scan'208";a="900570092"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.30.245])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2017 05:05:28 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapTy3Lngxr0d2Gkd_2gFkZDcyYaumrEGTK6S8Aks5czhxw@mail.gmail.com>
	(Trevor Woerner's message of "Tue, 12 Sep 2017 21:31:09 -0700")
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
	<CA+chaQdPFsk3yJzCO7e=L+=OW=SP8hdg3kUytdj36daOpwqjww@mail.gmail.com>
	<CALbNGRSMbrpZ+LMdRx1ZGAGbJHM3z8E8fT7oW2cNAE9+Sg-82A@mail.gmail.com>
	<CAHUNapS=PyHpv+G03RvmgptLxkhTK5mZLxdw4bN3z82Fo6Kvig@mail.gmail.com>
	<CAHUNapTy3Lngxr0d2Gkd_2gFkZDcyYaumrEGTK6S8Aks5czhxw@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Fri, 15 Sep 2017 14:05:28 +0200
Message-ID: <87efr8p3p3.fsf@rkubodac-desk.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 15 Sep 2017 12:05:30 -0000
Content-Type: text/plain

Trevor Woerner <twoerner@gmail.com> writes:

> On Wed, Aug 16, 2017 at 10:00 AM, Trevor Woerner <twoerner@gmail.com> wrote:
>> I won't submit anything to meta-browser until I can build and get it
>> running on a target (or multiple targets).
>
> I've been playing with this off-and-on for the past while. It looks
> really nice! Unfortunately I can't seem to get it to compile. Is there
> some secret I'm missing? I'm past all the openssl and gcc6/7 nonsense.
> All pre-requisites build fine, the build failure is (and has been for
> a while) with chromium itself.
>
> I've been trying to build it off master, but chromium always fails in
> breakpad. I won't bore you with the full build log (unless you really
> want to see it). My build setup is:
>
> Build Configuration:
> BB_VERSION        = "1.35.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "opensuse-42.2"
> TARGET_SYS        = "x86_64-oe-linux"
> MACHINE           = "qemux86-64"
> DISTRO            = "nodistro"
> DISTRO_VERSION    = "nodistro.0"
> TUNE_FEATURES     = "m64 core2"
> TARGET_FPU        = ""
> meta              = "master:2ebbeb61114e4b847e9164c621ac87b5cf03a299"
> meta-oe           = "master:8b991640f19f1d19b17db141c31bc56e26695a23"
> meta-crosswalk    = "chromium60:433371f15be4a16e1faab9e155d56edb572737d6"

Works For Me (TM), though I've only tested it with Yocto's pyro branch
so far. Also, do note that Chromium 61 is available in the chromium61
branch. Can you share the actual error you're getting in breakpad so I
could take a look?

