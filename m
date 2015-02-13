Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6743E733F3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 10:58:32 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 13 Feb 2015 02:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,570,1418112000"; d="scan'208";a="527075174"
Received: from jaloughr-mobl5.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.120])
	by orsmga003.jf.intel.com with ESMTP; 13 Feb 2015 02:49:54 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Gary Thomas <gary@mlbassoc.com>
Date: Fri, 13 Feb 2015 10:58:10 +0000
Message-ID: <101705652.1SzHARi5R4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.5-101.fc20.x86_64; KDE/4.14.4; x86_64; ; )
In-Reply-To: <54DD1C8B.90205@mlbassoc.com>
References: <1422971047-17965-1-git-send-email-gary@mlbassoc.com>
	<20150212183043.GF2272@jama> <54DD1C8B.90205@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] mplayer2: Remove blacklist
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Feb 2015 10:58:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 February 2015 14:35:07 Gary Thomas wrote:
> On 2015-02-12 11:30, Martin Jansa wrote:
> > On Tue, Feb 03, 2015 at 06:44:07AM -0700, Gary Thomas wrote:
> >> mplayer2 no longer needs to be blacklisted as OE-core has moved
> >> to libav_9.16
> > 
> > Please fix following issues before blacklisting it:
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc,
> > but it isn't a build dependency? [build-deps]
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but
> > it isn't a build dependency? [build-deps]
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver,
> > but it isn't a build dependency? [build-deps]
> > mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it
> > isn't a build dependency? [build-deps]
> 
> This must be an inferred dependency as mpg123 is not in meta-oe, but
> rather meta-multimedia and it is possible to build mplayer using only
> meta-oe and not meta-multimedia.  How should that be handled?

Should mplayer2 in fact be moved to meta-multimedia? I can't see any 
dependencies on it in meta-oe itself, only gnome-player in meta-gnome seems to 
need it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

