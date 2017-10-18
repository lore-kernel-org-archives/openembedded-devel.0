Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6C9601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Oct 2017 14:08:59 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 18 Oct 2017 07:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,397,1503385200"; d="scan'208";a="161905632"
Received: from jaertebj-mobl.ger.corp.intel.com (HELO
	rkubodac-desk.ger.corp.intel.com) ([10.252.14.1])
	by orsmga005.jf.intel.com with ESMTP; 18 Oct 2017 07:08:59 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Jacobo Aragunde =?utf-8?Q?P=C3=A9rez?= <jaragunde@igalia.com>
In-Reply-To: <874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com> (Raphael Kubo
	da Costa's message of "Mon, 16 Oct 2017 16:59:15 +0200")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
	<5612aa4c-d986-89f7-7667-14898b5f7bfc@igalia.com>
	<878tgbxio5.fsf@rkubodac-desk.ger.corp.intel.com>
	<874lqzxhoc.fsf@rkubodac-desk.ger.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Wed, 18 Oct 2017 16:08:59 +0200
Message-ID: <87efq0wnt0.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
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
X-List-Received-Date: Wed, 18 Oct 2017 14:09:00 -0000
Content-Type: text/plain

Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:

> Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com> writes:
>> Can you check if the attached patch also solves the WebRTC build issue
>> for you? I've tried it here with Yocto's morty branch and GCC 5.4.0.
>>
>> If so, I'll send it upstream, as the original approach
>> (https://webrtc-review.googlesource.com/c/src/+/8641) was not accepted
>> by the WebRTC maintainers.
>
> Sorry, I'm attaching patch v2, the original version had an extra,
> unwanted chunk.

I've upstreamed the patch and integrated it into the chromium61 branch.

Work on Chromium 62 has started, but updating is a bit slower now that
I'm trying to test GCC 5, 7, pyro and rocko.

