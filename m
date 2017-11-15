Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0C35C6FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 17:08:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 09:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,399,1505804400"; 
   d="scan'208";a="2187181"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.1.231])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Nov 2017 09:08:50 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	(Martin Jansa's message of "Wed, 15 Nov 2017 13:38:10 +0100")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Wed, 15 Nov 2017 18:08:49 +0100
Message-ID: <877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Wed, 15 Nov 2017 17:08:51 -0000
Content-Type: text/plain

Thanks for testing!

Martin Jansa <martin.jansa@gmail.com> writes:
> Thanks for very good changes.
>
> Yesterday I've tried to build this on "bitbake world" servers and the build
> for qemuarm64 failed with:
[...]
> longer log in http://errors.yoctoproject.org/Errors/Details/158898/
[...]
> I know what linking needs *a lot* of memory, but this server has 219GB
> available and "only" 128GB from it can be taken by tmpfs, so there should
> be still plenty RAM for successful linkage.

It had been a while since I'd last done an aarch64 build. I launched one
here and linking failed with relocation errors. I've pushed 4e5abf8
("chromium: Apply -g -> -g1 workaround for aarch64 as well"), which is
the same workaround I've been applying for other architectures, and
everything went fine.

> Build for x86_64 (on similar server) was successful.
>
> Build for x86 + musl failed even before start, because there is missing
> space in the append:
> recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86 =
> "yasm-native"
> recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_x86-64 =
> "yasm-native"
>
> and unlike x86_64 it doesn't have trailing space in previous DEPENDS,
> because of:
> recipes-browser/chromium/chromium_62.0.3202.89.bb:DEPENDS_append_libc-musl
> = " libexecinfo"
>
> Causing:
> ERROR: Nothing PROVIDES 'libexecinfoyasm-native' (but
> /home/jenkins/oe/world/shr-core/meta-browser/recipes-browser/chromium/
> chromium_62.0.3202.89.bb DEPENDS on or otherwise requires it). Close
> matches:
>   libxinerama-native
>   texinfo-native
>   libyaml-native

Thanks for fixing the yasm bit.

As for musl: like I said in my original email and on GitHub, the musl
build is currently broken. Carrying tons of patches in the recipe is an
uphill battle, so unless someone takes the time to work with upstream I
don't think it makes much sense to try to keep the build working.

