Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4433178461
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 16:23:02 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 09:23:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,378,1498546800"; d="scan'208";a="140534414"
Received: from pgarraul-mobl.ger.corp.intel.com (HELO
	rkubodac-desk.ger.corp.intel.com) ([10.252.27.114])
	by fmsmga006.fm.intel.com with ESMTP; 15 Aug 2017 09:23:02 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <8d04fa9f-3049-45cf-4255-bd0159b84751@gmail.com> (Khem Raj's
	message of "Tue, 15 Aug 2017 09:19:07 -0700")
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
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Date: Tue, 15 Aug 2017 18:23:01 +0200
Message-ID: <87r2wcajh6.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	"openembedded-devel@lists.openembedded.org"
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
X-List-Received-Date: Tue, 15 Aug 2017 16:23:03 -0000
Content-Type: text/plain

Khem Raj <raj.khem@gmail.com> writes:

> what are main architectures targetted with crosswalk ? I think scope is
> important, since meta-browser supports, almost all oe-core supported
> architectures. including x86/arm/mips/ppc, any cross build patches are
> required in anycase, but architecture patches will be additional if you
> were only considering a subset of architectures.

There's nothing Crosswalk-related in my Chromium recipe; it's in
meta-crosswalk simply due to a historical accident and the fact that I
haven't found a proper home for it so far.

With that said, I've tested my builds with x86, x86-64, ARMv7 (IIRC
Chromium doesn't support earlier ARM processors) and aarch64.

