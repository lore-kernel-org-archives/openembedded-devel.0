Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 32A877BFB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 21:33:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45FLR366psz43;
	Thu, 30 May 2019 23:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1559251984;
	bh=YlsQ2YVJ/HkWMEubkjvMweinZJc5wSj3Qw7B963tSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rkQ4NV/xjlYIQZm3P8EpM9qF5aXcIimm+DX5x8jy+GHB0FjJ1h9F2H6S6DWkGmChH
	5J4Wj+b53Cwz3nPUL9tNK0drYrgFoK+/WF9hN3eGReSGM04krVFumUs28V18xVeTDP
	LzWu9p1mPWnrJ/hWsZBixyjYZvxYMiJpxrI/GgL9f/aGswfV8VJ6uCV5e1gJH+Q8L2
	OHF03wVV6OvoGoziIghf15TNFJ4CLP21wek+NeIaN3l+cGSb4wx6fxMkdBqvmG9gIw
	7mtMttA1bY2yT15VZdXEeo4UpkesCtTOHFQrCdnnq2btzoffFfzqL9z8A1R1hI+Xpx
	yURUnTT2ITiJ7aNWaohXy4oNyTseZHEyJHDFRF4D1xPpHLSusnpbG97bNheO8FlqrF
	kHv/0wV9QyqGYIwoaExt5QQ2AIWghw+tsY2kFvJBmP3ysVj1LwydsnFUZ+xvEXtVX9
	Yz1OGqj9IRSxioHbXp5syhXV4oasBCYTTIlAVjTmXGatkwfzFLJoZ1j9OQ+f8DkMPa
	MUz63ZqMt5GsW1rIjFYA4STORU75Jhc9DALEhGI4WtSEA82EW7q9+gm3oq4hamaTnz
	pzsnQbjZW/uteMSiMHSNsAe7MrLjVXBzKwKmIYba8/4eAD0rqMZofi5rs0SOMcsMrx
	qFww+G9TmFoWSq4o65upXl7Q=
Date: Fri, 31 May 2019 00:33:01 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Scott Ellis <scott@jumpnowtek.com>
Message-ID: <20190530213301.GH318@localhost>
References: <1559207054-32056-1-git-send-email-scott@jumpnowtek.com>
	<d9e8c97c-892a-473b-c48d-eccffce6f071@gmail.com>
	<e5067fbe-0d2d-b2c3-8bb4-29024740cf65@jumpnowtek.com>
MIME-Version: 1.0
In-Reply-To: <e5067fbe-0d2d-b2c3-8bb4-29024740cf65@jumpnowtek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][warrior][PATCH] wireguard: Upgrade 20190123 -> 20190406
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
X-List-Received-Date: Thu, 30 May 2019 21:33:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 30, 2019 at 04:59:56PM -0400, Scott Ellis wrote:
> http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199619.html

http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199620.html

cu
Adrian

> On 5/30/2019 9:16 AM, akuster808 wrote:
> > 
> > 
> > On 5/30/19 2:04 AM, Scott Ellis wrote:
> >> Fixes issues with kernels 5.1 and greater.
> >>
> >> Backport from master fc1b5310b28f70900a8a432048e08ee06ae309d7
> > 
> > What is in this update?
> > 
> > - armin
> >>
> >> Signed-off-by: Scott Ellis <scott@jumpnowtek.com>
> >> ---
> >>  ...eguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} | 0
> >>  ...ireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} | 0
> >>  meta-networking/recipes-kernel/wireguard/wireguard.inc                | 4 ++--
> >>  3 files changed, 2 insertions(+), 2 deletions(-)
> >>  rename meta-networking/recipes-kernel/wireguard/{wireguard-module_0.0.20190123.bb => wireguard-module_0.0.20190406.bb} (100%)
> >>  rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_0.0.20190123.bb => wireguard-tools_0.0.20190406.bb} (100%)
> >>
> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
> >> similarity index 100%
> >> rename from meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190123.bb
> >> rename to meta-networking/recipes-kernel/wireguard/wireguard-module_0.0.20190406.bb
> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
> >> similarity index 100%
> >> rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
> >> rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190406.bb
> >> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard.inc b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> index 8314e79..5cf745e 100644
> >> --- a/meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> +++ b/meta-networking/recipes-kernel/wireguard/wireguard.inc
> >> @@ -11,7 +11,7 @@ LICENSE = "GPLv2"
> >>  LIC_FILES_CHKSUM = "file://../COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> >>  
> >>  SRC_URI = "https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${PV}.tar.xz"
> >> -SRC_URI[md5sum] = "8a0a232f65d5d86dd408efd9ac30bcf9"
> >> -SRC_URI[sha256sum] = "edd13c7631af169e3838621b1a1bff3ef73cf7bc778eec2bd55f7c1089ffdf9b"
> >> +SRC_URI[md5sum] = "c11254fe48695e61c145a7e82756ecba"
> >> +SRC_URI[sha256sum] = "2f06f3adf70b95e74a7736a22dcf6e9ef623b311a15b7d55b5474e57c3d0415b"
> >>  
> >>  S = "${WORKDIR}/WireGuard-${PV}/src/"

