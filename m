Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 21CFF7F8C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 19:38:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 11:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="406197376"
Received: from ppatil-mobl1.amr.corp.intel.com (HELO shodan.localnet)
	([10.255.162.6])
	by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2019 11:38:41 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mikko.Rapeli@bmw.de
Date: Tue, 19 Nov 2019 08:38:18 +1300
Message-ID: <7534400.j1Xr5d304z@shodan>
Organization: Intel Corporation
In-Reply-To: <20191118114027.GG3527@hiutale>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
	<e5beec9d-74a7-d60d-af9f-71f4c4d527aa@victronenergy.com>
	<20191118114027.GG3527@hiutale>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org, bunk@stusta.de
Subject: Re: [meta-qt4][PATCH 0/2] fix qt4 for zeus
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
X-List-Received-Date: Mon, 18 Nov 2019 19:38:44 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mikko,

On Tuesday, 19 November 2019 12:40:27 AM NZDT Mikko.Rapeli@bmw.de wrote:
> On Mon, Nov 18, 2019 at 11:01:09AM +0000, Jeroen Hofstee wrote:
> > On 11/18/19 10:13 AM, Mikko.Rapeli@bmw.de wrote:
> > > On Mon, Nov 18, 2019 at 04:12:56PM +1300, Paul Eggleton wrote:
> > >> On Monday, 18 November 2019 10:44:37 AM NZDT Jeroen Hofstee wrote:
> > >>> Gcc 9.2 miscompiles the foreach resulting in broken applications.
> > >>> This backports a fix from qt5 to make it work again. The fix is
> > >>> not written for this issue, but it does solve it.
> > >>>
> > >>> As a prepartion it includes some whitespace fixes, so the patches
> > >>> are aligned in the SRC_URI.
> > >>>
> > >>> Jeroen Hofstee (2):
> > >>>    qt4: fix whitespace so it aligns
> > >>>    qt4: updates for gcc 9.2
> > >> I've merged both of these. I've also created zeus and warrior branches. (For
> > >> now I have assumed these two should not be on warrior - let me know if that's
> > >> not correct.)
> > > It this ok from licensing point of view since LICENSE = "LGPLv2.1 | GPLv3"?
> > >
> > > I suspect the LGPLv2.1 is not correct if GPLv3 licensed patches from qt5 are there too.
> > 
> > Since the license of the file this patch is coming from is the same
> > as in qt4, I don't understand how you suspect that it conflicts.
> 
> Ok, that's great then!

FYI the patch that was backported [1] [2] first appeared in qtbase in v5.4.0-alpha1 in 2014 which was prior to the re-licensing that happened in 5.6.

> As you know, licensing of qt5 is different, e.g. in meta-qt5/recipes-qt/qt5/qt5.inc says
> LICENSE = "GFDL-1.3 & BSD & ( GPL-3.0 & The-Qt-Company-GPL-Exception-1.0 | The-Qt-Company-Commercial ) & ( GPL-2.0+ | LGPL-3.0 | The-Qt-Company-Commercial )"
> which does not include LGPLv2.1.
> 
> Thus one needs to be very careful when backporting patches, or change the licensing to be
> compatible. If qt4 would not include LGPLv2.1 in LICENSE, then backporting GPLv3 licensed
> changes from qt5 could be more straight forward.

Indeed, thanks for the reminder. I think we probably want to leave qt4's LICENSE as-is though, since the upstream code is available under LGPLv2.1 and I think it would be odd if we were to remove that just for the sake of a few patches.

Cheers
Paul

[1] https://salsa.debian.org/qt-kde-team/qt/qt4-x11/commit/0d4a3dd61ccb156dee556c214dbe91c04d44a717
[2] https://github.com/qt/qtbase/commit/c35a3f519007af44c3b364b9af86f6a336f6411b

-- 

Paul Eggleton
Intel System Software Products



