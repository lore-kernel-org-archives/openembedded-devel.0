Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C89A8719B7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 22:10:58 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 02 Nov 2016 15:11:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,436,1473145200"; d="scan'208";a="27091873"
Received: from mdonthir-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.161])
	by orsmga004.jf.intel.com with ESMTP; 02 Nov 2016 15:10:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 03 Nov 2016 11:10:50 +1300
Message-ID: <2334170.uKLsZrz9dF@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LY_nQfg5czXfOauC=eNG1fy0MDrreEvyuLx5NfyBny-Dw@mail.gmail.com>
References: <1477898963-3759-1-git-send-email-mike.looijmans@topic.nl>
	<1852679.faEG3Nt9xx@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LY_nQfg5czXfOauC=eNG1fy0MDrreEvyuLx5NfyBny-Dw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt4][PATCH] qt4-embedded: Default to build tslib when touchscreen is defined
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
X-List-Received-Date: Wed, 02 Nov 2016 22:10:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 02 Nov 2016 11:08:49 Burton, Ross wrote:
> On 2 November 2016 at 03:01, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > I have merged both of the patches to master and taken the liberty of
> > merging
> > them to morty as well, just so it isn't horribly broken. I appreciate it's
> > still slightly broken from some perspectives.
> > 
> > I suspect the reason this was done was to remove the tslib dependency by
> > default so that meta-oe wasn't pulled in. Whether or not that's a good
> > idea is
> > another question, personally I wouldn't have done it this way. It seems to
> > me
> > if you have a touchscreen arguably you need tslib here.
> 
> AFAIK tslib is only required for some touchscreens, for example the one I
> have somewhere in the attic works with standard kernel input drivers.  The
> LSB builds on the autobuilder pull in meta-qt4 so doesn't this mean that
> meta-oe is now a build dependency for the AB runs?

Only if they have "touchscreen" in IMAGE_FEATURES - do any of the machines we 
build for on the autobuilder do that?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

