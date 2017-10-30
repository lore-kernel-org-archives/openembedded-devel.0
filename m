Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 80CF471B40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Oct 2017 13:23:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Oct 2017 06:23:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,320,1505804400"; d="scan'208";a="169520343"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.13.114])
	by fmsmga006.fm.intel.com with ESMTP; 30 Oct 2017 06:23:25 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Trevor Woerner <twoerner@gmail.com>
In-Reply-To: <CAHUNapSQ1otDzx4kRVqpW6GFQdVWVhcZcWuWL4Q8n8qLHPyB5Q@mail.gmail.com>
	(Trevor Woerner's message of "Fri, 27 Oct 2017 11:44:36 -0400")
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
	<87lgk2nmxg.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAP9ODKqqSJDKNsoPoYR0oFUVynQqpey_jaSjLeEAPxYV3fpNPA@mail.gmail.com>
	<87y3o2m1iy.fsf@rkubodac-desk.ger.corp.intel.com>
	<CAHUNapSQ1otDzx4kRVqpW6GFQdVWVhcZcWuWL4Q8n8qLHPyB5Q@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Mon, 30 Oct 2017 14:23:25 +0100
Message-ID: <87376093ci.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Mon, 30 Oct 2017 13:23:25 -0000
Content-Type: text/plain

Trevor Woerner <twoerner@gmail.com> writes:

> I was able to successfully build for the minnow board (x86_64), but
> when I tried building for the 32-bit variant for raspberrypi3 I got:
>
>     | install: cannot stat 'swiftshader/libEGL.so': No such file or directory
>
> during the do_install step for chromium itself. Odd, I thought egl
> came from mesa? (but then again I thought OE built its own
> gcc-native... :-S

Thanks for spotting that, I've fixed it in commit de21170 ("chromium:
Install SwiftShader only when building for Intel architectures"). I've
now checked the M62 build on pyro with GCC 5.4.0 and
MACHINE="raspberrypi3".

As for the EGL question: as far as I know, the SwiftShader stuff [1] is
a CPU-based OpenGL implementation that's used when hardware acceleration
is not available.

[1] https://github.com/google/swiftshader

