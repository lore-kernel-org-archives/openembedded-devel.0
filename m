Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0187B784D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 13:05:44 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 06:05:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="139801781"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.3.96])
	by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2017 06:05:36 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
In-Reply-To: <CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
	(Otavio Salvador's message of "Mon, 14 Aug 2017 16:43:52 -0300")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <CALbNGRQWNNvf5kLxcWz7EvUK6CO5VMX43vMrPx28yOzCq5NV8g@mail.gmail.com>
	<CAHiDW_GuabOEPc6rgh-vV+f502A5dYi8wFVYhRzqcZBGYHzz9g@mail.gmail.com>
	<CAHiDW_HFgnLbvd64hR8yE107BLtkWcp3eb=mA8towH73pMbUZQ@mail.gmail.com>
	<CALbNGRQBRFeCuz5R10qhBHQGQ3hn7WO9i1SAZ5fV=4BqGepjrQ@mail.gmail.com>
	<CALbNGRT6v530xCdqLp3CRHKOtBZpg8JqYreOsUhFL5u-eV2O2A@mail.gmail.com>
	<CAP9ODKrwUkwdESj-qKrPjsKMN2=W-ZsYBb_+OYhbvrfgcoht2w@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
Date: Tue, 15 Aug 2017 15:05:35 +0200
Message-ID: <87wp65rnfk.fsf@rkubodac-desk.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 15 Aug 2017 13:05:45 -0000
Content-Type: text/plain

Otavio Salvador <otavio.salvador@ossystems.com.br> writes:

>>> On Mon, Aug 14, 2017 at 12:22 PM, Jussi Kukkonen
>>> <jussi.kukkonen@intel.com> wrote:
>>>> On a related note, this good work is currently a bit hidden in
>>>> meta-crosswalk -- is there a chance we could get this combined with
>>>> meta-browser (or whatever place makes sense)? I know next to nothing about
>>>> chromium packaging so CCing Raphael and the meta-browser maintainers for
>>>> comments.
>
> Indeed it does sound like the proper workaround for now. That said,
> I'd love to receive more help from meta-crosswalk people and avoid
> duplication of work in packaging Chromium so I am adding Raphael on Cc
> here so he can comment about how we can try to work together on this.

The main reason why we haven't worked together yet is procrastination
from my side :-)

My recipe's working fine and is up-to-date with Chromium's stable
releases, but I'd love to find a more permanent home for it and stop
duplicating the efforts, especially as I spend most of my time working
on Chromium itself, not its Yocto recipe or even Yocto in general.

The main reason why I opted to start my recipe from scratch at the time
was simplicity: the meta-browser repository used the same recipe for
Chromium, CEF and Chromium with Ozone-Wayland, offered many different
options and shipped quite a few patches that made updates quite
difficult. My recipe is a lot less customizable, but OTOH that makes it
quite easy to move to new Chromium milestones. If we're able to find a
balance there, I definitely think we'd be able to get a lot more done
together.

