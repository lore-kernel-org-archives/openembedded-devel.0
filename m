Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 300DE6E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Oct 2017 15:27:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Oct 2017 08:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,500,1500966000"; d="scan'208";a="1023271633"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.12.116])
	by orsmga003.jf.intel.com with ESMTP; 09 Oct 2017 08:27:26 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Jacobo Aragunde =?utf-8?Q?P=C3=A9rez?= <jaragunde@igalia.com>
In-Reply-To: <4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com> ("Jacobo
	Aragunde \=\?utf-8\?Q\?P\=C3\=A9rez\=22's\?\= message of "Thu,
	5 Oct 2017 17:26:01 +0200")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <cc8aeb58-0a29-de25-29b2-d6f1620409f9@igalia.com>
	<CAP9ODKq_x-xT_ux1tmcgDBuaUc2ekw36YAjQ66=iR3OBRgebJA@mail.gmail.com>
	<CAHUNapS+dr5Uc4upvd00vve+WubDT0Fgsc16vQmWXh3O1ErcLw@mail.gmail.com>
	<4e71f40e-63cb-0857-f292-ec3a120776c1@igalia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Mon, 09 Oct 2017 17:27:25 +0200
Message-ID: <87d15w4a02.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
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
X-List-Received-Date: Mon, 09 Oct 2017 15:27:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jacobo Aragunde P=C3=A9rez <jaragunde@igalia.com> writes:
> Hi everyone,
>
> I have several potential patches for Rafael's layer after having tried
> several builds for different hardware. I'm sending individual mails to
> discuss each of them.
>
> The first one is pretty straightforward. It is just a backport of an
> existing upstream chromium patch to fix a compilation error on some GCC
> versions. I've reproduced the error with gcc-linaro-5.3 and gcc-5.4.0
> toolchains, and the patch fixes it. GCC 6 seems not to have any problem
> with the original code but I still think it makes no harm to include the
> patch.
>
> Find the patch attached.

Hey Jacobo,

Sorry for the delay, it took me a couple of days to catch up with
everything after returning from the Hackfest :-)

I've just added some context to the patch and adjusted its name. It's
now in my chromium61 branch as commit 13cdc60.

Thanks!

(P.S.: I haven't given up on the idea of merging my recipe into
meta-browser, I just need to get around to doing it :-)

